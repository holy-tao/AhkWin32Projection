#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_PROCESSOR_FEATURES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - Sse3Support
     * - LahfSahfSupport
     * - Ssse3Support
     * - Sse4_1Support
     * - Sse4_2Support
     * - Sse4aSupport
     * - XopSupport
     * - PopCntSupport
     * - Cmpxchg16bSupport
     * - Altmovcr8Support
     * - LzcntSupport
     * - MisAlignSseSupport
     * - MmxExtSupport
     * - Amd3DNowSupport
     * - ExtendedAmd3DNowSupport
     * - Page1GbSupport
     * - AesSupport
     * - PclmulqdqSupport
     * - PcidSupport
     * - Fma4Support
     * - F16CSupport
     * - RdRandSupport
     * - RdWrFsGsSupport
     * - SmepSupport
     * - EnhancedFastStringSupport
     * - Bmi1Support
     * - Bmi2Support
     * - Reserved1
     * - MovbeSupport
     * - Npiep1Support
     * - DepX87FPUSaveSupport
     * - RdSeedSupport
     * - AdxSupport
     * - IntelPrefetchSupport
     * - SmapSupport
     * - HleSupport
     * - RtmSupport
     * - RdtscpSupport
     * - ClflushoptSupport
     * - ClwbSupport
     * - ShaSupport
     * - X87PointersSavedSupport
     * - InvpcidSupport
     * - IbrsSupport
     * - StibpSupport
     * - IbpbSupport
     * - Reserved2
     * - SsbdSupport
     * - FastShortRepMovSupport
     * - Reserved3
     * - RdclNo
     * - IbrsAllSupport
     * - Reserved4
     * - SsbNo
     * - RsbANo
     * - Reserved5
     * - RdPidSupport
     * - UmipSupport
     * - MdsNoSupport
     * - MdClearSupport
     * - TaaNoSupport
     * - TsxCtrlSupport
     * - Reserved6
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Sse3Support {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    LahfSahfSupport {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Ssse3Support {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Sse4_1Support {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Sse4_2Support {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Sse4aSupport {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    XopSupport {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    PopCntSupport {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    Cmpxchg16bSupport {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    Altmovcr8Support {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    LzcntSupport {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    MisAlignSseSupport {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    MmxExtSupport {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    Amd3DNowSupport {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    ExtendedAmd3DNowSupport {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    Page1GbSupport {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    AesSupport {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    PclmulqdqSupport {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    PcidSupport {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    Fma4Support {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    F16CSupport {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    RdRandSupport {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    RdWrFsGsSupport {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    SmepSupport {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    EnhancedFastStringSupport {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * @type {Integer}
     */
    Bmi1Support {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * @type {Integer}
     */
    Bmi2Support {
        get => (this._bitfield >> 26) & 0x1
        set => this._bitfield := ((value & 0x1) << 26) | (this._bitfield & ~(0x1 << 26))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 27) & 0x3
        set => this._bitfield := ((value & 0x3) << 27) | (this._bitfield & ~(0x3 << 27))
    }

    /**
     * @type {Integer}
     */
    MovbeSupport {
        get => (this._bitfield >> 29) & 0x1
        set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
    }

    /**
     * @type {Integer}
     */
    Npiep1Support {
        get => (this._bitfield >> 30) & 0x1
        set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    DepX87FPUSaveSupport {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    RdSeedSupport {
        get => (this._bitfield >> 32) & 0x1
        set => this._bitfield := ((value & 0x1) << 32) | (this._bitfield & ~(0x1 << 32))
    }

    /**
     * @type {Integer}
     */
    AdxSupport {
        get => (this._bitfield >> 33) & 0x1
        set => this._bitfield := ((value & 0x1) << 33) | (this._bitfield & ~(0x1 << 33))
    }

    /**
     * @type {Integer}
     */
    IntelPrefetchSupport {
        get => (this._bitfield >> 34) & 0x1
        set => this._bitfield := ((value & 0x1) << 34) | (this._bitfield & ~(0x1 << 34))
    }

    /**
     * @type {Integer}
     */
    SmapSupport {
        get => (this._bitfield >> 35) & 0x1
        set => this._bitfield := ((value & 0x1) << 35) | (this._bitfield & ~(0x1 << 35))
    }

    /**
     * @type {Integer}
     */
    HleSupport {
        get => (this._bitfield >> 36) & 0x1
        set => this._bitfield := ((value & 0x1) << 36) | (this._bitfield & ~(0x1 << 36))
    }

    /**
     * @type {Integer}
     */
    RtmSupport {
        get => (this._bitfield >> 37) & 0x1
        set => this._bitfield := ((value & 0x1) << 37) | (this._bitfield & ~(0x1 << 37))
    }

    /**
     * @type {Integer}
     */
    RdtscpSupport {
        get => (this._bitfield >> 38) & 0x1
        set => this._bitfield := ((value & 0x1) << 38) | (this._bitfield & ~(0x1 << 38))
    }

    /**
     * @type {Integer}
     */
    ClflushoptSupport {
        get => (this._bitfield >> 39) & 0x1
        set => this._bitfield := ((value & 0x1) << 39) | (this._bitfield & ~(0x1 << 39))
    }

    /**
     * @type {Integer}
     */
    ClwbSupport {
        get => (this._bitfield >> 40) & 0x1
        set => this._bitfield := ((value & 0x1) << 40) | (this._bitfield & ~(0x1 << 40))
    }

    /**
     * @type {Integer}
     */
    ShaSupport {
        get => (this._bitfield >> 41) & 0x1
        set => this._bitfield := ((value & 0x1) << 41) | (this._bitfield & ~(0x1 << 41))
    }

    /**
     * @type {Integer}
     */
    X87PointersSavedSupport {
        get => (this._bitfield >> 42) & 0x1
        set => this._bitfield := ((value & 0x1) << 42) | (this._bitfield & ~(0x1 << 42))
    }

    /**
     * @type {Integer}
     */
    InvpcidSupport {
        get => (this._bitfield >> 43) & 0x1
        set => this._bitfield := ((value & 0x1) << 43) | (this._bitfield & ~(0x1 << 43))
    }

    /**
     * @type {Integer}
     */
    IbrsSupport {
        get => (this._bitfield >> 44) & 0x1
        set => this._bitfield := ((value & 0x1) << 44) | (this._bitfield & ~(0x1 << 44))
    }

    /**
     * @type {Integer}
     */
    StibpSupport {
        get => (this._bitfield >> 45) & 0x1
        set => this._bitfield := ((value & 0x1) << 45) | (this._bitfield & ~(0x1 << 45))
    }

    /**
     * @type {Integer}
     */
    IbpbSupport {
        get => (this._bitfield >> 46) & 0x1
        set => this._bitfield := ((value & 0x1) << 46) | (this._bitfield & ~(0x1 << 46))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 47) & 0x1
        set => this._bitfield := ((value & 0x1) << 47) | (this._bitfield & ~(0x1 << 47))
    }

    /**
     * @type {Integer}
     */
    SsbdSupport {
        get => (this._bitfield >> 48) & 0x1
        set => this._bitfield := ((value & 0x1) << 48) | (this._bitfield & ~(0x1 << 48))
    }

    /**
     * @type {Integer}
     */
    FastShortRepMovSupport {
        get => (this._bitfield >> 49) & 0x1
        set => this._bitfield := ((value & 0x1) << 49) | (this._bitfield & ~(0x1 << 49))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield >> 50) & 0x1
        set => this._bitfield := ((value & 0x1) << 50) | (this._bitfield & ~(0x1 << 50))
    }

    /**
     * @type {Integer}
     */
    RdclNo {
        get => (this._bitfield >> 51) & 0x1
        set => this._bitfield := ((value & 0x1) << 51) | (this._bitfield & ~(0x1 << 51))
    }

    /**
     * @type {Integer}
     */
    IbrsAllSupport {
        get => (this._bitfield >> 52) & 0x1
        set => this._bitfield := ((value & 0x1) << 52) | (this._bitfield & ~(0x1 << 52))
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => (this._bitfield >> 53) & 0x1
        set => this._bitfield := ((value & 0x1) << 53) | (this._bitfield & ~(0x1 << 53))
    }

    /**
     * @type {Integer}
     */
    SsbNo {
        get => (this._bitfield >> 54) & 0x1
        set => this._bitfield := ((value & 0x1) << 54) | (this._bitfield & ~(0x1 << 54))
    }

    /**
     * @type {Integer}
     */
    RsbANo {
        get => (this._bitfield >> 55) & 0x1
        set => this._bitfield := ((value & 0x1) << 55) | (this._bitfield & ~(0x1 << 55))
    }

    /**
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield >> 56) & 0x1
        set => this._bitfield := ((value & 0x1) << 56) | (this._bitfield & ~(0x1 << 56))
    }

    /**
     * @type {Integer}
     */
    RdPidSupport {
        get => (this._bitfield >> 57) & 0x1
        set => this._bitfield := ((value & 0x1) << 57) | (this._bitfield & ~(0x1 << 57))
    }

    /**
     * @type {Integer}
     */
    UmipSupport {
        get => (this._bitfield >> 58) & 0x1
        set => this._bitfield := ((value & 0x1) << 58) | (this._bitfield & ~(0x1 << 58))
    }

    /**
     * @type {Integer}
     */
    MdsNoSupport {
        get => (this._bitfield >> 59) & 0x1
        set => this._bitfield := ((value & 0x1) << 59) | (this._bitfield & ~(0x1 << 59))
    }

    /**
     * @type {Integer}
     */
    MdClearSupport {
        get => (this._bitfield >> 60) & 0x1
        set => this._bitfield := ((value & 0x1) << 60) | (this._bitfield & ~(0x1 << 60))
    }

    /**
     * @type {Integer}
     */
    TaaNoSupport {
        get => (this._bitfield >> 61) & 0x1
        set => this._bitfield := ((value & 0x1) << 61) | (this._bitfield & ~(0x1 << 61))
    }

    /**
     * @type {Integer}
     */
    TsxCtrlSupport {
        get => (this._bitfield >> 62) & 0x1
        set => this._bitfield := ((value & 0x1) << 62) | (this._bitfield & ~(0x1 << 62))
    }

    /**
     * @type {Integer}
     */
    Reserved6 {
        get => (this._bitfield >> 63) & 0x1
        set => this._bitfield := ((value & 0x1) << 63) | (this._bitfield & ~(0x1 << 63))
    }

    /**
     * @type {Integer}
     */
    AsUINT64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
