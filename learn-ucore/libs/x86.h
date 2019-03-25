#ifndef __LIBS_X86_H__
#define __LIBS_X86_H__

#include "defs.h"

#define do_div(n, base) ({                                          \
            unsigned long __upper, __low, __high, __mod, __base;    \
            __base = (base);                                        \
            asm ("" : "=a" (__low), "=d" (__high) : "A" (n));       \
            __upper = __high;                                       \
            if (__high != 0) {                                      \
                __upper = __high % __base;                          \
                __high = __high / __base;                           \
            }                                                       \
            asm ("divl %2" : "=a" (__low), "=d" (__mod)             \
                : "rm" (__base), "0" (__low), "1" (__upper));       \
            asm ("" : "=A" (n) : "a" (__low), "d" (__high));        \
            __mod;                                                  \
        })

#define barrier() __asm__ __volatile__ ("" ::: "memory")

static inline uint8_t inb(uint16_t port) __attribute__((always_inline));
static inline uint16_t inw(uint16_t port) __attribute__((always_inline));
static inline void insl(uint32_t port, void *addr, int cnt) __attribute__((always_inline));
static inline void outb(uint16_t port, uint8_t data) __attribute__((always_inline));
static inline void outw(uint16_t port, uint16_t data) __attribute__((always_inline));
static inline void outsl(uint32_t port, const void *addr, int cnt) __attribute__((always_inline));
static inline uint32_t read_ebp(void) __attribute__((always_inline));
static inline void breakpoint(void) __attribute__((always_inline));
static inline uint32_t read_dr(unsigned regnum) __attribute__((always_inline));
static inline void write_dr(unsigned regnum, uint32_t value) __attribute__((always_inline));

/* Pseudo-descriptors used for LGDT, LLDT(not used) and LIDT instructions. */
struct pseudodesc {
    uint16_t pd_lim;        // Limit
    uintptr_t pd_base;      // Base address
} __attribute__ ((packed));

static inline void lidt(struct pseudodesc *pd) __attribute__((always_inline));
static inline void sti(void) __attribute__((always_inline));
static inline void cli(void) __attribute__((always_inline));
static inline void ltr(uint16_t sel) __attribute__((always_inline));
static inline uint32_t read_eflags(void) __attribute__((always_inline));
static inline void write_eflags(uint32_t eflags) __attribute__((always_inline));
static inline void lcr0(uintptr_t cr0) __attribute__((always_inline));
static inline void lcr3(uintptr_t cr3) __attribute__((always_inline));
static inline uintptr_t rcr0(void) __attribute__((always_inline));
static inline uintptr_t rcr1(void) __attribute__((always_inline));
static inline uintptr_t rcr2(void) __attribute__((always_inline));
static inline uintptr_t rcr3(void) __attribute__((always_inline));
static inline void invlpg(void *addr) __attribute__((always_inline));

static inline uint8_t inb(uint16_t port)
{
    uint8_t data = 0;
#if ASM_NO_64
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port) : "memory");
#endif
    return data;
}

static inline uint16_t inw(uint16_t port)
{
    uint16_t data = 0;
#if ASM_NO_64
    asm volatile ("inw %1, %0" : "=a" (data) : "d" (port));
#endif
    return data;
}

static inline void insl(uint32_t port, void *addr, int cnt)
{
#if ASM_NO_64
    asm volatile (
        "cld;"
        "repne; insl;"
        : "=D" (addr), "=c" (cnt)
        : "d" (port), "0" (addr), "1" (cnt)
        : "memory", "cc");
#endif
}

static inline void outb(uint16_t port, uint8_t data)
{
#if ASM_NO_64
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port) : "memory");
#endif
}

static inline void outw(uint16_t port, uint16_t data)
{
#if ASM_NO_64
    asm volatile ("outw %0, %1" :: "a" (data), "d" (port) : "memory");
#endif
}

static inline void outsl(uint32_t port, const void *addr, int cnt)
{
#if ASM_NO_64
    asm volatile (
        "cld;"
        "repne; outsl;"
        : "=S" (addr), "=c" (cnt)
        : "d" (port), "0" (addr), "1" (cnt)
        : "memory", "cc");
#endif
}

static inline uint32_t read_ebp(void)
{
    uint32_t ebp = 0;
#if ASM_NO_64
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
#endif
    return ebp;
}

static inline void breakpoint(void)
{
#if ASM_NO_64
    asm volatile ("int $3");
#endif
}

static inline uint32_t read_dr(unsigned regnum)
{
    uint32_t value = 0;
#if ASM_NO_64
    switch (regnum)
    {
        case 0: asm volatile ("movl %%db0, %0" : "=r" (value)); break;
        case 1: asm volatile ("movl %%db1, %0" : "=r" (value)); break;
        case 2: asm volatile ("movl %%db2, %0" : "=r" (value)); break;
        case 3: asm volatile ("movl %%db3, %0" : "=r" (value)); break;
        case 6: asm volatile ("movl %%db6, %0" : "=r" (value)); break;
        case 7: asm volatile ("movl %%db7, %0" : "=r" (value)); break;
    }
#endif
    return value;
}

static void write_dr(unsigned regnum, uint32_t value)
{
#if ASM_NO_64
    switch (regnum)
    {
        case 0: asm volatile ("movl %0, %%db0" :: "r" (value)); break;
        case 1: asm volatile ("movl %0, %%db1" :: "r" (value)); break;
        case 2: asm volatile ("movl %0, %%db2" :: "r" (value)); break;
        case 3: asm volatile ("movl %0, %%db3" :: "r" (value)); break;
        case 6: asm volatile ("movl %0, %%db6" :: "r" (value)); break;
        case 7: asm volatile ("movl %0, %%db7" :: "r" (value)); break;
    }
#endif
}

static inline void lidt(struct pseudodesc *pd)
{
#if ASM_NO_64
    asm volatile ("lidt (%0)" :: "r" (pd) : "memory");
#endif
}

static inline void sti(void)
{
#if ASM_NO_64
    asm volatile ("sti");
#endif
}

static inline void cli(void)
{
#if ASM_NO_64
    asm volatile ("cli" ::: "memory");
#endif
}

static inline void ltr(uint16_t sel)
{
#if ASM_NO_64
    asm volatile ("ltr %0" :: "r" (sel) : "memory");
#endif
}

static inline uint32_t read_eflags(void)
{
    uint32_t eflags = 0;
#if ASM_NO_64
    asm volatile ("pushfl; popl %0" : "=r" (eflags));
#endif
    return eflags;
}

static inline void write_eflags(uint32_t eflags)
{
#if ASM_NO_64
    asm volatile ("pushl %0; popfl" :: "r" (eflags));
#endif
}

static inline void lcr0(uintptr_t cr0)
{
#if ASM_NO_64
    asm volatile ("mov %0, %%cr0" :: "r" (cr0) : "memory");
#endif
}

static inline void lcr3(uintptr_t cr3)
{
#if ASM_NO_64
    asm volatile ("mov %0, %%cr3" :: "r" (cr3) : "memory");
#endif
}

static inline uintptr_t rcr0(void)
{
    uintptr_t cr0 = 0;
#if ASM_NO_64
    asm volatile ("mov %%cr0, %0" : "=r" (cr0) :: "memory");
#endif
    return cr0;
}

static inline uintptr_t rcr1(void)
{
    uintptr_t cr1 = 0;
#if ASM_NO_64
    asm volatile ("mov %%cr1, %0" : "=r" (cr1) :: "memory");
#endif
    return cr1;
}

static inline uintptr_t rcr2(void)
{
    uintptr_t cr2 = 0;
#if ASM_NO_64
    asm volatile ("mov %%cr2, %0" : "=r" (cr2) :: "memory");
#endif
    return cr2;
}

static inline uintptr_t rcr3(void)
{
    uintptr_t cr3 = 0;
#if ASM_NO_64
    asm volatile ("mov %%cr3, %0" : "=r" (cr3) :: "memory");
#endif
    return cr3;
}

static inline void invlpg(void *addr)
{
#if ASM_NO_64
    asm volatile ("invlpg (%0)" :: "r" (addr) : "memory");
#endif
}

static inline int __strcmp(const char *s1, const char *s2) __attribute__((always_inline));
static inline char *__strcpy(char *dst, const char *src) __attribute__((always_inline));
static inline void *__memset(void *s, char c, size_t n) __attribute__((always_inline));
static inline void *__memmove(void *dst, const void *src, size_t n) __attribute__((always_inline));
static inline void *__memcpy(void *dst, const void *src, size_t n) __attribute__((always_inline));

#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int __strcmp(const char *s1, const char *s2)
{
    int d0, d1, ret;
#if ASM_NO_64
    asm volatile (
        "1: lodsb;"
        "scasb;"
        "jne 2f;"
        "testb %%al, %%al;"
        "jne 1b;"
        "xorl %%eax, %%eax;"
        "jmp 3f;"
        "2: sbbl %%eax, %%eax;"
        "orb $1, %%al;"
        "3:"
        : "=a" (ret), "=&S" (d0), "=&D" (d1)
        : "1" (s1), "2" (s2)
        : "memory");
#endif
    return ret;
}

#endif /* __HAVE_ARCH_STRCMP */

#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *__strcpy(char *dst, const char *src)
{
    int d0, d1, d2;
#if ASM_NO_64
    asm volatile (
        "1: lodsb;"
        "stosb;"
        "testb %%al, %%al;"
        "jne 1b;"
        : "=&S" (d0), "=&D" (d1), "=&a" (d2)
        : "0" (src), "1" (dst) : "memory");
#endif
    return dst;
}
#endif /* __HAVE_ARCH_STRCPY */

#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *__memset(void *s, char c, size_t n)
{
    int d0, d1;
#if ASM_NO_64
    asm volatile (
        "rep; stosb;"
        : "=&c" (d0), "=&D" (d1)
        : "0" (n), "a" (c), "1" (s)
        : "memory");
#endif
    return s;
}
#endif /* __HAVE_ARCH_MEMSET */

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *__memmove(void *dst, const void *src, size_t n)
{
    if (dst < src)
    {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
#if ASM_NO_64
    asm volatile (
        "std;"
        "rep; movsb;"
        "cld;"
        : "=&c" (d0), "=&S" (d1), "=&D" (d2)
        : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
        : "memory");
#endif
    return dst;
}
#endif /* __HAVE_ARCH_MEMMOVE */

#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *__memcpy(void *dst, const void *src, size_t n)
{
    int d0, d1, d2;
#if ASM_NO_64
    asm volatile (
        "rep; movsl;"
        "movl %4, %%ecx;"
        "andl $3, %%ecx;"
        "jz 1f;"
        "rep; movsb;"
        "1:"
        : "=&c" (d0), "=&D" (d1), "=&S" (d2)
        : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
        : "memory");
#endif
    return dst;
}
#endif /* __HAVE_ARCH_MEMCPY */

#endif /* !__LIBS_X86_H__ */
