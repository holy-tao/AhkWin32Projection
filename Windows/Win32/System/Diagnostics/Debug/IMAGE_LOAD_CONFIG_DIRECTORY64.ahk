#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_LOAD_CONFIG_CODE_INTEGRITY.ahk" { IMAGE_LOAD_CONFIG_CODE_INTEGRITY }

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
 */
export default struct IMAGE_LOAD_CONFIG_DIRECTORY64 {
    #StructPack 8

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
    DeCommitFreeBlockThreshold : Int64

    /**
     * The size of the minimum total memory that must be freed in the process heap before it is freed (de-committed), in bytes. This value is advisory.
     */
    DeCommitTotalFreeThreshold : Int64

    /**
     * The VA of a list of addresses where the LOCK prefix is used. These will be replaced by NOP on single-processor systems. This member is available only for x86.
     */
    LockPrefixTable : Int64

    /**
     * The maximum allocation size, in bytes. This member is obsolete and is used only for debugging purposes.
     */
    MaximumAllocationSize : Int64

    /**
     * The maximum block size that can be allocated from heap segments, in bytes.
     */
    VirtualMemoryThreshold : Int64

    /**
     * The process affinity mask. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprocessaffinitymask">GetProcessAffinityMask</a>. This member is available only for .exe files.
     */
    ProcessAffinityMask : Int64

    /**
     * The process heap flags. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapcreate">HeapCreate</a>.
     */
    ProcessHeapFlags : UInt32

    /**
     * The service pack version.
     */
    CSDVersion : UInt16

    /**
     * The default load flags used when the operating system resolves the statically linked imports of a module. For more information, see [LoadLibraryEx](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibraryexw).
     */
    DependentLoadFlags : UInt16

    /**
     * Reserved for use by the system.
     */
    EditList : Int64

    /**
     * A pointer to a cookie that is used by Visual C++ or GS implementation.
     */
    SecurityCookie : Int64

    /**
     * The VA of the sorted table of RVAs of each valid, unique handler in the image. This member is available only for x86.
     */
    SEHandlerTable : Int64

    /**
     * The count of unique handlers in the table. This member is available only for x86.
     */
    SEHandlerCount : Int64

    GuardCFCheckFunctionPointer : Int64

    GuardCFDispatchFunctionPointer : Int64

    GuardCFFunctionTable : Int64

    GuardCFFunctionCount : Int64

    GuardFlags : UInt32

    CodeIntegrity : IMAGE_LOAD_CONFIG_CODE_INTEGRITY

    GuardAddressTakenIatEntryTable : Int64

    GuardAddressTakenIatEntryCount : Int64

    GuardLongJumpTargetTable : Int64

    GuardLongJumpTargetCount : Int64

    DynamicValueRelocTable : Int64

    CHPEMetadataPointer : Int64

    GuardRFFailureRoutine : Int64

    GuardRFFailureRoutineFunctionPointer : Int64

    DynamicValueRelocTableOffset : UInt32

    DynamicValueRelocTableSection : UInt16

    Reserved2 : UInt16

    GuardRFVerifyStackPointerFunctionPointer : Int64

    HotPatchTableOffset : UInt32

    Reserved3 : UInt32

    EnclaveConfigurationPointer : Int64

    VolatileMetadataPointer : Int64

    GuardEHContinuationTable : Int64

    GuardEHContinuationCount : Int64

    GuardXFGCheckFunctionPointer : Int64

    GuardXFGDispatchFunctionPointer : Int64

    GuardXFGTableDispatchFunctionPointer : Int64

    CastGuardOsDeterminedFailureMode : Int64

    GuardMemcpyFunctionPointer : Int64

    UmaFunctionPointers : Int64

}
