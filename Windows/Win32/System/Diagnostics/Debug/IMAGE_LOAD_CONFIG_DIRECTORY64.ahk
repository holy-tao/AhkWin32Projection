#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_LOAD_CONFIG_CODE_INTEGRITY.ahk

/**
 * Contains the load configuration data of an image. (64 bit)
 * @remarks
 * If <b>_WIN64</b> is defined, then <b>IMAGE_LOAD_CONFIG_DIRECTORY</b> is defined as <b>IMAGE_LOAD_CONFIG_DIRECTORY64</b>. However, if <b>_WIN64</b> is not defined,  then <b>IMAGE_LOAD_CONFIG_DIRECTORY</b> is defined as <b>IMAGE_LOAD_CONFIG_DIRECTORY32</b>. 
  * 
  * 
  * ```cpp
  * typedef struct {
  *     DWORD   Size;
  *     DWORD   TimeDateStamp;
  *     WORD    MajorVersion;
  *     WORD    MinorVersion;
  *     DWORD   GlobalFlagsClear;
  *     DWORD   GlobalFlagsSet;
  *     DWORD   CriticalSectionDefaultTimeout;
  *     DWORD   DeCommitFreeBlockThreshold;
  *     DWORD   DeCommitTotalFreeThreshold;
  *     DWORD   LockPrefixTable;            // VA
  *     DWORD   MaximumAllocationSize;
  *     DWORD   VirtualMemoryThreshold;
  *     DWORD   ProcessHeapFlags;
  *     DWORD   ProcessAffinityMask;
  *     WORD    CSDVersion;
  *     WORD    DependentLoadFlags;
  *     DWORD   EditList;                   // VA
  *     DWORD   SecurityCookie;             // VA
  *     DWORD   SEHandlerTable;             // VA
  *     DWORD   SEHandlerCount;
  * } IMAGE_LOAD_CONFIG_DIRECTORY32, *PIMAGE_LOAD_CONFIG_DIRECTORY32;
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_load_config_directory64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_LOAD_CONFIG_DIRECTORY64 extends Win32Struct
{
    static sizeof => 320

    static packingSize => 4

    /**
     * The size of the structure. For Windows XP, the size must be specified as 64 for x86 images.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The date and time stamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The time stamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The major version number.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The minor version number.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The global flags that control system behavior. For more information, see Gflags.exe.
     * @type {Integer}
     */
    GlobalFlagsClear {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The global flags that control system behavior. For more information, see Gflags.exe.
     * @type {Integer}
     */
    GlobalFlagsSet {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The critical section default time-out value.
     * @type {Integer}
     */
    CriticalSectionDefaultTimeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The size of the minimum block that must be freed before it is freed (de-committed), in bytes. This value is advisory.
     * @type {Integer}
     */
    DeCommitFreeBlockThreshold {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The size of the minimum total memory that must be freed in the process heap before it is freed (de-committed), in bytes. This value is advisory.
     * @type {Integer}
     */
    DeCommitTotalFreeThreshold {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The VA of a list of addresses where the LOCK prefix is used. These will be replaced by NOP on single-processor systems. This member is available only for x86.
     * @type {Integer}
     */
    LockPrefixTable {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The maximum allocation size, in bytes. This member is obsolete and is used only for debugging purposes.
     * @type {Integer}
     */
    MaximumAllocationSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The maximum block size that can be allocated from heap segments, in bytes.
     * @type {Integer}
     */
    VirtualMemoryThreshold {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The process affinity mask. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprocessaffinitymask">GetProcessAffinityMask</a>. This member is available only for .exe files.
     * @type {Integer}
     */
    ProcessAffinityMask {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The process heap flags. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>.
     * @type {Integer}
     */
    ProcessHeapFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The service pack version.
     * @type {Integer}
     */
    CSDVersion {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * The default load flags used when the operating system resolves the statically linked imports of a module. For more information, see [LoadLibraryEx](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibraryexw).
     * @type {Integer}
     */
    DependentLoadFlags {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }

    /**
     * Reserved for use by the system.
     * @type {Integer}
     */
    EditList {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A pointer to a cookie that is used by Visual C++ or GS implementation.
     * @type {Integer}
     */
    SecurityCookie {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The VA of the sorted table of RVAs of each valid, unique handler in the image. This member is available only for x86.
     * @type {Integer}
     */
    SEHandlerTable {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The count of unique handlers in the table. This member is available only for x86.
     * @type {Integer}
     */
    SEHandlerCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardCFCheckFunctionPointer {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardCFDispatchFunctionPointer {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardCFFunctionTable {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardCFFunctionCount {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardFlags {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * 
     * @type {IMAGE_LOAD_CONFIG_CODE_INTEGRITY}
     */
    CodeIntegrity{
        get {
            if(!this.HasProp("__CodeIntegrity"))
                this.__CodeIntegrity := IMAGE_LOAD_CONFIG_CODE_INTEGRITY(this.ptr + 148)
            return this.__CodeIntegrity
        }
    }

    /**
     * 
     * @type {Integer}
     */
    GuardAddressTakenIatEntryTable {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardAddressTakenIatEntryCount {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardLongJumpTargetTable {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardLongJumpTargetCount {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * 
     * @type {Integer}
     */
    DynamicValueRelocTable {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * 
     * @type {Integer}
     */
    CHPEMetadataPointer {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardRFFailureRoutine {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardRFFailureRoutineFunctionPointer {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * 
     * @type {Integer}
     */
    DynamicValueRelocTableOffset {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * 
     * @type {Integer}
     */
    DynamicValueRelocTableSection {
        get => NumGet(this, 228, "ushort")
        set => NumPut("ushort", value, this, 228)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 230, "ushort")
        set => NumPut("ushort", value, this, 230)
    }

    /**
     * 
     * @type {Integer}
     */
    GuardRFVerifyStackPointerFunctionPointer {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * 
     * @type {Integer}
     */
    HotPatchTableOffset {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * 
     * @type {Integer}
     */
    EnclaveConfigurationPointer {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * 
     * @type {Integer}
     */
    VolatileMetadataPointer {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    GuardEHContinuationTable {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    GuardEHContinuationCount {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    GuardXFGCheckFunctionPointer {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    GuardXFGDispatchFunctionPointer {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    GuardXFGTableDispatchFunctionPointer {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    CastGuardOsDeterminedFailureMode {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    GuardMemcpyFunctionPointer {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }
}
