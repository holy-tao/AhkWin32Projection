#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Kernel\LIST_ENTRY32.ahk
#Include .\DBGKD_DEBUG_DATA_HEADER32.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class KDDEBUGGER_DATA32 extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {DBGKD_DEBUG_DATA_HEADER32}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := DBGKD_DEBUG_DATA_HEADER32(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    KernBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BreakpointWithStatus {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    SavedContext {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ThCallbackStack {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    NextCallback {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    FramePointer {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * This bitfield backs the following members:
     * - PaeEnabled
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    PaeEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    KiCallUserMode {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    KeUserCallbackDispatcher {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PsLoadedModuleList {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    PsActiveProcessHead {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    PspCidTable {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    ExpSystemResourcesList {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ExpPagedPoolDescriptor {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    ExpNumberOfPagedPools {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    KeTimeIncrement {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    KeBugCheckCallbackListHead {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    KiBugcheckData {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    IopErrorLogListHead {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ObpRootDirectoryObject {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    ObpTypeObjectType {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    MmSystemCacheStart {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    MmSystemCacheEnd {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MmSystemCacheWs {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    MmPfnDatabase {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    MmSystemPtesStart {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    MmSystemPtesEnd {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    MmSubsectionBase {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    MmNumberOfPagingFiles {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    MmLowestPhysicalPage {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    MmHighestPhysicalPage {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    MmNumberOfPhysicalPages {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    MmMaximumNonPagedPoolInBytes {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    MmNonPagedSystemStart {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    MmNonPagedPoolStart {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    MmNonPagedPoolEnd {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolStart {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolEnd {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolInformation {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    MmPageSize {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    MmSizeOfPagedPoolInBytes {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    MmTotalCommitLimit {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    MmTotalCommittedPages {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    MmSharedCommit {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    MmDriverCommit {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    MmProcessCommit {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolCommit {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    MmExtendedCommit {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    MmZeroedPageListHead {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    MmFreePageListHead {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    MmStandbyPageListHead {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    MmModifiedPageListHead {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    MmModifiedNoWritePageListHead {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    MmAvailablePages {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    MmResidentAvailablePages {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    PoolTrackTable {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    NonPagedPoolDescriptor {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    MmHighestUserAddress {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * @type {Integer}
     */
    MmSystemRangeStart {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    MmUserProbeAddress {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    KdPrintCircularBuffer {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    KdPrintCircularBufferEnd {
        get => NumGet(this, 252, "uint")
        set => NumPut("uint", value, this, 252)
    }

    /**
     * @type {Integer}
     */
    KdPrintWritePointer {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    KdPrintRolloverCount {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    MmLoadedUserImageList {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }
}
