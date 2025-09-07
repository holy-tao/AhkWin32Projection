#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Kernel\LIST_ENTRY64.ahk
#Include .\DBGKD_DEBUG_DATA_HEADER64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class KDDEBUGGER_DATA64 extends Win32Struct
{
    static sizeof => 928

    static packingSize => 8

    /**
     * @type {DBGKD_DEBUG_DATA_HEADER64}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := DBGKD_DEBUG_DATA_HEADER64(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    KernBase {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    BreakpointWithStatus {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    SavedContext {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ThCallbackStack {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    NextCallback {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    FramePointer {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * @type {Integer}
     */
    KiCallUserMode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    KeUserCallbackDispatcher {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    PsLoadedModuleList {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    PsActiveProcessHead {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    PspCidTable {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ExpSystemResourcesList {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ExpPagedPoolDescriptor {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    ExpNumberOfPagedPools {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    KeTimeIncrement {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    KeBugCheckCallbackListHead {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    KiBugcheckData {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    IopErrorLogListHead {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    ObpRootDirectoryObject {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    ObpTypeObjectType {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    MmSystemCacheStart {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    MmSystemCacheEnd {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    MmSystemCacheWs {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    MmPfnDatabase {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    MmSystemPtesStart {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    MmSystemPtesEnd {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    MmSubsectionBase {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    MmNumberOfPagingFiles {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    MmLowestPhysicalPage {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    MmHighestPhysicalPage {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    MmNumberOfPhysicalPages {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    MmMaximumNonPagedPoolInBytes {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    MmNonPagedSystemStart {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    MmNonPagedPoolStart {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    MmNonPagedPoolEnd {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolStart {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolEnd {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolInformation {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    MmPageSize {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    MmSizeOfPagedPoolInBytes {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    MmTotalCommitLimit {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    MmTotalCommittedPages {
        get => NumGet(this, 336, "uint")
        set => NumPut("uint", value, this, 336)
    }

    /**
     * @type {Integer}
     */
    MmSharedCommit {
        get => NumGet(this, 344, "uint")
        set => NumPut("uint", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    MmDriverCommit {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    MmProcessCommit {
        get => NumGet(this, 360, "uint")
        set => NumPut("uint", value, this, 360)
    }

    /**
     * @type {Integer}
     */
    MmPagedPoolCommit {
        get => NumGet(this, 368, "uint")
        set => NumPut("uint", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    MmExtendedCommit {
        get => NumGet(this, 376, "uint")
        set => NumPut("uint", value, this, 376)
    }

    /**
     * @type {Integer}
     */
    MmZeroedPageListHead {
        get => NumGet(this, 384, "uint")
        set => NumPut("uint", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    MmFreePageListHead {
        get => NumGet(this, 392, "uint")
        set => NumPut("uint", value, this, 392)
    }

    /**
     * @type {Integer}
     */
    MmStandbyPageListHead {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * @type {Integer}
     */
    MmModifiedPageListHead {
        get => NumGet(this, 408, "uint")
        set => NumPut("uint", value, this, 408)
    }

    /**
     * @type {Integer}
     */
    MmModifiedNoWritePageListHead {
        get => NumGet(this, 416, "uint")
        set => NumPut("uint", value, this, 416)
    }

    /**
     * @type {Integer}
     */
    MmAvailablePages {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * @type {Integer}
     */
    MmResidentAvailablePages {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * @type {Integer}
     */
    PoolTrackTable {
        get => NumGet(this, 440, "uint")
        set => NumPut("uint", value, this, 440)
    }

    /**
     * @type {Integer}
     */
    NonPagedPoolDescriptor {
        get => NumGet(this, 448, "uint")
        set => NumPut("uint", value, this, 448)
    }

    /**
     * @type {Integer}
     */
    MmHighestUserAddress {
        get => NumGet(this, 456, "uint")
        set => NumPut("uint", value, this, 456)
    }

    /**
     * @type {Integer}
     */
    MmSystemRangeStart {
        get => NumGet(this, 464, "uint")
        set => NumPut("uint", value, this, 464)
    }

    /**
     * @type {Integer}
     */
    MmUserProbeAddress {
        get => NumGet(this, 472, "uint")
        set => NumPut("uint", value, this, 472)
    }

    /**
     * @type {Integer}
     */
    KdPrintCircularBuffer {
        get => NumGet(this, 480, "uint")
        set => NumPut("uint", value, this, 480)
    }

    /**
     * @type {Integer}
     */
    KdPrintCircularBufferEnd {
        get => NumGet(this, 488, "uint")
        set => NumPut("uint", value, this, 488)
    }

    /**
     * @type {Integer}
     */
    KdPrintWritePointer {
        get => NumGet(this, 496, "uint")
        set => NumPut("uint", value, this, 496)
    }

    /**
     * @type {Integer}
     */
    KdPrintRolloverCount {
        get => NumGet(this, 504, "uint")
        set => NumPut("uint", value, this, 504)
    }

    /**
     * @type {Integer}
     */
    MmLoadedUserImageList {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }

    /**
     * @type {Integer}
     */
    NtBuildLab {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    KiNormalSystemCall {
        get => NumGet(this, 528, "uint")
        set => NumPut("uint", value, this, 528)
    }

    /**
     * @type {Integer}
     */
    KiProcessorBlock {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    MmUnloadedDrivers {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {Integer}
     */
    MmLastUnloadedDriver {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    MmTriageActionTaken {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    MmSpecialPoolTag {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }

    /**
     * @type {Integer}
     */
    KernelVerifier {
        get => NumGet(this, 576, "uint")
        set => NumPut("uint", value, this, 576)
    }

    /**
     * @type {Integer}
     */
    MmVerifierData {
        get => NumGet(this, 584, "uint")
        set => NumPut("uint", value, this, 584)
    }

    /**
     * @type {Integer}
     */
    MmAllocatedNonPagedPool {
        get => NumGet(this, 592, "uint")
        set => NumPut("uint", value, this, 592)
    }

    /**
     * @type {Integer}
     */
    MmPeakCommitment {
        get => NumGet(this, 600, "uint")
        set => NumPut("uint", value, this, 600)
    }

    /**
     * @type {Integer}
     */
    MmTotalCommitLimitMaximum {
        get => NumGet(this, 608, "uint")
        set => NumPut("uint", value, this, 608)
    }

    /**
     * @type {Integer}
     */
    CmNtCSDVersion {
        get => NumGet(this, 616, "uint")
        set => NumPut("uint", value, this, 616)
    }

    /**
     * @type {Integer}
     */
    MmPhysicalMemoryBlock {
        get => NumGet(this, 624, "uint")
        set => NumPut("uint", value, this, 624)
    }

    /**
     * @type {Integer}
     */
    MmSessionBase {
        get => NumGet(this, 632, "uint")
        set => NumPut("uint", value, this, 632)
    }

    /**
     * @type {Integer}
     */
    MmSessionSize {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }

    /**
     * @type {Integer}
     */
    MmSystemParentTablePage {
        get => NumGet(this, 648, "uint")
        set => NumPut("uint", value, this, 648)
    }

    /**
     * @type {Integer}
     */
    MmVirtualTranslationBase {
        get => NumGet(this, 656, "uint")
        set => NumPut("uint", value, this, 656)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadNextProcessor {
        get => NumGet(this, 664, "ushort")
        set => NumPut("ushort", value, this, 664)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadTeb {
        get => NumGet(this, 666, "ushort")
        set => NumPut("ushort", value, this, 666)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadKernelStack {
        get => NumGet(this, 668, "ushort")
        set => NumPut("ushort", value, this, 668)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadInitialStack {
        get => NumGet(this, 670, "ushort")
        set => NumPut("ushort", value, this, 670)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadApcProcess {
        get => NumGet(this, 672, "ushort")
        set => NumPut("ushort", value, this, 672)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadState {
        get => NumGet(this, 674, "ushort")
        set => NumPut("ushort", value, this, 674)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadBStore {
        get => NumGet(this, 676, "ushort")
        set => NumPut("ushort", value, this, 676)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadBStoreLimit {
        get => NumGet(this, 678, "ushort")
        set => NumPut("ushort", value, this, 678)
    }

    /**
     * @type {Integer}
     */
    SizeEProcess {
        get => NumGet(this, 680, "ushort")
        set => NumPut("ushort", value, this, 680)
    }

    /**
     * @type {Integer}
     */
    OffsetEprocessPeb {
        get => NumGet(this, 682, "ushort")
        set => NumPut("ushort", value, this, 682)
    }

    /**
     * @type {Integer}
     */
    OffsetEprocessParentCID {
        get => NumGet(this, 684, "ushort")
        set => NumPut("ushort", value, this, 684)
    }

    /**
     * @type {Integer}
     */
    OffsetEprocessDirectoryTableBase {
        get => NumGet(this, 686, "ushort")
        set => NumPut("ushort", value, this, 686)
    }

    /**
     * @type {Integer}
     */
    SizePrcb {
        get => NumGet(this, 688, "ushort")
        set => NumPut("ushort", value, this, 688)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbDpcRoutine {
        get => NumGet(this, 690, "ushort")
        set => NumPut("ushort", value, this, 690)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbCurrentThread {
        get => NumGet(this, 692, "ushort")
        set => NumPut("ushort", value, this, 692)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbMhz {
        get => NumGet(this, 694, "ushort")
        set => NumPut("ushort", value, this, 694)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbCpuType {
        get => NumGet(this, 696, "ushort")
        set => NumPut("ushort", value, this, 696)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbVendorString {
        get => NumGet(this, 698, "ushort")
        set => NumPut("ushort", value, this, 698)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbProcStateContext {
        get => NumGet(this, 700, "ushort")
        set => NumPut("ushort", value, this, 700)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbNumber {
        get => NumGet(this, 702, "ushort")
        set => NumPut("ushort", value, this, 702)
    }

    /**
     * @type {Integer}
     */
    SizeEThread {
        get => NumGet(this, 704, "ushort")
        set => NumPut("ushort", value, this, 704)
    }

    /**
     * @type {Integer}
     */
    L1tfHighPhysicalBitIndex {
        get => NumGet(this, 706, "char")
        set => NumPut("char", value, this, 706)
    }

    /**
     * @type {Integer}
     */
    L1tfSwizzleBitIndex {
        get => NumGet(this, 707, "char")
        set => NumPut("char", value, this, 707)
    }

    /**
     * @type {Integer}
     */
    Padding0 {
        get => NumGet(this, 708, "uint")
        set => NumPut("uint", value, this, 708)
    }

    /**
     * @type {Integer}
     */
    KdPrintCircularBufferPtr {
        get => NumGet(this, 712, "uint")
        set => NumPut("uint", value, this, 712)
    }

    /**
     * @type {Integer}
     */
    KdPrintBufferSize {
        get => NumGet(this, 720, "uint")
        set => NumPut("uint", value, this, 720)
    }

    /**
     * @type {Integer}
     */
    KeLoaderBlock {
        get => NumGet(this, 728, "uint")
        set => NumPut("uint", value, this, 728)
    }

    /**
     * @type {Integer}
     */
    SizePcr {
        get => NumGet(this, 736, "ushort")
        set => NumPut("ushort", value, this, 736)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrSelfPcr {
        get => NumGet(this, 738, "ushort")
        set => NumPut("ushort", value, this, 738)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrCurrentPrcb {
        get => NumGet(this, 740, "ushort")
        set => NumPut("ushort", value, this, 740)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrContainedPrcb {
        get => NumGet(this, 742, "ushort")
        set => NumPut("ushort", value, this, 742)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrInitialBStore {
        get => NumGet(this, 744, "ushort")
        set => NumPut("ushort", value, this, 744)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrBStoreLimit {
        get => NumGet(this, 746, "ushort")
        set => NumPut("ushort", value, this, 746)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrInitialStack {
        get => NumGet(this, 748, "ushort")
        set => NumPut("ushort", value, this, 748)
    }

    /**
     * @type {Integer}
     */
    OffsetPcrStackLimit {
        get => NumGet(this, 750, "ushort")
        set => NumPut("ushort", value, this, 750)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbPcrPage {
        get => NumGet(this, 752, "ushort")
        set => NumPut("ushort", value, this, 752)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbProcStateSpecialReg {
        get => NumGet(this, 754, "ushort")
        set => NumPut("ushort", value, this, 754)
    }

    /**
     * @type {Integer}
     */
    GdtR0Code {
        get => NumGet(this, 756, "ushort")
        set => NumPut("ushort", value, this, 756)
    }

    /**
     * @type {Integer}
     */
    GdtR0Data {
        get => NumGet(this, 758, "ushort")
        set => NumPut("ushort", value, this, 758)
    }

    /**
     * @type {Integer}
     */
    GdtR0Pcr {
        get => NumGet(this, 760, "ushort")
        set => NumPut("ushort", value, this, 760)
    }

    /**
     * @type {Integer}
     */
    GdtR3Code {
        get => NumGet(this, 762, "ushort")
        set => NumPut("ushort", value, this, 762)
    }

    /**
     * @type {Integer}
     */
    GdtR3Data {
        get => NumGet(this, 764, "ushort")
        set => NumPut("ushort", value, this, 764)
    }

    /**
     * @type {Integer}
     */
    GdtR3Teb {
        get => NumGet(this, 766, "ushort")
        set => NumPut("ushort", value, this, 766)
    }

    /**
     * @type {Integer}
     */
    GdtLdt {
        get => NumGet(this, 768, "ushort")
        set => NumPut("ushort", value, this, 768)
    }

    /**
     * @type {Integer}
     */
    GdtTss {
        get => NumGet(this, 770, "ushort")
        set => NumPut("ushort", value, this, 770)
    }

    /**
     * @type {Integer}
     */
    Gdt64R3CmCode {
        get => NumGet(this, 772, "ushort")
        set => NumPut("ushort", value, this, 772)
    }

    /**
     * @type {Integer}
     */
    Gdt64R3CmTeb {
        get => NumGet(this, 774, "ushort")
        set => NumPut("ushort", value, this, 774)
    }

    /**
     * @type {Integer}
     */
    IopNumTriageDumpDataBlocks {
        get => NumGet(this, 776, "uint")
        set => NumPut("uint", value, this, 776)
    }

    /**
     * @type {Integer}
     */
    IopTriageDumpDataBlocks {
        get => NumGet(this, 784, "uint")
        set => NumPut("uint", value, this, 784)
    }

    /**
     * @type {Integer}
     */
    VfCrashDataBlock {
        get => NumGet(this, 792, "uint")
        set => NumPut("uint", value, this, 792)
    }

    /**
     * @type {Integer}
     */
    MmBadPagesDetected {
        get => NumGet(this, 800, "uint")
        set => NumPut("uint", value, this, 800)
    }

    /**
     * @type {Integer}
     */
    MmZeroedPageSingleBitErrorsDetected {
        get => NumGet(this, 808, "uint")
        set => NumPut("uint", value, this, 808)
    }

    /**
     * @type {Integer}
     */
    EtwpDebuggerData {
        get => NumGet(this, 816, "uint")
        set => NumPut("uint", value, this, 816)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbContext {
        get => NumGet(this, 824, "ushort")
        set => NumPut("ushort", value, this, 824)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbMaxBreakpoints {
        get => NumGet(this, 826, "ushort")
        set => NumPut("ushort", value, this, 826)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbMaxWatchpoints {
        get => NumGet(this, 828, "ushort")
        set => NumPut("ushort", value, this, 828)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadStackLimit {
        get => NumGet(this, 832, "uint")
        set => NumPut("uint", value, this, 832)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadStackBase {
        get => NumGet(this, 836, "uint")
        set => NumPut("uint", value, this, 836)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadQueueListEntry {
        get => NumGet(this, 840, "uint")
        set => NumPut("uint", value, this, 840)
    }

    /**
     * @type {Integer}
     */
    OffsetEThreadIrpList {
        get => NumGet(this, 844, "uint")
        set => NumPut("uint", value, this, 844)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbIdleThread {
        get => NumGet(this, 848, "ushort")
        set => NumPut("ushort", value, this, 848)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbNormalDpcState {
        get => NumGet(this, 850, "ushort")
        set => NumPut("ushort", value, this, 850)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbDpcStack {
        get => NumGet(this, 852, "ushort")
        set => NumPut("ushort", value, this, 852)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbIsrStack {
        get => NumGet(this, 854, "ushort")
        set => NumPut("ushort", value, this, 854)
    }

    /**
     * @type {Integer}
     */
    SizeKDPC_STACK_FRAME {
        get => NumGet(this, 856, "ushort")
        set => NumPut("ushort", value, this, 856)
    }

    /**
     * @type {Integer}
     */
    OffsetKPriQueueThreadListHead {
        get => NumGet(this, 858, "ushort")
        set => NumPut("ushort", value, this, 858)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadWaitReason {
        get => NumGet(this, 860, "ushort")
        set => NumPut("ushort", value, this, 860)
    }

    /**
     * @type {Integer}
     */
    Padding1 {
        get => NumGet(this, 862, "ushort")
        set => NumPut("ushort", value, this, 862)
    }

    /**
     * @type {Integer}
     */
    PteBase {
        get => NumGet(this, 864, "uint")
        set => NumPut("uint", value, this, 864)
    }

    /**
     * @type {Integer}
     */
    RetpolineStubFunctionTable {
        get => NumGet(this, 872, "uint")
        set => NumPut("uint", value, this, 872)
    }

    /**
     * @type {Integer}
     */
    RetpolineStubFunctionTableSize {
        get => NumGet(this, 880, "uint")
        set => NumPut("uint", value, this, 880)
    }

    /**
     * @type {Integer}
     */
    RetpolineStubOffset {
        get => NumGet(this, 884, "uint")
        set => NumPut("uint", value, this, 884)
    }

    /**
     * @type {Integer}
     */
    RetpolineStubSize {
        get => NumGet(this, 888, "uint")
        set => NumPut("uint", value, this, 888)
    }

    /**
     * @type {Integer}
     */
    OffsetEProcessMmHotPatchContext {
        get => NumGet(this, 892, "ushort")
        set => NumPut("ushort", value, this, 892)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadShadowStackLimit {
        get => NumGet(this, 896, "uint")
        set => NumPut("uint", value, this, 896)
    }

    /**
     * @type {Integer}
     */
    OffsetKThreadShadowStackBase {
        get => NumGet(this, 900, "uint")
        set => NumPut("uint", value, this, 900)
    }

    /**
     * @type {Integer}
     */
    ShadowStackEnabled {
        get => NumGet(this, 904, "uint")
        set => NumPut("uint", value, this, 904)
    }

    /**
     * @type {Integer}
     */
    PointerAuthMask {
        get => NumGet(this, 912, "uint")
        set => NumPut("uint", value, this, 912)
    }

    /**
     * @type {Integer}
     */
    OffsetPrcbExceptionStack {
        get => NumGet(this, 920, "ushort")
        set => NumPut("ushort", value, this, 920)
    }
}
