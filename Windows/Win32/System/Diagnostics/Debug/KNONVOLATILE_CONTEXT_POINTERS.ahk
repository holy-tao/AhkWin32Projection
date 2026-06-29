#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\M128A.ahk" { M128A }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64
 */
export default struct KNONVOLATILE_CONTEXT_POINTERS {
    #StructPack 8

    FloatingContext : M128A.Ptr[16]

    IntegerContext : IntPtr[16]

    static __New() {
        DefineProp(this.Prototype, 'Xmm0', { type: M128A.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'Xmm1', { type: M128A.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'Xmm2', { type: M128A.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'Xmm3', { type: M128A.Ptr, offset: 24 })
        DefineProp(this.Prototype, 'Xmm4', { type: M128A.Ptr, offset: 32 })
        DefineProp(this.Prototype, 'Xmm5', { type: M128A.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'Xmm6', { type: M128A.Ptr, offset: 48 })
        DefineProp(this.Prototype, 'Xmm7', { type: M128A.Ptr, offset: 56 })
        DefineProp(this.Prototype, 'Xmm8', { type: M128A.Ptr, offset: 64 })
        DefineProp(this.Prototype, 'Xmm9', { type: M128A.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'Xmm10', { type: M128A.Ptr, offset: 80 })
        DefineProp(this.Prototype, 'Xmm11', { type: M128A.Ptr, offset: 88 })
        DefineProp(this.Prototype, 'Xmm12', { type: M128A.Ptr, offset: 96 })
        DefineProp(this.Prototype, 'Xmm13', { type: M128A.Ptr, offset: 104 })
        DefineProp(this.Prototype, 'Xmm14', { type: M128A.Ptr, offset: 112 })
        DefineProp(this.Prototype, 'Xmm15', { type: M128A.Ptr, offset: 120 })
        DefineProp(this.Prototype, 'Rax', { type: IntPtr, offset: 128 })
        DefineProp(this.Prototype, 'Rcx', { type: IntPtr, offset: 136 })
        DefineProp(this.Prototype, 'Rdx', { type: IntPtr, offset: 144 })
        DefineProp(this.Prototype, 'Rbx', { type: IntPtr, offset: 152 })
        DefineProp(this.Prototype, 'Rsp', { type: IntPtr, offset: 160 })
        DefineProp(this.Prototype, 'Rbp', { type: IntPtr, offset: 168 })
        DefineProp(this.Prototype, 'Rsi', { type: IntPtr, offset: 176 })
        DefineProp(this.Prototype, 'Rdi', { type: IntPtr, offset: 184 })
        DefineProp(this.Prototype, 'R8', { type: IntPtr, offset: 192 })
        DefineProp(this.Prototype, 'R9', { type: IntPtr, offset: 200 })
        DefineProp(this.Prototype, 'R10', { type: IntPtr, offset: 208 })
        DefineProp(this.Prototype, 'R11', { type: IntPtr, offset: 216 })
        DefineProp(this.Prototype, 'R12', { type: IntPtr, offset: 224 })
        DefineProp(this.Prototype, 'R13', { type: IntPtr, offset: 232 })
        DefineProp(this.Prototype, 'R14', { type: IntPtr, offset: 240 })
        DefineProp(this.Prototype, 'R15', { type: IntPtr, offset: 248 })
        this.DeleteProp("__New")
    }
}
