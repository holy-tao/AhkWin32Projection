#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\M128A.ahk
#Include .\XSAVE_FORMAT.ahk

/**
 * Contains processor-specific register data. The system uses CONTEXT structures to perform various internal operations.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-context
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class CONTEXT extends Win32Struct
{
    static sizeof => 848

    static packingSize => 8

    /**
     * @type {Integer}
     */
    P1Home {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    P2Home {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    P3Home {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    P4Home {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    P5Home {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    P6Home {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ContextFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MxCsr {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    SegCs {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SegDs {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * @type {Integer}
     */
    SegEs {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    SegFs {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    SegGs {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    SegSs {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * @type {Integer}
     */
    EFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    Dr0 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Dr1 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    Dr2 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Dr3 {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    Dr6 {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    Dr7 {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    Rax {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    Rcx {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    Rdx {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    Rbx {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    Rsp {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    Rbp {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    Rsi {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    Rdi {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    R8 {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    R9 {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    R10 {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    R11 {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    R12 {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    R13 {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    R14 {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    R15 {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    Rip {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {XSAVE_FORMAT}
     */
    FltSave{
        get {
            if(!this.HasProp("__FltSave"))
                this.__FltSave := XSAVE_FORMAT(256, this)
            return this.__FltSave
        }
    }

    /**
     * @type {Array<M128A>}
     */
    Header{
        get {
            if(!this.HasProp("__HeaderProxyArray"))
                this.__HeaderProxyArray := Win32FixedArray(this.ptr + 256, 2, M128A, "")
            return this.__HeaderProxyArray
        }
    }

    /**
     * @type {Array<M128A>}
     */
    Legacy{
        get {
            if(!this.HasProp("__LegacyProxyArray"))
                this.__LegacyProxyArray := Win32FixedArray(this.ptr + 272, 8, M128A, "")
            return this.__LegacyProxyArray
        }
    }

    /**
     * @type {M128A}
     */
    Xmm0{
        get {
            if(!this.HasProp("__Xmm0"))
                this.__Xmm0 := M128A(336, this)
            return this.__Xmm0
        }
    }

    /**
     * @type {M128A}
     */
    Xmm1{
        get {
            if(!this.HasProp("__Xmm1"))
                this.__Xmm1 := M128A(352, this)
            return this.__Xmm1
        }
    }

    /**
     * @type {M128A}
     */
    Xmm2{
        get {
            if(!this.HasProp("__Xmm2"))
                this.__Xmm2 := M128A(368, this)
            return this.__Xmm2
        }
    }

    /**
     * @type {M128A}
     */
    Xmm3{
        get {
            if(!this.HasProp("__Xmm3"))
                this.__Xmm3 := M128A(384, this)
            return this.__Xmm3
        }
    }

    /**
     * @type {M128A}
     */
    Xmm4{
        get {
            if(!this.HasProp("__Xmm4"))
                this.__Xmm4 := M128A(400, this)
            return this.__Xmm4
        }
    }

    /**
     * @type {M128A}
     */
    Xmm5{
        get {
            if(!this.HasProp("__Xmm5"))
                this.__Xmm5 := M128A(416, this)
            return this.__Xmm5
        }
    }

    /**
     * @type {M128A}
     */
    Xmm6{
        get {
            if(!this.HasProp("__Xmm6"))
                this.__Xmm6 := M128A(432, this)
            return this.__Xmm6
        }
    }

    /**
     * @type {M128A}
     */
    Xmm7{
        get {
            if(!this.HasProp("__Xmm7"))
                this.__Xmm7 := M128A(448, this)
            return this.__Xmm7
        }
    }

    /**
     * @type {M128A}
     */
    Xmm8{
        get {
            if(!this.HasProp("__Xmm8"))
                this.__Xmm8 := M128A(464, this)
            return this.__Xmm8
        }
    }

    /**
     * @type {M128A}
     */
    Xmm9{
        get {
            if(!this.HasProp("__Xmm9"))
                this.__Xmm9 := M128A(480, this)
            return this.__Xmm9
        }
    }

    /**
     * @type {M128A}
     */
    Xmm10{
        get {
            if(!this.HasProp("__Xmm10"))
                this.__Xmm10 := M128A(496, this)
            return this.__Xmm10
        }
    }

    /**
     * @type {M128A}
     */
    Xmm11{
        get {
            if(!this.HasProp("__Xmm11"))
                this.__Xmm11 := M128A(512, this)
            return this.__Xmm11
        }
    }

    /**
     * @type {M128A}
     */
    Xmm12{
        get {
            if(!this.HasProp("__Xmm12"))
                this.__Xmm12 := M128A(528, this)
            return this.__Xmm12
        }
    }

    /**
     * @type {M128A}
     */
    Xmm13{
        get {
            if(!this.HasProp("__Xmm13"))
                this.__Xmm13 := M128A(544, this)
            return this.__Xmm13
        }
    }

    /**
     * @type {M128A}
     */
    Xmm14{
        get {
            if(!this.HasProp("__Xmm14"))
                this.__Xmm14 := M128A(560, this)
            return this.__Xmm14
        }
    }

    /**
     * @type {M128A}
     */
    Xmm15{
        get {
            if(!this.HasProp("__Xmm15"))
                this.__Xmm15 := M128A(576, this)
            return this.__Xmm15
        }
    }

    /**
     * @type {Array<M128A>}
     */
    VectorRegister{
        get {
            if(!this.HasProp("__VectorRegisterProxyArray"))
                this.__VectorRegisterProxyArray := Win32FixedArray(this.ptr + 592, 26, M128A, "")
            return this.__VectorRegisterProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VectorControl {
        get => NumGet(this, 800, "uint")
        set => NumPut("uint", value, this, 800)
    }

    /**
     * @type {Integer}
     */
    DebugControl {
        get => NumGet(this, 808, "uint")
        set => NumPut("uint", value, this, 808)
    }

    /**
     * @type {Integer}
     */
    LastBranchToRip {
        get => NumGet(this, 816, "uint")
        set => NumPut("uint", value, this, 816)
    }

    /**
     * @type {Integer}
     */
    LastBranchFromRip {
        get => NumGet(this, 824, "uint")
        set => NumPut("uint", value, this, 824)
    }

    /**
     * @type {Integer}
     */
    LastExceptionToRip {
        get => NumGet(this, 832, "uint")
        set => NumPut("uint", value, this, 832)
    }

    /**
     * @type {Integer}
     */
    LastExceptionFromRip {
        get => NumGet(this, 840, "uint")
        set => NumPut("uint", value, this, 840)
    }
}
