#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class Minifilters {

;@region Constants

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_ACQUIRE_FOR_SECTION_SYNCHRONIZATION => 65535

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_RELEASE_FOR_SECTION_SYNCHRONIZATION => 65534

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_ACQUIRE_FOR_MOD_WRITE => 65533

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_RELEASE_FOR_MOD_WRITE => 65532

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_ACQUIRE_FOR_CC_FLUSH => 65531

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_RELEASE_FOR_CC_FLUSH => 65530

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_QUERY_OPEN => 65529

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_FAST_IO_CHECK_IF_POSSIBLE => 65523

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_NETWORK_QUERY_OPEN => 65522

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_MDL_READ => 65521

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_MDL_READ_COMPLETE => 65520

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_PREPARE_MDL_WRITE => 65519

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_MDL_WRITE_COMPLETE => 65518

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_VOLUME_MOUNT => 65517

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_VOLUME_DISMOUNT => 65516

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_INTERNAL_OPERATION_COUNT => 22

    /**
     * @type {Integer (UInt16)}
     */
    static IRP_MJ_OPERATION_END => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_REISSUE_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_IRP_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_FAST_IO_OPERATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_FS_FILTER_OPERATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_SYSTEM_BUFFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_GENERATED_IO => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_REISSUED_IO => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_DRAINING_IO => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_POST_OPERATION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_NEW_SYSTEM_BUFFER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CALLBACK_DATA_DIRTY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_ALLOCATE_CALLBACK_DATA_PREALLOCATE_ALL_MEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_VOLUME_CONTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_INSTANCE_CONTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_CONTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_STREAM_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_STREAMHANDLE_CONTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_TRANSACTION_CONTEXT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_SECTION_CONTEXT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_CONTEXT_END => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_CONTEXT_REGISTRATION_NO_EXACT_SIZE_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_SETUP_AUTOMATIC_ATTACHMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_SETUP_MANUAL_ATTACHMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_SETUP_NEWLY_MOUNTED_VOLUME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_SETUP_DETACHED_VOLUME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_TEARDOWN_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_TEARDOWN_FILTER_UNLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_TEARDOWN_MANDATORY_FILTER_UNLOAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_TEARDOWN_VOLUME_DISMOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_INSTANCE_TEARDOWN_INTERNAL_ERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_POST_OPERATION_DRAINING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_OPERATION_REGISTRATION_SKIP_PAGING_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_OPERATION_REGISTRATION_SKIP_CACHED_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_OPERATION_REGISTRATION_SKIP_NON_DASD_IO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_OPERATION_REGISTRATION_SKIP_NON_CACHED_NON_PAGING_IO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_FILTER_UNLOAD_MANDATORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_NORMALIZE_NAME_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_NORMALIZE_NAME_DESTINATION_FILE_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_REGISTRATION_VERSION_0200 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_REGISTRATION_VERSION_0201 => 513

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_REGISTRATION_VERSION_0202 => 514

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_REGISTRATION_VERSION_0203 => 515

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_REGISTRATION_VERSION => 515

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_REGISTRATION_DO_NOT_SUPPORT_SERVICE_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_REGISTRATION_SUPPORT_NPFS_MSFS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_REGISTRATION_SUPPORT_DAX_VOLUME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_REGISTRATION_SUPPORT_WCOS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IO_OPERATION_NON_CACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IO_OPERATION_PAGING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IO_OPERATION_DO_NOT_UPDATE_BYTE_OFFSET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IO_OPERATION_SYNCHRONOUS_PAGING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_VALID_FILE_NAME_FORMATS => 255

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_NORMALIZED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_OPENED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_SHORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_VALID_FILE_NAME_QUERY_METHODS => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_QUERY_DEFAULT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_QUERY_CACHE_ONLY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_QUERY_FILESYSTEM_ONLY => 768

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_QUERY_ALWAYS_ALLOW_CACHE_LOOKUP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_VALID_FILE_NAME_FLAGS => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_REQUEST_FROM_CURRENT_PROVIDER => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_DO_NOT_CACHE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FILE_NAME_ALLOW_QUERY_ON_REPARSE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_FILE_NAME_PARSED_FINAL_COMPONENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_FILE_NAME_PARSED_EXTENSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_FILE_NAME_PARSED_STREAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_FILE_NAME_PARSED_PARENT_DIR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_MAX_DEVICE_REPARSE_ATTEMPTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FLTTCFL_AUTO_REPARSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FLUSH_TYPE_FLUSH_AND_PURGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FLUSH_TYPE_FILE_DATA_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FLUSH_TYPE_NO_SYNC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_FLUSH_TYPE_DATA_SYNC_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VOL_PROP_FL_DAX_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_PORT_CONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_PUSH_LOCK_ENABLE_AUTO_BOOST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_PUSH_LOCK_DISABLE_AUTO_BOOST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_PUSH_LOCK_VALID_FLAGS => 3

    /**
     * @type {Guid}
     */
    static GUID_ECP_FLT_CREATEFILE_TARGET => Guid("{ce08041d-f411-447f-b70d-ccee45c23fac}")
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltSetCallbackDataDirty(Data) {
        DllCall("FLTMGR.SYS\FltSetCallbackDataDirty", "ptr", Data)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltClearCallbackDataDirty(Data) {
        DllCall("FLTMGR.SYS\FltClearCallbackDataDirty", "ptr", Data)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {BOOLEAN} 
     */
    static FltIsCallbackDataDirty(Data) {
        result := DllCall("FLTMGR.SYS\FltIsCallbackDataDirty", "ptr", Data, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Pointer<Void>} CompletionContext 
     * @param {Integer} Flags 
     * @param {Pointer<PFLT_POST_OPERATION_CALLBACK>} SafePostCallback 
     * @param {Pointer<Integer>} RetPostOperationStatus 
     * @returns {BOOLEAN} 
     */
    static FltDoCompletionProcessingWhenSafe(Data, FltObjects, CompletionContext, Flags, SafePostCallback, RetPostOperationStatus) {
        CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"
        RetPostOperationStatusMarshal := RetPostOperationStatus is VarRef ? "int*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDoCompletionProcessingWhenSafe", "ptr", Data, "ptr", FltObjects, CompletionContextMarshal, CompletionContext, "uint", Flags, "ptr", SafePostCallback, RetPostOperationStatusMarshal, RetPostOperationStatus, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_NAME_CONTROL>} NameCtrl 
     * @param {Integer} NewSize 
     * @returns {NTSTATUS} 
     */
    static FltCheckAndGrowNameControl(NameCtrl, NewSize) {
        result := DllCall("FLTMGR.SYS\FltCheckAndGrowNameControl", "ptr", NameCtrl, "ushort", NewSize, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {NTSTATUS} 
     */
    static FltPurgeFileNameInformationCache(Instance, FileObject) {
        result := DllCall("FLTMGR.SYS\FltPurgeFileNameInformationCache", "ptr", Instance, "ptr", FileObject, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @returns {NTSTATUS} 
     */
    static FltRegisterForDataScan(Instance) {
        result := DllCall("FLTMGR.SYS\FltRegisterForDataScan", "ptr", Instance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PFLT_CONTEXT} SectionContext 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Integer>} MaximumSize 
     * @param {Integer} SectionPageProtection 
     * @param {Integer} AllocationAttributes 
     * @param {Integer} Flags 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Pointer<Pointer<Void>>} SectionObject 
     * @param {Pointer<Integer>} SectionFileSize 
     * @returns {NTSTATUS} 
     */
    static FltCreateSectionForDataScan(Instance, FileObject, SectionContext, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, Flags, SectionHandle, SectionObject, SectionFileSize) {
        MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"
        SectionObjectMarshal := SectionObject is VarRef ? "ptr*" : "ptr"
        SectionFileSizeMarshal := SectionFileSize is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateSectionForDataScan", "ptr", Instance, "ptr", FileObject, "ptr", SectionContext, "uint", DesiredAccess, "ptr", ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "uint", Flags, "ptr", SectionHandle, SectionObjectMarshal, SectionObject, SectionFileSizeMarshal, SectionFileSize, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_CONTEXT} SectionContext 
     * @returns {NTSTATUS} 
     */
    static FltCloseSectionForDataScan(SectionContext) {
        result := DllCall("FLTMGR.SYS\FltCloseSectionForDataScan", "ptr", SectionContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} Driver 
     * @param {Pointer<FLT_REGISTRATION>} Registration 
     * @param {Pointer<PFLT_FILTER>} RetFilter 
     * @returns {NTSTATUS} 
     */
    static FltRegisterFilter(Driver, Registration, RetFilter) {
        RetFilterMarshal := RetFilter is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRegisterFilter", "ptr", Driver, "ptr", Registration, RetFilterMarshal, RetFilter, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltUnregisterFilter(Filter) {
        DllCall("FLTMGR.SYS\FltUnregisterFilter", "ptr", Filter)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @returns {NTSTATUS} 
     */
    static FltStartFiltering(Filter) {
        result := DllCall("FLTMGR.SYS\FltStartFiltering", "ptr", Filter, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} FltMgrRoutineName 
     * @returns {Pointer<Void>} 
     */
    static FltGetRoutineAddress(FltMgrRoutineName) {
        FltMgrRoutineName := FltMgrRoutineName is String ? StrPtr(FltMgrRoutineName) : FltMgrRoutineName

        result := DllCall("FLTMGR.SYS\FltGetRoutineAddress", "ptr", FltMgrRoutineName, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} CallbackStatus 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCompletePendedPreOperation(CallbackData, CallbackStatus, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltCompletePendedPreOperation", "ptr", CallbackData, "int", CallbackStatus, ContextMarshal, Context)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCompletePendedPostOperation(CallbackData) {
        DllCall("FLTMGR.SYS\FltCompletePendedPostOperation", "ptr", CallbackData)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<PFLT_GET_OPERATION_STATUS_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} RequesterContext 
     * @returns {NTSTATUS} 
     */
    static FltRequestOperationStatusCallback(Data, CallbackRoutine, RequesterContext) {
        RequesterContextMarshal := RequesterContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRequestOperationStatusCallback", "ptr", Data, "ptr", CallbackRoutine, RequesterContextMarshal, RequesterContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Integer} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @returns {Pointer<Void>} 
     */
    static FltAllocatePoolAlignedWithTag(Instance, PoolType, NumberOfBytes, Tag) {
        result := DllCall("FLTMGR.SYS\FltAllocatePoolAlignedWithTag", "ptr", Instance, "int", PoolType, "ptr", NumberOfBytes, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Integer} Tag 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreePoolAlignedWithTag(Instance, Buffer_R, Tag) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltFreePoolAlignedWithTag", "ptr", Instance, Buffer_RMarshal, Buffer_R, "uint", Tag)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} NameOptions 
     * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} FileNameInformation 
     * @returns {NTSTATUS} 
     */
    static FltGetFileNameInformation(CallbackData, NameOptions, FileNameInformation) {
        FileNameInformationMarshal := FileNameInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFileNameInformation", "ptr", CallbackData, "uint", NameOptions, FileNameInformationMarshal, FileNameInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Integer} NameOptions 
     * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} FileNameInformation 
     * @returns {NTSTATUS} 
     */
    static FltGetFileNameInformationUnsafe(FileObject, Instance, NameOptions, FileNameInformation) {
        FileNameInformationMarshal := FileNameInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFileNameInformationUnsafe", "ptr", FileObject, "ptr", Instance, "uint", NameOptions, FileNameInformationMarshal, FileNameInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleaseFileNameInformation(FileNameInformation) {
        DllCall("FLTMGR.SYS\FltReleaseFileNameInformation", "ptr", FileNameInformation)
    }

    /**
     * 
     * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReferenceFileNameInformation(FileNameInformation) {
        DllCall("FLTMGR.SYS\FltReferenceFileNameInformation", "ptr", FileNameInformation)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {Pointer<UNICODE_STRING>} Extension 
     * @param {Pointer<UNICODE_STRING>} Stream 
     * @param {Pointer<UNICODE_STRING>} FinalComponent 
     * @returns {NTSTATUS} 
     */
    static FltParseFileName(FileName, Extension, Stream, FinalComponent) {
        result := DllCall("FLTMGR.SYS\FltParseFileName", "ptr", FileName, "ptr", Extension, "ptr", Stream, "ptr", FinalComponent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
     * @returns {NTSTATUS} 
     */
    static FltParseFileNameInformation(FileNameInformation) {
        result := DllCall("FLTMGR.SYS\FltParseFileNameInformation", "ptr", FileNameInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
     * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} RetTunneledFileNameInformation 
     * @returns {NTSTATUS} 
     */
    static FltGetTunneledName(CallbackData, FileNameInformation, RetTunneledFileNameInformation) {
        RetTunneledFileNameInformationMarshal := RetTunneledFileNameInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetTunneledName", "ptr", CallbackData, "ptr", FileNameInformation, RetTunneledFileNameInformationMarshal, RetTunneledFileNameInformation, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<UNICODE_STRING>} VolumeName 
     * @param {Pointer<Integer>} BufferSizeNeeded 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeName(Volume, VolumeName, BufferSizeNeeded) {
        BufferSizeNeededMarshal := BufferSizeNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeName", "ptr", Volume, "ptr", VolumeName, BufferSizeNeededMarshal, BufferSizeNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {HANDLE} RootDirectory 
     * @param {Pointer} FileName 
     * @param {Integer} FileNameLength 
     * @param {Integer} NameOptions 
     * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} RetFileNameInformation 
     * @returns {NTSTATUS} 
     */
    static FltGetDestinationFileNameInformation(Instance, FileObject, RootDirectory, FileName, FileNameLength, NameOptions, RetFileNameInformation) {
        RootDirectory := RootDirectory is Win32Handle ? NumGet(RootDirectory, "ptr") : RootDirectory

        RetFileNameInformationMarshal := RetFileNameInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetDestinationFileNameInformation", "ptr", Instance, "ptr", FileObject, "ptr", RootDirectory, "ptr", FileName, "uint", FileNameLength, "uint", NameOptions, RetFileNameInformationMarshal, RetFileNameInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<BOOLEAN>} IsDirectory 
     * @returns {NTSTATUS} 
     */
    static FltIsDirectory(FileObject, Instance, IsDirectory) {
        IsDirectoryMarshal := IsDirectory is VarRef ? "char*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsDirectory", "ptr", FileObject, "ptr", Instance, IsDirectoryMarshal, IsDirectory, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FilterName 
     * @returns {NTSTATUS} 
     */
    static FltLoadFilter(FilterName) {
        result := DllCall("FLTMGR.SYS\FltLoadFilter", "ptr", FilterName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FilterName 
     * @returns {NTSTATUS} 
     */
    static FltUnloadFilter(FilterName) {
        result := DllCall("FLTMGR.SYS\FltUnloadFilter", "ptr", FilterName, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Pointer<PFLT_INSTANCE>} RetInstance 
     * @returns {NTSTATUS} 
     */
    static FltAttachVolume(Filter, Volume, InstanceName, RetInstance) {
        RetInstanceMarshal := RetInstance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAttachVolume", "ptr", Filter, "ptr", Volume, "ptr", InstanceName, RetInstanceMarshal, RetInstance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<UNICODE_STRING>} Altitude 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Pointer<PFLT_INSTANCE>} RetInstance 
     * @returns {NTSTATUS} 
     */
    static FltAttachVolumeAtAltitude(Filter, Volume, Altitude, InstanceName, RetInstance) {
        RetInstanceMarshal := RetInstance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAttachVolumeAtAltitude", "ptr", Filter, "ptr", Volume, "ptr", Altitude, "ptr", InstanceName, RetInstanceMarshal, RetInstance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @returns {NTSTATUS} 
     */
    static FltDetachVolume(Filter, Volume, InstanceName) {
        result := DllCall("FLTMGR.SYS\FltDetachVolume", "ptr", Filter, "ptr", Volume, "ptr", InstanceName, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Pointer<FLT_CALLBACK_DATA>>} RetNewCallbackData 
     * @returns {NTSTATUS} 
     */
    static FltAllocateCallbackData(Instance, FileObject, RetNewCallbackData) {
        RetNewCallbackDataMarshal := RetNewCallbackData is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAllocateCallbackData", "ptr", Instance, "ptr", FileObject, RetNewCallbackDataMarshal, RetNewCallbackData, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<FLT_CALLBACK_DATA>>} RetNewCallbackData 
     * @returns {NTSTATUS} 
     */
    static FltAllocateCallbackDataEx(Instance, FileObject, Flags, RetNewCallbackData) {
        RetNewCallbackDataMarshal := RetNewCallbackData is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAllocateCallbackDataEx", "ptr", Instance, "ptr", FileObject, "uint", Flags, RetNewCallbackDataMarshal, RetNewCallbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeCallbackData(CallbackData) {
        DllCall("FLTMGR.SYS\FltFreeCallbackData", "ptr", CallbackData)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReuseCallbackData(CallbackData) {
        DllCall("FLTMGR.SYS\FltReuseCallbackData", "ptr", CallbackData)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltPerformSynchronousIo(CallbackData) {
        DllCall("FLTMGR.SYS\FltPerformSynchronousIo", "ptr", CallbackData)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {NTSTATUS} 
     */
    static FltPerformAsynchronousIo(CallbackData, CallbackRoutine, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltPerformAsynchronousIo", "ptr", CallbackData, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} OriginatingFileObject 
     * @param {Pointer<FLT_CALLBACK_DATA>} ChildCallbackData 
     * @returns {NTSTATUS} 
     */
    static FltpTraceRedirectedFileIo(OriginatingFileObject, ChildCallbackData) {
        result := DllCall("FLTMGR.SYS\FltpTraceRedirectedFileIo", "ptr", OriginatingFileObject, "ptr", ChildCallbackData, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Pointer<Pointer<FILE_OBJECT>>} FileObject 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} ShareAccess 
     * @param {Integer} CreateDisposition 
     * @param {Integer} CreateOptions 
     * @param {Integer} NamedPipeType 
     * @param {Integer} ReadMode 
     * @param {Integer} CompletionMode 
     * @param {Integer} MaximumInstances 
     * @param {Integer} InboundQuota 
     * @param {Integer} OutboundQuota 
     * @param {Pointer<Integer>} DefaultTimeout 
     * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static FltCreateNamedPipeFile(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, CreateDisposition, CreateOptions, NamedPipeType, ReadMode, CompletionMode, MaximumInstances, InboundQuota, OutboundQuota, DefaultTimeout, DriverContext) {
        FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
        DefaultTimeoutMarshal := DefaultTimeout is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateNamedPipeFile", "ptr", Filter, "ptr", Instance, "ptr", FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "uint", NamedPipeType, "uint", ReadMode, "uint", CompletionMode, "uint", MaximumInstances, "uint", InboundQuota, "uint", OutboundQuota, DefaultTimeoutMarshal, DefaultTimeout, "ptr", DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Pointer<Pointer<FILE_OBJECT>>} FileObject 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} CreateOptions 
     * @param {Integer} MailslotQuota 
     * @param {Integer} MaximumMessageSize 
     * @param {Pointer<Integer>} ReadTimeout 
     * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static FltCreateMailslotFile(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, CreateOptions, MailslotQuota, MaximumMessageSize, ReadTimeout, DriverContext) {
        FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
        ReadTimeoutMarshal := ReadTimeout is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateMailslotFile", "ptr", Filter, "ptr", Instance, "ptr", FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, "uint", CreateOptions, "uint", MailslotQuota, "uint", MaximumMessageSize, ReadTimeoutMarshal, ReadTimeout, "ptr", DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Pointer<Pointer<FILE_OBJECT>>} FileObject 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} CreateDisposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Integer} Flags 
     * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static FltCreateFileEx2(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength, Flags, DriverContext) {
        FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateFileEx2", "ptr", Filter, "ptr", Instance, "ptr", FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "uint", Flags, "ptr", DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Pointer<Pointer<FILE_OBJECT>>} FileObject 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} CreateDisposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FltCreateFileEx(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength, Flags) {
        FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateFileEx", "ptr", Filter, "ptr", Instance, "ptr", FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} CreateDisposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FltCreateFile(Filter, Instance, FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength, Flags) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateFile", "ptr", Filter, "ptr", Instance, "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<HANDLE>} VolumeHandle 
     * @param {Pointer<Pointer<FILE_OBJECT>>} VolumeFileObject 
     * @returns {NTSTATUS} 
     */
    static FltOpenVolume(Instance, VolumeHandle, VolumeFileObject) {
        VolumeFileObjectMarshal := VolumeFileObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOpenVolume", "ptr", Instance, "ptr", VolumeHandle, VolumeFileObjectMarshal, VolumeFileObject, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Integer} Length 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} BytesRead 
     * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {NTSTATUS} 
     */
    static FltReadFile(InitiatingInstance, FileObject, ByteOffset, Length, Buffer_R, Flags, BytesRead, CallbackRoutine, CallbackContext) {
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        BytesReadMarshal := BytesRead is VarRef ? "uint*" : "ptr"
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltReadFile", "ptr", InitiatingInstance, "ptr", FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", Buffer_R, "uint", Flags, BytesReadMarshal, BytesRead, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Integer} Length 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} BytesRead 
     * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Pointer<Integer>} Key 
     * @param {Pointer<MDL>} Mdl 
     * @returns {NTSTATUS} 
     */
    static FltReadFileEx(InitiatingInstance, FileObject, ByteOffset, Length, Buffer_R, Flags, BytesRead, CallbackRoutine, CallbackContext, Key, Mdl) {
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        BytesReadMarshal := BytesRead is VarRef ? "uint*" : "ptr"
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltReadFileEx", "ptr", InitiatingInstance, "ptr", FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", Buffer_R, "uint", Flags, BytesReadMarshal, BytesRead, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, KeyMarshal, Key, "ptr", Mdl, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileTag 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer} DataBuffer 
     * @param {Integer} DataBufferLength 
     * @returns {NTSTATUS} 
     */
    static FltTagFile(InitiatingInstance, FileObject, FileTag, Guid, DataBuffer, DataBufferLength) {
        result := DllCall("FLTMGR.SYS\FltTagFile", "ptr", InitiatingInstance, "ptr", FileObject, "uint", FileTag, "ptr", Guid, "ptr", DataBuffer, "ushort", DataBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileTag 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer} DataBuffer 
     * @param {Integer} DataBufferLength 
     * @param {Integer} ExistingFileTag 
     * @param {Pointer<Guid>} ExistingGuid 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FltTagFileEx(InitiatingInstance, FileObject, FileTag, Guid, DataBuffer, DataBufferLength, ExistingFileTag, ExistingGuid, Flags) {
        result := DllCall("FLTMGR.SYS\FltTagFileEx", "ptr", InitiatingInstance, "ptr", FileObject, "uint", FileTag, "ptr", Guid, "ptr", DataBuffer, "ushort", DataBufferLength, "uint", ExistingFileTag, "ptr", ExistingGuid, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileTag 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static FltUntagFile(InitiatingInstance, FileObject, FileTag, Guid) {
        result := DllCall("FLTMGR.SYS\FltUntagFile", "ptr", InitiatingInstance, "ptr", FileObject, "uint", FileTag, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Integer} Length 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} BytesWritten 
     * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {NTSTATUS} 
     */
    static FltWriteFile(InitiatingInstance, FileObject, ByteOffset, Length, Buffer_R, Flags, BytesWritten, CallbackRoutine, CallbackContext) {
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        BytesWrittenMarshal := BytesWritten is VarRef ? "uint*" : "ptr"
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltWriteFile", "ptr", InitiatingInstance, "ptr", FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", Buffer_R, "uint", Flags, BytesWrittenMarshal, BytesWritten, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Integer} Length 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} BytesWritten 
     * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Pointer<Integer>} Key 
     * @param {Pointer<MDL>} Mdl 
     * @returns {NTSTATUS} 
     */
    static FltWriteFileEx(InitiatingInstance, FileObject, ByteOffset, Length, Buffer_R, Flags, BytesWritten, CallbackRoutine, CallbackContext, Key, Mdl) {
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        BytesWrittenMarshal := BytesWritten is VarRef ? "uint*" : "ptr"
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltWriteFileEx", "ptr", InitiatingInstance, "ptr", FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", Buffer_R, "uint", Flags, BytesWrittenMarshal, BytesWritten, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, KeyMarshal, Key, "ptr", Mdl, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {BOOLEAN} 
     */
    static FltFastIoMdlRead(InitiatingInstance, FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltFastIoMdlRead", "ptr", InitiatingInstance, "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, "ptr", IoStatus, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<MDL>} MdlChain 
     * @returns {BOOLEAN} 
     */
    static FltFastIoMdlReadComplete(InitiatingInstance, FileObject, MdlChain) {
        result := DllCall("FLTMGR.SYS\FltFastIoMdlReadComplete", "ptr", InitiatingInstance, "ptr", FileObject, "ptr", MdlChain, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {BOOLEAN} 
     */
    static FltFastIoPrepareMdlWrite(InitiatingInstance, FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltFastIoPrepareMdlWrite", "ptr", InitiatingInstance, "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, "ptr", IoStatus, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<MDL>} MdlChain 
     * @returns {BOOLEAN} 
     */
    static FltFastIoMdlWriteComplete(InitiatingInstance, FileObject, FileOffset, MdlChain) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltFastIoMdlWriteComplete", "ptr", InitiatingInstance, "ptr", FileObject, FileOffsetMarshal, FileOffset, "ptr", MdlChain, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static FltQueryInformationByName(Filter, Instance, ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass, DriverContext) {
        result := DllCall("FLTMGR.SYS\FltQueryInformationByName", "ptr", Filter, "ptr", Instance, "ptr", ObjectAttributes, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "ptr", DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltQueryInformationFile(Instance, FileObject, FileInformation, Length, FileInformationClass, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueryInformationFile", "ptr", Instance, "ptr", FileObject, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @returns {NTSTATUS} 
     */
    static FltSetInformationFile(Instance, FileObject, FileInformation, Length, FileInformationClass) {
        result := DllCall("FLTMGR.SYS\FltSetInformationFile", "ptr", Instance, "ptr", FileObject, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {BOOLEAN} RestartScan 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltQueryDirectoryFile(Instance, FileObject, FileInformation, Length, FileInformationClass, ReturnSingleEntry, FileName, RestartScan, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueryDirectoryFile", "ptr", Instance, "ptr", FileObject, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "char", ReturnSingleEntry, "ptr", FileName, "char", RestartScan, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Integer} QueryFlags 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltQueryDirectoryFileEx(Instance, FileObject, FileInformation, Length, FileInformationClass, QueryFlags, FileName, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueryDirectoryFileEx", "ptr", Instance, "ptr", FileObject, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "uint", QueryFlags, "ptr", FileName, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} SidList 
     * @param {Integer} SidListLength 
     * @param {Pointer<Integer>} StartSid 
     * @param {BOOLEAN} RestartScan 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltQueryQuotaInformationFile(Instance, FileObject, IoStatusBlock, Buffer_R, Length, ReturnSingleEntry, SidList, SidListLength, StartSid, RestartScan, LengthReturned) {
        StartSidMarshal := StartSid is VarRef ? "uint*" : "ptr"
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueryQuotaInformationFile", "ptr", Instance, "ptr", FileObject, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "char", ReturnSingleEntry, "ptr", SidList, "uint", SidListLength, StartSidMarshal, StartSid, "char", RestartScan, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static FltSetQuotaInformationFile(Instance, FileObject, Buffer_R, Length) {
        result := DllCall("FLTMGR.SYS\FltSetQuotaInformationFile", "ptr", Instance, "ptr", FileObject, "ptr", Buffer_R, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} ReturnedEaData 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} EaList 
     * @param {Integer} EaListLength 
     * @param {Pointer<Integer>} EaIndex 
     * @param {BOOLEAN} RestartScan 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltQueryEaFile(Instance, FileObject, ReturnedEaData, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan, LengthReturned) {
        EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueryEaFile", "ptr", Instance, "ptr", FileObject, "ptr", ReturnedEaData, "uint", Length, "char", ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, "char", RestartScan, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} EaBuffer 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static FltSetEaFile(Instance, FileObject, EaBuffer, Length) {
        result := DllCall("FLTMGR.SYS\FltSetEaFile", "ptr", Instance, "ptr", FileObject, "ptr", EaBuffer, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltQueryVolumeInformationFile(Instance, FileObject, FsInformation, Length, FsInformationClass, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueryVolumeInformationFile", "ptr", Instance, "ptr", FileObject, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} SecurityInformation 
     * @param {Pointer} SecurityDescriptor 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} LengthNeeded 
     * @returns {NTSTATUS} 
     */
    static FltQuerySecurityObject(Instance, FileObject, SecurityInformation, SecurityDescriptor, Length, LengthNeeded) {
        LengthNeededMarshal := LengthNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQuerySecurityObject", "ptr", Instance, "ptr", FileObject, "uint", SecurityInformation, "ptr", SecurityDescriptor, "uint", Length, LengthNeededMarshal, LengthNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {NTSTATUS} 
     */
    static FltSetSecurityObject(Instance, FileObject, SecurityInformation, SecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("FLTMGR.SYS\FltSetSecurityObject", "ptr", Instance, "ptr", FileObject, "uint", SecurityInformation, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {NTSTATUS} 
     */
    static FltFlushBuffers(Instance, FileObject) {
        result := DllCall("FLTMGR.SYS\FltFlushBuffers", "ptr", Instance, "ptr", FileObject, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FlushType 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {NTSTATUS} 
     */
    static FltFlushBuffers2(Instance, FileObject, FlushType, CallbackData) {
        result := DllCall("FLTMGR.SYS\FltFlushBuffers2", "ptr", Instance, "ptr", FileObject, "uint", FlushType, "ptr", CallbackData, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FsControlCode 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltFsControlFile(Instance, FileObject, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltFsControlFile", "ptr", Instance, "ptr", FileObject, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} IoControlCode 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltDeviceIoControlFile(Instance, FileObject, IoControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeviceIoControlFile", "ptr", Instance, "ptr", FileObject, "uint", IoControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} InitiatingInstance 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReissueSynchronousIo(InitiatingInstance, CallbackData) {
        DllCall("FLTMGR.SYS\FltReissueSynchronousIo", "ptr", InitiatingInstance, "ptr", CallbackData)
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @returns {NTSTATUS} 
     */
    static FltClose(FileHandle) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("FLTMGR.SYS\FltClose", "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCancelFileOpen(Instance, FileObject) {
        DllCall("FLTMGR.SYS\FltCancelFileOpen", "ptr", Instance, "ptr", FileObject)
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @returns {NTSTATUS} 
     */
    static FltCreateSystemVolumeInformationFolder(Instance) {
        result := DllCall("FLTMGR.SYS\FltCreateSystemVolumeInformationFolder", "ptr", Instance, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PFLT_INSTANCE} Instance 
     * @returns {BOOLEAN} 
     */
    static FltSupportsFileContextsEx(FileObject, Instance) {
        result := DllCall("FLTMGR.SYS\FltSupportsFileContextsEx", "ptr", FileObject, "ptr", Instance, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {BOOLEAN} 
     */
    static FltSupportsFileContexts(FileObject) {
        result := DllCall("FLTMGR.SYS\FltSupportsFileContexts", "ptr", FileObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {BOOLEAN} 
     */
    static FltSupportsStreamContexts(FileObject) {
        result := DllCall("FLTMGR.SYS\FltSupportsStreamContexts", "ptr", FileObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {BOOLEAN} 
     */
    static FltSupportsStreamHandleContexts(FileObject) {
        result := DllCall("FLTMGR.SYS\FltSupportsStreamHandleContexts", "ptr", FileObject, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Integer} ContextType 
     * @param {Pointer} ContextSize 
     * @param {Integer} PoolType 
     * @param {Pointer<PFLT_CONTEXT>} ReturnedContext 
     * @returns {NTSTATUS} 
     */
    static FltAllocateContext(Filter, ContextType, ContextSize, PoolType, ReturnedContext) {
        ReturnedContextMarshal := ReturnedContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAllocateContext", "ptr", Filter, "ushort", ContextType, "ptr", ContextSize, "int", PoolType, ReturnedContextMarshal, ReturnedContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Integer} DesiredContexts 
     * @param {Pointer<FLT_RELATED_CONTEXTS>} Contexts 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltGetContexts(FltObjects, DesiredContexts, Contexts) {
        DllCall("FLTMGR.SYS\FltGetContexts", "ptr", FltObjects, "ushort", DesiredContexts, "ptr", Contexts)
    }

    /**
     * 
     * @param {Pointer<FLT_RELATED_CONTEXTS>} Contexts 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleaseContexts(Contexts) {
        DllCall("FLTMGR.SYS\FltReleaseContexts", "ptr", Contexts)
    }

    /**
     * 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Integer} DesiredContexts 
     * @param {Pointer} ContextsSize 
     * @param {Pointer<FLT_RELATED_CONTEXTS_EX>} Contexts 
     * @returns {NTSTATUS} 
     */
    static FltGetContextsEx(FltObjects, DesiredContexts, ContextsSize, Contexts) {
        result := DllCall("FLTMGR.SYS\FltGetContextsEx", "ptr", FltObjects, "ushort", DesiredContexts, "ptr", ContextsSize, "ptr", Contexts, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} ContextsSize 
     * @param {Pointer<FLT_RELATED_CONTEXTS_EX>} Contexts 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleaseContextsEx(ContextsSize, Contexts) {
        DllCall("FLTMGR.SYS\FltReleaseContextsEx", "ptr", ContextsSize, "ptr", Contexts)
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Integer} Operation 
     * @param {PFLT_CONTEXT} NewContext 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltSetVolumeContext(Volume, Operation, NewContext, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetVolumeContext", "ptr", Volume, "int", Operation, "ptr", NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Integer} Operation 
     * @param {PFLT_CONTEXT} NewContext 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltSetInstanceContext(Instance, Operation, NewContext, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetInstanceContext", "ptr", Instance, "int", Operation, "ptr", NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Operation 
     * @param {PFLT_CONTEXT} NewContext 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltSetFileContext(Instance, FileObject, Operation, NewContext, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetFileContext", "ptr", Instance, "ptr", FileObject, "int", Operation, "ptr", NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Operation 
     * @param {PFLT_CONTEXT} NewContext 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltSetStreamContext(Instance, FileObject, Operation, NewContext, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetStreamContext", "ptr", Instance, "ptr", FileObject, "int", Operation, "ptr", NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Operation 
     * @param {PFLT_CONTEXT} NewContext 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltSetStreamHandleContext(Instance, FileObject, Operation, NewContext, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetStreamHandleContext", "ptr", Instance, "ptr", FileObject, "int", Operation, "ptr", NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {Integer} Operation 
     * @param {PFLT_CONTEXT} NewContext 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltSetTransactionContext(Instance, Transaction, Operation, NewContext, OldContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetTransactionContext", "ptr", Instance, TransactionMarshal, Transaction, "int", Operation, "ptr", NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_CONTEXT} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltDeleteContext(Context) {
        DllCall("FLTMGR.SYS\FltDeleteContext", "ptr", Context)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltDeleteVolumeContext(Filter, Volume, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeleteVolumeContext", "ptr", Filter, "ptr", Volume, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltDeleteInstanceContext(Instance, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeleteInstanceContext", "ptr", Instance, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltDeleteFileContext(Instance, FileObject, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeleteFileContext", "ptr", Instance, "ptr", FileObject, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltDeleteStreamContext(Instance, FileObject, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeleteStreamContext", "ptr", Instance, "ptr", FileObject, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltDeleteStreamHandleContext(Instance, FileObject, OldContext) {
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeleteStreamHandleContext", "ptr", Instance, "ptr", FileObject, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {Pointer<PFLT_CONTEXT>} OldContext 
     * @returns {NTSTATUS} 
     */
    static FltDeleteTransactionContext(Instance, Transaction, OldContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDeleteTransactionContext", "ptr", Instance, TransactionMarshal, Transaction, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeContext(Filter, Volume, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeContext", "ptr", Filter, "ptr", Volume, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetInstanceContext(Instance, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetInstanceContext", "ptr", Instance, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetFileContext(Instance, FileObject, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFileContext", "ptr", Instance, "ptr", FileObject, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetStreamContext(Instance, FileObject, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetStreamContext", "ptr", Instance, "ptr", FileObject, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetStreamHandleContext(Instance, FileObject, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetStreamHandleContext", "ptr", Instance, "ptr", FileObject, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetTransactionContext(Instance, Transaction, Context) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetTransactionContext", "ptr", Instance, TransactionMarshal, Transaction, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static FltGetSectionContext(Instance, FileObject, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetSectionContext", "ptr", Instance, "ptr", FileObject, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_CONTEXT} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReferenceContext(Context) {
        DllCall("FLTMGR.SYS\FltReferenceContext", "ptr", Context)
    }

    /**
     * 
     * @param {PFLT_CONTEXT} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleaseContext(Context) {
        DllCall("FLTMGR.SYS\FltReleaseContext", "ptr", Context)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FilterName 
     * @param {Pointer<PFLT_FILTER>} RetFilter 
     * @returns {NTSTATUS} 
     */
    static FltGetFilterFromName(FilterName, RetFilter) {
        RetFilterMarshal := RetFilter is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFilterFromName", "ptr", FilterName, RetFilterMarshal, RetFilter, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<UNICODE_STRING>} VolumeName 
     * @param {Pointer<PFLT_VOLUME>} RetVolume 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeFromName(Filter, VolumeName, RetVolume) {
        RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeFromName", "ptr", Filter, "ptr", VolumeName, RetVolumeMarshal, RetVolume, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Pointer<PFLT_INSTANCE>} RetInstance 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeInstanceFromName(Filter, Volume, InstanceName, RetInstance) {
        RetInstanceMarshal := RetInstance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeInstanceFromName", "ptr", Filter, "ptr", Volume, "ptr", InstanceName, RetInstanceMarshal, RetInstance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<PFLT_VOLUME>} RetVolume 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeFromInstance(Instance, RetVolume) {
        RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeFromInstance", "ptr", Instance, RetVolumeMarshal, RetVolume, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<PFLT_FILTER>} RetFilter 
     * @returns {NTSTATUS} 
     */
    static FltGetFilterFromInstance(Instance, RetFilter) {
        RetFilterMarshal := RetFilter is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFilterFromInstance", "ptr", Instance, RetFilterMarshal, RetFilter, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PFLT_VOLUME>} RetVolume 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeFromFileObject(Filter, FileObject, RetVolume) {
        RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeFromFileObject", "ptr", Filter, "ptr", FileObject, RetVolumeMarshal, RetVolume, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<PFLT_VOLUME>} RetVolume 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeFromDeviceObject(Filter, DeviceObject, RetVolume) {
        RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeFromDeviceObject", "ptr", Filter, "ptr", DeviceObject, RetVolumeMarshal, RetVolume, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FltIsFltMgrVolumeDeviceObject(DeviceObject) {
        result := DllCall("FLTMGR.SYS\FltIsFltMgrVolumeDeviceObject", "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static FltGetDeviceObject(Volume, DeviceObject) {
        DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetDeviceObject", "ptr", Volume, DeviceObjectMarshal, DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} DiskDeviceObject 
     * @returns {NTSTATUS} 
     */
    static FltGetDiskDeviceObject(Volume, DiskDeviceObject) {
        DiskDeviceObjectMarshal := DiskDeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetDiskDeviceObject", "ptr", Volume, DiskDeviceObjectMarshal, DiskDeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} CurrentInstance 
     * @param {Pointer<PFLT_INSTANCE>} LowerInstance 
     * @returns {NTSTATUS} 
     */
    static FltGetLowerInstance(CurrentInstance, LowerInstance) {
        LowerInstanceMarshal := LowerInstance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetLowerInstance", "ptr", CurrentInstance, LowerInstanceMarshal, LowerInstance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} CurrentInstance 
     * @param {Pointer<PFLT_INSTANCE>} UpperInstance 
     * @returns {NTSTATUS} 
     */
    static FltGetUpperInstance(CurrentInstance, UpperInstance) {
        UpperInstanceMarshal := UpperInstance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetUpperInstance", "ptr", CurrentInstance, UpperInstanceMarshal, UpperInstance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<PFLT_INSTANCE>} Instance 
     * @returns {NTSTATUS} 
     */
    static FltGetTopInstance(Volume, Instance) {
        InstanceMarshal := Instance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetTopInstance", "ptr", Volume, InstanceMarshal, Instance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<PFLT_INSTANCE>} Instance 
     * @returns {NTSTATUS} 
     */
    static FltGetBottomInstance(Volume, Instance) {
        InstanceMarshal := Instance is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetBottomInstance", "ptr", Volume, InstanceMarshal, Instance, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance1 
     * @param {PFLT_INSTANCE} Instance2 
     * @returns {Integer} 
     */
    static FltCompareInstanceAltitudes(Instance1, Instance2) {
        result := DllCall("FLTMGR.SYS\FltCompareInstanceAltitudes", "ptr", Instance1, "ptr", Instance2, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltGetFilterInformation(Filter, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFilterInformation", "ptr", Filter, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltGetInstanceInformation(Instance, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetInstanceInformation", "ptr", Instance, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeInformation(Volume, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeInformation", "ptr", Volume, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer} VolumeProperties 
     * @param {Integer} VolumePropertiesLength 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeProperties(Volume, VolumeProperties, VolumePropertiesLength, LengthReturned) {
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeProperties", "ptr", Volume, "ptr", VolumeProperties, "uint", VolumePropertiesLength, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} FltObject 
     * @param {Pointer<BOOLEAN>} IsWritable 
     * @returns {NTSTATUS} 
     */
    static FltIsVolumeWritable(FltObject, IsWritable) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
        IsWritableMarshal := IsWritable is VarRef ? "char*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsVolumeWritable", FltObjectMarshal, FltObject, IsWritableMarshal, IsWritable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} FltObject 
     * @param {Pointer<Integer>} FileSystemType 
     * @returns {NTSTATUS} 
     */
    static FltGetFileSystemType(FltObject, FileSystemType) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
        FileSystemTypeMarshal := FileSystemType is VarRef ? "int*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFileSystemType", FltObjectMarshal, FltObject, FileSystemTypeMarshal, FileSystemType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} FltObject 
     * @param {Pointer<BOOLEAN>} IsSnapshotVolume 
     * @returns {NTSTATUS} 
     */
    static FltIsVolumeSnapshot(FltObject, IsSnapshotVolume) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
        IsSnapshotVolumeMarshal := IsSnapshotVolume is VarRef ? "char*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsVolumeSnapshot", FltObjectMarshal, FltObject, IsSnapshotVolumeMarshal, IsSnapshotVolume, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Pointer<UNICODE_STRING>} VolumeGuidName 
     * @param {Pointer<Integer>} BufferSizeNeeded 
     * @returns {NTSTATUS} 
     */
    static FltGetVolumeGuidName(Volume, VolumeGuidName, BufferSizeNeeded) {
        BufferSizeNeededMarshal := BufferSizeNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetVolumeGuidName", "ptr", Volume, "ptr", VolumeGuidName, BufferSizeNeededMarshal, BufferSizeNeeded, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<IO_STATUS_BLOCK>} Iosb 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @returns {NTSTATUS} 
     */
    static FltQueryVolumeInformation(Instance, Iosb, FsInformation, Length, FsInformationClass) {
        result := DllCall("FLTMGR.SYS\FltQueryVolumeInformation", "ptr", Instance, "ptr", Iosb, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<IO_STATUS_BLOCK>} Iosb 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @returns {NTSTATUS} 
     */
    static FltSetVolumeInformation(Instance, Iosb, FsInformation, Length, FsInformationClass) {
        result := DllCall("FLTMGR.SYS\FltSetVolumeInformation", "ptr", Instance, "ptr", Iosb, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PFLT_FILTER>} FilterList 
     * @param {Integer} FilterListSize 
     * @param {Pointer<Integer>} NumberFiltersReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateFilters(FilterList, FilterListSize, NumberFiltersReturned) {
        FilterListMarshal := FilterList is VarRef ? "ptr*" : "ptr"
        NumberFiltersReturnedMarshal := NumberFiltersReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateFilters", FilterListMarshal, FilterList, "uint", FilterListSize, NumberFiltersReturnedMarshal, NumberFiltersReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<PFLT_VOLUME>} VolumeList 
     * @param {Integer} VolumeListSize 
     * @param {Pointer<Integer>} NumberVolumesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateVolumes(Filter, VolumeList, VolumeListSize, NumberVolumesReturned) {
        VolumeListMarshal := VolumeList is VarRef ? "ptr*" : "ptr"
        NumberVolumesReturnedMarshal := NumberVolumesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateVolumes", "ptr", Filter, VolumeListMarshal, VolumeList, "uint", VolumeListSize, NumberVolumesReturnedMarshal, NumberVolumesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<PFLT_INSTANCE>} InstanceList 
     * @param {Integer} InstanceListSize 
     * @param {Pointer<Integer>} NumberInstancesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateInstances(Volume, Filter, InstanceList, InstanceListSize, NumberInstancesReturned) {
        InstanceListMarshal := InstanceList is VarRef ? "ptr*" : "ptr"
        NumberInstancesReturnedMarshal := NumberInstancesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateInstances", "ptr", Volume, "ptr", Filter, InstanceListMarshal, InstanceList, "uint", InstanceListSize, NumberInstancesReturnedMarshal, NumberInstancesReturned, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateFilterInformation(Index, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateFilterInformation", "uint", Index, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Integer} Index 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateInstanceInformationByFilter(Filter, Index, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByFilter", "ptr", Filter, "uint", Index, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_VOLUME} Volume 
     * @param {Integer} Index 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateInstanceInformationByVolume(Volume, Index, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByVolume", "ptr", Volume, "uint", Index, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VolumeName 
     * @param {Integer} Index 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateInstanceInformationByVolumeName(VolumeName, Index, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByVolumeName", "ptr", VolumeName, "uint", Index, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} Index 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateInstanceInformationByDeviceObject(DeviceObject, Index, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByDeviceObject", "ptr", DeviceObject, "uint", Index, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Integer} Index 
     * @param {Integer} InformationClass 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static FltEnumerateVolumeInformation(Filter, Index, InformationClass, Buffer_R, BufferSize, BytesReturned) {
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnumerateVolumeInformation", "ptr", Filter, "uint", Index, "int", InformationClass, "ptr", Buffer_R, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} FltObject 
     * @returns {NTSTATUS} 
     */
    static FltObjectReference(FltObject) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltObjectReference", FltObjectMarshal, FltObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} FltObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltObjectDereference(FltObject) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltObjectDereference", FltObjectMarshal, FltObject)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<PFLT_PORT>} ServerPort 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Void>} ServerPortCookie 
     * @param {Pointer<PFLT_CONNECT_NOTIFY>} ConnectNotifyCallback 
     * @param {Pointer<PFLT_DISCONNECT_NOTIFY>} DisconnectNotifyCallback 
     * @param {Pointer<PFLT_MESSAGE_NOTIFY>} MessageNotifyCallback 
     * @param {Integer} MaxConnections 
     * @returns {NTSTATUS} 
     */
    static FltCreateCommunicationPort(Filter, ServerPort, ObjectAttributes, ServerPortCookie, ConnectNotifyCallback, DisconnectNotifyCallback, MessageNotifyCallback, MaxConnections) {
        ServerPortMarshal := ServerPort is VarRef ? "ptr*" : "ptr"
        ServerPortCookieMarshal := ServerPortCookie is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCreateCommunicationPort", "ptr", Filter, ServerPortMarshal, ServerPort, "ptr", ObjectAttributes, ServerPortCookieMarshal, ServerPortCookie, "ptr", ConnectNotifyCallback, "ptr", DisconnectNotifyCallback, "ptr", MessageNotifyCallback, "int", MaxConnections, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_PORT} ServerPort 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCloseCommunicationPort(ServerPort) {
        DllCall("FLTMGR.SYS\FltCloseCommunicationPort", "ptr", ServerPort)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<PFLT_PORT>} ClientPort 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCloseClientPort(Filter, ClientPort) {
        ClientPortMarshal := ClientPort is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltCloseClientPort", "ptr", Filter, ClientPortMarshal, ClientPort)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<PFLT_PORT>} ClientPort 
     * @param {Pointer} SenderBuffer 
     * @param {Integer} SenderBufferLength 
     * @param {Pointer} ReplyBuffer 
     * @param {Pointer<Integer>} ReplyLength 
     * @param {Pointer<Integer>} Timeout 
     * @returns {NTSTATUS} 
     */
    static FltSendMessage(Filter, ClientPort, SenderBuffer, SenderBufferLength, ReplyBuffer, ReplyLength, Timeout) {
        ClientPortMarshal := ClientPort is VarRef ? "ptr*" : "ptr"
        ReplyLengthMarshal := ReplyLength is VarRef ? "uint*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSendMessage", "ptr", Filter, ClientPortMarshal, ClientPort, "ptr", SenderBuffer, "uint", SenderBufferLength, "ptr", ReplyBuffer, ReplyLengthMarshal, ReplyLength, TimeoutMarshal, Timeout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} SecurityDescriptor 
     * @param {Integer} DesiredAccess 
     * @returns {NTSTATUS} 
     */
    static FltBuildDefaultSecurityDescriptor(SecurityDescriptor, DesiredAccess) {
        result := DllCall("FLTMGR.SYS\FltBuildDefaultSecurityDescriptor", "ptr", SecurityDescriptor, "uint", DesiredAccess, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeSecurityDescriptor(SecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        DllCall("FLTMGR.SYS\FltFreeSecurityDescriptor", "ptr", SecurityDescriptor)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltCancelIo(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltCancelIo", "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<PFLT_COMPLETE_CANCELED_CALLBACK>} CanceledCallback 
     * @returns {NTSTATUS} 
     */
    static FltSetCancelCompletion(CallbackData, CanceledCallback) {
        result := DllCall("FLTMGR.SYS\FltSetCancelCompletion", "ptr", CallbackData, "ptr", CanceledCallback, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {NTSTATUS} 
     */
    static FltClearCancelCompletion(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltClearCancelCompletion", "ptr", CallbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltIsIoCanceled(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltIsIoCanceled", "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @returns {PFLT_DEFERRED_IO_WORKITEM} 
     */
    static FltAllocateDeferredIoWorkItem() {
        result := DllCall("FLTMGR.SYS\FltAllocateDeferredIoWorkItem", "ptr")
        return result
    }

    /**
     * 
     * @param {PFLT_DEFERRED_IO_WORKITEM} FltWorkItem 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeDeferredIoWorkItem(FltWorkItem) {
        DllCall("FLTMGR.SYS\FltFreeDeferredIoWorkItem", "ptr", FltWorkItem)
    }

    /**
     * 
     * @returns {PFLT_GENERIC_WORKITEM} 
     */
    static FltAllocateGenericWorkItem() {
        result := DllCall("FLTMGR.SYS\FltAllocateGenericWorkItem", "ptr")
        return result
    }

    /**
     * 
     * @param {PFLT_GENERIC_WORKITEM} FltWorkItem 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeGenericWorkItem(FltWorkItem) {
        DllCall("FLTMGR.SYS\FltFreeGenericWorkItem", "ptr", FltWorkItem)
    }

    /**
     * 
     * @param {PFLT_DEFERRED_IO_WORKITEM} FltWorkItem 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<PFLT_DEFERRED_IO_WORKITEM_ROUTINE>} WorkerRoutine 
     * @param {Integer} QueueType 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static FltQueueDeferredIoWorkItem(FltWorkItem, Data, WorkerRoutine, QueueType, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueueDeferredIoWorkItem", "ptr", FltWorkItem, "ptr", Data, "ptr", WorkerRoutine, "int", QueueType, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_GENERIC_WORKITEM} FltWorkItem 
     * @param {Pointer<Void>} FltObject 
     * @param {Pointer<PFLT_GENERIC_WORKITEM_ROUTINE>} WorkerRoutine 
     * @param {Integer} QueueType 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static FltQueueGenericWorkItem(FltWorkItem, FltObject, WorkerRoutine, QueueType, Context) {
        FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltQueueGenericWorkItem", "ptr", FltWorkItem, FltObjectMarshal, FltObject, "ptr", WorkerRoutine, "int", QueueType, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {NTSTATUS} 
     */
    static FltLockUserBuffer(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltLockUserBuffer", "ptr", CallbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Pointer<Pointer<MDL>>>} MdlAddressPointer 
     * @param {Pointer<Pointer<Pointer<Void>>>} Buffer_R 
     * @param {Pointer<Pointer<Integer>>} Length 
     * @param {Pointer<Integer>} DesiredAccess 
     * @returns {NTSTATUS} 
     */
    static FltDecodeParameters(CallbackData, MdlAddressPointer, Buffer_R, Length, DesiredAccess) {
        MdlAddressPointerMarshal := MdlAddressPointer is VarRef ? "ptr*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"
        LengthMarshal := Length is VarRef ? "ptr*" : "ptr"
        DesiredAccessMarshal := DesiredAccess is VarRef ? "int*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltDecodeParameters", "ptr", CallbackData, MdlAddressPointerMarshal, MdlAddressPointer, Buffer_RMarshal, Buffer_R, LengthMarshal, Length, DesiredAccessMarshal, DesiredAccess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {Pointer<MDL>} 
     */
    static FltGetSwappedBufferMdlAddress(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltGetSwappedBufferMdlAddress", "ptr", CallbackData, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltRetainSwappedBufferMdlAddress(CallbackData) {
        DllCall("FLTMGR.SYS\FltRetainSwappedBufferMdlAddress", "ptr", CallbackData)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {Pointer<Void>} 
     */
    static FltGetNewSystemBufferAddress(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltGetNewSystemBufferAddress", "ptr", CallbackData, "ptr")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @param {Pointer<PFLT_CALLBACK_DATA_QUEUE_INSERT_IO>} CbdqInsertIo 
     * @param {Pointer<PFLT_CALLBACK_DATA_QUEUE_REMOVE_IO>} CbdqRemoveIo 
     * @param {Pointer<PFLT_CALLBACK_DATA_QUEUE_PEEK_NEXT_IO>} CbdqPeekNextIo 
     * @param {Pointer<PFLT_CALLBACK_DATA_QUEUE_ACQUIRE>} CbdqAcquire 
     * @param {Pointer<PFLT_CALLBACK_DATA_QUEUE_RELEASE>} CbdqRelease 
     * @param {Pointer<PFLT_CALLBACK_DATA_QUEUE_COMPLETE_CANCELED_IO>} CbdqCompleteCanceledIo 
     * @returns {NTSTATUS} 
     */
    static FltCbdqInitialize(Instance, Cbdq, CbdqInsertIo, CbdqRemoveIo, CbdqPeekNextIo, CbdqAcquire, CbdqRelease, CbdqCompleteCanceledIo) {
        result := DllCall("FLTMGR.SYS\FltCbdqInitialize", "ptr", Instance, "ptr", Cbdq, "ptr", CbdqInsertIo, "ptr", CbdqRemoveIo, "ptr", CbdqPeekNextIo, "ptr", CbdqAcquire, "ptr", CbdqRelease, "ptr", CbdqCompleteCanceledIo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCbdqEnable(Cbdq) {
        DllCall("FLTMGR.SYS\FltCbdqEnable", "ptr", Cbdq)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltCbdqDisable(Cbdq) {
        DllCall("FLTMGR.SYS\FltCbdqDisable", "ptr", Cbdq)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @param {Pointer<FLT_CALLBACK_DATA>} Cbd 
     * @param {Pointer<IO_CSQ_IRP_CONTEXT>} Context 
     * @param {Pointer<Void>} InsertContext 
     * @returns {NTSTATUS} 
     */
    static FltCbdqInsertIo(Cbdq, Cbd, Context, InsertContext) {
        InsertContextMarshal := InsertContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCbdqInsertIo", "ptr", Cbdq, "ptr", Cbd, "ptr", Context, InsertContextMarshal, InsertContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @param {Pointer<IO_CSQ_IRP_CONTEXT>} Context 
     * @returns {Pointer<FLT_CALLBACK_DATA>} 
     */
    static FltCbdqRemoveIo(Cbdq, Context) {
        result := DllCall("FLTMGR.SYS\FltCbdqRemoveIo", "ptr", Cbdq, "ptr", Context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @param {Pointer<Void>} PeekContext 
     * @returns {Pointer<FLT_CALLBACK_DATA>} 
     */
    static FltCbdqRemoveNextIo(Cbdq, PeekContext) {
        PeekContextMarshal := PeekContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCbdqRemoveNextIo", "ptr", Cbdq, PeekContextMarshal, PeekContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltInitializeOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltInitializeOplock", OplockMarshal, Oplock)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltUninitializeOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltUninitializeOplock", OplockMarshal, Oplock)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} OpenCount 
     * @returns {Integer} 
     */
    static FltOplockFsctrl(Oplock, CallbackData, OpenCount) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOplockFsctrl", OplockMarshal, Oplock, "ptr", CallbackData, "uint", OpenCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
     * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
     * @returns {Integer} 
     */
    static FltCheckOplock(Oplock, CallbackData, Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCheckOplock", OplockMarshal, Oplock, "ptr", CallbackData, ContextMarshal, Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FltOplockIsFastIoPossible(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOplockIsFastIoPossible", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FltCurrentBatchOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCurrentBatchOplock", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
     * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
     * @returns {Integer} 
     */
    static FltCheckOplockEx(Oplock, CallbackData, Flags, Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCheckOplockEx", OplockMarshal, Oplock, "ptr", CallbackData, "uint", Flags, ContextMarshal, Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FltCurrentOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCurrentOplock", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FltCurrentOplockH(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCurrentOplockH", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
     * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
     * @returns {Integer} 
     */
    static FltOplockBreakH(Oplock, CallbackData, Flags, Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOplockBreakH", OplockMarshal, Oplock, "ptr", CallbackData, "uint", Flags, ContextMarshal, Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
     * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
     * @returns {Integer} 
     */
    static FltOplockBreakToNone(Oplock, CallbackData, Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOplockBreakToNone", OplockMarshal, Oplock, "ptr", CallbackData, ContextMarshal, Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
     * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
     * @returns {Integer} 
     */
    static FltOplockBreakToNoneEx(Oplock, CallbackData, Flags, Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOplockBreakToNoneEx", OplockMarshal, Oplock, "ptr", CallbackData, "uint", Flags, ContextMarshal, Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltOplockIsSharedRequest(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltOplockIsSharedRequest", "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} OpenCount 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static FltOplockFsctrlEx(Oplock, CallbackData, OpenCount, Flags) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltOplockFsctrlEx", OplockMarshal, Oplock, "ptr", CallbackData, "uint", OpenCount, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} Fo1 
     * @param {Pointer<FILE_OBJECT>} Fo2 
     * @returns {BOOLEAN} 
     */
    static FltOplockKeysEqual(Fo1, Fo2) {
        result := DllCall("FLTMGR.SYS\FltOplockKeysEqual", "ptr", Fo1, "ptr", Fo2, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltInitializeFileLock(FileLock) {
        DllCall("FLTMGR.SYS\FltInitializeFileLock", "ptr", FileLock)
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltUninitializeFileLock(FileLock) {
        DllCall("FLTMGR.SYS\FltUninitializeFileLock", "ptr", FileLock)
    }

    /**
     * 
     * @param {Pointer<PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE>} CompleteLockCallbackDataRoutine 
     * @param {Pointer<PUNLOCK_ROUTINE>} UnlockRoutine 
     * @returns {Pointer<FILE_LOCK>} 
     */
    static FltAllocateFileLock(CompleteLockCallbackDataRoutine, UnlockRoutine) {
        result := DllCall("FLTMGR.SYS\FltAllocateFileLock", "ptr", CompleteLockCallbackDataRoutine, "ptr", UnlockRoutine, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeFileLock(FileLock) {
        DllCall("FLTMGR.SYS\FltFreeFileLock", "ptr", FileLock)
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Void>} Context 
     * @returns {Integer} 
     */
    static FltProcessFileLock(FileLock, CallbackData, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltProcessFileLock", "ptr", FileLock, "ptr", CallbackData, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltCheckLockForReadAccess(FileLock, CallbackData) {
        result := DllCall("FLTMGR.SYS\FltCheckLockForReadAccess", "ptr", FileLock, "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltCheckLockForWriteAccess(FileLock, CallbackData) {
        result := DllCall("FLTMGR.SYS\FltCheckLockForWriteAccess", "ptr", FileLock, "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcquireResourceExclusive(Resource) {
        DllCall("FLTMGR.SYS\FltAcquireResourceExclusive", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcquireResourceShared(Resource) {
        DllCall("FLTMGR.SYS\FltAcquireResourceShared", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleaseResource(Resource) {
        DllCall("FLTMGR.SYS\FltReleaseResource", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltInitializePushLock(PushLock) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltInitializePushLock", PushLockMarshal, PushLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltDeletePushLock(PushLock) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltDeletePushLock", PushLockMarshal, PushLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcquirePushLockExclusive(PushLock) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltAcquirePushLockExclusive", PushLockMarshal, PushLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcquirePushLockShared(PushLock) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltAcquirePushLockShared", PushLockMarshal, PushLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleasePushLock(PushLock) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltReleasePushLock", PushLockMarshal, PushLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcquirePushLockExclusiveEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltAcquirePushLockExclusiveEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcquirePushLockSharedEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltAcquirePushLockSharedEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltReleasePushLockEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltReleasePushLockEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {NTSTATUS} 
     */
    static FltCancellableWaitForSingleObject(Object_R, Timeout, CallbackData) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCancellableWaitForSingleObject", Object_RMarshal, Object_R, TimeoutMarshal, Timeout, "ptr", CallbackData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Pointer<Void>>} ObjectArray 
     * @param {Integer} WaitType 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<KWAIT_BLOCK>} WaitBlockArray 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {NTSTATUS} 
     */
    static FltCancellableWaitForMultipleObjects(Count, ObjectArray, WaitType, Timeout, WaitBlockArray, CallbackData) {
        ObjectArrayMarshal := ObjectArray is VarRef ? "ptr*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCancellableWaitForMultipleObjects", "uint", Count, ObjectArrayMarshal, ObjectArray, "int", WaitType, TimeoutMarshal, Timeout, "ptr", WaitBlockArray, "ptr", CallbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltIsOperationSynchronous(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltIsOperationSynchronous", "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {BOOLEAN} 
     */
    static FltIs32bitProcess(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltIs32bitProcess", "ptr", CallbackData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {PEPROCESS} 
     */
    static FltGetRequestorProcess(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltGetRequestorProcess", "ptr", CallbackData, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {Integer} 
     */
    static FltGetRequestorProcessId(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltGetRequestorProcessId", "ptr", CallbackData, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @returns {HANDLE} 
     */
    static FltGetRequestorProcessIdEx(CallbackData) {
        result := DllCall("FLTMGR.SYS\FltGetRequestorProcessIdEx", "ptr", CallbackData, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @param {Pointer<Void>} FsContext 
     * @param {Pointer<STRING>} FullDirectoryName 
     * @param {BOOLEAN} WatchTree 
     * @param {BOOLEAN} IgnoreBuffer 
     * @param {Integer} CompletionFilter 
     * @param {Pointer<FLT_CALLBACK_DATA>} NotifyCallbackData 
     * @param {Pointer<PCHECK_FOR_TRAVERSE_ACCESS>} TraverseCallback 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @param {Pointer<PFILTER_REPORT_CHANGE>} FilterCallback 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltNotifyFilterChangeDirectory(NotifySync, NotifyList, FsContext, FullDirectoryName, WatchTree, IgnoreBuffer, CompletionFilter, NotifyCallbackData, TraverseCallback, SubjectContext, FilterCallback) {
        FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltNotifyFilterChangeDirectory", "ptr", NotifySync, "ptr", NotifyList, FsContextMarshal, FsContext, "ptr", FullDirectoryName, "char", WatchTree, "char", IgnoreBuffer, "uint", CompletionFilter, "ptr", NotifyCallbackData, "ptr", TraverseCallback, "ptr", SubjectContext, "ptr", FilterCallback)
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Integer>} SessionId 
     * @returns {NTSTATUS} 
     */
    static FltGetRequestorSessionId(CallbackData, SessionId) {
        SessionIdMarshal := SessionId is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetRequestorSessionId", "ptr", CallbackData, SessionIdMarshal, SessionId, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} SourceInstance 
     * @param {PFLT_INSTANCE} TargetInstance 
     * @param {Pointer<BOOLEAN>} SourceDeviceStackSizeModified 
     * @returns {NTSTATUS} 
     */
    static FltAdjustDeviceStackSizeForIoRedirection(SourceInstance, TargetInstance, SourceDeviceStackSizeModified) {
        SourceDeviceStackSizeModifiedMarshal := SourceDeviceStackSizeModified is VarRef ? "char*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAdjustDeviceStackSizeForIoRedirection", "ptr", SourceInstance, "ptr", TargetInstance, SourceDeviceStackSizeModifiedMarshal, SourceDeviceStackSizeModified, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} SourceInstance 
     * @param {PFLT_INSTANCE} TargetInstance 
     * @param {Pointer<BOOLEAN>} RedirectionAllowed 
     * @returns {NTSTATUS} 
     */
    static FltIsIoRedirectionAllowed(SourceInstance, TargetInstance, RedirectionAllowed) {
        RedirectionAllowedMarshal := RedirectionAllowed is VarRef ? "char*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsIoRedirectionAllowed", "ptr", SourceInstance, "ptr", TargetInstance, RedirectionAllowedMarshal, RedirectionAllowed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {PFLT_INSTANCE} TargetInstance 
     * @param {Pointer<BOOLEAN>} RedirectionAllowedThisIo 
     * @param {Pointer<BOOLEAN>} RedirectionAllowedAllIo 
     * @returns {NTSTATUS} 
     */
    static FltIsIoRedirectionAllowedForOperation(Data, TargetInstance, RedirectionAllowedThisIo, RedirectionAllowedAllIo) {
        RedirectionAllowedThisIoMarshal := RedirectionAllowedThisIo is VarRef ? "char*" : "ptr"
        RedirectionAllowedAllIoMarshal := RedirectionAllowedAllIo is VarRef ? "char*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsIoRedirectionAllowedForOperation", "ptr", Data, "ptr", TargetInstance, RedirectionAllowedThisIoMarshal, RedirectionAllowedThisIo, RedirectionAllowedAllIoMarshal, RedirectionAllowedAllIo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {NTSTATUS} OperationStatus 
     * @param {Pointer<UNICODE_STRING>} FailureReason 
     * @returns {NTSTATUS} 
     */
    static FltVetoBypassIo(CallbackData, FltObjects, OperationStatus, FailureReason) {
        result := DllCall("FLTMGR.SYS\FltVetoBypassIo", "ptr", CallbackData, "ptr", FltObjects, "int", OperationStatus, "ptr", FailureReason, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @param {Integer} NotificationMask 
     * @returns {NTSTATUS} 
     */
    static FltEnlistInTransaction(Instance, Transaction, TransactionContext, NotificationMask) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltEnlistInTransaction", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "uint", NotificationMask, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @returns {NTSTATUS} 
     */
    static FltRollbackEnlistment(Instance, Transaction, TransactionContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRollbackEnlistment", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @returns {NTSTATUS} 
     */
    static FltPrePrepareComplete(Instance, Transaction, TransactionContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltPrePrepareComplete", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @returns {NTSTATUS} 
     */
    static FltPrepareComplete(Instance, Transaction, TransactionContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltPrepareComplete", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @returns {NTSTATUS} 
     */
    static FltCommitComplete(Instance, Transaction, TransactionContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCommitComplete", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @returns {NTSTATUS} 
     */
    static FltCommitFinalizeComplete(Instance, Transaction, TransactionContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCommitFinalizeComplete", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {PFLT_CONTEXT} TransactionContext 
     * @returns {NTSTATUS} 
     */
    static FltRollbackComplete(Instance, Transaction, TransactionContext) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRollbackComplete", "ptr", Instance, TransactionMarshal, Transaction, "ptr", TransactionContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FltAllocateExtraCreateParameterList(Filter, Flags, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAllocateExtraCreateParameterList", "ptr", Filter, "uint", Flags, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Guid>} EcpType 
     * @param {Integer} SizeOfContext 
     * @param {Integer} Flags 
     * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
     * @param {Integer} PoolTag 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @returns {NTSTATUS} 
     */
    static FltAllocateExtraCreateParameter(Filter, EcpType, SizeOfContext, Flags, CleanupCallback, PoolTag, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAllocateExtraCreateParameter", "ptr", Filter, "ptr", EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, "uint", PoolTag, EcpContextMarshal, EcpContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} Lookaside 
     * @param {Integer} Flags 
     * @param {Pointer} Size 
     * @param {Integer} Tag 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltInitExtraCreateParameterLookasideList(Filter, Lookaside, Flags, Size, Tag) {
        LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltInitExtraCreateParameterLookasideList", "ptr", Filter, LookasideMarshal, Lookaside, "uint", Flags, "ptr", Size, "uint", Tag)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} Lookaside 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltDeleteExtraCreateParameterLookasideList(Filter, Lookaside, Flags) {
        LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltDeleteExtraCreateParameterLookasideList", "ptr", Filter, LookasideMarshal, Lookaside, "uint", Flags)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Guid>} EcpType 
     * @param {Integer} SizeOfContext 
     * @param {Integer} Flags 
     * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
     * @param {Pointer<Void>} LookasideList 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @returns {NTSTATUS} 
     */
    static FltAllocateExtraCreateParameterFromLookasideList(Filter, EcpType, SizeOfContext, Flags, CleanupCallback, LookasideList, EcpContext) {
        LookasideListMarshal := LookasideList is VarRef ? "ptr" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltAllocateExtraCreateParameterFromLookasideList", "ptr", Filter, "ptr", EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, LookasideListMarshal, LookasideList, EcpContextMarshal, EcpContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Void>} EcpContext 
     * @returns {NTSTATUS} 
     */
    static FltInsertExtraCreateParameter(Filter, EcpList, EcpContext) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltInsertExtraCreateParameter", "ptr", Filter, EcpListMarshal, EcpList, EcpContextMarshal, EcpContext, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Guid>} EcpType 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @param {Pointer<Integer>} EcpContextSize 
     * @returns {NTSTATUS} 
     */
    static FltFindExtraCreateParameter(Filter, EcpList, EcpType, EcpContext, EcpContextSize) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
        EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltFindExtraCreateParameter", "ptr", Filter, EcpListMarshal, EcpList, "ptr", EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Guid>} EcpType 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @param {Pointer<Integer>} EcpContextSize 
     * @returns {NTSTATUS} 
     */
    static FltRemoveExtraCreateParameter(Filter, EcpList, EcpType, EcpContext, EcpContextSize) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
        EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRemoveExtraCreateParameter", "ptr", Filter, EcpListMarshal, EcpList, "ptr", EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeExtraCreateParameterList(Filter, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltFreeExtraCreateParameterList", "ptr", Filter, EcpListMarshal, EcpList)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} EcpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeExtraCreateParameter(Filter, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltFreeExtraCreateParameter", "ptr", Filter, EcpContextMarshal, EcpContext)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FltGetEcpListFromCallbackData(Filter, CallbackData, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetEcpListFromCallbackData", "ptr", Filter, "ptr", CallbackData, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FltSetEcpListIntoCallbackData(Filter, CallbackData, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltSetEcpListIntoCallbackData", "ptr", Filter, "ptr", CallbackData, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Void>} CurrentEcpContext 
     * @param {Pointer<Guid>} NextEcpType 
     * @param {Pointer<Pointer<Void>>} NextEcpContext 
     * @param {Pointer<Integer>} NextEcpContextSize 
     * @returns {NTSTATUS} 
     */
    static FltGetNextExtraCreateParameter(Filter, EcpList, CurrentEcpContext, NextEcpType, NextEcpContext, NextEcpContextSize) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        CurrentEcpContextMarshal := CurrentEcpContext is VarRef ? "ptr" : "ptr"
        NextEcpContextMarshal := NextEcpContext is VarRef ? "ptr*" : "ptr"
        NextEcpContextSizeMarshal := NextEcpContextSize is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetNextExtraCreateParameter", "ptr", Filter, EcpListMarshal, EcpList, CurrentEcpContextMarshal, CurrentEcpContext, "ptr", NextEcpType, NextEcpContextMarshal, NextEcpContext, NextEcpContextSizeMarshal, NextEcpContextSize, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} EcpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltAcknowledgeEcp(Filter, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltAcknowledgeEcp", "ptr", Filter, EcpContextMarshal, EcpContext)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} EcpContext 
     * @returns {BOOLEAN} 
     */
    static FltIsEcpAcknowledged(Filter, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsEcpAcknowledged", "ptr", Filter, EcpContextMarshal, EcpContext, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} EcpContext 
     * @returns {BOOLEAN} 
     */
    static FltIsEcpFromUserMode(Filter, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("FLTMGR.SYS\FltIsEcpFromUserMode", "ptr", Filter, EcpContextMarshal, EcpContext, "char")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<Void>} EcpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltPrepareToReuseEcp(Filter, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall("FLTMGR.SYS\FltPrepareToReuseEcp", "ptr", Filter, EcpContextMarshal, EcpContext)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<OPEN_REPARSE_LIST_ENTRY>} OpenReparseEntry 
     * @returns {NTSTATUS} 
     */
    static FltAddOpenReparseEntry(Filter, Data, OpenReparseEntry) {
        result := DllCall("FLTMGR.SYS\FltAddOpenReparseEntry", "ptr", Filter, "ptr", Data, "ptr", OpenReparseEntry, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<OPEN_REPARSE_LIST_ENTRY>} OpenReparseEntry 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltRemoveOpenReparseEntry(Filter, Data, OpenReparseEntry) {
        DllCall("FLTMGR.SYS\FltRemoveOpenReparseEntry", "ptr", Filter, "ptr", Data, "ptr", OpenReparseEntry)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FltCopyOpenReparseList(Filter, Data, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltCopyOpenReparseList", "ptr", Filter, "ptr", Data, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {String} Nothing - always returns an empty string
     */
    static FltFreeOpenReparseList(Filter, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        DllCall("FLTMGR.SYS\FltFreeOpenReparseList", "ptr", Filter, EcpListMarshal, EcpList)
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Integer} InfoClassFlags 
     * @returns {NTSTATUS} 
     */
    static FltRequestFileInfoOnCreateCompletion(Filter, Data, InfoClassFlags) {
        result := DllCall("FLTMGR.SYS\FltRequestFileInfoOnCreateCompletion", "ptr", Filter, "ptr", Data, "uint", InfoClassFlags, "int")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Integer} InfoClass 
     * @param {Pointer<Integer>} Size 
     * @returns {Pointer<Void>} 
     */
    static FltRetrieveFileInfoOnCreateCompletion(Filter, Data, InfoClass, Size) {
        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRetrieveFileInfoOnCreateCompletion", "ptr", Filter, "ptr", Data, "uint", InfoClass, SizeMarshal, Size, "ptr")
        return result
    }

    /**
     * 
     * @param {PFLT_FILTER} Filter 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Integer} InfoClass 
     * @param {Pointer<Integer>} RetInfoSize 
     * @param {Pointer<Pointer<Void>>} RetInfoBuffer 
     * @returns {NTSTATUS} 
     */
    static FltRetrieveFileInfoOnCreateCompletionEx(Filter, Data, InfoClass, RetInfoSize, RetInfoBuffer) {
        RetInfoSizeMarshal := RetInfoSize is VarRef ? "uint*" : "ptr"
        RetInfoBufferMarshal := RetInfoBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltRetrieveFileInfoOnCreateCompletionEx", "ptr", Filter, "ptr", Data, "uint", InfoClass, RetInfoSizeMarshal, RetInfoSize, RetInfoBufferMarshal, RetInfoBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PETHREAD} Thread 
     * @param {Pointer<IO_PRIORITY_INFO>} PriorityInfo 
     * @returns {NTSTATUS} 
     */
    static FltRetrieveIoPriorityInfo(Data, FileObject, Thread, PriorityInfo) {
        result := DllCall("FLTMGR.SYS\FltRetrieveIoPriorityInfo", "ptr", Data, "ptr", FileObject, "ptr", Thread, "ptr", PriorityInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_PRIORITY_INFO>} InputPriorityInfo 
     * @param {Pointer<IO_PRIORITY_INFO>} OutputPriorityInfo 
     * @param {PETHREAD} Thread 
     * @returns {NTSTATUS} 
     */
    static FltApplyPriorityInfoThread(InputPriorityInfo, OutputPriorityInfo, Thread) {
        result := DllCall("FLTMGR.SYS\FltApplyPriorityInfoThread", "ptr", InputPriorityInfo, "ptr", OutputPriorityInfo, "ptr", Thread, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {Integer} 
     */
    static FltGetIoPriorityHint(Data) {
        result := DllCall("FLTMGR.SYS\FltGetIoPriorityHint", "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {Integer} 
     */
    static FltGetIoPriorityHintFromCallbackData(Data) {
        result := DllCall("FLTMGR.SYS\FltGetIoPriorityHintFromCallbackData", "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Integer} PriorityHint 
     * @returns {NTSTATUS} 
     */
    static FltSetIoPriorityHintIntoCallbackData(Data, PriorityHint) {
        result := DllCall("FLTMGR.SYS\FltSetIoPriorityHintIntoCallbackData", "ptr", Data, "int", PriorityHint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Integer} 
     */
    static FltGetIoPriorityHintFromFileObject(FileObject) {
        result := DllCall("FLTMGR.SYS\FltGetIoPriorityHintFromFileObject", "ptr", FileObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} PriorityHint 
     * @returns {NTSTATUS} 
     */
    static FltSetIoPriorityHintIntoFileObject(FileObject, PriorityHint) {
        result := DllCall("FLTMGR.SYS\FltSetIoPriorityHintIntoFileObject", "ptr", FileObject, "int", PriorityHint, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {Integer} 
     */
    static FltGetIoPriorityHintFromThread(Thread) {
        result := DllCall("FLTMGR.SYS\FltGetIoPriorityHintFromThread", "ptr", Thread, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Integer} PriorityHint 
     * @returns {NTSTATUS} 
     */
    static FltSetIoPriorityHintIntoThread(Thread, PriorityHint) {
        result := DllCall("FLTMGR.SYS\FltSetIoPriorityHintIntoThread", "ptr", Thread, "int", PriorityHint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static FltGetActivityIdCallbackData(CallbackData, Guid) {
        result := DllCall("FLTMGR.SYS\FltGetActivityIdCallbackData", "ptr", CallbackData, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static FltSetActivityIdCallbackData(CallbackData, Guid) {
        result := DllCall("FLTMGR.SYS\FltSetActivityIdCallbackData", "ptr", CallbackData, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Pointer<Guid>} PropagateId 
     * @param {Pointer<Pointer<Guid>>} OriginalId 
     * @returns {NTSTATUS} 
     */
    static FltPropagateActivityIdToThread(CallbackData, PropagateId, OriginalId) {
        OriginalIdMarshal := OriginalId is VarRef ? "ptr*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltPropagateActivityIdToThread", "ptr", CallbackData, "ptr", PropagateId, OriginalIdMarshal, OriginalId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Pointer<Integer>} ZeroingOffset 
     * @returns {NTSTATUS} 
     */
    static FltGetFsZeroingOffset(Data, ZeroingOffset) {
        ZeroingOffsetMarshal := ZeroingOffset is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTMGR.SYS\FltGetFsZeroingOffset", "ptr", Data, ZeroingOffsetMarshal, ZeroingOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {NTSTATUS} 
     */
    static FltSetFsZeroingOffsetRequired(Data) {
        result := DllCall("FLTMGR.SYS\FltSetFsZeroingOffsetRequired", "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @param {Integer} ZeroingOffset 
     * @returns {NTSTATUS} 
     */
    static FltSetFsZeroingOffset(Data, ZeroingOffset) {
        result := DllCall("FLTMGR.SYS\FltSetFsZeroingOffset", "ptr", Data, "uint", ZeroingOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {Pointer<Void>} 
     */
    static FltGetIoAttributionHandleFromCallbackData(Data) {
        result := DllCall("FLTMGR.SYS\FltGetIoAttributionHandleFromCallbackData", "ptr", Data, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} SourceData 
     * @param {Pointer<FLT_CALLBACK_DATA>} TargetData 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FltPropagateIrpExtension(SourceData, TargetData, Flags) {
        result := DllCall("FLTMGR.SYS\FltPropagateIrpExtension", "ptr", SourceData, "ptr", TargetData, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} IrpMajorCode 
     * @returns {PSTR} 
     */
    static FltGetIrpName(IrpMajorCode) {
        result := DllCall("FLTMGR.SYS\FltGetIrpName", "char", IrpMajorCode, "ptr")
        return result
    }

;@endregion Methods
}
