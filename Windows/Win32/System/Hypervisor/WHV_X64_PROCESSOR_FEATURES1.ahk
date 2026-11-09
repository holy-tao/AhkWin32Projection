#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_X64_PROCESSOR_FEATURES1 extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - ACountMCountSupport
     * - TscInvariantSupport
     * - ClZeroSupport
     * - RdpruSupport
     * - La57Support
     * - MbecSupport
     * - NestedVirtSupport
     * - PsfdSupport
     * - CetSsSupport
     * - CetIbtSupport
     * - VmxExceptionInjectSupport
     * - Reserved2
     * - UmwaitTpauseSupport
     * - MovdiriSupport
     * - Movdir64bSupport
     * - CldemoteSupport
     * - SerializeSupport
     * - TscDeadlineTmrSupport
     * - TscAdjustSupport
     * - FZLRepMovsb
     * - FSRepStosb
     * - FSRepCmpsb
     * - TsxLdTrkSupport
     * - VmxInsOutsExitInfoSupport
     * - Reserved3
     * - SbdrSsdpNoSupport
     * - FbsdpNoSupport
     * - PsdpNoSupport
     * - FbClearSupport
     * - BtcNoSupport
     * - IbpbRsbFlushSupport
     * - StibpAlwaysOnSupport
     * - PerfGlobalCtrlSupport
     * - NptExecuteOnlySupport
     * - NptADFlagsSupport
     * - Npt1GbPageSupport
     * - Reserved4
     * - Reserved5
     * - Reserved6
     * - Reserved7
     * - CmpccxaddSupport
     * - Reserved8
     * - Reserved9
     * - Reserved10
     * - Reserved11
     * - PrefetchISupport
     * - Sha512Support
     * - Reserved12
     * - Reserved13
     * - Reserved14
     * - SM3Support
     * - SM4Support
     * - Reserved15
     * - Reserved16
     * - SbpbSupported
     * - IbpbBrTypeSupported
     * - SrsoNoSupported
     * - SrsoUserKernelNoSupported
     * - Reserved17
     * - Reserved18
     * - Reserved19
     * - LassSupport
     * - IdleHltInterceptSupport
     * - MsrListSupport
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ACountMCountSupport {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    TscInvariantSupport {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ClZeroSupport {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    RdpruSupport {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    La57Support {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    MbecSupport {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    NestedVirtSupport {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    PsfdSupport {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    CetSsSupport {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    CetIbtSupport {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    VmxExceptionInjectSupport {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    UmwaitTpauseSupport {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    MovdiriSupport {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    Movdir64bSupport {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    CldemoteSupport {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    SerializeSupport {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    TscDeadlineTmrSupport {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    TscAdjustSupport {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    FZLRepMovsb {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    FSRepStosb {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    FSRepCmpsb {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    TsxLdTrkSupport {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    VmxInsOutsExitInfoSupport {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * @type {Integer}
     */
    SbdrSsdpNoSupport {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * @type {Integer}
     */
    FbsdpNoSupport {
        get => (this._bitfield >> 26) & 0x1
        set => this._bitfield := ((value & 0x1) << 26) | (this._bitfield & ~(0x1 << 26))
    }

    /**
     * @type {Integer}
     */
    PsdpNoSupport {
        get => (this._bitfield >> 27) & 0x1
        set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
    }

    /**
     * @type {Integer}
     */
    FbClearSupport {
        get => (this._bitfield >> 28) & 0x1
        set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
    }

    /**
     * @type {Integer}
     */
    BtcNoSupport {
        get => (this._bitfield >> 29) & 0x1
        set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
    }

    /**
     * @type {Integer}
     */
    IbpbRsbFlushSupport {
        get => (this._bitfield >> 30) & 0x1
        set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    StibpAlwaysOnSupport {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    PerfGlobalCtrlSupport {
        get => (this._bitfield >> 32) & 0x1
        set => this._bitfield := ((value & 0x1) << 32) | (this._bitfield & ~(0x1 << 32))
    }

    /**
     * @type {Integer}
     */
    NptExecuteOnlySupport {
        get => (this._bitfield >> 33) & 0x1
        set => this._bitfield := ((value & 0x1) << 33) | (this._bitfield & ~(0x1 << 33))
    }

    /**
     * @type {Integer}
     */
    NptADFlagsSupport {
        get => (this._bitfield >> 34) & 0x1
        set => this._bitfield := ((value & 0x1) << 34) | (this._bitfield & ~(0x1 << 34))
    }

    /**
     * @type {Integer}
     */
    Npt1GbPageSupport {
        get => (this._bitfield >> 35) & 0x1
        set => this._bitfield := ((value & 0x1) << 35) | (this._bitfield & ~(0x1 << 35))
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => (this._bitfield >> 36) & 0x1
        set => this._bitfield := ((value & 0x1) << 36) | (this._bitfield & ~(0x1 << 36))
    }

    /**
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield >> 37) & 0x1
        set => this._bitfield := ((value & 0x1) << 37) | (this._bitfield & ~(0x1 << 37))
    }

    /**
     * @type {Integer}
     */
    Reserved6 {
        get => (this._bitfield >> 38) & 0x1
        set => this._bitfield := ((value & 0x1) << 38) | (this._bitfield & ~(0x1 << 38))
    }

    /**
     * @type {Integer}
     */
    Reserved7 {
        get => (this._bitfield >> 39) & 0x1
        set => this._bitfield := ((value & 0x1) << 39) | (this._bitfield & ~(0x1 << 39))
    }

    /**
     * @type {Integer}
     */
    CmpccxaddSupport {
        get => (this._bitfield >> 40) & 0x1
        set => this._bitfield := ((value & 0x1) << 40) | (this._bitfield & ~(0x1 << 40))
    }

    /**
     * @type {Integer}
     */
    Reserved8 {
        get => (this._bitfield >> 41) & 0x1
        set => this._bitfield := ((value & 0x1) << 41) | (this._bitfield & ~(0x1 << 41))
    }

    /**
     * @type {Integer}
     */
    Reserved9 {
        get => (this._bitfield >> 42) & 0x1
        set => this._bitfield := ((value & 0x1) << 42) | (this._bitfield & ~(0x1 << 42))
    }

    /**
     * @type {Integer}
     */
    Reserved10 {
        get => (this._bitfield >> 43) & 0x1
        set => this._bitfield := ((value & 0x1) << 43) | (this._bitfield & ~(0x1 << 43))
    }

    /**
     * @type {Integer}
     */
    Reserved11 {
        get => (this._bitfield >> 44) & 0x1
        set => this._bitfield := ((value & 0x1) << 44) | (this._bitfield & ~(0x1 << 44))
    }

    /**
     * @type {Integer}
     */
    PrefetchISupport {
        get => (this._bitfield >> 45) & 0x1
        set => this._bitfield := ((value & 0x1) << 45) | (this._bitfield & ~(0x1 << 45))
    }

    /**
     * @type {Integer}
     */
    Sha512Support {
        get => (this._bitfield >> 46) & 0x1
        set => this._bitfield := ((value & 0x1) << 46) | (this._bitfield & ~(0x1 << 46))
    }

    /**
     * @type {Integer}
     */
    Reserved12 {
        get => (this._bitfield >> 47) & 0x1
        set => this._bitfield := ((value & 0x1) << 47) | (this._bitfield & ~(0x1 << 47))
    }

    /**
     * @type {Integer}
     */
    Reserved13 {
        get => (this._bitfield >> 48) & 0x1
        set => this._bitfield := ((value & 0x1) << 48) | (this._bitfield & ~(0x1 << 48))
    }

    /**
     * @type {Integer}
     */
    Reserved14 {
        get => (this._bitfield >> 49) & 0x1
        set => this._bitfield := ((value & 0x1) << 49) | (this._bitfield & ~(0x1 << 49))
    }

    /**
     * @type {Integer}
     */
    SM3Support {
        get => (this._bitfield >> 50) & 0x1
        set => this._bitfield := ((value & 0x1) << 50) | (this._bitfield & ~(0x1 << 50))
    }

    /**
     * @type {Integer}
     */
    SM4Support {
        get => (this._bitfield >> 51) & 0x1
        set => this._bitfield := ((value & 0x1) << 51) | (this._bitfield & ~(0x1 << 51))
    }

    /**
     * @type {Integer}
     */
    Reserved15 {
        get => (this._bitfield >> 52) & 0x1
        set => this._bitfield := ((value & 0x1) << 52) | (this._bitfield & ~(0x1 << 52))
    }

    /**
     * @type {Integer}
     */
    Reserved16 {
        get => (this._bitfield >> 53) & 0x1
        set => this._bitfield := ((value & 0x1) << 53) | (this._bitfield & ~(0x1 << 53))
    }

    /**
     * @type {Integer}
     */
    SbpbSupported {
        get => (this._bitfield >> 54) & 0x1
        set => this._bitfield := ((value & 0x1) << 54) | (this._bitfield & ~(0x1 << 54))
    }

    /**
     * @type {Integer}
     */
    IbpbBrTypeSupported {
        get => (this._bitfield >> 55) & 0x1
        set => this._bitfield := ((value & 0x1) << 55) | (this._bitfield & ~(0x1 << 55))
    }

    /**
     * @type {Integer}
     */
    SrsoNoSupported {
        get => (this._bitfield >> 56) & 0x1
        set => this._bitfield := ((value & 0x1) << 56) | (this._bitfield & ~(0x1 << 56))
    }

    /**
     * @type {Integer}
     */
    SrsoUserKernelNoSupported {
        get => (this._bitfield >> 57) & 0x1
        set => this._bitfield := ((value & 0x1) << 57) | (this._bitfield & ~(0x1 << 57))
    }

    /**
     * @type {Integer}
     */
    Reserved17 {
        get => (this._bitfield >> 58) & 0x1
        set => this._bitfield := ((value & 0x1) << 58) | (this._bitfield & ~(0x1 << 58))
    }

    /**
     * @type {Integer}
     */
    Reserved18 {
        get => (this._bitfield >> 59) & 0x1
        set => this._bitfield := ((value & 0x1) << 59) | (this._bitfield & ~(0x1 << 59))
    }

    /**
     * @type {Integer}
     */
    Reserved19 {
        get => (this._bitfield >> 60) & 0x1
        set => this._bitfield := ((value & 0x1) << 60) | (this._bitfield & ~(0x1 << 60))
    }

    /**
     * @type {Integer}
     */
    LassSupport {
        get => (this._bitfield >> 61) & 0x1
        set => this._bitfield := ((value & 0x1) << 61) | (this._bitfield & ~(0x1 << 61))
    }

    /**
     * @type {Integer}
     */
    IdleHltInterceptSupport {
        get => (this._bitfield >> 62) & 0x1
        set => this._bitfield := ((value & 0x1) << 62) | (this._bitfield & ~(0x1 << 62))
    }

    /**
     * @type {Integer}
     */
    MsrListSupport {
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
