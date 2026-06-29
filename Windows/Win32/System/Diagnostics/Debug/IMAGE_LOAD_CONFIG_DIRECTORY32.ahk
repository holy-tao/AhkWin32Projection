#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_LOAD_CONFIG_CODE_INTEGRITY.ahk" { IMAGE_LOAD_CONFIG_CODE_INTEGRITY }

/**
 * Contains the load configuration data of an image. (32 bit)
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
 *     WORD    Reserved1;
 *     DWORD   EditList;                   // VA
 *     DWORD   SecurityCookie;             // VA
 *     DWORD   SEHandlerTable;             // VA
 *     DWORD   SEHandlerCount;
 * } IMAGE_LOAD_CONFIG_DIRECTORY32, *PIMAGE_LOAD_CONFIG_DIRECTORY32;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_load_config_directory32
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_LOAD_CONFIG_DIRECTORY32 {
    #StructPack 4

    /**
     * The size of the structure. For Windows XP, the size must be specified as 64 for x86 images.
     */
    Size : UInt32

    /**
     * The date and time stamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The time stamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     */
    TimeDateStamp : UInt32

    /**
     * The major version number.
     */
    MajorVersion : UInt16

    /**
     * The minor version number.
     */
    MinorVersion : UInt16

    /**
     * The global flags that control system behavior. For more information, see Gflags.exe.
     */
    GlobalFlagsClear : UInt32

    /**
     * The global flags that control system behavior. For more information, see Gflags.exe.
     */
    GlobalFlagsSet : UInt32

    /**
     * The critical section default time-out value.
     */
    CriticalSectionDefaultTimeout : UInt32

    /**
     * The size of the minimum block that must be freed before it is freed (de-committed), in bytes. This value is advisory.
     */
    DeCommitFreeBlockThreshold : UInt32

    /**
     * The size of the minimum total memory that must be freed in the process heap before it is freed (de-committed), in bytes. This value is advisory.
     */
    DeCommitTotalFreeThreshold : UInt32

    /**
     * The VA of a list of addresses where the LOCK prefix is used. These will be replaced by NOP on single-processor systems. This member is available only for x86.
     */
    LockPrefixTable : UInt32

    /**
     * The maximum allocation size, in bytes. This member is obsolete and is used only for debugging purposes.
     */
    MaximumAllocationSize : UInt32

    /**
     * The maximum block size that can be allocated from heap segments, in bytes.
     */
    VirtualMemoryThreshold : UInt32

    /**
     * The process heap flags. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>.
     */
    ProcessHeapFlags : UInt32

    /**
     * The process affinity mask. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprocessaffinitymask">GetProcessAffinityMask</a>. This member is available only for .exe files.
     */
    ProcessAffinityMask : UInt32

    /**
     * The service pack version.
     */
    CSDVersion : UInt16

    DependentLoadFlags : UInt16

    /**
     * Reserved for use by the system.
     */
    EditList : UInt32

    /**
     * A pointer to a cookie that is used by Visual C++ or GS implementation.
     */
    SecurityCookie : UInt32

    /**
     * The VA of the sorted table of RVAs of each valid, unique handler in the image. This member is available only for x86.
     */
    SEHandlerTable : UInt32

    /**
     * The count of unique handlers in the table. This member is available only for x86.
     */
    SEHandlerCount : UInt32

    GuardCFCheckFunctionPointer : UInt32

    GuardCFDispatchFunctionPointer : UInt32

    GuardCFFunctionTable : UInt32

    GuardCFFunctionCount : UInt32

    GuardFlags : UInt32

    CodeIntegrity : IMAGE_LOAD_CONFIG_CODE_INTEGRITY

    GuardAddressTakenIatEntryTable : UInt32

    GuardAddressTakenIatEntryCount : UInt32

    GuardLongJumpTargetTable : UInt32

    GuardLongJumpTargetCount : UInt32

    DynamicValueRelocTable : UInt32

    CHPEMetadataPointer : UInt32

    GuardRFFailureRoutine : UInt32

    GuardRFFailureRoutineFunctionPointer : UInt32

    DynamicValueRelocTableOffset : UInt32

    DynamicValueRelocTableSection : UInt16

    Reserved2 : UInt16

    GuardRFVerifyStackPointerFunctionPointer : UInt32

    HotPatchTableOffset : UInt32

    Reserved3 : UInt32

    EnclaveConfigurationPointer : UInt32

    VolatileMetadataPointer : UInt32

    GuardEHContinuationTable : UInt32

    GuardEHContinuationCount : UInt32

    GuardXFGCheckFunctionPointer : UInt32

    GuardXFGDispatchFunctionPointer : UInt32

    GuardXFGTableDispatchFunctionPointer : UInt32

    CastGuardOsDeterminedFailureMode : UInt32

    GuardMemcpyFunctionPointer : UInt32

    UmaFunctionPointers : UInt32

}
