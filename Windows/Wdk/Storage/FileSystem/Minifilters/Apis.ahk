#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }
#Import "..\..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\FLT_POSTOP_CALLBACK_STATUS.ahk" { FLT_POSTOP_CALLBACK_STATUS }
#Import ".\FLT_RELATED_CONTEXTS_EX.ahk" { FLT_RELATED_CONTEXTS_EX }
#Import "..\..\..\System\SystemServices\IO_DRIVER_CREATE_CONTEXT.ahk" { IO_DRIVER_CREATE_CONTEXT }
#Import ".\PFLT_PORT.ahk" { PFLT_PORT }
#Import "..\..\..\Foundation\POOL_TYPE.ahk" { POOL_TYPE }
#Import "..\..\..\Foundation\MDL.ahk" { MDL }
#Import "..\IO_PRIORITY_INFO.ahk" { IO_PRIORITY_INFO }
#Import "..\..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\FLT_PREOP_CALLBACK_STATUS.ahk" { FLT_PREOP_CALLBACK_STATUS }
#Import "..\FS_INFORMATION_CLASS.ahk" { FS_INFORMATION_CLASS }
#Import ".\PFLT_FILTER.ahk" { PFLT_FILTER }
#Import "..\..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\FLT_RELATED_CONTEXTS.ahk" { FLT_RELATED_CONTEXTS }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\SystemServices\WORK_QUEUE_TYPE.ahk" { WORK_QUEUE_TYPE }
#Import "..\..\..\Foundation\PETHREAD.ahk" { PETHREAD }
#Import "..\..\..\..\Win32\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Foundation\ECP_LIST.ahk" { ECP_LIST }
#Import "..\..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\..\Foundation\ERESOURCE.ahk" { ERESOURCE }
#Import "..\..\..\..\Win32\Storage\InstallableFileSystems\FILTER_VOLUME_INFORMATION_CLASS.ahk" { FILTER_VOLUME_INFORMATION_CLASS }
#Import ".\FLT_CALLBACK_DATA_QUEUE.ahk" { FLT_CALLBACK_DATA_QUEUE }
#Import "..\..\..\System\SystemServices\IO_CSQ_IRP_CONTEXT.ahk" { IO_CSQ_IRP_CONTEXT }
#Import "..\..\..\Foundation\KWAIT_BLOCK.ahk" { KWAIT_BLOCK }
#Import ".\FLT_FILE_NAME_INFORMATION.ahk" { FLT_FILE_NAME_INFORMATION }
#Import ".\FLT_NAME_CONTROL.ahk" { FLT_NAME_CONTROL }
#Import ".\FLT_REGISTRATION.ahk" { FLT_REGISTRATION }
#Import "..\FILE_LOCK.ahk" { FILE_LOCK }
#Import "..\..\..\Foundation\SECURITY_SUBJECT_CONTEXT.ahk" { SECURITY_SUBJECT_CONTEXT }
#Import "..\..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }
#Import "..\..\..\..\Win32\Storage\InstallableFileSystems\INSTANCE_INFORMATION_CLASS.ahk" { INSTANCE_INFORMATION_CLASS }
#Import "..\..\..\Foundation\IO_PRIORITY_HINT.ahk" { IO_PRIORITY_HINT }
#Import "..\..\..\System\SystemServices\LOCK_OPERATION.ahk" { LOCK_OPERATION }
#Import "..\..\..\..\Win32\Storage\InstallableFileSystems\FILTER_INFORMATION_CLASS.ahk" { FILTER_INFORMATION_CLASS }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }
#Import ".\PFLT_CONTEXT.ahk" { PFLT_CONTEXT }
#Import "..\OPEN_REPARSE_LIST_ENTRY.ahk" { OPEN_REPARSE_LIST_ENTRY }
#Import "..\..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import ".\FLT_SET_CONTEXT_OPERATION.ahk" { FLT_SET_CONTEXT_OPERATION }
#Import ".\PFLT_DEFERRED_IO_WORKITEM.ahk" { PFLT_DEFERRED_IO_WORKITEM }
#Import "..\..\..\Foundation\KTRANSACTION.ahk" { KTRANSACTION }
#Import "..\..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }
#Import "..\..\..\Foundation\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import "..\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }
#Import ".\PFLT_VOLUME.ahk" { PFLT_VOLUME }
#Import ".\PFLT_GENERIC_WORKITEM.ahk" { PFLT_GENERIC_WORKITEM }
#Import "..\..\..\..\Win32\System\Kernel\STRING.ahk" { STRING }
#Import "..\..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\..\Win32\System\Kernel\WAIT_TYPE.ahk" { WAIT_TYPE }
#Import "..\..\..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }
#Import "..\..\..\..\Win32\Storage\InstallableFileSystems\FLT_FILESYSTEM_TYPE.ahk" { FLT_FILESYSTEM_TYPE }
#Import "..\..\..\Foundation\PNOTIFY_SYNC.ahk" { PNOTIFY_SYNC }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */

;@region Functions
/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {String} Nothing - always returns an empty string
 */
export FltSetCallbackDataDirty(Data) {
    DllCall("FLTMGR.SYS\FltSetCallbackDataDirty", FLT_CALLBACK_DATA.Ptr, Data)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {String} Nothing - always returns an empty string
 */
export FltClearCallbackDataDirty(Data) {
    DllCall("FLTMGR.SYS\FltClearCallbackDataDirty", FLT_CALLBACK_DATA.Ptr, Data)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {BOOLEAN} 
 */
export FltIsCallbackDataDirty(Data) {
    result := DllCall("FLTMGR.SYS\FltIsCallbackDataDirty", FLT_CALLBACK_DATA.Ptr, Data, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
 * @param {Pointer<Void>} CompletionContext 
 * @param {Integer} Flags 
 * @param {Pointer<PFLT_POST_OPERATION_CALLBACK>} SafePostCallback 
 * @param {Pointer<FLT_POSTOP_CALLBACK_STATUS>} RetPostOperationStatus 
 * @returns {BOOLEAN} 
 */
export FltDoCompletionProcessingWhenSafe(Data, FltObjects, CompletionContext, Flags, SafePostCallback, RetPostOperationStatus) {
    CompletionContextMarshal := CompletionContext is VarRef ? "ptr" : "ptr"
    RetPostOperationStatusMarshal := RetPostOperationStatus is VarRef ? "int*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDoCompletionProcessingWhenSafe", FLT_CALLBACK_DATA.Ptr, Data, FLT_RELATED_OBJECTS.Ptr, FltObjects, CompletionContextMarshal, CompletionContext, "uint", Flags, "ptr", SafePostCallback, RetPostOperationStatusMarshal, RetPostOperationStatus, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FLT_NAME_CONTROL>} NameCtrl 
 * @param {Integer} NewSize 
 * @returns {NTSTATUS} 
 */
export FltCheckAndGrowNameControl(NameCtrl, NewSize) {
    result := DllCall("FLTMGR.SYS\FltCheckAndGrowNameControl", FLT_NAME_CONTROL.Ptr, NameCtrl, "ushort", NewSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {NTSTATUS} 
 */
export FltPurgeFileNameInformationCache(Instance, FileObject) {
    result := DllCall("FLTMGR.SYS\FltPurgeFileNameInformationCache", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @returns {NTSTATUS} 
 */
export FltRegisterForDataScan(Instance) {
    result := DllCall("FLTMGR.SYS\FltRegisterForDataScan", PFLT_INSTANCE, Instance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltCreateSectionForDataScan(Instance, FileObject, SectionContext, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, Flags, SectionHandle, SectionObject, SectionFileSize) {
    MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"
    SectionObjectMarshal := SectionObject is VarRef ? "ptr*" : "ptr"
    SectionFileSizeMarshal := SectionFileSize is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateSectionForDataScan", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, PFLT_CONTEXT, SectionContext, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "uint", Flags, HANDLE.Ptr, SectionHandle, SectionObjectMarshal, SectionObject, SectionFileSizeMarshal, SectionFileSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_CONTEXT} SectionContext 
 * @returns {NTSTATUS} 
 */
export FltCloseSectionForDataScan(SectionContext) {
    result := DllCall("FLTMGR.SYS\FltCloseSectionForDataScan", PFLT_CONTEXT, SectionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} Driver 
 * @param {Pointer<FLT_REGISTRATION>} Registration 
 * @param {Pointer<PFLT_FILTER>} RetFilter 
 * @returns {NTSTATUS} 
 */
export FltRegisterFilter(Driver, Registration, RetFilter) {
    RetFilterMarshal := RetFilter is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRegisterFilter", DRIVER_OBJECT.Ptr, Driver, FLT_REGISTRATION.Ptr, Registration, RetFilterMarshal, RetFilter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @returns {String} Nothing - always returns an empty string
 */
export FltUnregisterFilter(Filter) {
    DllCall("FLTMGR.SYS\FltUnregisterFilter", PFLT_FILTER, Filter)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @returns {NTSTATUS} 
 */
export FltStartFiltering(Filter) {
    result := DllCall("FLTMGR.SYS\FltStartFiltering", PFLT_FILTER, Filter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSTR} FltMgrRoutineName 
 * @returns {Pointer<Void>} 
 */
export FltGetRoutineAddress(FltMgrRoutineName) {
    FltMgrRoutineName := FltMgrRoutineName is String ? StrPtr(FltMgrRoutineName) : FltMgrRoutineName

    result := DllCall("FLTMGR.SYS\FltGetRoutineAddress", "ptr", FltMgrRoutineName, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {FLT_PREOP_CALLBACK_STATUS} CallbackStatus 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCompletePendedPreOperation(CallbackData, CallbackStatus, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltCompletePendedPreOperation", FLT_CALLBACK_DATA.Ptr, CallbackData, FLT_PREOP_CALLBACK_STATUS, CallbackStatus, _ContextMarshal, _Context)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCompletePendedPostOperation(CallbackData) {
    DllCall("FLTMGR.SYS\FltCompletePendedPostOperation", FLT_CALLBACK_DATA.Ptr, CallbackData)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<PFLT_GET_OPERATION_STATUS_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} RequesterContext 
 * @returns {NTSTATUS} 
 */
export FltRequestOperationStatusCallback(Data, CallbackRoutine, RequesterContext) {
    RequesterContextMarshal := RequesterContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRequestOperationStatusCallback", FLT_CALLBACK_DATA.Ptr, Data, "ptr", CallbackRoutine, RequesterContextMarshal, RequesterContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Tag 
 * @returns {Pointer<Void>} 
 */
export FltAllocatePoolAlignedWithTag(Instance, PoolType, NumberOfBytes, Tag) {
    result := DllCall("FLTMGR.SYS\FltAllocatePoolAlignedWithTag", PFLT_INSTANCE, Instance, POOL_TYPE, PoolType, "ptr", NumberOfBytes, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<Void>} _Buffer 
 * @param {Integer} Tag 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreePoolAlignedWithTag(Instance, _Buffer, Tag) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltFreePoolAlignedWithTag", PFLT_INSTANCE, Instance, _BufferMarshal, _Buffer, "uint", Tag)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Integer} NameOptions 
 * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} FileNameInformation 
 * @returns {NTSTATUS} 
 */
export FltGetFileNameInformation(CallbackData, NameOptions, FileNameInformation) {
    FileNameInformationMarshal := FileNameInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFileNameInformation", FLT_CALLBACK_DATA.Ptr, CallbackData, "uint", NameOptions, FileNameInformationMarshal, FileNameInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltGetFileNameInformationUnsafe(FileObject, Instance, NameOptions, FileNameInformation) {
    FileNameInformationMarshal := FileNameInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFileNameInformationUnsafe", FILE_OBJECT.Ptr, FileObject, PFLT_INSTANCE, Instance, "uint", NameOptions, FileNameInformationMarshal, FileNameInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleaseFileNameInformation(FileNameInformation) {
    DllCall("FLTMGR.SYS\FltReleaseFileNameInformation", FLT_FILE_NAME_INFORMATION.Ptr, FileNameInformation)
}

/**
 * 
 * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReferenceFileNameInformation(FileNameInformation) {
    DllCall("FLTMGR.SYS\FltReferenceFileNameInformation", FLT_FILE_NAME_INFORMATION.Ptr, FileNameInformation)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {Pointer<UNICODE_STRING>} _Extension 
 * @param {Pointer<UNICODE_STRING>} Stream 
 * @param {Pointer<UNICODE_STRING>} FinalComponent 
 * @returns {NTSTATUS} 
 */
export FltParseFileName(FileName, _Extension, Stream, FinalComponent) {
    result := DllCall("FLTMGR.SYS\FltParseFileName", UNICODE_STRING.Ptr, FileName, UNICODE_STRING.Ptr, _Extension, UNICODE_STRING.Ptr, Stream, UNICODE_STRING.Ptr, FinalComponent, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
 * @returns {NTSTATUS} 
 */
export FltParseFileNameInformation(FileNameInformation) {
    result := DllCall("FLTMGR.SYS\FltParseFileNameInformation", FLT_FILE_NAME_INFORMATION.Ptr, FileNameInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<FLT_FILE_NAME_INFORMATION>} FileNameInformation 
 * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} RetTunneledFileNameInformation 
 * @returns {NTSTATUS} 
 */
export FltGetTunneledName(CallbackData, FileNameInformation, RetTunneledFileNameInformation) {
    RetTunneledFileNameInformationMarshal := RetTunneledFileNameInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetTunneledName", FLT_CALLBACK_DATA.Ptr, CallbackData, FLT_FILE_NAME_INFORMATION.Ptr, FileNameInformation, RetTunneledFileNameInformationMarshal, RetTunneledFileNameInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<UNICODE_STRING>} VolumeName 
 * @param {Pointer<Integer>} BufferSizeNeeded 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeName(Volume, VolumeName, BufferSizeNeeded) {
    BufferSizeNeededMarshal := BufferSizeNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeName", PFLT_VOLUME, Volume, UNICODE_STRING.Ptr, VolumeName, BufferSizeNeededMarshal, BufferSizeNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {HANDLE} RootDirectory 
 * @param {Integer} FileName 
 * @param {Integer} FileNameLength 
 * @param {Integer} NameOptions 
 * @param {Pointer<Pointer<FLT_FILE_NAME_INFORMATION>>} RetFileNameInformation 
 * @returns {NTSTATUS} 
 */
export FltGetDestinationFileNameInformation(Instance, FileObject, RootDirectory, FileName, FileNameLength, NameOptions, RetFileNameInformation) {
    RetFileNameInformationMarshal := RetFileNameInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetDestinationFileNameInformation", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, HANDLE, RootDirectory, "ptr", FileName, "uint", FileNameLength, "uint", NameOptions, RetFileNameInformationMarshal, RetFileNameInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<BOOLEAN>} IsDirectory 
 * @returns {NTSTATUS} 
 */
export FltIsDirectory(FileObject, Instance, IsDirectory) {
    IsDirectoryMarshal := IsDirectory is VarRef ? "char*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsDirectory", FILE_OBJECT.Ptr, FileObject, PFLT_INSTANCE, Instance, IsDirectoryMarshal, IsDirectory, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FilterName 
 * @returns {NTSTATUS} 
 */
export FltLoadFilter(FilterName) {
    result := DllCall("FLTMGR.SYS\FltLoadFilter", UNICODE_STRING.Ptr, FilterName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FilterName 
 * @returns {NTSTATUS} 
 */
export FltUnloadFilter(FilterName) {
    result := DllCall("FLTMGR.SYS\FltUnloadFilter", UNICODE_STRING.Ptr, FilterName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltAttachVolume(Filter, Volume, InstanceName, RetInstance) {
    RetInstanceMarshal := RetInstance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAttachVolume", PFLT_FILTER, Filter, PFLT_VOLUME, Volume, UNICODE_STRING.Ptr, InstanceName, RetInstanceMarshal, RetInstance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltAttachVolumeAtAltitude(Filter, Volume, Altitude, InstanceName, RetInstance) {
    RetInstanceMarshal := RetInstance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAttachVolumeAtAltitude", PFLT_FILTER, Filter, PFLT_VOLUME, Volume, UNICODE_STRING.Ptr, Altitude, UNICODE_STRING.Ptr, InstanceName, RetInstanceMarshal, RetInstance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @returns {NTSTATUS} 
 */
export FltDetachVolume(Filter, Volume, InstanceName) {
    result := DllCall("FLTMGR.SYS\FltDetachVolume", PFLT_FILTER, Filter, PFLT_VOLUME, Volume, UNICODE_STRING.Ptr, InstanceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Pointer<FLT_CALLBACK_DATA>>} RetNewCallbackData 
 * @returns {NTSTATUS} 
 */
export FltAllocateCallbackData(Instance, FileObject, RetNewCallbackData) {
    RetNewCallbackDataMarshal := RetNewCallbackData is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAllocateCallbackData", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, RetNewCallbackDataMarshal, RetNewCallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltAllocateCallbackDataEx(Instance, FileObject, Flags, RetNewCallbackData) {
    RetNewCallbackDataMarshal := RetNewCallbackData is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAllocateCallbackDataEx", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "uint", Flags, RetNewCallbackDataMarshal, RetNewCallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeCallbackData(CallbackData) {
    DllCall("FLTMGR.SYS\FltFreeCallbackData", FLT_CALLBACK_DATA.Ptr, CallbackData)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReuseCallbackData(CallbackData) {
    DllCall("FLTMGR.SYS\FltReuseCallbackData", FLT_CALLBACK_DATA.Ptr, CallbackData)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {String} Nothing - always returns an empty string
 */
export FltPerformSynchronousIo(CallbackData) {
    DllCall("FLTMGR.SYS\FltPerformSynchronousIo", FLT_CALLBACK_DATA.Ptr, CallbackData)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} CallbackContext 
 * @returns {NTSTATUS} 
 */
export FltPerformAsynchronousIo(CallbackData, CallbackRoutine, CallbackContext) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltPerformAsynchronousIo", FLT_CALLBACK_DATA.Ptr, CallbackData, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} OriginatingFileObject 
 * @param {Pointer<FLT_CALLBACK_DATA>} ChildCallbackData 
 * @returns {NTSTATUS} 
 */
export FltpTraceRedirectedFileIo(OriginatingFileObject, ChildCallbackData) {
    result := DllCall("FLTMGR.SYS\FltpTraceRedirectedFileIo", FILE_OBJECT.Ptr, OriginatingFileObject, FLT_CALLBACK_DATA.Ptr, ChildCallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltCreateNamedPipeFile(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, CreateDisposition, CreateOptions, NamedPipeType, ReadMode, CompletionMode, MaximumInstances, InboundQuota, OutboundQuota, DefaultTimeout, DriverContext) {
    FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
    DefaultTimeoutMarshal := DefaultTimeout is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateNamedPipeFile", PFLT_FILTER, Filter, PFLT_INSTANCE, Instance, HANDLE.Ptr, FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "uint", NamedPipeType, "uint", ReadMode, "uint", CompletionMode, "uint", MaximumInstances, "uint", InboundQuota, "uint", OutboundQuota, DefaultTimeoutMarshal, DefaultTimeout, IO_DRIVER_CREATE_CONTEXT.Ptr, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltCreateMailslotFile(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, CreateOptions, MailslotQuota, MaximumMessageSize, ReadTimeout, DriverContext) {
    FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
    ReadTimeoutMarshal := ReadTimeout is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateMailslotFile", PFLT_FILTER, Filter, PFLT_INSTANCE, Instance, HANDLE.Ptr, FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", CreateOptions, "uint", MailslotQuota, "uint", MaximumMessageSize, ReadTimeoutMarshal, ReadTimeout, IO_DRIVER_CREATE_CONTEXT.Ptr, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
 * @param {Integer} EaBuffer 
 * @param {Integer} EaLength 
 * @param {Integer} Flags 
 * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
 * @returns {NTSTATUS} 
 */
export FltCreateFileEx2(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength, Flags, DriverContext) {
    FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateFileEx2", PFLT_FILTER, Filter, PFLT_INSTANCE, Instance, HANDLE.Ptr, FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "uint", Flags, IO_DRIVER_CREATE_CONTEXT.Ptr, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
 * @param {Integer} EaBuffer 
 * @param {Integer} EaLength 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FltCreateFileEx(Filter, Instance, FileHandle, FileObject, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength, Flags) {
    FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateFileEx", PFLT_FILTER, Filter, PFLT_INSTANCE, Instance, HANDLE.Ptr, FileHandle, FileObjectMarshal, FileObject, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
 * @param {Integer} EaBuffer 
 * @param {Integer} EaLength 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FltCreateFile(Filter, Instance, FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength, Flags) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateFile", PFLT_FILTER, Filter, PFLT_INSTANCE, Instance, HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<HANDLE>} VolumeHandle 
 * @param {Pointer<Pointer<FILE_OBJECT>>} VolumeFileObject 
 * @returns {NTSTATUS} 
 */
export FltOpenVolume(Instance, VolumeHandle, VolumeFileObject) {
    VolumeFileObjectMarshal := VolumeFileObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOpenVolume", PFLT_INSTANCE, Instance, HANDLE.Ptr, VolumeHandle, VolumeFileObjectMarshal, VolumeFileObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Integer} Length 
 * @param {Integer} _Buffer 
 * @param {Integer} Flags 
 * @param {Pointer<Integer>} BytesRead 
 * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} CallbackContext 
 * @returns {NTSTATUS} 
 */
export FltReadFile(InitiatingInstance, FileObject, ByteOffset, Length, _Buffer, Flags, BytesRead, CallbackRoutine, CallbackContext) {
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    BytesReadMarshal := BytesRead is VarRef ? "uint*" : "ptr"
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltReadFile", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", _Buffer, "uint", Flags, BytesReadMarshal, BytesRead, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Integer} Length 
 * @param {Integer} _Buffer 
 * @param {Integer} Flags 
 * @param {Pointer<Integer>} BytesRead 
 * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} CallbackContext 
 * @param {Pointer<Integer>} Key 
 * @param {Pointer<MDL>} _Mdl 
 * @returns {NTSTATUS} 
 */
export FltReadFileEx(InitiatingInstance, FileObject, ByteOffset, Length, _Buffer, Flags, BytesRead, CallbackRoutine, CallbackContext, Key, _Mdl) {
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    BytesReadMarshal := BytesRead is VarRef ? "uint*" : "ptr"
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltReadFileEx", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", _Buffer, "uint", Flags, BytesReadMarshal, BytesRead, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, KeyMarshal, Key, MDL.Ptr, _Mdl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileTag 
 * @param {Pointer<Guid>} Guid 
 * @param {Integer} DataBuffer 
 * @param {Integer} DataBufferLength 
 * @returns {NTSTATUS} 
 */
export FltTagFile(InitiatingInstance, FileObject, FileTag, Guid, DataBuffer, DataBufferLength) {
    result := DllCall("FLTMGR.SYS\FltTagFile", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, "uint", FileTag, Guid.Ptr, Guid, "ptr", DataBuffer, "ushort", DataBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileTag 
 * @param {Pointer<Guid>} Guid 
 * @param {Integer} DataBuffer 
 * @param {Integer} DataBufferLength 
 * @param {Integer} ExistingFileTag 
 * @param {Pointer<Guid>} ExistingGuid 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FltTagFileEx(InitiatingInstance, FileObject, FileTag, Guid, DataBuffer, DataBufferLength, ExistingFileTag, ExistingGuid, Flags) {
    result := DllCall("FLTMGR.SYS\FltTagFileEx", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, "uint", FileTag, Guid.Ptr, Guid, "ptr", DataBuffer, "ushort", DataBufferLength, "uint", ExistingFileTag, Guid.Ptr, ExistingGuid, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltUntagFile(InitiatingInstance, FileObject, FileTag, Guid) {
    result := DllCall("FLTMGR.SYS\FltUntagFile", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, "uint", FileTag, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Integer} Length 
 * @param {Integer} _Buffer 
 * @param {Integer} Flags 
 * @param {Pointer<Integer>} BytesWritten 
 * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} CallbackContext 
 * @returns {NTSTATUS} 
 */
export FltWriteFile(InitiatingInstance, FileObject, ByteOffset, Length, _Buffer, Flags, BytesWritten, CallbackRoutine, CallbackContext) {
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    BytesWrittenMarshal := BytesWritten is VarRef ? "uint*" : "ptr"
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltWriteFile", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", _Buffer, "uint", Flags, BytesWrittenMarshal, BytesWritten, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Integer} Length 
 * @param {Integer} _Buffer 
 * @param {Integer} Flags 
 * @param {Pointer<Integer>} BytesWritten 
 * @param {Pointer<PFLT_COMPLETED_ASYNC_IO_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} CallbackContext 
 * @param {Pointer<Integer>} Key 
 * @param {Pointer<MDL>} _Mdl 
 * @returns {NTSTATUS} 
 */
export FltWriteFileEx(InitiatingInstance, FileObject, ByteOffset, Length, _Buffer, Flags, BytesWritten, CallbackRoutine, CallbackContext, Key, _Mdl) {
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    BytesWrittenMarshal := BytesWritten is VarRef ? "uint*" : "ptr"
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltWriteFileEx", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, ByteOffsetMarshal, ByteOffset, "uint", Length, "ptr", _Buffer, "uint", Flags, BytesWrittenMarshal, BytesWritten, "ptr", CallbackRoutine, CallbackContextMarshal, CallbackContext, KeyMarshal, Key, MDL.Ptr, _Mdl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltFastIoMdlRead(InitiatingInstance, FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltFastIoMdlRead", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, BOOLEAN)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<MDL>} MdlChain 
 * @returns {BOOLEAN} 
 */
export FltFastIoMdlReadComplete(InitiatingInstance, FileObject, MdlChain) {
    result := DllCall("FLTMGR.SYS\FltFastIoMdlReadComplete", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, MDL.Ptr, MdlChain, BOOLEAN)
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
export FltFastIoPrepareMdlWrite(InitiatingInstance, FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
    MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltFastIoPrepareMdlWrite", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, BOOLEAN)
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
export FltFastIoMdlWriteComplete(InitiatingInstance, FileObject, FileOffset, MdlChain) {
    FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltFastIoMdlWriteComplete", PFLT_INSTANCE, InitiatingInstance, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, MDL.Ptr, MdlChain, BOOLEAN)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
 * @returns {NTSTATUS} 
 */
export FltQueryInformationByName(Filter, Instance, ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass, DriverContext) {
    result := DllCall("FLTMGR.SYS\FltQueryInformationByName", PFLT_FILTER, Filter, PFLT_INSTANCE, Instance, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, IO_DRIVER_CREATE_CONTEXT.Ptr, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltQueryInformationFile(Instance, FileObject, FileInformation, Length, FileInformationClass, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueryInformationFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export FltSetInformationFile(Instance, FileObject, FileInformation, Length, FileInformationClass) {
    result := DllCall("FLTMGR.SYS\FltSetInformationFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {BOOLEAN} RestartScan 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltQueryDirectoryFile(Instance, FileObject, FileInformation, Length, FileInformationClass, ReturnSingleEntry, FileName, RestartScan, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueryDirectoryFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, BOOLEAN, ReturnSingleEntry, UNICODE_STRING.Ptr, FileName, BOOLEAN, RestartScan, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} QueryFlags 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltQueryDirectoryFileEx(Instance, FileObject, FileInformation, Length, FileInformationClass, QueryFlags, FileName, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueryDirectoryFileEx", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, "uint", QueryFlags, UNICODE_STRING.Ptr, FileName, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} SidList 
 * @param {Integer} SidListLength 
 * @param {Pointer<Integer>} StartSid 
 * @param {BOOLEAN} RestartScan 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltQueryQuotaInformationFile(Instance, FileObject, IoStatusBlock, _Buffer, Length, ReturnSingleEntry, SidList, SidListLength, StartSid, RestartScan, LengthReturned) {
    StartSidMarshal := StartSid is VarRef ? "uint*" : "ptr"
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueryQuotaInformationFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", SidList, "uint", SidListLength, StartSidMarshal, StartSid, BOOLEAN, RestartScan, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export FltSetQuotaInformationFile(Instance, FileObject, _Buffer, Length) {
    result := DllCall("FLTMGR.SYS\FltSetQuotaInformationFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", _Buffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} ReturnedEaData 
 * @param {Integer} Length 
 * @param {BOOLEAN} ReturnSingleEntry 
 * @param {Integer} EaList 
 * @param {Integer} EaListLength 
 * @param {Pointer<Integer>} EaIndex 
 * @param {BOOLEAN} RestartScan 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltQueryEaFile(Instance, FileObject, ReturnedEaData, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan, LengthReturned) {
    EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueryEaFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", ReturnedEaData, "uint", Length, BOOLEAN, ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, BOOLEAN, RestartScan, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} EaBuffer 
 * @param {Integer} Length 
 * @returns {NTSTATUS} 
 */
export FltSetEaFile(Instance, FileObject, EaBuffer, Length) {
    result := DllCall("FLTMGR.SYS\FltSetEaFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", EaBuffer, "uint", Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltQueryVolumeInformationFile(Instance, FileObject, FsInformation, Length, FsInformationClass, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueryVolumeInformationFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} SecurityInformation 
 * @param {Integer} _SecurityDescriptor 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} LengthNeeded 
 * @returns {NTSTATUS} 
 */
export FltQuerySecurityObject(Instance, FileObject, SecurityInformation, _SecurityDescriptor, Length, LengthNeeded) {
    LengthNeededMarshal := LengthNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQuerySecurityObject", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "uint", SecurityInformation, "ptr", _SecurityDescriptor, "uint", Length, LengthNeededMarshal, LengthNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} SecurityInformation 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {NTSTATUS} 
 */
export FltSetSecurityObject(Instance, FileObject, SecurityInformation, _SecurityDescriptor) {
    result := DllCall("FLTMGR.SYS\FltSetSecurityObject", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "uint", SecurityInformation, PSECURITY_DESCRIPTOR, _SecurityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {NTSTATUS} 
 */
export FltFlushBuffers(Instance, FileObject) {
    result := DllCall("FLTMGR.SYS\FltFlushBuffers", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltFlushBuffers2(Instance, FileObject, FlushType, CallbackData) {
    result := DllCall("FLTMGR.SYS\FltFlushBuffers2", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "uint", FlushType, FLT_CALLBACK_DATA.Ptr, CallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} FsControlCode 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltFsControlFile(Instance, FileObject, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltFsControlFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} IoControlCode 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltDeviceIoControlFile(Instance, FileObject, IoControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeviceIoControlFile", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, "uint", IoControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} InitiatingInstance 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReissueSynchronousIo(InitiatingInstance, CallbackData) {
    DllCall("FLTMGR.SYS\FltReissueSynchronousIo", PFLT_INSTANCE, InitiatingInstance, FLT_CALLBACK_DATA.Ptr, CallbackData)
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @returns {NTSTATUS} 
 */
export FltClose(FileHandle) {
    result := DllCall("FLTMGR.SYS\FltClose", HANDLE, FileHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCancelFileOpen(Instance, FileObject) {
    DllCall("FLTMGR.SYS\FltCancelFileOpen", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject)
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @returns {NTSTATUS} 
 */
export FltCreateSystemVolumeInformationFolder(Instance) {
    result := DllCall("FLTMGR.SYS\FltCreateSystemVolumeInformationFolder", PFLT_INSTANCE, Instance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PFLT_INSTANCE} Instance 
 * @returns {BOOLEAN} 
 */
export FltSupportsFileContextsEx(FileObject, Instance) {
    result := DllCall("FLTMGR.SYS\FltSupportsFileContextsEx", FILE_OBJECT.Ptr, FileObject, PFLT_INSTANCE, Instance, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {BOOLEAN} 
 */
export FltSupportsFileContexts(FileObject) {
    result := DllCall("FLTMGR.SYS\FltSupportsFileContexts", FILE_OBJECT.Ptr, FileObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {BOOLEAN} 
 */
export FltSupportsStreamContexts(FileObject) {
    result := DllCall("FLTMGR.SYS\FltSupportsStreamContexts", FILE_OBJECT.Ptr, FileObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {BOOLEAN} 
 */
export FltSupportsStreamHandleContexts(FileObject) {
    result := DllCall("FLTMGR.SYS\FltSupportsStreamHandleContexts", FILE_OBJECT.Ptr, FileObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Integer} ContextType 
 * @param {Pointer} ContextSize 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer<PFLT_CONTEXT>} ReturnedContext 
 * @returns {NTSTATUS} 
 */
export FltAllocateContext(Filter, ContextType, ContextSize, PoolType, ReturnedContext) {
    ReturnedContextMarshal := ReturnedContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAllocateContext", PFLT_FILTER, Filter, "ushort", ContextType, "ptr", ContextSize, POOL_TYPE, PoolType, ReturnedContextMarshal, ReturnedContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
 * @param {Integer} DesiredContexts 
 * @param {Pointer<FLT_RELATED_CONTEXTS>} Contexts 
 * @returns {String} Nothing - always returns an empty string
 */
export FltGetContexts(FltObjects, DesiredContexts, Contexts) {
    DllCall("FLTMGR.SYS\FltGetContexts", FLT_RELATED_OBJECTS.Ptr, FltObjects, "ushort", DesiredContexts, FLT_RELATED_CONTEXTS.Ptr, Contexts)
}

/**
 * 
 * @param {Pointer<FLT_RELATED_CONTEXTS>} Contexts 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleaseContexts(Contexts) {
    DllCall("FLTMGR.SYS\FltReleaseContexts", FLT_RELATED_CONTEXTS.Ptr, Contexts)
}

/**
 * 
 * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
 * @param {Integer} DesiredContexts 
 * @param {Pointer} ContextsSize 
 * @param {Pointer<FLT_RELATED_CONTEXTS_EX>} Contexts 
 * @returns {NTSTATUS} 
 */
export FltGetContextsEx(FltObjects, DesiredContexts, ContextsSize, Contexts) {
    result := DllCall("FLTMGR.SYS\FltGetContextsEx", FLT_RELATED_OBJECTS.Ptr, FltObjects, "ushort", DesiredContexts, "ptr", ContextsSize, FLT_RELATED_CONTEXTS_EX.Ptr, Contexts, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer} ContextsSize 
 * @param {Pointer<FLT_RELATED_CONTEXTS_EX>} Contexts 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleaseContextsEx(ContextsSize, Contexts) {
    DllCall("FLTMGR.SYS\FltReleaseContextsEx", "ptr", ContextsSize, FLT_RELATED_CONTEXTS_EX.Ptr, Contexts)
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {FLT_SET_CONTEXT_OPERATION} Operation 
 * @param {PFLT_CONTEXT} NewContext 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltSetVolumeContext(Volume, Operation, NewContext, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetVolumeContext", PFLT_VOLUME, Volume, FLT_SET_CONTEXT_OPERATION, Operation, PFLT_CONTEXT, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {FLT_SET_CONTEXT_OPERATION} Operation 
 * @param {PFLT_CONTEXT} NewContext 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltSetInstanceContext(Instance, Operation, NewContext, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetInstanceContext", PFLT_INSTANCE, Instance, FLT_SET_CONTEXT_OPERATION, Operation, PFLT_CONTEXT, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {FLT_SET_CONTEXT_OPERATION} Operation 
 * @param {PFLT_CONTEXT} NewContext 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltSetFileContext(Instance, FileObject, Operation, NewContext, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetFileContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, FLT_SET_CONTEXT_OPERATION, Operation, PFLT_CONTEXT, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {FLT_SET_CONTEXT_OPERATION} Operation 
 * @param {PFLT_CONTEXT} NewContext 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltSetStreamContext(Instance, FileObject, Operation, NewContext, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetStreamContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, FLT_SET_CONTEXT_OPERATION, Operation, PFLT_CONTEXT, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {FLT_SET_CONTEXT_OPERATION} Operation 
 * @param {PFLT_CONTEXT} NewContext 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltSetStreamHandleContext(Instance, FileObject, Operation, NewContext, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetStreamHandleContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, FLT_SET_CONTEXT_OPERATION, Operation, PFLT_CONTEXT, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {FLT_SET_CONTEXT_OPERATION} Operation 
 * @param {PFLT_CONTEXT} NewContext 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltSetTransactionContext(Instance, Transaction, Operation, NewContext, OldContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetTransactionContext", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, FLT_SET_CONTEXT_OPERATION, Operation, PFLT_CONTEXT, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_CONTEXT} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export FltDeleteContext(_Context) {
    DllCall("FLTMGR.SYS\FltDeleteContext", PFLT_CONTEXT, _Context)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltDeleteVolumeContext(Filter, Volume, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeleteVolumeContext", PFLT_FILTER, Filter, PFLT_VOLUME, Volume, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltDeleteInstanceContext(Instance, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeleteInstanceContext", PFLT_INSTANCE, Instance, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltDeleteFileContext(Instance, FileObject, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeleteFileContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltDeleteStreamContext(Instance, FileObject, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeleteStreamContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltDeleteStreamHandleContext(Instance, FileObject, OldContext) {
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeleteStreamHandleContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {Pointer<PFLT_CONTEXT>} OldContext 
 * @returns {NTSTATUS} 
 */
export FltDeleteTransactionContext(Instance, Transaction, OldContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDeleteTransactionContext", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeContext(Filter, Volume, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeContext", PFLT_FILTER, Filter, PFLT_VOLUME, Volume, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetInstanceContext(Instance, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetInstanceContext", PFLT_INSTANCE, Instance, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetFileContext(Instance, FileObject, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFileContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetStreamContext(Instance, FileObject, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetStreamContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetStreamHandleContext(Instance, FileObject, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetStreamHandleContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetTransactionContext(Instance, Transaction, _Context) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetTransactionContext", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export FltGetSectionContext(Instance, FileObject, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetSectionContext", PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_CONTEXT} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReferenceContext(_Context) {
    DllCall("FLTMGR.SYS\FltReferenceContext", PFLT_CONTEXT, _Context)
}

/**
 * 
 * @param {PFLT_CONTEXT} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleaseContext(_Context) {
    DllCall("FLTMGR.SYS\FltReleaseContext", PFLT_CONTEXT, _Context)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} FilterName 
 * @param {Pointer<PFLT_FILTER>} RetFilter 
 * @returns {NTSTATUS} 
 */
export FltGetFilterFromName(FilterName, RetFilter) {
    RetFilterMarshal := RetFilter is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFilterFromName", UNICODE_STRING.Ptr, FilterName, RetFilterMarshal, RetFilter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<UNICODE_STRING>} VolumeName 
 * @param {Pointer<PFLT_VOLUME>} RetVolume 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeFromName(Filter, VolumeName, RetVolume) {
    RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeFromName", PFLT_FILTER, Filter, UNICODE_STRING.Ptr, VolumeName, RetVolumeMarshal, RetVolume, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltGetVolumeInstanceFromName(Filter, Volume, InstanceName, RetInstance) {
    RetInstanceMarshal := RetInstance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeInstanceFromName", PFLT_FILTER, Filter, PFLT_VOLUME, Volume, UNICODE_STRING.Ptr, InstanceName, RetInstanceMarshal, RetInstance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<PFLT_VOLUME>} RetVolume 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeFromInstance(Instance, RetVolume) {
    RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeFromInstance", PFLT_INSTANCE, Instance, RetVolumeMarshal, RetVolume, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<PFLT_FILTER>} RetFilter 
 * @returns {NTSTATUS} 
 */
export FltGetFilterFromInstance(Instance, RetFilter) {
    RetFilterMarshal := RetFilter is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFilterFromInstance", PFLT_INSTANCE, Instance, RetFilterMarshal, RetFilter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<PFLT_VOLUME>} RetVolume 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeFromFileObject(Filter, FileObject, RetVolume) {
    RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeFromFileObject", PFLT_FILTER, Filter, FILE_OBJECT.Ptr, FileObject, RetVolumeMarshal, RetVolume, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<PFLT_VOLUME>} RetVolume 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeFromDeviceObject(Filter, DeviceObject, RetVolume) {
    RetVolumeMarshal := RetVolume is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeFromDeviceObject", PFLT_FILTER, Filter, DEVICE_OBJECT.Ptr, DeviceObject, RetVolumeMarshal, RetVolume, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {BOOLEAN} 
 */
export FltIsFltMgrVolumeDeviceObject(DeviceObject) {
    result := DllCall("FLTMGR.SYS\FltIsFltMgrVolumeDeviceObject", DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export FltGetDeviceObject(Volume, DeviceObject) {
    DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetDeviceObject", PFLT_VOLUME, Volume, DeviceObjectMarshal, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} DiskDeviceObject 
 * @returns {NTSTATUS} 
 */
export FltGetDiskDeviceObject(Volume, DiskDeviceObject) {
    DiskDeviceObjectMarshal := DiskDeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetDiskDeviceObject", PFLT_VOLUME, Volume, DiskDeviceObjectMarshal, DiskDeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} CurrentInstance 
 * @param {Pointer<PFLT_INSTANCE>} LowerInstance 
 * @returns {NTSTATUS} 
 */
export FltGetLowerInstance(CurrentInstance, LowerInstance) {
    LowerInstanceMarshal := LowerInstance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetLowerInstance", PFLT_INSTANCE, CurrentInstance, LowerInstanceMarshal, LowerInstance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} CurrentInstance 
 * @param {Pointer<PFLT_INSTANCE>} UpperInstance 
 * @returns {NTSTATUS} 
 */
export FltGetUpperInstance(CurrentInstance, UpperInstance) {
    UpperInstanceMarshal := UpperInstance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetUpperInstance", PFLT_INSTANCE, CurrentInstance, UpperInstanceMarshal, UpperInstance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<PFLT_INSTANCE>} Instance 
 * @returns {NTSTATUS} 
 */
export FltGetTopInstance(Volume, Instance) {
    InstanceMarshal := Instance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetTopInstance", PFLT_VOLUME, Volume, InstanceMarshal, Instance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<PFLT_INSTANCE>} Instance 
 * @returns {NTSTATUS} 
 */
export FltGetBottomInstance(Volume, Instance) {
    InstanceMarshal := Instance is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetBottomInstance", PFLT_VOLUME, Volume, InstanceMarshal, Instance, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance1 
 * @param {PFLT_INSTANCE} Instance2 
 * @returns {Integer} 
 */
export FltCompareInstanceAltitudes(Instance1, Instance2) {
    result := DllCall("FLTMGR.SYS\FltCompareInstanceAltitudes", PFLT_INSTANCE, Instance1, PFLT_INSTANCE, Instance2, Int32)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {FILTER_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltGetFilterInformation(Filter, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFilterInformation", PFLT_FILTER, Filter, FILTER_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {INSTANCE_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltGetInstanceInformation(Instance, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetInstanceInformation", PFLT_INSTANCE, Instance, INSTANCE_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {FILTER_VOLUME_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeInformation(Volume, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeInformation", PFLT_VOLUME, Volume, FILTER_VOLUME_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Integer} VolumeProperties 
 * @param {Integer} VolumePropertiesLength 
 * @param {Pointer<Integer>} LengthReturned 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeProperties(Volume, VolumeProperties, VolumePropertiesLength, LengthReturned) {
    LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeProperties", PFLT_VOLUME, Volume, "ptr", VolumeProperties, "uint", VolumePropertiesLength, LengthReturnedMarshal, LengthReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} FltObject 
 * @param {Pointer<BOOLEAN>} IsWritable 
 * @returns {NTSTATUS} 
 */
export FltIsVolumeWritable(FltObject, IsWritable) {
    FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
    IsWritableMarshal := IsWritable is VarRef ? "char*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsVolumeWritable", FltObjectMarshal, FltObject, IsWritableMarshal, IsWritable, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} FltObject 
 * @param {Pointer<FLT_FILESYSTEM_TYPE>} FileSystemType 
 * @returns {NTSTATUS} 
 */
export FltGetFileSystemType(FltObject, FileSystemType) {
    FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
    FileSystemTypeMarshal := FileSystemType is VarRef ? "int*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFileSystemType", FltObjectMarshal, FltObject, FileSystemTypeMarshal, FileSystemType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} FltObject 
 * @param {Pointer<BOOLEAN>} IsSnapshotVolume 
 * @returns {NTSTATUS} 
 */
export FltIsVolumeSnapshot(FltObject, IsSnapshotVolume) {
    FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
    IsSnapshotVolumeMarshal := IsSnapshotVolume is VarRef ? "char*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsVolumeSnapshot", FltObjectMarshal, FltObject, IsSnapshotVolumeMarshal, IsSnapshotVolume, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Pointer<UNICODE_STRING>} VolumeGuidName 
 * @param {Pointer<Integer>} BufferSizeNeeded 
 * @returns {NTSTATUS} 
 */
export FltGetVolumeGuidName(Volume, VolumeGuidName, BufferSizeNeeded) {
    BufferSizeNeededMarshal := BufferSizeNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetVolumeGuidName", PFLT_VOLUME, Volume, UNICODE_STRING.Ptr, VolumeGuidName, BufferSizeNeededMarshal, BufferSizeNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<IO_STATUS_BLOCK>} Iosb 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @returns {NTSTATUS} 
 */
export FltQueryVolumeInformation(Instance, Iosb, FsInformation, Length, FsInformationClass) {
    result := DllCall("FLTMGR.SYS\FltQueryVolumeInformation", PFLT_INSTANCE, Instance, IO_STATUS_BLOCK.Ptr, Iosb, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<IO_STATUS_BLOCK>} Iosb 
 * @param {Integer} FsInformation 
 * @param {Integer} Length 
 * @param {FS_INFORMATION_CLASS} FsInformationClass 
 * @returns {NTSTATUS} 
 */
export FltSetVolumeInformation(Instance, Iosb, FsInformation, Length, FsInformationClass) {
    result := DllCall("FLTMGR.SYS\FltSetVolumeInformation", PFLT_INSTANCE, Instance, IO_STATUS_BLOCK.Ptr, Iosb, "ptr", FsInformation, "uint", Length, FS_INFORMATION_CLASS, FsInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PFLT_FILTER>} FilterList 
 * @param {Integer} FilterListSize 
 * @param {Pointer<Integer>} NumberFiltersReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateFilters(FilterList, FilterListSize, NumberFiltersReturned) {
    FilterListMarshal := FilterList is VarRef ? "ptr*" : "ptr"
    NumberFiltersReturnedMarshal := NumberFiltersReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateFilters", FilterListMarshal, FilterList, "uint", FilterListSize, NumberFiltersReturnedMarshal, NumberFiltersReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltEnumerateVolumes(Filter, VolumeList, VolumeListSize, NumberVolumesReturned) {
    VolumeListMarshal := VolumeList is VarRef ? "ptr*" : "ptr"
    NumberVolumesReturnedMarshal := NumberVolumesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateVolumes", PFLT_FILTER, Filter, VolumeListMarshal, VolumeList, "uint", VolumeListSize, NumberVolumesReturnedMarshal, NumberVolumesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltEnumerateInstances(Volume, Filter, InstanceList, InstanceListSize, NumberInstancesReturned) {
    InstanceListMarshal := InstanceList is VarRef ? "ptr*" : "ptr"
    NumberInstancesReturnedMarshal := NumberInstancesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateInstances", PFLT_VOLUME, Volume, PFLT_FILTER, Filter, InstanceListMarshal, InstanceList, "uint", InstanceListSize, NumberInstancesReturnedMarshal, NumberInstancesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Index 
 * @param {FILTER_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateFilterInformation(Index, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateFilterInformation", "uint", Index, FILTER_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Integer} Index 
 * @param {INSTANCE_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateInstanceInformationByFilter(Filter, Index, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByFilter", PFLT_FILTER, Filter, "uint", Index, INSTANCE_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_VOLUME} Volume 
 * @param {Integer} Index 
 * @param {INSTANCE_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateInstanceInformationByVolume(Volume, Index, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByVolume", PFLT_VOLUME, Volume, "uint", Index, INSTANCE_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VolumeName 
 * @param {Integer} Index 
 * @param {INSTANCE_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateInstanceInformationByVolumeName(VolumeName, Index, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByVolumeName", UNICODE_STRING.Ptr, VolumeName, "uint", Index, INSTANCE_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} Index 
 * @param {INSTANCE_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateInstanceInformationByDeviceObject(DeviceObject, Index, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateInstanceInformationByDeviceObject", DEVICE_OBJECT.Ptr, DeviceObject, "uint", Index, INSTANCE_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Integer} Index 
 * @param {FILTER_VOLUME_INFORMATION_CLASS} InformationClass 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export FltEnumerateVolumeInformation(Filter, Index, InformationClass, _Buffer, BufferSize, BytesReturned) {
    BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnumerateVolumeInformation", PFLT_FILTER, Filter, "uint", Index, FILTER_VOLUME_INFORMATION_CLASS, InformationClass, "ptr", _Buffer, "uint", BufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} FltObject 
 * @returns {NTSTATUS} 
 */
export FltObjectReference(FltObject) {
    FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltObjectReference", FltObjectMarshal, FltObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} FltObject 
 * @returns {String} Nothing - always returns an empty string
 */
export FltObjectDereference(FltObject) {
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
export FltCreateCommunicationPort(Filter, ServerPort, ObjectAttributes, ServerPortCookie, ConnectNotifyCallback, DisconnectNotifyCallback, MessageNotifyCallback, MaxConnections) {
    ServerPortMarshal := ServerPort is VarRef ? "ptr*" : "ptr"
    ServerPortCookieMarshal := ServerPortCookie is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCreateCommunicationPort", PFLT_FILTER, Filter, ServerPortMarshal, ServerPort, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, ServerPortCookieMarshal, ServerPortCookie, "ptr", ConnectNotifyCallback, "ptr", DisconnectNotifyCallback, "ptr", MessageNotifyCallback, "int", MaxConnections, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_PORT} ServerPort 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCloseCommunicationPort(ServerPort) {
    DllCall("FLTMGR.SYS\FltCloseCommunicationPort", PFLT_PORT, ServerPort)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<PFLT_PORT>} ClientPort 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCloseClientPort(Filter, ClientPort) {
    ClientPortMarshal := ClientPort is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltCloseClientPort", PFLT_FILTER, Filter, ClientPortMarshal, ClientPort)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<PFLT_PORT>} ClientPort 
 * @param {Integer} SenderBuffer 
 * @param {Integer} SenderBufferLength 
 * @param {Integer} ReplyBuffer 
 * @param {Pointer<Integer>} ReplyLength 
 * @param {Pointer<Integer>} Timeout 
 * @returns {NTSTATUS} 
 */
export FltSendMessage(Filter, ClientPort, SenderBuffer, SenderBufferLength, ReplyBuffer, ReplyLength, Timeout) {
    ClientPortMarshal := ClientPort is VarRef ? "ptr*" : "ptr"
    ReplyLengthMarshal := ReplyLength is VarRef ? "uint*" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSendMessage", PFLT_FILTER, Filter, ClientPortMarshal, ClientPort, "ptr", SenderBuffer, "uint", SenderBufferLength, "ptr", ReplyBuffer, ReplyLengthMarshal, ReplyLength, TimeoutMarshal, Timeout, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _SecurityDescriptor 
 * @param {Integer} DesiredAccess 
 * @returns {NTSTATUS} 
 */
export FltBuildDefaultSecurityDescriptor(_SecurityDescriptor, DesiredAccess) {
    result := DllCall("FLTMGR.SYS\FltBuildDefaultSecurityDescriptor", PSECURITY_DESCRIPTOR.Ptr, _SecurityDescriptor, "uint", DesiredAccess, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeSecurityDescriptor(_SecurityDescriptor) {
    DllCall("FLTMGR.SYS\FltFreeSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltCancelIo(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltCancelIo", FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<PFLT_COMPLETE_CANCELED_CALLBACK>} CanceledCallback 
 * @returns {NTSTATUS} 
 */
export FltSetCancelCompletion(CallbackData, CanceledCallback) {
    result := DllCall("FLTMGR.SYS\FltSetCancelCompletion", FLT_CALLBACK_DATA.Ptr, CallbackData, "ptr", CanceledCallback, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {NTSTATUS} 
 */
export FltClearCancelCompletion(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltClearCancelCompletion", FLT_CALLBACK_DATA.Ptr, CallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltIsIoCanceled(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltIsIoCanceled", FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @returns {PFLT_DEFERRED_IO_WORKITEM} 
 */
export FltAllocateDeferredIoWorkItem() {
    result := DllCall("FLTMGR.SYS\FltAllocateDeferredIoWorkItem", PFLT_DEFERRED_IO_WORKITEM)
    return result
}

/**
 * 
 * @param {PFLT_DEFERRED_IO_WORKITEM} FltWorkItem 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeDeferredIoWorkItem(FltWorkItem) {
    DllCall("FLTMGR.SYS\FltFreeDeferredIoWorkItem", PFLT_DEFERRED_IO_WORKITEM, FltWorkItem)
}

/**
 * 
 * @returns {PFLT_GENERIC_WORKITEM} 
 */
export FltAllocateGenericWorkItem() {
    result := DllCall("FLTMGR.SYS\FltAllocateGenericWorkItem", PFLT_GENERIC_WORKITEM)
    return result
}

/**
 * 
 * @param {PFLT_GENERIC_WORKITEM} FltWorkItem 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeGenericWorkItem(FltWorkItem) {
    DllCall("FLTMGR.SYS\FltFreeGenericWorkItem", PFLT_GENERIC_WORKITEM, FltWorkItem)
}

/**
 * 
 * @param {PFLT_DEFERRED_IO_WORKITEM} FltWorkItem 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<PFLT_DEFERRED_IO_WORKITEM_ROUTINE>} WorkerRoutine 
 * @param {WORK_QUEUE_TYPE} QueueType 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export FltQueueDeferredIoWorkItem(FltWorkItem, Data, WorkerRoutine, QueueType, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueueDeferredIoWorkItem", PFLT_DEFERRED_IO_WORKITEM, FltWorkItem, FLT_CALLBACK_DATA.Ptr, Data, "ptr", WorkerRoutine, WORK_QUEUE_TYPE, QueueType, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_GENERIC_WORKITEM} FltWorkItem 
 * @param {Pointer<Void>} FltObject 
 * @param {Pointer<PFLT_GENERIC_WORKITEM_ROUTINE>} WorkerRoutine 
 * @param {WORK_QUEUE_TYPE} QueueType 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export FltQueueGenericWorkItem(FltWorkItem, FltObject, WorkerRoutine, QueueType, _Context) {
    FltObjectMarshal := FltObject is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltQueueGenericWorkItem", PFLT_GENERIC_WORKITEM, FltWorkItem, FltObjectMarshal, FltObject, "ptr", WorkerRoutine, WORK_QUEUE_TYPE, QueueType, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {NTSTATUS} 
 */
export FltLockUserBuffer(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltLockUserBuffer", FLT_CALLBACK_DATA.Ptr, CallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Pointer<Pointer<MDL>>>} MdlAddressPointer 
 * @param {Pointer<Pointer<Pointer<Void>>>} _Buffer 
 * @param {Pointer<Pointer<Integer>>} Length 
 * @param {Pointer<LOCK_OPERATION>} DesiredAccess 
 * @returns {NTSTATUS} 
 */
export FltDecodeParameters(CallbackData, MdlAddressPointer, _Buffer, Length, DesiredAccess) {
    MdlAddressPointerMarshal := MdlAddressPointer is VarRef ? "ptr*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
    LengthMarshal := Length is VarRef ? "ptr*" : "ptr"
    DesiredAccessMarshal := DesiredAccess is VarRef ? "int*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltDecodeParameters", FLT_CALLBACK_DATA.Ptr, CallbackData, MdlAddressPointerMarshal, MdlAddressPointer, _BufferMarshal, _Buffer, LengthMarshal, Length, DesiredAccessMarshal, DesiredAccess, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {Pointer<MDL>} 
 */
export FltGetSwappedBufferMdlAddress(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltGetSwappedBufferMdlAddress", FLT_CALLBACK_DATA.Ptr, CallbackData, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {String} Nothing - always returns an empty string
 */
export FltRetainSwappedBufferMdlAddress(CallbackData) {
    DllCall("FLTMGR.SYS\FltRetainSwappedBufferMdlAddress", FLT_CALLBACK_DATA.Ptr, CallbackData)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {Pointer<Void>} 
 */
export FltGetNewSystemBufferAddress(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltGetNewSystemBufferAddress", FLT_CALLBACK_DATA.Ptr, CallbackData, IntPtr)
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
export FltCbdqInitialize(Instance, Cbdq, CbdqInsertIo, CbdqRemoveIo, CbdqPeekNextIo, CbdqAcquire, CbdqRelease, CbdqCompleteCanceledIo) {
    result := DllCall("FLTMGR.SYS\FltCbdqInitialize", PFLT_INSTANCE, Instance, FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, "ptr", CbdqInsertIo, "ptr", CbdqRemoveIo, "ptr", CbdqPeekNextIo, "ptr", CbdqAcquire, "ptr", CbdqRelease, "ptr", CbdqCompleteCanceledIo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCbdqEnable(Cbdq) {
    DllCall("FLTMGR.SYS\FltCbdqEnable", FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
 * @returns {String} Nothing - always returns an empty string
 */
export FltCbdqDisable(Cbdq) {
    DllCall("FLTMGR.SYS\FltCbdqDisable", FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
 * @param {Pointer<FLT_CALLBACK_DATA>} Cbd 
 * @param {Pointer<IO_CSQ_IRP_CONTEXT>} _Context 
 * @param {Pointer<Void>} InsertContext 
 * @returns {NTSTATUS} 
 */
export FltCbdqInsertIo(Cbdq, Cbd, _Context, InsertContext) {
    InsertContextMarshal := InsertContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCbdqInsertIo", FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, FLT_CALLBACK_DATA.Ptr, Cbd, IO_CSQ_IRP_CONTEXT.Ptr, _Context, InsertContextMarshal, InsertContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
 * @param {Pointer<IO_CSQ_IRP_CONTEXT>} _Context 
 * @returns {Pointer<FLT_CALLBACK_DATA>} 
 */
export FltCbdqRemoveIo(Cbdq, _Context) {
    result := DllCall("FLTMGR.SYS\FltCbdqRemoveIo", FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, IO_CSQ_IRP_CONTEXT.Ptr, _Context, FLT_CALLBACK_DATA.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
 * @param {Pointer<Void>} PeekContext 
 * @returns {Pointer<FLT_CALLBACK_DATA>} 
 */
export FltCbdqRemoveNextIo(Cbdq, PeekContext) {
    PeekContextMarshal := PeekContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCbdqRemoveNextIo", FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, PeekContextMarshal, PeekContext, FLT_CALLBACK_DATA.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltInitializeOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltInitializeOplock", OplockMarshal, Oplock)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltUninitializeOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltUninitializeOplock", OplockMarshal, Oplock)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Integer} OpenCount 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltOplockFsctrl(Oplock, CallbackData, OpenCount) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOplockFsctrl", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, "uint", OpenCount, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
 * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltCheckOplock(Oplock, CallbackData, _Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCheckOplock", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, _ContextMarshal, _Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FltOplockIsFastIoPossible(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOplockIsFastIoPossible", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FltCurrentBatchOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCurrentBatchOplock", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
 * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltCheckOplockEx(Oplock, CallbackData, Flags, _Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCheckOplockEx", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, "uint", Flags, _ContextMarshal, _Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FltCurrentOplock(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCurrentOplock", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @returns {BOOLEAN} 
 */
export FltCurrentOplockH(Oplock) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCurrentOplockH", OplockMarshal, Oplock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
 * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltOplockBreakH(Oplock, CallbackData, Flags, _Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOplockBreakH", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, "uint", Flags, _ContextMarshal, _Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
 * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltOplockBreakToNone(Oplock, CallbackData, _Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOplockBreakToNone", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, _ContextMarshal, _Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<PFLTOPLOCK_WAIT_COMPLETE_ROUTINE>} WaitCompletionRoutine 
 * @param {Pointer<PFLTOPLOCK_PREPOST_CALLBACKDATA_ROUTINE>} PrePostCallbackDataRoutine 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltOplockBreakToNoneEx(Oplock, CallbackData, Flags, _Context, WaitCompletionRoutine, PrePostCallbackDataRoutine) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOplockBreakToNoneEx", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, "uint", Flags, _ContextMarshal, _Context, "ptr", WaitCompletionRoutine, "ptr", PrePostCallbackDataRoutine, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltOplockIsSharedRequest(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltOplockIsSharedRequest", FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Oplock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Integer} OpenCount 
 * @param {Integer} Flags 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltOplockFsctrlEx(Oplock, CallbackData, OpenCount, Flags) {
    OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltOplockFsctrlEx", OplockMarshal, Oplock, FLT_CALLBACK_DATA.Ptr, CallbackData, "uint", OpenCount, "uint", Flags, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} Fo1 
 * @param {Pointer<FILE_OBJECT>} Fo2 
 * @returns {BOOLEAN} 
 */
export FltOplockKeysEqual(Fo1, Fo2) {
    result := DllCall("FLTMGR.SYS\FltOplockKeysEqual", FILE_OBJECT.Ptr, Fo1, FILE_OBJECT.Ptr, Fo2, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltInitializeFileLock(FileLock) {
    DllCall("FLTMGR.SYS\FltInitializeFileLock", FILE_LOCK.Ptr, FileLock)
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltUninitializeFileLock(FileLock) {
    DllCall("FLTMGR.SYS\FltUninitializeFileLock", FILE_LOCK.Ptr, FileLock)
}

/**
 * 
 * @param {Pointer<PFLT_COMPLETE_LOCK_CALLBACK_DATA_ROUTINE>} CompleteLockCallbackDataRoutine 
 * @param {Pointer<PUNLOCK_ROUTINE>} UnlockRoutine 
 * @returns {Pointer<FILE_LOCK>} 
 */
export FltAllocateFileLock(CompleteLockCallbackDataRoutine, UnlockRoutine) {
    result := DllCall("FLTMGR.SYS\FltAllocateFileLock", "ptr", CompleteLockCallbackDataRoutine, "ptr", UnlockRoutine, FILE_LOCK.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeFileLock(FileLock) {
    DllCall("FLTMGR.SYS\FltFreeFileLock", FILE_LOCK.Ptr, FileLock)
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Void>} _Context 
 * @returns {FLT_PREOP_CALLBACK_STATUS} 
 */
export FltProcessFileLock(FileLock, CallbackData, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltProcessFileLock", FILE_LOCK.Ptr, FileLock, FLT_CALLBACK_DATA.Ptr, CallbackData, _ContextMarshal, _Context, FLT_PREOP_CALLBACK_STATUS)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltCheckLockForReadAccess(FileLock, CallbackData) {
    result := DllCall("FLTMGR.SYS\FltCheckLockForReadAccess", FILE_LOCK.Ptr, FileLock, FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_LOCK>} FileLock 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltCheckLockForWriteAccess(FileLock, CallbackData) {
    result := DllCall("FLTMGR.SYS\FltCheckLockForWriteAccess", FILE_LOCK.Ptr, FileLock, FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcquireResourceExclusive(Resource) {
    DllCall("FLTMGR.SYS\FltAcquireResourceExclusive", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcquireResourceShared(Resource) {
    DllCall("FLTMGR.SYS\FltAcquireResourceShared", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleaseResource(Resource) {
    DllCall("FLTMGR.SYS\FltReleaseResource", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltInitializePushLock(PushLock) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltInitializePushLock", PushLockMarshal, PushLock)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltDeletePushLock(PushLock) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltDeletePushLock", PushLockMarshal, PushLock)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcquirePushLockExclusive(PushLock) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltAcquirePushLockExclusive", PushLockMarshal, PushLock)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcquirePushLockShared(PushLock) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltAcquirePushLockShared", PushLockMarshal, PushLock)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleasePushLock(PushLock) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltReleasePushLock", PushLockMarshal, PushLock)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcquirePushLockExclusiveEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltAcquirePushLockExclusiveEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcquirePushLockSharedEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltAcquirePushLockSharedEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export FltReleasePushLockEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltReleasePushLockEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {NTSTATUS} 
 */
export FltCancellableWaitForSingleObject(_Object, Timeout, CallbackData) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCancellableWaitForSingleObject", _ObjectMarshal, _Object, TimeoutMarshal, Timeout, FLT_CALLBACK_DATA.Ptr, CallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Count 
 * @param {Pointer<Pointer<Void>>} ObjectArray 
 * @param {WAIT_TYPE} WaitType 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<KWAIT_BLOCK>} WaitBlockArray 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {NTSTATUS} 
 */
export FltCancellableWaitForMultipleObjects(Count, ObjectArray, WaitType, Timeout, WaitBlockArray, CallbackData) {
    ObjectArrayMarshal := ObjectArray is VarRef ? "ptr*" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCancellableWaitForMultipleObjects", "uint", Count, ObjectArrayMarshal, ObjectArray, WAIT_TYPE, WaitType, TimeoutMarshal, Timeout, KWAIT_BLOCK.Ptr, WaitBlockArray, FLT_CALLBACK_DATA.Ptr, CallbackData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltIsOperationSynchronous(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltIsOperationSynchronous", FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {BOOLEAN} 
 */
export FltIs32bitProcess(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltIs32bitProcess", FLT_CALLBACK_DATA.Ptr, CallbackData, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {PEPROCESS} 
 */
export FltGetRequestorProcess(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltGetRequestorProcess", FLT_CALLBACK_DATA.Ptr, CallbackData, PEPROCESS)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {Integer} 
 */
export FltGetRequestorProcessId(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltGetRequestorProcessId", FLT_CALLBACK_DATA.Ptr, CallbackData, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @returns {HANDLE} 
 */
export FltGetRequestorProcessIdEx(CallbackData) {
    result := DllCall("FLTMGR.SYS\FltGetRequestorProcessIdEx", FLT_CALLBACK_DATA.Ptr, CallbackData, HANDLE.Owned)
    return result
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
export FltNotifyFilterChangeDirectory(NotifySync, NotifyList, FsContext, FullDirectoryName, WatchTree, IgnoreBuffer, CompletionFilter, NotifyCallbackData, TraverseCallback, SubjectContext, FilterCallback) {
    FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltNotifyFilterChangeDirectory", PNOTIFY_SYNC, NotifySync, LIST_ENTRY.Ptr, NotifyList, FsContextMarshal, FsContext, STRING.Ptr, FullDirectoryName, BOOLEAN, WatchTree, BOOLEAN, IgnoreBuffer, "uint", CompletionFilter, FLT_CALLBACK_DATA.Ptr, NotifyCallbackData, "ptr", TraverseCallback, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext, "ptr", FilterCallback)
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Integer>} SessionId 
 * @returns {NTSTATUS} 
 */
export FltGetRequestorSessionId(CallbackData, SessionId) {
    SessionIdMarshal := SessionId is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetRequestorSessionId", FLT_CALLBACK_DATA.Ptr, CallbackData, SessionIdMarshal, SessionId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} SourceInstance 
 * @param {PFLT_INSTANCE} TargetInstance 
 * @param {Pointer<BOOLEAN>} SourceDeviceStackSizeModified 
 * @returns {NTSTATUS} 
 */
export FltAdjustDeviceStackSizeForIoRedirection(SourceInstance, TargetInstance, SourceDeviceStackSizeModified) {
    SourceDeviceStackSizeModifiedMarshal := SourceDeviceStackSizeModified is VarRef ? "char*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAdjustDeviceStackSizeForIoRedirection", PFLT_INSTANCE, SourceInstance, PFLT_INSTANCE, TargetInstance, SourceDeviceStackSizeModifiedMarshal, SourceDeviceStackSizeModified, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} SourceInstance 
 * @param {PFLT_INSTANCE} TargetInstance 
 * @param {Pointer<BOOLEAN>} RedirectionAllowed 
 * @returns {NTSTATUS} 
 */
export FltIsIoRedirectionAllowed(SourceInstance, TargetInstance, RedirectionAllowed) {
    RedirectionAllowedMarshal := RedirectionAllowed is VarRef ? "char*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsIoRedirectionAllowed", PFLT_INSTANCE, SourceInstance, PFLT_INSTANCE, TargetInstance, RedirectionAllowedMarshal, RedirectionAllowed, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltIsIoRedirectionAllowedForOperation(Data, TargetInstance, RedirectionAllowedThisIo, RedirectionAllowedAllIo) {
    RedirectionAllowedThisIoMarshal := RedirectionAllowedThisIo is VarRef ? "char*" : "ptr"
    RedirectionAllowedAllIoMarshal := RedirectionAllowedAllIo is VarRef ? "char*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsIoRedirectionAllowedForOperation", FLT_CALLBACK_DATA.Ptr, Data, PFLT_INSTANCE, TargetInstance, RedirectionAllowedThisIoMarshal, RedirectionAllowedThisIo, RedirectionAllowedAllIoMarshal, RedirectionAllowedAllIo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltVetoBypassIo(CallbackData, FltObjects, OperationStatus, FailureReason) {
    result := DllCall("FLTMGR.SYS\FltVetoBypassIo", FLT_CALLBACK_DATA.Ptr, CallbackData, FLT_RELATED_OBJECTS.Ptr, FltObjects, NTSTATUS, OperationStatus, UNICODE_STRING.Ptr, FailureReason, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @param {Integer} NotificationMask 
 * @returns {NTSTATUS} 
 */
export FltEnlistInTransaction(Instance, Transaction, _TransactionContext, NotificationMask) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltEnlistInTransaction", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, "uint", NotificationMask, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @returns {NTSTATUS} 
 */
export FltRollbackEnlistment(Instance, Transaction, _TransactionContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRollbackEnlistment", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @returns {NTSTATUS} 
 */
export FltPrePrepareComplete(Instance, Transaction, _TransactionContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltPrePrepareComplete", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @returns {NTSTATUS} 
 */
export FltPrepareComplete(Instance, Transaction, _TransactionContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltPrepareComplete", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @returns {NTSTATUS} 
 */
export FltCommitComplete(Instance, Transaction, _TransactionContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCommitComplete", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @returns {NTSTATUS} 
 */
export FltCommitFinalizeComplete(Instance, Transaction, _TransactionContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCommitFinalizeComplete", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_INSTANCE} Instance 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {PFLT_CONTEXT} _TransactionContext 
 * @returns {NTSTATUS} 
 */
export FltRollbackComplete(Instance, Transaction, _TransactionContext) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRollbackComplete", PFLT_INSTANCE, Instance, TransactionMarshal, Transaction, PFLT_CONTEXT, _TransactionContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
 * @returns {NTSTATUS} 
 */
export FltAllocateExtraCreateParameterList(Filter, Flags, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAllocateExtraCreateParameterList", PFLT_FILTER, Filter, "uint", Flags, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltAllocateExtraCreateParameter(Filter, EcpType, SizeOfContext, Flags, CleanupCallback, PoolTag, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAllocateExtraCreateParameter", PFLT_FILTER, Filter, Guid.Ptr, EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, "uint", PoolTag, EcpContextMarshal, EcpContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} Lookaside 
 * @param {Integer} Flags 
 * @param {Pointer} _Size 
 * @param {Integer} Tag 
 * @returns {String} Nothing - always returns an empty string
 */
export FltInitExtraCreateParameterLookasideList(Filter, Lookaside, Flags, _Size, Tag) {
    LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltInitExtraCreateParameterLookasideList", PFLT_FILTER, Filter, LookasideMarshal, Lookaside, "uint", Flags, "ptr", _Size, "uint", Tag)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} Lookaside 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export FltDeleteExtraCreateParameterLookasideList(Filter, Lookaside, Flags) {
    LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltDeleteExtraCreateParameterLookasideList", PFLT_FILTER, Filter, LookasideMarshal, Lookaside, "uint", Flags)
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
export FltAllocateExtraCreateParameterFromLookasideList(Filter, EcpType, SizeOfContext, Flags, CleanupCallback, LookasideList, EcpContext) {
    LookasideListMarshal := LookasideList is VarRef ? "ptr" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltAllocateExtraCreateParameterFromLookasideList", PFLT_FILTER, Filter, Guid.Ptr, EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, LookasideListMarshal, LookasideList, EcpContextMarshal, EcpContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @param {Pointer<Void>} EcpContext 
 * @returns {NTSTATUS} 
 */
export FltInsertExtraCreateParameter(Filter, EcpList, EcpContext) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltInsertExtraCreateParameter", PFLT_FILTER, Filter, EcpListMarshal, EcpList, EcpContextMarshal, EcpContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltFindExtraCreateParameter(Filter, EcpList, EcpType, EcpContext, EcpContextSize) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
    EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltFindExtraCreateParameter", PFLT_FILTER, Filter, EcpListMarshal, EcpList, Guid.Ptr, EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltRemoveExtraCreateParameter(Filter, EcpList, EcpType, EcpContext, EcpContextSize) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
    EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRemoveExtraCreateParameter", PFLT_FILTER, Filter, EcpListMarshal, EcpList, Guid.Ptr, EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeExtraCreateParameterList(Filter, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltFreeExtraCreateParameterList", PFLT_FILTER, Filter, EcpListMarshal, EcpList)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} EcpContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeExtraCreateParameter(Filter, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltFreeExtraCreateParameter", PFLT_FILTER, Filter, EcpContextMarshal, EcpContext)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
 * @returns {NTSTATUS} 
 */
export FltGetEcpListFromCallbackData(Filter, CallbackData, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetEcpListFromCallbackData", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, CallbackData, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {NTSTATUS} 
 */
export FltSetEcpListIntoCallbackData(Filter, CallbackData, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltSetEcpListIntoCallbackData", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, CallbackData, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltGetNextExtraCreateParameter(Filter, EcpList, CurrentEcpContext, NextEcpType, NextEcpContext, NextEcpContextSize) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
    CurrentEcpContextMarshal := CurrentEcpContext is VarRef ? "ptr" : "ptr"
    NextEcpContextMarshal := NextEcpContext is VarRef ? "ptr*" : "ptr"
    NextEcpContextSizeMarshal := NextEcpContextSize is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetNextExtraCreateParameter", PFLT_FILTER, Filter, EcpListMarshal, EcpList, CurrentEcpContextMarshal, CurrentEcpContext, Guid.Ptr, NextEcpType, NextEcpContextMarshal, NextEcpContext, NextEcpContextSizeMarshal, NextEcpContextSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} EcpContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FltAcknowledgeEcp(Filter, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltAcknowledgeEcp", PFLT_FILTER, Filter, EcpContextMarshal, EcpContext)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} EcpContext 
 * @returns {BOOLEAN} 
 */
export FltIsEcpAcknowledged(Filter, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsEcpAcknowledged", PFLT_FILTER, Filter, EcpContextMarshal, EcpContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} EcpContext 
 * @returns {BOOLEAN} 
 */
export FltIsEcpFromUserMode(Filter, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("FLTMGR.SYS\FltIsEcpFromUserMode", PFLT_FILTER, Filter, EcpContextMarshal, EcpContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<Void>} EcpContext 
 * @returns {String} Nothing - always returns an empty string
 */
export FltPrepareToReuseEcp(Filter, EcpContext) {
    EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

    DllCall("FLTMGR.SYS\FltPrepareToReuseEcp", PFLT_FILTER, Filter, EcpContextMarshal, EcpContext)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<OPEN_REPARSE_LIST_ENTRY>} OpenReparseEntry 
 * @returns {NTSTATUS} 
 */
export FltAddOpenReparseEntry(Filter, Data, OpenReparseEntry) {
    result := DllCall("FLTMGR.SYS\FltAddOpenReparseEntry", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, Data, OPEN_REPARSE_LIST_ENTRY.Ptr, OpenReparseEntry, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<OPEN_REPARSE_LIST_ENTRY>} OpenReparseEntry 
 * @returns {String} Nothing - always returns an empty string
 */
export FltRemoveOpenReparseEntry(Filter, Data, OpenReparseEntry) {
    DllCall("FLTMGR.SYS\FltRemoveOpenReparseEntry", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, Data, OPEN_REPARSE_LIST_ENTRY.Ptr, OpenReparseEntry)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {NTSTATUS} 
 */
export FltCopyOpenReparseList(Filter, Data, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltCopyOpenReparseList", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, Data, EcpListMarshal, EcpList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<ECP_LIST>} EcpList 
 * @returns {String} Nothing - always returns an empty string
 */
export FltFreeOpenReparseList(Filter, EcpList) {
    EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

    DllCall("FLTMGR.SYS\FltFreeOpenReparseList", PFLT_FILTER, Filter, EcpListMarshal, EcpList)
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Integer} InfoClassFlags 
 * @returns {NTSTATUS} 
 */
export FltRequestFileInfoOnCreateCompletion(Filter, Data, InfoClassFlags) {
    result := DllCall("FLTMGR.SYS\FltRequestFileInfoOnCreateCompletion", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, Data, "uint", InfoClassFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PFLT_FILTER} Filter 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Integer} InfoClass 
 * @param {Pointer<Integer>} _Size 
 * @returns {Pointer<Void>} 
 */
export FltRetrieveFileInfoOnCreateCompletion(Filter, Data, InfoClass, _Size) {
    _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRetrieveFileInfoOnCreateCompletion", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, Data, "uint", InfoClass, _SizeMarshal, _Size, IntPtr)
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
export FltRetrieveFileInfoOnCreateCompletionEx(Filter, Data, InfoClass, RetInfoSize, RetInfoBuffer) {
    RetInfoSizeMarshal := RetInfoSize is VarRef ? "uint*" : "ptr"
    RetInfoBufferMarshal := RetInfoBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltRetrieveFileInfoOnCreateCompletionEx", PFLT_FILTER, Filter, FLT_CALLBACK_DATA.Ptr, Data, "uint", InfoClass, RetInfoSizeMarshal, RetInfoSize, RetInfoBufferMarshal, RetInfoBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
export FltRetrieveIoPriorityInfo(Data, FileObject, Thread, PriorityInfo) {
    result := DllCall("FLTMGR.SYS\FltRetrieveIoPriorityInfo", FLT_CALLBACK_DATA.Ptr, Data, FILE_OBJECT.Ptr, FileObject, PETHREAD, Thread, IO_PRIORITY_INFO.Ptr, PriorityInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_PRIORITY_INFO>} InputPriorityInfo 
 * @param {Pointer<IO_PRIORITY_INFO>} OutputPriorityInfo 
 * @param {PETHREAD} Thread 
 * @returns {NTSTATUS} 
 */
export FltApplyPriorityInfoThread(InputPriorityInfo, OutputPriorityInfo, Thread) {
    result := DllCall("FLTMGR.SYS\FltApplyPriorityInfoThread", IO_PRIORITY_INFO.Ptr, InputPriorityInfo, IO_PRIORITY_INFO.Ptr, OutputPriorityInfo, PETHREAD, Thread, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {IO_PRIORITY_HINT} 
 */
export FltGetIoPriorityHint(Data) {
    result := DllCall("FLTMGR.SYS\FltGetIoPriorityHint", FLT_CALLBACK_DATA.Ptr, Data, IO_PRIORITY_HINT)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {IO_PRIORITY_HINT} 
 */
export FltGetIoPriorityHintFromCallbackData(Data) {
    result := DllCall("FLTMGR.SYS\FltGetIoPriorityHintFromCallbackData", FLT_CALLBACK_DATA.Ptr, Data, IO_PRIORITY_HINT)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {IO_PRIORITY_HINT} PriorityHint 
 * @returns {NTSTATUS} 
 */
export FltSetIoPriorityHintIntoCallbackData(Data, PriorityHint) {
    result := DllCall("FLTMGR.SYS\FltSetIoPriorityHintIntoCallbackData", FLT_CALLBACK_DATA.Ptr, Data, IO_PRIORITY_HINT, PriorityHint, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {IO_PRIORITY_HINT} 
 */
export FltGetIoPriorityHintFromFileObject(FileObject) {
    result := DllCall("FLTMGR.SYS\FltGetIoPriorityHintFromFileObject", FILE_OBJECT.Ptr, FileObject, IO_PRIORITY_HINT)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {IO_PRIORITY_HINT} PriorityHint 
 * @returns {NTSTATUS} 
 */
export FltSetIoPriorityHintIntoFileObject(FileObject, PriorityHint) {
    result := DllCall("FLTMGR.SYS\FltSetIoPriorityHintIntoFileObject", FILE_OBJECT.Ptr, FileObject, IO_PRIORITY_HINT, PriorityHint, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {IO_PRIORITY_HINT} 
 */
export FltGetIoPriorityHintFromThread(Thread) {
    result := DllCall("FLTMGR.SYS\FltGetIoPriorityHintFromThread", PETHREAD, Thread, IO_PRIORITY_HINT)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {IO_PRIORITY_HINT} PriorityHint 
 * @returns {NTSTATUS} 
 */
export FltSetIoPriorityHintIntoThread(Thread, PriorityHint) {
    result := DllCall("FLTMGR.SYS\FltSetIoPriorityHintIntoThread", PETHREAD, Thread, IO_PRIORITY_HINT, PriorityHint, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export FltGetActivityIdCallbackData(CallbackData, Guid) {
    result := DllCall("FLTMGR.SYS\FltGetActivityIdCallbackData", FLT_CALLBACK_DATA.Ptr, CallbackData, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export FltSetActivityIdCallbackData(CallbackData, Guid) {
    result := DllCall("FLTMGR.SYS\FltSetActivityIdCallbackData", FLT_CALLBACK_DATA.Ptr, CallbackData, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
 * @param {Pointer<Guid>} PropagateId 
 * @param {Pointer<Pointer<Guid>>} OriginalId 
 * @returns {NTSTATUS} 
 */
export FltPropagateActivityIdToThread(CallbackData, PropagateId, OriginalId) {
    OriginalIdMarshal := OriginalId is VarRef ? "ptr*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltPropagateActivityIdToThread", FLT_CALLBACK_DATA.Ptr, CallbackData, Guid.Ptr, PropagateId, OriginalIdMarshal, OriginalId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Pointer<Integer>} ZeroingOffset 
 * @returns {NTSTATUS} 
 */
export FltGetFsZeroingOffset(Data, ZeroingOffset) {
    ZeroingOffsetMarshal := ZeroingOffset is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTMGR.SYS\FltGetFsZeroingOffset", FLT_CALLBACK_DATA.Ptr, Data, ZeroingOffsetMarshal, ZeroingOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {NTSTATUS} 
 */
export FltSetFsZeroingOffsetRequired(Data) {
    result := DllCall("FLTMGR.SYS\FltSetFsZeroingOffsetRequired", FLT_CALLBACK_DATA.Ptr, Data, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @param {Integer} ZeroingOffset 
 * @returns {NTSTATUS} 
 */
export FltSetFsZeroingOffset(Data, ZeroingOffset) {
    result := DllCall("FLTMGR.SYS\FltSetFsZeroingOffset", FLT_CALLBACK_DATA.Ptr, Data, "uint", ZeroingOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} Data 
 * @returns {Pointer<Void>} 
 */
export FltGetIoAttributionHandleFromCallbackData(Data) {
    result := DllCall("FLTMGR.SYS\FltGetIoAttributionHandleFromCallbackData", FLT_CALLBACK_DATA.Ptr, Data, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<FLT_CALLBACK_DATA>} SourceData 
 * @param {Pointer<FLT_CALLBACK_DATA>} TargetData 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export FltPropagateIrpExtension(SourceData, TargetData, Flags) {
    result := DllCall("FLTMGR.SYS\FltPropagateIrpExtension", FLT_CALLBACK_DATA.Ptr, SourceData, FLT_CALLBACK_DATA.Ptr, TargetData, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} IrpMajorCode 
 * @returns {PSTR} 
 */
export FltGetIrpName(IrpMajorCode) {
    result := DllCall("FLTMGR.SYS\FltGetIrpName", "char", IrpMajorCode, PSTR)
    return result
}

;@endregion Functions
