#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\M128A.ahk

/**
 * Contains processor-specific register data. The system uses CONTEXT structures to perform various internal operations. (CONTEXT)
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-context
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class CONTEXT extends Win32Struct
{
    static sizeof => 760

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
     * @type {Integer}
     */
    X0 {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    X1 {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    X2 {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    X3 {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    X4 {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    X5 {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    X6 {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    X7 {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    X8 {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    X9 {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    X10 {
        get => NumGet(this, 336, "uint")
        set => NumPut("uint", value, this, 336)
    }

    /**
     * @type {Integer}
     */
    X11 {
        get => NumGet(this, 344, "uint")
        set => NumPut("uint", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    X12 {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    X13 {
        get => NumGet(this, 360, "uint")
        set => NumPut("uint", value, this, 360)
    }

    /**
     * @type {Integer}
     */
    X14 {
        get => NumGet(this, 368, "uint")
        set => NumPut("uint", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    X15 {
        get => NumGet(this, 376, "uint")
        set => NumPut("uint", value, this, 376)
    }

    /**
     * @type {Integer}
     */
    X16 {
        get => NumGet(this, 384, "uint")
        set => NumPut("uint", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    X17 {
        get => NumGet(this, 392, "uint")
        set => NumPut("uint", value, this, 392)
    }

    /**
     * @type {Integer}
     */
    X18 {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * @type {Integer}
     */
    X19 {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * @type {Integer}
     */
    X20 {
        get => NumGet(this, 416, "uint")
        set => NumPut("uint", value, this, 416)
    }

    /**
     * @type {Integer}
     */
    X21 {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * @type {Integer}
     */
    X22 {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * @type {Integer}
     */
    X23 {
        get => NumGet(this, 440, "uint")
        set => NumPut("uint", value, this, 440)
    }

    /**
     * @type {Integer}
     */
    X24 {
        get => NumGet(this, 448, "uint")
        set => NumPut("uint", value, this, 448)
    }

    /**
     * @type {Integer}
     */
    X25 {
        get => NumGet(this, 456, "uint")
        set => NumPut("uint", value, this, 456)
    }

    /**
     * @type {Integer}
     */
    X26 {
        get => NumGet(this, 464, "uint")
        set => NumPut("uint", value, this, 464)
    }

    /**
     * @type {Integer}
     */
    X27 {
        get => NumGet(this, 472, "uint")
        set => NumPut("uint", value, this, 472)
    }

    /**
     * @type {Integer}
     */
    X28 {
        get => NumGet(this, 480, "uint")
        set => NumPut("uint", value, this, 480)
    }

    /**
     * @type {Integer}
     */
    Fp {
        get => NumGet(this, 488, "uint")
        set => NumPut("uint", value, this, 488)
    }

    /**
     * @type {Integer}
     */
    Lr {
        get => NumGet(this, 496, "uint")
        set => NumPut("uint", value, this, 496)
    }

    /**
     * @type {Array<UInt64>}
     */
    X{
        get {
            if(!this.HasProp("__XProxyArray"))
                this.__XProxyArray := Win32FixedArray(this.ptr + 256, 31, Primitive, "uint")
            return this.__XProxyArray
        }
    }

    /**
     * @type {Array<M128A>}
     */
    VectorRegister{
        get {
            if(!this.HasProp("__VectorRegisterProxyArray"))
                this.__VectorRegisterProxyArray := Win32FixedArray(this.ptr + 504, 26, M128A, "")
            return this.__VectorRegisterProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VectorControl {
        get => NumGet(this, 712, "uint")
        set => NumPut("uint", value, this, 712)
    }

    /**
     * @type {Integer}
     */
    DebugControl {
        get => NumGet(this, 720, "uint")
        set => NumPut("uint", value, this, 720)
    }

    /**
     * @type {Integer}
     */
    LastBranchToRip {
        get => NumGet(this, 728, "uint")
        set => NumPut("uint", value, this, 728)
    }

    /**
     * @type {Integer}
     */
    LastBranchFromRip {
        get => NumGet(this, 736, "uint")
        set => NumPut("uint", value, this, 736)
    }

    /**
     * @type {Integer}
     */
    LastExceptionToRip {
        get => NumGet(this, 744, "uint")
        set => NumPut("uint", value, this, 744)
    }

    /**
     * @type {Integer}
     */
    LastExceptionFromRip {
        get => NumGet(this, 752, "uint")
        set => NumPut("uint", value, this, 752)
    }
}
