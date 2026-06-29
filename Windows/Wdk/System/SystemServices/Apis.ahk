#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\MEMORY_CACHING_TYPE.ahk" { MEMORY_CACHING_TYPE }
#Import ".\IO_DRIVER_CREATE_CONTEXT.ahk" { IO_DRIVER_CREATE_CONTEXT }
#Import "..\..\Foundation\KTM.ahk" { KTM }
#Import ".\DMA_IOMMU_INTERFACE.ahk" { DMA_IOMMU_INTERFACE }
#Import "..\..\Foundation\KRESOURCEMANAGER.ahk" { KRESOURCEMANAGER }
#Import ".\DMA_IOMMU_INTERFACE_EX.ahk" { DMA_IOMMU_INTERFACE_EX }
#Import ".\KSEMAPHORE.ahk" { KSEMAPHORE }
#Import "..\..\Foundation\KEVENT.ahk" { KEVENT }
#Import ".\DEVICE_DIRECTORY_TYPE.ahk" { DEVICE_DIRECTORY_TYPE }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\..\Win32\System\SystemServices\KTMOBJECT_TYPE.ahk" { KTMOBJECT_TYPE }
#Import "..\..\Foundation\POBJECT_TYPE.ahk" { POBJECT_TYPE }
#Import ".\KDPC_IMPORTANCE.ahk" { KDPC_IMPORTANCE }
#Import "..\..\Foundation\PEX_RUNDOWN_REF_CACHE_AWARE.ahk" { PEX_RUNDOWN_REF_CACHE_AWARE }
#Import ".\WHEA_ERROR_RECORD_HEADER.ahk" { WHEA_ERROR_RECORD_HEADER }
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import ".\KLOCK_QUEUE_HANDLE.ahk" { KLOCK_QUEUE_HANDLE }
#Import ".\IO_CONTAINER_NOTIFICATION_CLASS.ahk" { IO_CONTAINER_NOTIFICATION_CLASS }
#Import ".\RTL_GENERIC_TABLE.ahk" { RTL_GENERIC_TABLE }
#Import ".\IO_CONNECT_INTERRUPT_PARAMETERS.ahk" { IO_CONNECT_INTERRUPT_PARAMETERS }
#Import "..\..\..\Win32\System\SystemInformation\OSVERSIONINFOW.ahk" { OSVERSIONINFOW }
#Import "..\..\Foundation\KMUTANT.ahk" { KMUTANT }
#Import "..\..\..\Win32\Storage\FileSystem\CLS_SCAN_CONTEXT.ahk" { CLS_SCAN_CONTEXT }
#Import ".\COUNTED_REASON_CONTEXT.ahk" { COUNTED_REASON_CONTEXT }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_STATE.ahk" { WHEA_ERROR_SOURCE_STATE }
#Import ".\KINTERRUPT_MODE.ahk" { KINTERRUPT_MODE }
#Import "..\..\Foundation\PEJOB.ahk" { PEJOB }
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }
#Import ".\RTL_BITMAP.ahk" { RTL_BITMAP }
#Import ".\RTL_DYNAMIC_HASH_TABLE_ENTRY.ahk" { RTL_DYNAMIC_HASH_TABLE_ENTRY }
#Import "..\..\Foundation\IO_PRIORITY_HINT.ahk" { IO_PRIORITY_HINT }
#Import "..\..\..\Win32\System\SystemServices\TRANSACTIONMANAGER_INFORMATION_CLASS.ahk" { TRANSACTIONMANAGER_INFORMATION_CLASS }
#Import "..\..\..\Win32\Storage\FileSystem\CLS_LSN.ahk" { CLS_LSN }
#Import ".\PSCREATETHREADNOTIFYTYPE.ahk" { PSCREATETHREADNOTIFYTYPE }
#Import ".\EX_POOL_PRIORITY.ahk" { EX_POOL_PRIORITY }
#Import ".\PO_FX_PERF_STATE_CHANGE.ahk" { PO_FX_PERF_STATE_CHANGE }
#Import ".\RTL_AVL_TABLE.ahk" { RTL_AVL_TABLE }
#Import ".\IO_CSQ.ahk" { IO_CSQ }
#Import ".\EX_RUNDOWN_REF.ahk" { EX_RUNDOWN_REF }
#Import "..\..\..\Win32\Storage\FileSystem\CLFS_IOSTATS_CLASS.ahk" { CLFS_IOSTATS_CLASS }
#Import ".\DEVICE_DESCRIPTION.ahk" { DEVICE_DESCRIPTION }
#Import ".\RTL_DYNAMIC_HASH_TABLE_CONTEXT.ahk" { RTL_DYNAMIC_HASH_TABLE_CONTEXT }
#Import "..\..\Foundation\PCALLBACK_OBJECT.ahk" { PCALLBACK_OBJECT }
#Import "..\..\Foundation\WORK_QUEUE_ITEM.ahk" { WORK_QUEUE_ITEM }
#Import ".\SHARE_ACCESS.ahk" { SHARE_ACCESS }
#Import "..\..\Foundation\PETHREAD.ahk" { PETHREAD }
#Import "..\..\..\Win32\System\Diagnostics\Etw\EVENT_DESCRIPTOR.ahk" { EVENT_DESCRIPTOR }
#Import ".\HARDWARE_COUNTER.ahk" { HARDWARE_COUNTER }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk" { WHEA_ERROR_SOURCE_DESCRIPTOR }
#Import ".\RTL_DYNAMIC_HASH_TABLE.ahk" { RTL_DYNAMIC_HASH_TABLE }
#Import ".\CLFS_MGMT_CLIENT_REGISTRATION.ahk" { CLFS_MGMT_CLIENT_REGISTRATION }
#Import "..\..\..\Win32\Security\ACL.ahk" { ACL }
#Import "..\..\Storage\FileSystem\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }
#Import "..\..\Foundation\PPCW_INSTANCE.ahk" { PPCW_INSTANCE }
#Import ".\IO_NOTIFICATION_EVENT_CATEGORY.ahk" { IO_NOTIFICATION_EVENT_CATEGORY }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\System\Kernel\TIMER_TYPE.ahk" { TIMER_TYPE }
#Import ".\TRACE_INFORMATION_CLASS.ahk" { TRACE_INFORMATION_CLASS }
#Import ".\IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS.ahk" { IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk" { WHEA_ERROR_SOURCE_TYPE }
#Import ".\TXN_PARAMETER_BLOCK.ahk" { TXN_PARAMETER_BLOCK }
#Import "..\..\..\Win32\Storage\IscsiDisc\_ADAPTER_OBJECT.ahk" { _ADAPTER_OBJECT }
#Import "..\..\..\Win32\Security\GENERIC_MAPPING.ahk" { GENERIC_MAPPING }
#Import ".\BUS_DATA_TYPE.ahk" { BUS_DATA_TYPE }
#Import "..\..\Foundation\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\KDEVICE_QUEUE.ahk" { KDEVICE_QUEUE }
#Import "..\..\Foundation\SECURITY_SUBJECT_CONTEXT.ahk" { SECURITY_SUBJECT_CONTEXT }
#Import "..\..\..\Win32\System\SystemInformation\OSVERSIONINFOEXW.ahk" { OSVERSIONINFOEXW }
#Import "..\..\..\Win32\System\Diagnostics\Debug\BUGCHECK_ERROR.ahk" { BUGCHECK_ERROR }
#Import "..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }
#Import ".\KTRIAGE_DUMP_DATA_ARRAY.ahk" { KTRIAGE_DUMP_DATA_ARRAY }
#Import ".\XSTATE_SAVE.ahk" { XSTATE_SAVE }
#Import ".\RTL_QUERY_REGISTRY_TABLE.ahk" { RTL_QUERY_REGISTRY_TABLE }
#Import "..\..\..\Win32\Storage\FileSystem\CLFS_CONTEXT_MODE.ahk" { CLFS_CONTEXT_MODE }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\System\Ioctl\DRIVE_LAYOUT_INFORMATION.ahk" { DRIVE_LAYOUT_INFORMATION }
#Import ".\TIME_FIELDS.ahk" { TIME_FIELDS }
#Import ".\CONFIGURATION_TYPE.ahk" { CONFIGURATION_TYPE }
#Import ".\WORK_QUEUE_TYPE.ahk" { WORK_QUEUE_TYPE }
#Import ".\IO_REMOVE_LOCK.ahk" { IO_REMOVE_LOCK }
#Import "..\..\..\Win32\System\Ioctl\CREATE_DISK.ahk" { CREATE_DISK }
#Import ".\POOL_CREATE_EXTENDED_PARAMS.ahk" { POOL_CREATE_EXTENDED_PARAMS }
#Import ".\DEVICE_RELATION_TYPE.ahk" { DEVICE_RELATION_TYPE }
#Import "..\..\Foundation\KENLISTMENT.ahk" { KENLISTMENT }
#Import ".\PSCREATEPROCESSNOTIFYTYPE.ahk" { PSCREATEPROCESSNOTIFYTYPE }
#Import ".\CONFIGURATION_INFORMATION.ahk" { CONFIGURATION_INFORMATION }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\DRIVER_REGKEY_TYPE.ahk" { DRIVER_REGKEY_TYPE }
#Import ".\KWAIT_REASON.ahk" { KWAIT_REASON }
#Import "..\..\..\Win32\Storage\FileSystem\TRANSACTION_NOTIFICATION.ahk" { TRANSACTION_NOTIFICATION }
#Import ".\LOCK_OPERATION.ahk" { LOCK_OPERATION }
#Import ".\DISK_SIGNATURE.ahk" { DISK_SIGNATURE }
#Import ".\CREATE_FILE_TYPE.ahk" { CREATE_FILE_TYPE }
#Import ".\TABLE_SEARCH_RESULT.ahk" { TABLE_SEARCH_RESULT }
#Import ".\MM_SYSTEMSIZE.ahk" { MM_SYSTEMSIZE }
#Import ".\HAL_DMA_CRASH_DUMP_REGISTER_TYPE.ahk" { HAL_DMA_CRASH_DUMP_REGISTER_TYPE }
#Import "..\..\..\Win32\Devices\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\..\..\Win32\Security\PSID.ahk" { PSID }
#Import "..\..\..\Win32\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\..\Win32\System\Kernel\NT_PRODUCT_TYPE.ahk" { NT_PRODUCT_TYPE }
#Import "..\..\..\Win32\System\Kernel\SUITE_TYPE.ahk" { SUITE_TYPE }
#Import "..\..\Foundation\PESILO.ahk" { PESILO }
#Import ".\MM_ROTATE_DIRECTION.ahk" { MM_ROTATE_DIRECTION }
#Import ".\KD_OPTION.ahk" { KD_OPTION }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\PO_THERMAL_REQUEST_TYPE.ahk" { PO_THERMAL_REQUEST_TYPE }
#Import ".\BOOTDISK_INFORMATION.ahk" { BOOTDISK_INFORMATION }
#Import ".\IO_FOEXT_SILO_PARAMETERS.ahk" { IO_FOEXT_SILO_PARAMETERS }
#Import "..\..\..\Win32\System\WindowsProgramming\CLIENT_ID.ahk" { CLIENT_ID }
#Import "..\..\Foundation\PKINTERRUPT.ahk" { PKINTERRUPT }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_DRIVER_BUFFER_SET.ahk" { WHEA_DRIVER_BUFFER_SET }
#Import "..\..\..\Win32\System\Diagnostics\Etw\EVENT_INFO_CLASS.ahk" { EVENT_INFO_CLASS }
#Import ".\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk" { CM_PARTIAL_RESOURCE_DESCRIPTOR }
#Import ".\IO_ATTRIBUTION_INFORMATION.ahk" { IO_ATTRIBUTION_INFORMATION }
#Import ".\KDPC_WATCHDOG_INFORMATION.ahk" { KDPC_WATCHDOG_INFORMATION }
#Import "..\..\Foundation\FAST_MUTEX.ahk" { FAST_MUTEX }
#Import ".\CM_RESOURCE_LIST.ahk" { CM_RESOURCE_LIST }
#Import "..\..\..\Win32\Security\PRIVILEGE_SET.ahk" { PRIVILEGE_SET }
#Import "..\..\..\Win32\System\SystemServices\RESOURCEMANAGER_INFORMATION_CLASS.ahk" { RESOURCEMANAGER_INFORMATION_CLASS }
#Import ".\PHYSICAL_COUNTER_RESOURCE_LIST.ahk" { PHYSICAL_COUNTER_RESOURCE_LIST }
#Import "..\..\..\Win32\System\Kernel\WAIT_TYPE.ahk" { WAIT_TYPE }
#Import ".\IO_RESOURCE_REQUIREMENTS_LIST.ahk" { IO_RESOURCE_REQUIREMENTS_LIST }
#Import ".\PO_FX_COMPONENT_PERF_INFO.ahk" { PO_FX_COMPONENT_PERF_INFO }
#Import ".\SILO_MONITOR_REGISTRATION.ahk" { SILO_MONITOR_REGISTRATION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Power\DEVICE_POWER_STATE.ahk" { DEVICE_POWER_STATE }
#Import "..\..\..\Win32\System\Power\POWER_REQUEST_TYPE.ahk" { POWER_REQUEST_TYPE }
#Import ".\ZONE_HEADER.ahk" { ZONE_HEADER }
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER.ahk" { WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER }
#Import "..\..\..\Win32\System\SystemServices\TRANSACTION_INFORMATION_CLASS.ahk" { TRANSACTION_INFORMATION_CLASS }
#Import "..\..\Foundation\PAFFINITY_TOKEN.ahk" { PAFFINITY_TOKEN }
#Import "..\..\..\Win32\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PEX_TIMER.ahk" { PEX_TIMER }
#Import "..\..\Foundation\POOL_TYPE.ahk" { POOL_TYPE }
#Import "..\..\..\Win32\System\Power\POWER_INFORMATION_LEVEL.ahk" { POWER_INFORMATION_LEVEL }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import ".\MM_COPY_ADDRESS.ahk" { MM_COPY_ADDRESS }
#Import "..\..\..\Win32\System\Kernel\STRING.ahk" { STRING }
#Import "..\..\Foundation\VPB.ahk" { VPB }
#Import "..\..\Foundation\KDPC.ahk" { KDPC }
#Import ".\DEVICE_REGISTRY_PROPERTY.ahk" { DEVICE_REGISTRY_PROPERTY }
#Import ".\RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.ahk" { RTL_DYNAMIC_HASH_TABLE_ENUMERATOR }
#Import "..\..\..\Win32\Security\Authentication\Identity\SE_ADT_PARAMETER_TYPE.ahk" { SE_ADT_PARAMETER_TYPE }
#Import ".\DRIVER_DIRECTORY_TYPE.ahk" { DRIVER_DIRECTORY_TYPE }
#Import ".\PCW_DATA.ahk" { PCW_DATA }
#Import "..\..\..\Win32\System\Kernel\EVENT_TYPE.ahk" { EVENT_TYPE }
#Import "..\..\..\Win32\System\SystemInformation\LOGICAL_PROCESSOR_RELATIONSHIP.ahk" { LOGICAL_PROCESSOR_RELATIONSHIP }
#Import "..\..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }
#Import ".\KBUGCHECK_REASON_CALLBACK_RECORD.ahk" { KBUGCHECK_REASON_CALLBACK_RECORD }
#Import ".\SE_IMAGE_VERIFICATION_CALLBACK_TYPE.ahk" { SE_IMAGE_VERIFICATION_CALLBACK_TYPE }
#Import ".\IO_CONTAINER_INFORMATION_CLASS.ahk" { IO_CONTAINER_INFORMATION_CLASS }
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import "..\..\..\Win32\System\Diagnostics\Etw\REGHANDLE.ahk" { REGHANDLE }
#Import ".\IO_PAGING_PRIORITY.ahk" { IO_PAGING_PRIORITY }
#Import "..\..\..\Win32\System\Ioctl\DRIVE_LAYOUT_INFORMATION_EX.ahk" { DRIVE_LAYOUT_INFORMATION_EX }
#Import "..\..\..\Win32\System\Threading\INIT_ONCE.ahk" { INIT_ONCE }
#Import "..\..\..\Win32\Storage\FileSystem\CLS_LOG_INFORMATION_CLASS.ahk" { CLS_LOG_INFORMATION_CLASS }
#Import ".\WAIT_CONTEXT_BLOCK.ahk" { WAIT_CONTEXT_BLOCK }
#Import ".\POOL_EXTENDED_PARAMETER.ahk" { POOL_EXTENDED_PARAMETER }
#Import ".\OB_CALLBACK_REGISTRATION.ahk" { OB_CALLBACK_REGISTRATION }
#Import ".\STATE_LOCATION_TYPE.ahk" { STATE_LOCATION_TYPE }
#Import "..\..\..\Win32\Security\Authentication\Identity\SE_ADT_PARAMETER_ARRAY.ahk" { SE_ADT_PARAMETER_ARRAY }
#Import ".\WHEA_ERROR_RECORD.ahk" { WHEA_ERROR_RECORD }
#Import ".\BOOTDISK_INFORMATION_LITE.ahk" { BOOTDISK_INFORMATION_LITE }
#Import "..\..\..\Win32\System\Ioctl\SET_PARTITION_INFORMATION_EX.ahk" { SET_PARTITION_INFORMATION_EX }
#Import "..\..\Foundation\PPCW_REGISTRATION.ahk" { PPCW_REGISTRATION }
#Import ".\MM_PHYSICAL_ADDRESS_LIST.ahk" { MM_PHYSICAL_ADDRESS_LIST }
#Import ".\CONTROLLER_OBJECT.ahk" { CONTROLLER_OBJECT }
#Import ".\IO_DISCONNECT_INTERRUPT_PARAMETERS.ahk" { IO_DISCONNECT_INTERRUPT_PARAMETERS }
#Import ".\PHYSICAL_MEMORY_RANGE.ahk" { PHYSICAL_MEMORY_RANGE }
#Import "..\..\..\Win32\System\SystemInformation\GROUP_AFFINITY.ahk" { GROUP_AFFINITY }
#Import "..\..\..\Win32\System\Diagnostics\Etw\EVENT_DATA_DESCRIPTOR.ahk" { EVENT_DATA_DESCRIPTOR }
#Import ".\WHEA_PSHED_PLUGIN_REGISTRATION_PACKET_V2.ahk" { WHEA_PSHED_PLUGIN_REGISTRATION_PACKET_V2 }
#Import "..\..\..\Win32\System\SystemInformation\RTL_SYSTEM_GLOBAL_DATA_ID.ahk" { RTL_SYSTEM_GLOBAL_DATA_ID }
#Import ".\LINK_SHARE_ACCESS.ahk" { LINK_SHARE_ACCESS }
#Import ".\KDEVICE_QUEUE_ENTRY.ahk" { KDEVICE_QUEUE_ENTRY }
#Import ".\_EXT_SET_PARAMETERS_V0.ahk" { _EXT_SET_PARAMETERS_V0 }
#Import "..\..\..\Win32\Storage\FileSystem\CLFS_MGMT_POLICY_TYPE.ahk" { CLFS_MGMT_POLICY_TYPE }
#Import ".\OBJECT_HANDLE_INFORMATION.ahk" { OBJECT_HANDLE_INFORMATION }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\ERESOURCE.ahk" { ERESOURCE }
#Import "..\..\Foundation\PIO_WORKITEM.ahk" { PIO_WORKITEM }
#Import ".\PO_FX_DEVICE_V1.ahk" { PO_FX_DEVICE_V1 }
#Import "..\..\..\Win32\System\Kernel\PROCESSOR_NUMBER.ahk" { PROCESSOR_NUMBER }
#Import "..\..\..\Win32\Storage\FileSystem\CLS_WRITE_ENTRY.ahk" { CLS_WRITE_ENTRY }
#Import "..\..\Foundation\KTRANSACTION.ahk" { KTRANSACTION }
#Import ".\EXT_DELETE_PARAMETERS.ahk" { EXT_DELETE_PARAMETERS }
#Import ".\IO_RESOURCE_DESCRIPTOR.ahk" { IO_RESOURCE_DESCRIPTOR }
#Import ".\KBUGCHECK_CALLBACK_REASON.ahk" { KBUGCHECK_CALLBACK_REASON }
#Import "..\..\Foundation\IRP.ahk" { IRP }
#Import ".\PCW_REGISTRATION_INFORMATION.ahk" { PCW_REGISTRATION_INFORMATION }
#Import ".\RTL_BITMAP_RUN.ahk" { RTL_BITMAP_RUN }
#Import "..\..\Foundation\KWAIT_BLOCK.ahk" { KWAIT_BLOCK }
#Import "..\..\Foundation\PKTHREAD.ahk" { PKTHREAD }
#Import ".\IO_CSQ_IRP_CONTEXT.ahk" { IO_CSQ_IRP_CONTEXT }
#Import "..\..\..\Win32\System\SystemInformation\FIRMWARE_TYPE.ahk" { FIRMWARE_TYPE }
#Import ".\MM_MDL_PAGE_CONTENTS_STATE.ahk" { MM_MDL_PAGE_CONTENTS_STATE }
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\Foundation\RTL_SPLAY_LINKS.ahk" { RTL_SPLAY_LINKS }
#Import "..\..\Foundation\PSILO_MONITOR.ahk" { PSILO_MONITOR }
#Import ".\POWER_STATE_TYPE.ahk" { POWER_STATE_TYPE }
#Import "..\..\..\Win32\Storage\FileSystem\FILE_SEGMENT_ELEMENT.ahk" { FILE_SEGMENT_ELEMENT }
#Import ".\POWER_STATE.ahk" { POWER_STATE }
#Import ".\KBUGCHECK_CALLBACK_RECORD.ahk" { KBUGCHECK_CALLBACK_RECORD }
#Import ".\WHEA_ERROR_PACKET_V2.ahk" { WHEA_ERROR_PACKET_V2 }
#Import ".\WHEA_ERROR_SOURCE_CONFIGURATION.ahk" { WHEA_ERROR_SOURCE_CONFIGURATION }
#Import "..\..\Foundation\PPCW_BUFFER.ahk" { PPCW_BUFFER }
#Import ".\KTIMER.ahk" { KTIMER }
#Import ".\WHEA_EVENT_LOG_ENTRY.ahk" { WHEA_EVENT_LOG_ENTRY }
#Import "..\..\Foundation\POHANDLE.ahk" { POHANDLE }
#Import ".\PARTITION_INFORMATION_CLASS.ahk" { PARTITION_INFORMATION_CLASS }
#Import ".\SE_IMAGE_TYPE.ahk" { SE_IMAGE_TYPE }
#Import "..\..\..\Win32\System\SystemServices\ENLISTMENT_INFORMATION_CLASS.ahk" { ENLISTMENT_INFORMATION_CLASS }
#Import "..\..\..\Win32\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */

;@region Functions
/**
 * 
 * @param {Pointer<UNICODE_STRING>} DriverServiceName 
 * @returns {NTSTATUS} 
 */
export NtLoadDriver(DriverServiceName) {
    result := DllCall("ntdll.dll\NtLoadDriver", UNICODE_STRING.Ptr, DriverServiceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DriverServiceName 
 * @returns {NTSTATUS} 
 */
export NtUnloadDriver(DriverServiceName) {
    result := DllCall("ntdll.dll\NtUnloadDriver", UNICODE_STRING.Ptr, DriverServiceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @returns {NTSTATUS} 
 */
export NtMakeTemporaryObject(_Handle) {
    result := DllCall("ntdll.dll\NtMakeTemporaryObject", HANDLE, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TmHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Integer} CreateOptions 
 * @param {Integer} CommitStrength 
 * @returns {NTSTATUS} 
 */
export NtCreateTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, CreateOptions, CommitStrength) {
    result := DllCall("ntdll.dll\NtCreateTransactionManager", HANDLE.Ptr, TmHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, UNICODE_STRING.Ptr, LogFileName, "uint", CreateOptions, "uint", CommitStrength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TmHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Pointer<Guid>} TmIdentity 
 * @param {Integer} OpenOptions 
 * @returns {NTSTATUS} 
 */
export NtOpenTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, TmIdentity, OpenOptions) {
    result := DllCall("ntdll.dll\NtOpenTransactionManager", HANDLE.Ptr, TmHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, UNICODE_STRING.Ptr, LogFileName, Guid.Ptr, TmIdentity, "uint", OpenOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionManagerHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtRollforwardTransactionManager(TransactionManagerHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtRollforwardTransactionManager", HANDLE, TransactionManagerHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionManagerHandle 
 * @returns {NTSTATUS} 
 */
export NtRecoverTransactionManager(TransactionManagerHandle) {
    result := DllCall("ntdll.dll\NtRecoverTransactionManager", HANDLE, TransactionManagerHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} RootObjectHandle 
 * @param {KTMOBJECT_TYPE} QueryType 
 * @param {Integer} ObjectCursor 
 * @param {Integer} ObjectCursorLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtEnumerateTransactionObject(RootObjectHandle, QueryType, ObjectCursor, ObjectCursorLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtEnumerateTransactionObject", HANDLE, RootObjectHandle, KTMOBJECT_TYPE, QueryType, "ptr", ObjectCursor, "uint", ObjectCursorLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Guid>} Uow 
 * @param {HANDLE} TmHandle 
 * @param {Integer} CreateOptions 
 * @param {Integer} _IsolationLevel 
 * @param {Integer} IsolationFlags 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<UNICODE_STRING>} Description 
 * @returns {NTSTATUS} 
 */
export NtCreateTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle, CreateOptions, _IsolationLevel, IsolationFlags, Timeout, Description) {
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtCreateTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, Guid.Ptr, Uow, HANDLE, TmHandle, "uint", CreateOptions, "uint", _IsolationLevel, "uint", IsolationFlags, TimeoutMarshal, Timeout, UNICODE_STRING.Ptr, Description, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {TRANSACTION_INFORMATION_CLASS} TransactionInformationClass 
 * @param {Integer} TransactionInformation 
 * @param {Integer} TransactionInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryInformationTransaction", HANDLE, TransactionHandle, TRANSACTION_INFORMATION_CLASS, TransactionInformationClass, "ptr", TransactionInformation, "uint", TransactionInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {BOOLEAN} Wait 
 * @returns {NTSTATUS} 
 */
export NtCommitTransaction(TransactionHandle, Wait) {
    result := DllCall("ntdll.dll\NtCommitTransaction", HANDLE, TransactionHandle, BOOLEAN, Wait, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {BOOLEAN} Wait 
 * @returns {NTSTATUS} 
 */
export NtRollbackTransaction(TransactionHandle, Wait) {
    result := DllCall("ntdll.dll\NtRollbackTransaction", HANDLE, TransactionHandle, BOOLEAN, Wait, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @returns {NTSTATUS} 
 */
export NtRecoverResourceManager(ResourceManagerHandle) {
    result := DllCall("ntdll.dll\NtRecoverResourceManager", HANDLE, ResourceManagerHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {RESOURCEMANAGER_INFORMATION_CLASS} ResourceManagerInformationClass 
 * @param {Integer} ResourceManagerInformation 
 * @param {Integer} ResourceManagerInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryInformationResourceManager", HANDLE, ResourceManagerHandle, RESOURCEMANAGER_INFORMATION_CLASS, ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {RESOURCEMANAGER_INFORMATION_CLASS} ResourceManagerInformationClass 
 * @param {Integer} ResourceManagerInformation 
 * @param {Integer} ResourceManagerInformationLength 
 * @returns {NTSTATUS} 
 */
export NtSetInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationResourceManager", HANDLE, ResourceManagerHandle, RESOURCEMANAGER_INFORMATION_CLASS, ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EnlistmentHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {HANDLE} TransactionHandle 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} CreateOptions 
 * @param {Integer} NotificationMask 
 * @param {Pointer<Void>} EnlistmentKey 
 * @returns {NTSTATUS} 
 */
export NtCreateEnlistment(EnlistmentHandle, DesiredAccess, ResourceManagerHandle, TransactionHandle, ObjectAttributes, CreateOptions, NotificationMask, EnlistmentKey) {
    EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtCreateEnlistment", HANDLE.Ptr, EnlistmentHandle, "uint", DesiredAccess, HANDLE, ResourceManagerHandle, HANDLE, TransactionHandle, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", CreateOptions, "uint", NotificationMask, EnlistmentKeyMarshal, EnlistmentKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Void>} EnlistmentKey 
 * @returns {NTSTATUS} 
 */
export NtRecoverEnlistment(EnlistmentHandle, EnlistmentKey) {
    EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtRecoverEnlistment", HANDLE, EnlistmentHandle, EnlistmentKeyMarshal, EnlistmentKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtPrePrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtPrePrepareEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtPrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtPrepareEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtCommitEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtCommitEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtRollbackEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtRollbackEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtPrePrepareComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtPrePrepareComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtPrepareComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtPrepareComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtCommitComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtCommitComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtReadOnlyEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtReadOnlyEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtRollbackComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtRollbackComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export NtSinglePhaseReject(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\NtSinglePhaseReject", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @returns {NTSTATUS} 
 */
export NtDisplayString(_String) {
    result := DllCall("ntdll.dll\NtDisplayString", UNICODE_STRING.Ptr, _String, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POWER_INFORMATION_LEVEL} InformationLevel 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @returns {NTSTATUS} 
 */
export NtPowerInformation(InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
    result := DllCall("ntdll.dll\NtPowerInformation", POWER_INFORMATION_LEVEL, InformationLevel, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LUID>} _Luid 
 * @returns {NTSTATUS} 
 */
export NtAllocateLocallyUniqueId(_Luid) {
    result := DllCall("ntdll.dll\NtAllocateLocallyUniqueId", LUID.Ptr, _Luid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TargetHandle 
 * @param {HANDLE} SourceHandle 
 * @param {PARTITION_INFORMATION_CLASS} PartitionInformationClass 
 * @param {Integer} PartitionInformation 
 * @param {Integer} PartitionInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwManagePartition(TargetHandle, SourceHandle, PartitionInformationClass, PartitionInformation, PartitionInformationLength) {
    result := DllCall("ntdll.dll\ZwManagePartition", HANDLE, TargetHandle, HANDLE, SourceHandle, PARTITION_INFORMATION_CLASS, PartitionInformationClass, "ptr", PartitionInformation, "uint", PartitionInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManager 
 * @param {Pointer<Guid>} ProtocolId 
 * @param {Integer} ProtocolInformationSize 
 * @param {Pointer<Void>} ProtocolInformation 
 * @param {Integer} CreateOptions 
 * @returns {NTSTATUS} 
 */
export ZwRegisterProtocolAddressInformation(ResourceManager, ProtocolId, ProtocolInformationSize, ProtocolInformation, CreateOptions) {
    ProtocolInformationMarshal := ProtocolInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwRegisterProtocolAddressInformation", HANDLE, ResourceManager, Guid.Ptr, ProtocolId, "uint", ProtocolInformationSize, ProtocolInformationMarshal, ProtocolInformation, "uint", CreateOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Pointer<Guid>} ExistingTransactionManagerGuid 
 * @returns {NTSTATUS} 
 */
export ZwRenameTransactionManager(LogFileName, ExistingTransactionManagerGuid) {
    result := DllCall("ntdll.dll\ZwRenameTransactionManager", UNICODE_STRING.Ptr, LogFileName, Guid.Ptr, ExistingTransactionManagerGuid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Integer} RequestCookie 
 * @param {Integer} BufferLength 
 * @param {Pointer<Void>} _Buffer 
 * @returns {NTSTATUS} 
 */
export ZwPropagationComplete(ResourceManagerHandle, RequestCookie, BufferLength, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwPropagationComplete", HANDLE, ResourceManagerHandle, "uint", RequestCookie, "uint", BufferLength, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Integer} RequestCookie 
 * @param {NTSTATUS} PropStatus 
 * @returns {NTSTATUS} 
 */
export ZwPropagationFailed(ResourceManagerHandle, RequestCookie, PropStatus) {
    result := DllCall("ntdll.dll\ZwPropagationFailed", HANDLE, ResourceManagerHandle, "uint", RequestCookie, NTSTATUS, PropStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TargetHandle 
 * @param {HANDLE} SourceHandle 
 * @param {PARTITION_INFORMATION_CLASS} PartitionInformationClass 
 * @param {Integer} PartitionInformation 
 * @param {Integer} PartitionInformationLength 
 * @returns {NTSTATUS} 
 */
export NtManagePartition(TargetHandle, SourceHandle, PartitionInformationClass, PartitionInformation, PartitionInformationLength) {
    result := DllCall("ntdll.dll\NtManagePartition", HANDLE, TargetHandle, HANDLE, SourceHandle, PARTITION_INFORMATION_CLASS, PartitionInformationClass, "ptr", PartitionInformation, "uint", PartitionInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VoidFailedAssertion 
 * @param {Pointer<Void>} VoidFileName 
 * @param {Integer} LineNumber 
 * @param {PSTR} MutableMessage 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlAssert(VoidFailedAssertion, VoidFileName, LineNumber, MutableMessage) {
    MutableMessage := MutableMessage is String ? StrPtr(MutableMessage) : MutableMessage

    VoidFailedAssertionMarshal := VoidFailedAssertion is VarRef ? "ptr" : "ptr"
    VoidFileNameMarshal := VoidFileName is VarRef ? "ptr" : "ptr"

    DllCall("ntdll.dll\RtlAssert", VoidFailedAssertionMarshal, VoidFailedAssertion, VoidFileNameMarshal, VoidFileName, "uint", LineNumber, "ptr", MutableMessage)
}

/**
 * 
 * @param {Integer} Value 
 * @param {Integer} Base 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @returns {NTSTATUS} 
 */
export RtlIntegerToUnicodeString(Value, Base, _String) {
    result := DllCall("ntdll.dll\RtlIntegerToUnicodeString", "uint", Value, "uint", Base, UNICODE_STRING.Ptr, _String, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Value 
 * @param {Integer} Base 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @returns {NTSTATUS} 
 */
export RtlInt64ToUnicodeString(Value, Base, _String) {
    result := DllCall("ntdll.dll\RtlInt64ToUnicodeString", "uint", Value, "uint", Base, UNICODE_STRING.Ptr, _String, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @param {Integer} Base 
 * @param {Pointer<Integer>} Value 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeStringToInteger(_String, Base, Value) {
    ValueMarshal := Value is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUnicodeStringToInteger", UNICODE_STRING.Ptr, _String, "uint", Base, ValueMarshal, Value, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @param {Integer} Base 
 * @param {Pointer<Integer>} _Number 
 * @param {Pointer<PWSTR>} EndPointer 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeStringToInt64(_String, Base, _Number, EndPointer) {
    _NumberMarshal := _Number is VarRef ? "int64*" : "ptr"
    EndPointerMarshal := EndPointer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlUnicodeStringToInt64", UNICODE_STRING.Ptr, _String, "uint", Base, _NumberMarshal, _Number, EndPointerMarshal, EndPointer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<Integer>} SourceString 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlInitUTF8String(DestinationString, SourceString) {
    SourceStringMarshal := SourceString is VarRef ? "char*" : "ptr"

    DllCall("ntdll.dll\RtlInitUTF8String", STRING.Ptr, DestinationString, SourceStringMarshal, SourceString)
}

/**
 * 
 * @param {Integer} RelativeTo 
 * @param {PWSTR} _Path 
 * @param {Pointer<RTL_QUERY_REGISTRY_TABLE>} QueryTable 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<Void>} Environment 
 * @returns {NTSTATUS} 
 */
export RtlQueryRegistryValues(RelativeTo, _Path, QueryTable, _Context, Environment) {
    _Path := _Path is String ? StrPtr(_Path) : _Path

    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    EnvironmentMarshal := Environment is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlQueryRegistryValues", "uint", RelativeTo, "ptr", _Path, RTL_QUERY_REGISTRY_TABLE.Ptr, QueryTable, _ContextMarshal, _Context, EnvironmentMarshal, Environment, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SystemRoutineName 
 * @returns {Pointer<Void>} 
 */
export MmGetSystemRoutineAddress(SystemRoutineName) {
    result := DllCall("ntoskrnl.exe\MmGetSystemRoutineAddress", UNICODE_STRING.Ptr, SystemRoutineName, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} RelativeTo 
 * @param {PWSTR} _Path 
 * @param {PWSTR} _ValueName 
 * @param {Integer} ValueType 
 * @param {Integer} ValueData 
 * @param {Integer} ValueLength 
 * @returns {NTSTATUS} 
 */
export RtlWriteRegistryValue(RelativeTo, _Path, _ValueName, ValueType, ValueData, ValueLength) {
    _Path := _Path is String ? StrPtr(_Path) : _Path
    _ValueName := _ValueName is String ? StrPtr(_ValueName) : _ValueName

    result := DllCall("ntdll.dll\RtlWriteRegistryValue", "uint", RelativeTo, "ptr", _Path, "ptr", _ValueName, "uint", ValueType, "ptr", ValueData, "uint", ValueLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} RelativeTo 
 * @param {PWSTR} _Path 
 * @param {PWSTR} _ValueName 
 * @returns {NTSTATUS} 
 */
export RtlDeleteRegistryValue(RelativeTo, _Path, _ValueName) {
    _Path := _Path is String ? StrPtr(_Path) : _Path
    _ValueName := _ValueName is String ? StrPtr(_ValueName) : _ValueName

    result := DllCall("ntdll.dll\RtlDeleteRegistryValue", "uint", RelativeTo, "ptr", _Path, "ptr", _ValueName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} RelativeTo 
 * @param {PWSTR} _Path 
 * @returns {NTSTATUS} 
 */
export RtlCreateRegistryKey(RelativeTo, _Path) {
    _Path := _Path is String ? StrPtr(_Path) : _Path

    result := DllCall("ntdll.dll\RtlCreateRegistryKey", "uint", RelativeTo, "ptr", _Path, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} RelativeTo 
 * @param {PWSTR} _Path 
 * @returns {NTSTATUS} 
 */
export RtlCheckRegistryKey(RelativeTo, _Path) {
    _Path := _Path is String ? StrPtr(_Path) : _Path

    result := DllCall("ntdll.dll\RtlCheckRegistryKey", "uint", RelativeTo, "ptr", _Path, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<Integer>} SourceString 
 * @returns {NTSTATUS} 
 */
export RtlInitUTF8StringEx(DestinationString, SourceString) {
    SourceStringMarshal := SourceString is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlInitUTF8StringEx", STRING.Ptr, DestinationString, SourceStringMarshal, SourceString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} String1 
 * @param {Pointer} String1Length 
 * @param {Pointer<Integer>} String2 
 * @param {Pointer} String2Length 
 * @param {BOOLEAN} CaseInSensitive 
 * @returns {Integer} 
 */
export RtlCompareUnicodeStrings(String1, String1Length, String2, String2Length, CaseInSensitive) {
    String1Marshal := String1 is VarRef ? "ushort*" : "ptr"
    String2Marshal := String2 is VarRef ? "ushort*" : "ptr"

    result := DllCall("ntdll.dll\RtlCompareUnicodeStrings", String1Marshal, String1, "ptr", String1Length, String2Marshal, String2, "ptr", String2Length, BOOLEAN, CaseInSensitive, Int32)
    return result
}

/**
 * Compares two Unicode strings.
 * @param {Pointer<UNICODE_STRING>} String1 Pointer to the first string.
 * @param {Pointer<UNICODE_STRING>} String2 Pointer to the second string.
 * @param {BOOLEAN} CaseInSensitive If **TRUE**, case should be ignored when doing the comparison.
 * @returns {Integer} A signed value that gives the results of the comparison:
 * 
 * 
 * 
 * | Return code                                                                               | Description                                     |
 * |-------------------------------------------------------------------------------------------|-------------------------------------------------|
 * | <dl> <dt>**Zero**</dt> </dl>       | *String1* equals *String2*.<br/>          |
 * | <dl> <dt>**< Zero**</dt> </dl>  | *String1* is less than *String2*.<br/>    |
 * | <dl> <dt>**> Zero** </dt> </dl> | *String1* is greater than *String2*.<br/> |
 * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlcompareunicodestring
 */
export RtlCompareUnicodeString(String1, String2, CaseInSensitive) {
    result := DllCall("ntdll.dll\RtlCompareUnicodeString", UNICODE_STRING.Ptr, String1, UNICODE_STRING.Ptr, String2, BOOLEAN, CaseInSensitive, Int32)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} String1 
 * @param {Pointer<UNICODE_STRING>} String2 
 * @param {BOOLEAN} CaseInSensitive 
 * @returns {BOOLEAN} 
 */
export RtlEqualUnicodeString(String1, String2, CaseInSensitive) {
    result := DllCall("ntdll.dll\RtlEqualUnicodeString", UNICODE_STRING.Ptr, String1, UNICODE_STRING.Ptr, String2, BOOLEAN, CaseInSensitive, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @param {BOOLEAN} CaseInSensitive 
 * @param {Integer} HashAlgorithm 
 * @param {Pointer<Integer>} HashValue 
 * @returns {NTSTATUS} 
 */
export RtlHashUnicodeString(_String, CaseInSensitive, HashAlgorithm, HashValue) {
    HashValueMarshal := HashValue is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlHashUnicodeString", UNICODE_STRING.Ptr, _String, BOOLEAN, CaseInSensitive, "uint", HashAlgorithm, HashValueMarshal, HashValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlCopyUnicodeString(DestinationString, SourceString) {
    DllCall("ntdll.dll\RtlCopyUnicodeString", UNICODE_STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Destination 
 * @param {Pointer<UNICODE_STRING>} Source 
 * @returns {NTSTATUS} 
 */
export RtlAppendUnicodeStringToString(Destination, Source) {
    result := DllCall("ntdll.dll\RtlAppendUnicodeStringToString", UNICODE_STRING.Ptr, Destination, UNICODE_STRING.Ptr, Source, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Destination 
 * @param {PWSTR} Source 
 * @returns {NTSTATUS} 
 */
export RtlAppendUnicodeToString(Destination, Source) {
    Source := Source is String ? StrPtr(Source) : Source

    result := DllCall("ntdll.dll\RtlAppendUnicodeToString", UNICODE_STRING.Ptr, Destination, "ptr", Source, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} SourceCharacter 
 * @returns {Integer} 
 */
export RtlUpcaseUnicodeChar(SourceCharacter) {
    result := DllCall("ntdll.dll\RtlUpcaseUnicodeChar", "char", SourceCharacter, Int8)
    return result
}

/**
 * 
 * @param {Integer} SourceCharacter 
 * @returns {Integer} 
 */
export RtlDowncaseUnicodeChar(SourceCharacter) {
    result := DllCall("ntdll.dll\RtlDowncaseUnicodeChar", "char", SourceCharacter, Int8)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} utf8String 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlFreeUTF8String(utf8String) {
    DllCall("ntdll.dll\RtlFreeUTF8String", STRING.Ptr, utf8String)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} UnicodeString 
 * @returns {Integer} 
 */
export RtlxUnicodeStringToAnsiSize(UnicodeString) {
    result := DllCall("ntdll.dll\RtlxUnicodeStringToAnsiSize", UNICODE_STRING.Ptr, UnicodeString, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} AnsiString 
 * @returns {Integer} 
 */
export RtlxAnsiStringToUnicodeSize(AnsiString) {
    result := DllCall("ntdll.dll\RtlxAnsiStringToUnicodeSize", STRING.Ptr, AnsiString, UInt32)
    return result
}

/**
 * Translates the specified Unicode string into a new character string, using the 8-bit Unicode Transformation Format (UTF-8) code page.
 * @remarks
 * Although *UTF8StringActualByteCount* is optional and can be **NULL**, callers should provide storage for it, because the received length can be used to determine whether the conversion was successful. This routine does not modify the source string. It returns a null-terminated UTF-8 string if the given *UnicodeStringSource* included a NULL terminator and if the given *UTF8StringMaxByteCount* did not cause truncation.
 * 
 * If the output is truncated and an invalid input character is encountered then the function returns STATUS\_BUFFER\_TOO\_SMALL error.
 * 
 * If the *UTF8StringDestination* is set to **NULL** the function will return the required number of bytes to host the translated string without any truncation in *UTF8StringActualByteCount*.
 * 
 * Callers of **RtlUnicodeToUTF8N** must be running at IRQL < DISPATCH\_LEVEL.
 * @param {Integer} UTF8StringDestination A pointer to a caller-allocated buffer to receive the translated string.
 * @param {Integer} UTF8StringMaxByteCount Maximum number of bytes to be written to *UTF8StringDestination*. If this value causes the translated string to be truncated, **RtlUnicodeToUTF8N** returns an error status.
 * @param {Pointer<Integer>} UTF8StringActualByteCount A pointer to a caller-allocated variable that receives the length, in bytes, of the translated string. This parameter is optional and can be **NULL**. If the string is truncated then the returned number counts the actual truncated string count.
 * @param {Integer} UnicodeStringSource A pointer to the Unicode source string to be translated.
 * 
 * 
 * *UnicodeStringByteCount * \[in\]
 * 
 * Specifies the number of bytes in the Unicode source string that the *UnicodeStringSource* parameter points to.
 * @param {Integer} UnicodeStringByteCount 
 * @returns {NTSTATUS} **RtlUnicodeToUTF8N** returns one of the following NTSTATUS values:
 * 
 * 
 * 
 * | Return code                                                                                                  | Description                                                                                                     |
 * |--------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
 * | <dl> <dt>**STATUS\_SUCCESS**</dt> </dl>               | The Unicode string was converted to UTF-8.<br/>                                                           |
 * | <dl> <dt>**STATUS\_SOME\_NOT\_MAPPED**</dt> </dl>     | An invalid input character was encountered and replaced. This status is considered a success status.<br/> |
 * | <dl> <dt>**STATUS\_INVALID\_PARAMETER**</dt> </dl>    | Both pointers to *UTF8StringDestination* and *UTF8StringActualByteCount* were **NULL**.<br/>              |
 * | <dl> <dt>**STATUS\_INVALID\_PARAMETER\_4**</dt> </dl> | The *UnicodeStringSource* was **NULL**.<br/>                                                              |
 * | <dl> <dt>**STATUS\_BUFFER\_TOO\_SMALL**</dt> </dl>    | *UTF8StringDestination* was truncated.<br/>                                                               |
 * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlunicodetoutf8n
 */
export RtlUnicodeToUTF8N(UTF8StringDestination, UTF8StringMaxByteCount, UTF8StringActualByteCount, UnicodeStringSource, UnicodeStringByteCount) {
    UTF8StringActualByteCountMarshal := UTF8StringActualByteCount is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUnicodeToUTF8N", "ptr", UTF8StringDestination, "uint", UTF8StringMaxByteCount, UTF8StringActualByteCountMarshal, UTF8StringActualByteCount, "ptr", UnicodeStringSource, "uint", UnicodeStringByteCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Translates the specified source string into a Unicode string, using the 8-bit Unicode Transformation Format (UTF-8) code page.
 * @remarks
 * Although *UnicodeStringActualByteCount* is optional and can be **NULL**, callers should provide storage for it, because the received length can be used to determine whether the conversion was successful.
 * 
 * If the output is truncated and an invalid input character is encountered then the function returns STATUS\_BUFFER\_TOO\_SMALL error.
 * 
 * If the *UnicodeStringDestination* is set to **NULL** the function will return the required number of bytes to host the translated string without any truncation in *UnicodeStringActualByteCount*.
 * 
 * **RtlUTF8ToUnicodeN** does not modify the source string unless the *UnicodeStringDestination* and *UTF8StringSource* pointers are equivalent. The returned Unicode string is not null-terminated.
 * 
 * Callers of **RtlUTF8ToUnicodeN** must be running at IRQL < DISPATCH\_LEVEL.
 * @param {Integer} UnicodeStringDestination A pointer to a caller-allocated buffer that receives the translated string.
 * @param {Integer} UnicodeStringMaxByteCount Maximum number of bytes to be written at *UnicodeStringDestination*. If this value causes the translated string to be truncated, **RtlUTF8ToUnicodeN** returns an error status.
 * @param {Pointer<Integer>} UnicodeStringActualByteCount A pointer to a caller-allocated variable that receives the length, in bytes, of the translated string. This parameter is optional and can be **NULL**. If the string is truncated then the returned number counts the actual truncated string count.
 * @param {Integer} UTF8StringSource A pointer to the string to be translated.
 * @param {Integer} UTF8StringByteCount Size, in bytes, of the string at *UTF8StringSource*.
 * @returns {NTSTATUS} **RtlUTF8ToUnicodeN** returns one of the following NTSTATUS values:
 * 
 * 
 * 
 * | Return code                                                                                                  | Description                                                                                                     |
 * |--------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
 * | <dl> <dt>**STATUS\_SUCCESS**</dt> </dl>               | The string was converted to Unicode.<br/>                                                                 |
 * | <dl> <dt>**STATUS\_SOME\_NOT\_MAPPED**</dt> </dl>     | An invalid input character was encountered and replaced. This status is considered a success status.<br/> |
 * | <dl> <dt>**STATUS\_INVALID\_PARAMETER**</dt> </dl>    | Both pointers to *UnicodeStringDestination* and *UnicodeStringActualByteCount* were **NULL**.<br/>       |
 * | <dl> <dt>**STATUS\_INVALID\_PARAMETER\_4**</dt> </dl> | The *UTF8StringSource* was **NULL**.<br/>                                                                 |
 * | <dl> <dt>**STATUS\_BUFFER\_TOO\_SMALL**</dt> </dl>    | *UnicodeStringDestination* was truncated.<br/>                                                            |
 * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlutf8tounicoden
 */
export RtlUTF8ToUnicodeN(UnicodeStringDestination, UnicodeStringMaxByteCount, UnicodeStringActualByteCount, UTF8StringSource, UTF8StringByteCount) {
    UnicodeStringActualByteCountMarshal := UnicodeStringActualByteCount is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlUTF8ToUnicodeN", "ptr", UnicodeStringDestination, "uint", UnicodeStringMaxByteCount, UnicodeStringActualByteCountMarshal, UnicodeStringActualByteCount, "ptr", UTF8StringSource, "uint", UTF8StringByteCount, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlUnicodeStringToUTF8String(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlUnicodeStringToUTF8String", STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {Pointer<STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlUTF8StringToUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlUTF8StringToUnicodeString", UNICODE_STRING.Ptr, DestinationString, STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} Guid 
 * @param {Pointer<UNICODE_STRING>} GuidString 
 * @returns {NTSTATUS} 
 */
export RtlStringFromGUID(Guid, GuidString) {
    result := DllCall("ntdll.dll\RtlStringFromGUID", Guid.Ptr, Guid, UNICODE_STRING.Ptr, GuidString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} GuidString 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export RtlGUIDFromString(GuidString, Guid) {
    result := DllCall("ntdll.dll\RtlGUIDFromString", UNICODE_STRING.Ptr, GuidString, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} NamespaceGuid 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export RtlGenerateClass5Guid(NamespaceGuid, _Buffer, BufferSize, Guid) {
    result := DllCall("ntoskrnl.exe\RtlGenerateClass5Guid", Guid.Ptr, NamespaceGuid, "ptr", _Buffer, "uint", BufferSize, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Source 
 * @param {Pointer} Length 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlPrefetchMemoryNonTemporal(Source, Length) {
    SourceMarshal := Source is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\RtlPrefetchMemoryNonTemporal", SourceMarshal, Source, "ptr", Length)
}

/**
 * 
 * @param {Integer} _Status 
 * @returns {String} Nothing - always returns an empty string
 */
export DbgBreakPointWithStatus(_Status) {
    DllCall("ntoskrnl.exe\DbgBreakPointWithStatus", "uint", _Status)
}

/**
 * 
 * @param {PSTR} Format 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export DbgPrint(Format, args*) {
    Format := Format is String ? StrPtr(Format) : Format

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("ntdll.dll\DbgPrint", "ptr", Format, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} ComponentId 
 * @param {Integer} Level 
 * @param {PSTR} Format 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export DbgPrintEx(ComponentId, Level, Format, args*) {
    Format := Format is String ? StrPtr(Format) : Format

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("ntdll.dll\DbgPrintEx", "uint", ComponentId, "uint", Level, "ptr", Format, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} ComponentId 
 * @param {Integer} Level 
 * @param {PSTR} Format 
 * @param {Pointer<Integer>} arglist 
 * @returns {Integer} 
 */
export vDbgPrintEx(ComponentId, Level, Format, arglist) {
    Format := Format is String ? StrPtr(Format) : Format

    arglistMarshal := arglist is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\vDbgPrintEx", "uint", ComponentId, "uint", Level, "ptr", Format, arglistMarshal, arglist, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} Prefix 
 * @param {Integer} ComponentId 
 * @param {Integer} Level 
 * @param {PSTR} Format 
 * @param {Pointer<Integer>} arglist 
 * @returns {Integer} 
 */
export vDbgPrintExWithPrefix(Prefix, ComponentId, Level, Format, arglist) {
    Prefix := Prefix is String ? StrPtr(Prefix) : Prefix
    Format := Format is String ? StrPtr(Format) : Format

    arglistMarshal := arglist is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\vDbgPrintExWithPrefix", "ptr", Prefix, "uint", ComponentId, "uint", Level, "ptr", Format, arglistMarshal, arglist, UInt32)
    return result
}

/**
 * 
 * @param {PSTR} Format 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} 
 */
export DbgPrintReturnControlC(Format, args*) {
    Format := Format is String ? StrPtr(Format) : Format

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("ntdll.dll\DbgPrintReturnControlC", "ptr", Format, varArgs*)
    return result
}

/**
 * 
 * @param {Integer} ComponentId 
 * @param {Integer} Level 
 * @returns {NTSTATUS} 
 */
export DbgQueryDebugFilterState(ComponentId, Level) {
    result := DllCall("ntdll.dll\DbgQueryDebugFilterState", "uint", ComponentId, "uint", Level, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ComponentId 
 * @param {Integer} Level 
 * @param {BOOLEAN} State 
 * @returns {NTSTATUS} 
 */
export DbgSetDebugFilterState(ComponentId, Level, State) {
    result := DllCall("ntdll.dll\DbgSetDebugFilterState", "uint", ComponentId, "uint", Level, BOOLEAN, State, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PDEBUG_PRINT_CALLBACK>} DebugPrintCallback 
 * @param {BOOLEAN} Enable 
 * @returns {NTSTATUS} 
 */
export DbgSetDebugPrintCallback(DebugPrintCallback, Enable) {
    result := DllCall("ntoskrnl.exe\DbgSetDebugPrintCallback", "ptr", DebugPrintCallback, BOOLEAN, Enable, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Time 
 * @param {Pointer<TIME_FIELDS>} TimeFields 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlTimeToTimeFields(Time, TimeFields) {
    TimeMarshal := Time is VarRef ? "int64*" : "ptr"

    DllCall("ntdll.dll\RtlTimeToTimeFields", TimeMarshal, Time, TIME_FIELDS.Ptr, TimeFields)
}

/**
 * 
 * @param {Pointer<TIME_FIELDS>} TimeFields 
 * @param {Pointer<Integer>} Time 
 * @returns {BOOLEAN} 
 */
export RtlTimeFieldsToTime(TimeFields, Time) {
    TimeMarshal := Time is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\RtlTimeFieldsToTime", TIME_FIELDS.Ptr, TimeFields, TimeMarshal, Time, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Pointer<Integer>} BitMapBuffer 
 * @param {Integer} SizeOfBitMap 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlInitializeBitMap(BitMapHeader, BitMapBuffer, SizeOfBitMap) {
    BitMapBufferMarshal := BitMapBuffer is VarRef ? "uint*" : "ptr"

    DllCall("ntdll.dll\RtlInitializeBitMap", RTL_BITMAP.Ptr, BitMapHeader, BitMapBufferMarshal, BitMapBuffer, "uint", SizeOfBitMap)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} BitNumber 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlClearBit(BitMapHeader, BitNumber) {
    DllCall("ntdll.dll\RtlClearBit", RTL_BITMAP.Ptr, BitMapHeader, "uint", BitNumber)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} BitNumber 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlSetBit(BitMapHeader, BitNumber) {
    DllCall("ntdll.dll\RtlSetBit", RTL_BITMAP.Ptr, BitMapHeader, "uint", BitNumber)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} BitNumber 
 * @returns {BOOLEAN} 
 */
export RtlTestBit(BitMapHeader, BitNumber) {
    result := DllCall("ntdll.dll\RtlTestBit", RTL_BITMAP.Ptr, BitMapHeader, "uint", BitNumber, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlClearAllBits(BitMapHeader) {
    DllCall("ntdll.dll\RtlClearAllBits", RTL_BITMAP.Ptr, BitMapHeader)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlSetAllBits(BitMapHeader) {
    DllCall("ntdll.dll\RtlSetAllBits", RTL_BITMAP.Ptr, BitMapHeader)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} NumberToFind 
 * @param {Integer} HintIndex 
 * @returns {Integer} 
 */
export RtlFindClearBits(BitMapHeader, NumberToFind, HintIndex) {
    result := DllCall("ntdll.dll\RtlFindClearBits", RTL_BITMAP.Ptr, BitMapHeader, "uint", NumberToFind, "uint", HintIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} NumberToFind 
 * @param {Integer} HintIndex 
 * @returns {Integer} 
 */
export RtlFindSetBits(BitMapHeader, NumberToFind, HintIndex) {
    result := DllCall("ntdll.dll\RtlFindSetBits", RTL_BITMAP.Ptr, BitMapHeader, "uint", NumberToFind, "uint", HintIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} NumberToFind 
 * @param {Integer} HintIndex 
 * @returns {Integer} 
 */
export RtlFindClearBitsAndSet(BitMapHeader, NumberToFind, HintIndex) {
    result := DllCall("ntdll.dll\RtlFindClearBitsAndSet", RTL_BITMAP.Ptr, BitMapHeader, "uint", NumberToFind, "uint", HintIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} NumberToFind 
 * @param {Integer} HintIndex 
 * @returns {Integer} 
 */
export RtlFindSetBitsAndClear(BitMapHeader, NumberToFind, HintIndex) {
    result := DllCall("ntdll.dll\RtlFindSetBitsAndClear", RTL_BITMAP.Ptr, BitMapHeader, "uint", NumberToFind, "uint", HintIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} StartingIndex 
 * @param {Integer} NumberToClear 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlClearBits(BitMapHeader, StartingIndex, NumberToClear) {
    DllCall("ntdll.dll\RtlClearBits", RTL_BITMAP.Ptr, BitMapHeader, "uint", StartingIndex, "uint", NumberToClear)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} StartingIndex 
 * @param {Integer} NumberToSet 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlSetBits(BitMapHeader, StartingIndex, NumberToSet) {
    DllCall("ntdll.dll\RtlSetBits", RTL_BITMAP.Ptr, BitMapHeader, "uint", StartingIndex, "uint", NumberToSet)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Pointer<RTL_BITMAP_RUN>} RunArray 
 * @param {Integer} SizeOfRunArray 
 * @param {BOOLEAN} LocateLongestRuns 
 * @returns {Integer} 
 */
export RtlFindClearRuns(BitMapHeader, RunArray, SizeOfRunArray, LocateLongestRuns) {
    result := DllCall("ntdll.dll\RtlFindClearRuns", RTL_BITMAP.Ptr, BitMapHeader, RTL_BITMAP_RUN.Ptr, RunArray, "uint", SizeOfRunArray, BOOLEAN, LocateLongestRuns, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Pointer<Integer>} StartingIndex 
 * @returns {Integer} 
 */
export RtlFindLongestRunClear(BitMapHeader, StartingIndex) {
    StartingIndexMarshal := StartingIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlFindLongestRunClear", RTL_BITMAP.Ptr, BitMapHeader, StartingIndexMarshal, StartingIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Pointer<Integer>} StartingIndex 
 * @returns {Integer} 
 */
export RtlFindFirstRunClear(BitMapHeader, StartingIndex) {
    StartingIndexMarshal := StartingIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlFindFirstRunClear", RTL_BITMAP.Ptr, BitMapHeader, StartingIndexMarshal, StartingIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} StartingIndex 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export RtlNumberOfClearBitsInRange(BitMapHeader, StartingIndex, Length) {
    result := DllCall("ntdll.dll\RtlNumberOfClearBitsInRange", RTL_BITMAP.Ptr, BitMapHeader, "uint", StartingIndex, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} StartingIndex 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export RtlNumberOfSetBitsInRange(BitMapHeader, StartingIndex, Length) {
    result := DllCall("ntdll.dll\RtlNumberOfSetBitsInRange", RTL_BITMAP.Ptr, BitMapHeader, "uint", StartingIndex, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @returns {Integer} 
 */
export RtlNumberOfClearBits(BitMapHeader) {
    result := DllCall("ntdll.dll\RtlNumberOfClearBits", RTL_BITMAP.Ptr, BitMapHeader, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @returns {Integer} 
 */
export RtlNumberOfSetBits(BitMapHeader) {
    result := DllCall("ntdll.dll\RtlNumberOfSetBits", RTL_BITMAP.Ptr, BitMapHeader, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} StartingIndex 
 * @param {Integer} Length 
 * @returns {BOOLEAN} 
 */
export RtlAreBitsClear(BitMapHeader, StartingIndex, Length) {
    result := DllCall("ntdll.dll\RtlAreBitsClear", RTL_BITMAP.Ptr, BitMapHeader, "uint", StartingIndex, "uint", Length, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} StartingIndex 
 * @param {Integer} Length 
 * @returns {BOOLEAN} 
 */
export RtlAreBitsSet(BitMapHeader, StartingIndex, Length) {
    result := DllCall("ntdll.dll\RtlAreBitsSet", RTL_BITMAP.Ptr, BitMapHeader, "uint", StartingIndex, "uint", Length, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} FromIndex 
 * @param {Pointer<Integer>} StartingRunIndex 
 * @returns {Integer} 
 */
export RtlFindNextForwardRunClear(BitMapHeader, FromIndex, StartingRunIndex) {
    StartingRunIndexMarshal := StartingRunIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlFindNextForwardRunClear", RTL_BITMAP.Ptr, BitMapHeader, "uint", FromIndex, StartingRunIndexMarshal, StartingRunIndex, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} BitMapHeader 
 * @param {Integer} FromIndex 
 * @param {Pointer<Integer>} StartingRunIndex 
 * @returns {Integer} 
 */
export RtlFindLastBackwardRunClear(BitMapHeader, FromIndex, StartingRunIndex) {
    StartingRunIndexMarshal := StartingRunIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlFindLastBackwardRunClear", RTL_BITMAP.Ptr, BitMapHeader, "uint", FromIndex, StartingRunIndexMarshal, StartingRunIndex, UInt32)
    return result
}

/**
 * 
 * @param {Integer} Set 
 * @returns {Integer} 
 */
export RtlFindLeastSignificantBit(Set) {
    result := DllCall("ntdll.dll\RtlFindLeastSignificantBit", "uint", Set, Int8)
    return result
}

/**
 * 
 * @param {Integer} Set 
 * @returns {Integer} 
 */
export RtlFindMostSignificantBit(Set) {
    result := DllCall("ntdll.dll\RtlFindMostSignificantBit", "uint", Set, Int8)
    return result
}

/**
 * 
 * @param {Pointer} Target 
 * @returns {Integer} 
 */
export RtlNumberOfSetBitsUlongPtr(Target) {
    result := DllCall("ntdll.dll\RtlNumberOfSetBitsUlongPtr", "ptr", Target, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} Source 
 * @param {Pointer<RTL_BITMAP>} Destination 
 * @param {Integer} TargetBit 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlCopyBitMap(Source, Destination, TargetBit) {
    DllCall("ntdll.dll\RtlCopyBitMap", RTL_BITMAP.Ptr, Source, RTL_BITMAP.Ptr, Destination, "uint", TargetBit)
}

/**
 * 
 * @param {Pointer<RTL_BITMAP>} Source 
 * @param {Pointer<RTL_BITMAP>} Destination 
 * @param {Integer} TargetBit 
 * @param {Integer} NumberOfBits 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlExtractBitMap(Source, Destination, TargetBit, NumberOfBits) {
    DllCall("ntdll.dll\RtlExtractBitMap", RTL_BITMAP.Ptr, Source, RTL_BITMAP.Ptr, Destination, "uint", TargetBit, "uint", NumberOfBits)
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Integer} Revision 
 * @returns {NTSTATUS} 
 */
export RtlCreateSecurityDescriptor(_SecurityDescriptor, Revision) {
    result := DllCall("ntdll.dll\RtlCreateSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, "uint", Revision, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {BOOLEAN} 
 */
export RtlValidSecurityDescriptor(_SecurityDescriptor) {
    result := DllCall("ntdll.dll\RtlValidSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @returns {Integer} 
 */
export RtlLengthSecurityDescriptor(_SecurityDescriptor) {
    result := DllCall("ntdll.dll\RtlLengthSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, UInt32)
    return result
}

/**
 * 
 * @param {Integer} SecurityDescriptorInput 
 * @param {Integer} SecurityDescriptorLength 
 * @param {Integer} RequiredInformation 
 * @returns {BOOLEAN} 
 */
export RtlValidRelativeSecurityDescriptor(SecurityDescriptorInput, SecurityDescriptorLength, RequiredInformation) {
    result := DllCall("ntdll.dll\RtlValidRelativeSecurityDescriptor", "ptr", SecurityDescriptorInput, "uint", SecurityDescriptorLength, "uint", RequiredInformation, BOOLEAN)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {BOOLEAN} DaclPresent 
 * @param {Pointer<ACL>} Dacl 
 * @param {BOOLEAN} DaclDefaulted 
 * @returns {NTSTATUS} 
 */
export RtlSetDaclSecurityDescriptor(_SecurityDescriptor, DaclPresent, Dacl, DaclDefaulted) {
    result := DllCall("ntdll.dll\RtlSetDaclSecurityDescriptor", PSECURITY_DESCRIPTOR, _SecurityDescriptor, BOOLEAN, DaclPresent, ACL.Ptr, Dacl, BOOLEAN, DaclDefaulted, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Gets version information about the currently running operating system.
 * @remarks
 * **RtlGetVersion** is the equivalent of the [**GetVersionEx**](/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversionexa) function in the Windows SDK. See the example in the Windows SDK that shows how to get the system version.
 * 
 * When using **RtlGetVersion** to determine whether a particular version of the operating system is running, a caller should check for version numbers that are greater than or equal to the required version number. This ensures that a version test succeeds for later versions of Windows.
 * 
 * Because operating system features can be added in a redistributable DLL, checking only the major and minor version numbers is not the most reliable way to verify the presence of a specific system feature. A driver should use [**RtlVerifyVersionInfo**](/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlverifyversioninfo) to test for the presence of a specific system feature.
 * @param {Pointer<OSVERSIONINFOW>} lpVersionInformation Pointer to either a [**RTL\_OSVERSIONINFOW**](/windows-hardware/drivers/ddi/wdm/ns-wdm-_osversioninfow) structure or a [**RTL\_OSVERSIONINFOEXW**](/windows-hardware/drivers/ddi/wdm/ns-wdm-_osversioninfoexw) structure that contains the version information about the currently running operating system. A caller specifies which input structure is used by setting the **dwOSVersionInfoSize** member of the structure to the size in bytes of the structure that is used.
 * @returns {NTSTATUS} Returns STATUS\_SUCCESS.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlgetversion
 */
export RtlGetVersion(lpVersionInformation) {
    result := DllCall("ntdll.dll\RtlGetVersion", OSVERSIONINFOW.Ptr, lpVersionInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OSVERSIONINFOEXW>} VersionInfo 
 * @param {Integer} TypeMask 
 * @param {Integer} ConditionMask 
 * @returns {NTSTATUS} 
 */
export RtlVerifyVersionInfo(VersionInfo, TypeMask, ConditionMask) {
    result := DllCall("ntdll.dll\RtlVerifyVersionInfo", OSVERSIONINFOEXW.Ptr, VersionInfo, "uint", TypeMask, "uint", ConditionMask, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} _Version 
 * @returns {BOOLEAN} 
 */
export RtlIsNtDdiVersionAvailable(_Version) {
    result := DllCall("ntoskrnl.exe\RtlIsNtDdiVersionAvailable", "uint", _Version, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} _Version 
 * @returns {BOOLEAN} 
 */
export RtlIsServicePackVersionInstalled(_Version) {
    result := DllCall("ntoskrnl.exe\RtlIsServicePackVersionInstalled", "uint", _Version, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Descriptor 
 * @param {Integer} Type 
 * @param {Integer} Length 
 * @param {Integer} Alignment 
 * @param {Integer} MinimumAddress 
 * @param {Integer} MaximumAddress 
 * @returns {NTSTATUS} 
 */
export RtlIoEncodeMemIoResource(Descriptor, Type, Length, Alignment, MinimumAddress, MaximumAddress) {
    result := DllCall("ntdll.dll\RtlIoEncodeMemIoResource", IO_RESOURCE_DESCRIPTOR.Ptr, Descriptor, "char", Type, "uint", Length, "uint", Alignment, "uint", MinimumAddress, "uint", MaximumAddress, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Descriptor 
 * @param {Integer} Type 
 * @param {Integer} Length 
 * @param {Integer} Start 
 * @returns {NTSTATUS} 
 */
export RtlCmEncodeMemIoResource(Descriptor, Type, Length, Start) {
    result := DllCall("ntdll.dll\RtlCmEncodeMemIoResource", CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr, Descriptor, "char", Type, "uint", Length, "uint", Start, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Descriptor 
 * @param {Pointer<Integer>} Alignment 
 * @param {Pointer<Integer>} MinimumAddress 
 * @param {Pointer<Integer>} MaximumAddress 
 * @returns {Integer} 
 */
export RtlIoDecodeMemIoResource(Descriptor, Alignment, MinimumAddress, MaximumAddress) {
    AlignmentMarshal := Alignment is VarRef ? "uint*" : "ptr"
    MinimumAddressMarshal := MinimumAddress is VarRef ? "uint*" : "ptr"
    MaximumAddressMarshal := MaximumAddress is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlIoDecodeMemIoResource", IO_RESOURCE_DESCRIPTOR.Ptr, Descriptor, AlignmentMarshal, Alignment, MinimumAddressMarshal, MinimumAddress, MaximumAddressMarshal, MaximumAddress, Int64)
    return result
}

/**
 * 
 * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Descriptor 
 * @param {Pointer<Integer>} Start 
 * @returns {Integer} 
 */
export RtlCmDecodeMemIoResource(Descriptor, Start) {
    StartMarshal := Start is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlCmDecodeMemIoResource", CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr, Descriptor, StartMarshal, Start, Int64)
    return result
}

/**
 * 
 * @param {Integer} SourceLength 
 * @param {Pointer<Integer>} TargetLength 
 * @returns {NTSTATUS} 
 */
export RtlFindClosestEncodableLength(SourceLength, TargetLength) {
    TargetLengthMarshal := TargetLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlFindClosestEncodableLength", "uint", SourceLength, TargetLengthMarshal, TargetLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<BOOLEAN>} UntrustedObject 
 * @returns {NTSTATUS} 
 */
export RtlIsUntrustedObject(_Handle, _Object, UntrustedObject) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    UntrustedObjectMarshal := UntrustedObject is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlIsUntrustedObject", HANDLE, _Handle, _ObjectMarshal, _Object, UntrustedObjectMarshal, UntrustedObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ComponentName 
 * @returns {Integer} 
 */
export RtlQueryValidationRunlevel(ComponentName) {
    result := DllCall("ntdll.dll\RtlQueryValidationRunlevel", UNICODE_STRING.Ptr, ComponentName, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Pointer<Guid>} ExistingTransactionManagerGuid 
 * @returns {NTSTATUS} 
 */
export NtRenameTransactionManager(LogFileName, ExistingTransactionManagerGuid) {
    result := DllCall("ntdll.dll\NtRenameTransactionManager", UNICODE_STRING.Ptr, LogFileName, Guid.Ptr, ExistingTransactionManagerGuid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionManagerHandle 
 * @param {TRANSACTIONMANAGER_INFORMATION_CLASS} TransactionManagerInformationClass 
 * @param {Integer} TransactionManagerInformation 
 * @param {Integer} TransactionManagerInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationTransactionManager(TransactionManagerHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryInformationTransactionManager", HANDLE, TransactionManagerHandle, TRANSACTIONMANAGER_INFORMATION_CLASS, TransactionManagerInformationClass, "ptr", TransactionManagerInformation, "uint", TransactionManagerInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TmHandle 
 * @param {TRANSACTIONMANAGER_INFORMATION_CLASS} TransactionManagerInformationClass 
 * @param {Integer} TransactionManagerInformation 
 * @param {Integer} TransactionManagerInformationLength 
 * @returns {NTSTATUS} 
 */
export NtSetInformationTransactionManager(TmHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationTransactionManager", HANDLE, TmHandle, TRANSACTIONMANAGER_INFORMATION_CLASS, TransactionManagerInformationClass, "ptr", TransactionManagerInformation, "uint", TransactionManagerInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Guid>} Uow 
 * @param {HANDLE} TmHandle 
 * @returns {NTSTATUS} 
 */
export NtOpenTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle) {
    result := DllCall("ntdll.dll\NtOpenTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, Guid.Ptr, Uow, HANDLE, TmHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {TRANSACTION_INFORMATION_CLASS} TransactionInformationClass 
 * @param {Integer} TransactionInformation 
 * @param {Integer} TransactionInformationLength 
 * @returns {NTSTATUS} 
 */
export NtSetInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationTransaction", HANDLE, TransactionHandle, TRANSACTION_INFORMATION_CLASS, TransactionInformationClass, "ptr", TransactionInformation, "uint", TransactionInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EnlistmentHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Pointer<Guid>} EnlistmentGuid 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtOpenEnlistment(EnlistmentHandle, DesiredAccess, ResourceManagerHandle, EnlistmentGuid, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenEnlistment", HANDLE.Ptr, EnlistmentHandle, "uint", DesiredAccess, HANDLE, ResourceManagerHandle, Guid.Ptr, EnlistmentGuid, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {ENLISTMENT_INFORMATION_CLASS} EnlistmentInformationClass 
 * @param {Integer} EnlistmentInformation 
 * @param {Integer} EnlistmentInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export NtQueryInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtQueryInformationEnlistment", HANDLE, EnlistmentHandle, ENLISTMENT_INFORMATION_CLASS, EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {ENLISTMENT_INFORMATION_CLASS} EnlistmentInformationClass 
 * @param {Integer} EnlistmentInformation 
 * @param {Integer} EnlistmentInformationLength 
 * @returns {NTSTATUS} 
 */
export NtSetInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength) {
    result := DllCall("ntdll.dll\NtSetInformationEnlistment", HANDLE, EnlistmentHandle, ENLISTMENT_INFORMATION_CLASS, EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} ResourceManagerHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} TmHandle 
 * @param {Pointer<Guid>} RmGuid 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} CreateOptions 
 * @param {Pointer<UNICODE_STRING>} Description 
 * @returns {NTSTATUS} 
 */
export NtCreateResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, RmGuid, ObjectAttributes, CreateOptions, Description) {
    result := DllCall("ntdll.dll\NtCreateResourceManager", HANDLE.Ptr, ResourceManagerHandle, "uint", DesiredAccess, HANDLE, TmHandle, Guid.Ptr, RmGuid, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", CreateOptions, UNICODE_STRING.Ptr, Description, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} ResourceManagerHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} TmHandle 
 * @param {Pointer<Guid>} ResourceManagerGuid 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtOpenResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, ResourceManagerGuid, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenResourceManager", HANDLE.Ptr, ResourceManagerHandle, "uint", DesiredAccess, HANDLE, TmHandle, Guid.Ptr, ResourceManagerGuid, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Pointer<TRANSACTION_NOTIFICATION>} TransactionNotification 
 * @param {Integer} NotificationLength 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<Integer>} ReturnLength 
 * @param {Integer} Asynchronous 
 * @param {Pointer} AsynchronousContext 
 * @returns {NTSTATUS} 
 */
export NtGetNotificationResourceManager(ResourceManagerHandle, TransactionNotification, NotificationLength, Timeout, ReturnLength, Asynchronous, AsynchronousContext) {
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\NtGetNotificationResourceManager", HANDLE, ResourceManagerHandle, TRANSACTION_NOTIFICATION.Ptr, TransactionNotification, "uint", NotificationLength, TimeoutMarshal, Timeout, ReturnLengthMarshal, ReturnLength, "uint", Asynchronous, "ptr", AsynchronousContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManager 
 * @param {Pointer<Guid>} ProtocolId 
 * @param {Integer} ProtocolInformationSize 
 * @param {Pointer<Void>} ProtocolInformation 
 * @param {Integer} CreateOptions 
 * @returns {NTSTATUS} 
 */
export NtRegisterProtocolAddressInformation(ResourceManager, ProtocolId, ProtocolInformationSize, ProtocolInformation, CreateOptions) {
    ProtocolInformationMarshal := ProtocolInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtRegisterProtocolAddressInformation", HANDLE, ResourceManager, Guid.Ptr, ProtocolId, "uint", ProtocolInformationSize, ProtocolInformationMarshal, ProtocolInformation, "uint", CreateOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Integer} RequestCookie 
 * @param {Integer} BufferLength 
 * @param {Pointer<Void>} _Buffer 
 * @returns {NTSTATUS} 
 */
export NtPropagationComplete(ResourceManagerHandle, RequestCookie, BufferLength, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtPropagationComplete", HANDLE, ResourceManagerHandle, "uint", RequestCookie, "uint", BufferLength, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Integer} RequestCookie 
 * @param {NTSTATUS} PropStatus 
 * @returns {NTSTATUS} 
 */
export NtPropagationFailed(ResourceManagerHandle, RequestCookie, PropStatus) {
    result := DllCall("ntdll.dll\NtPropagationFailed", HANDLE, ResourceManagerHandle, "uint", RequestCookie, NTSTATUS, PropStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} NewIrql 
 * @returns {Integer} 
 */
export KfRaiseIrql(NewIrql) {
    result := DllCall("ntoskrnl.exe\KfRaiseIrql", "char", NewIrql, Int8)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} _Mdl 
 * @param {BOOLEAN} ReadOperation 
 * @param {BOOLEAN} DmaOperation 
 * @returns {String} Nothing - always returns an empty string
 */
export KeFlushIoBuffers(_Mdl, ReadOperation, DmaOperation) {
    DllCall("ntoskrnl.exe\KeFlushIoBuffers", MDL.Ptr, _Mdl, BOOLEAN, ReadOperation, BOOLEAN, DmaOperation)
}

/**
 * 
 * @returns {Integer} 
 */
export KeGetCurrentIrql() {
    result := DllCall("ntoskrnl.exe\KeGetCurrentIrql", Int8)
    return result
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {Pointer<PKDEFERRED_ROUTINE>} DeferredRoutine 
 * @param {Pointer<Void>} DeferredContext 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeDpc(Dpc, DeferredRoutine, DeferredContext) {
    DeferredContextMarshal := DeferredContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\KeInitializeDpc", KDPC.Ptr, Dpc, "ptr", DeferredRoutine, DeferredContextMarshal, DeferredContext)
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {Pointer<PKDEFERRED_ROUTINE>} DeferredRoutine 
 * @param {Pointer<Void>} DeferredContext 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeThreadedDpc(Dpc, DeferredRoutine, DeferredContext) {
    DeferredContextMarshal := DeferredContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\KeInitializeThreadedDpc", KDPC.Ptr, Dpc, "ptr", DeferredRoutine, DeferredContextMarshal, DeferredContext)
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {Pointer<Void>} SystemArgument1 
 * @param {Pointer<Void>} SystemArgument2 
 * @returns {BOOLEAN} 
 */
export KeInsertQueueDpc(Dpc, SystemArgument1, SystemArgument2) {
    SystemArgument1Marshal := SystemArgument1 is VarRef ? "ptr" : "ptr"
    SystemArgument2Marshal := SystemArgument2 is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeInsertQueueDpc", KDPC.Ptr, Dpc, SystemArgument1Marshal, SystemArgument1, SystemArgument2Marshal, SystemArgument2, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @returns {BOOLEAN} 
 */
export KeRemoveQueueDpc(Dpc) {
    result := DllCall("ntoskrnl.exe\KeRemoveQueueDpc", KDPC.Ptr, Dpc, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {BOOLEAN} WaitIfActive 
 * @returns {BOOLEAN} 
 */
export KeRemoveQueueDpcEx(Dpc, WaitIfActive) {
    result := DllCall("ntoskrnl.exe\KeRemoveQueueDpcEx", KDPC.Ptr, Dpc, BOOLEAN, WaitIfActive, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} _DumpType 
 * @param {Integer} Flags 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<Integer>} BufferNeeded 
 * @returns {NTSTATUS} 
 */
export KeInitializeCrashDumpHeader(_DumpType, Flags, _Buffer, BufferSize, BufferNeeded) {
    BufferNeededMarshal := BufferNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeInitializeCrashDumpHeader", "uint", _DumpType, "uint", Flags, "ptr", _Buffer, "uint", BufferSize, BufferNeededMarshal, BufferNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {KDPC_IMPORTANCE} Importance 
 * @returns {String} Nothing - always returns an empty string
 */
export KeSetImportanceDpc(Dpc, Importance) {
    DllCall("ntoskrnl.exe\KeSetImportanceDpc", KDPC.Ptr, Dpc, KDPC_IMPORTANCE, Importance)
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {Integer} _Number 
 * @returns {String} Nothing - always returns an empty string
 */
export KeSetTargetProcessorDpc(Dpc, _Number) {
    DllCall("ntoskrnl.exe\KeSetTargetProcessorDpc", KDPC.Ptr, Dpc, "char", _Number)
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeFlushQueuedDpcs() {
    DllCall("ntoskrnl.exe\KeFlushQueuedDpcs")
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeDeviceQueue(DeviceQueue) {
    DllCall("ntoskrnl.exe\KeInitializeDeviceQueue", KDEVICE_QUEUE.Ptr, DeviceQueue)
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @param {Pointer<KDEVICE_QUEUE_ENTRY>} DeviceQueueEntry 
 * @returns {BOOLEAN} 
 */
export KeInsertDeviceQueue(DeviceQueue, DeviceQueueEntry) {
    result := DllCall("ntoskrnl.exe\KeInsertDeviceQueue", KDEVICE_QUEUE.Ptr, DeviceQueue, KDEVICE_QUEUE_ENTRY.Ptr, DeviceQueueEntry, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @param {Pointer<KDEVICE_QUEUE_ENTRY>} DeviceQueueEntry 
 * @param {Integer} _SortKey 
 * @returns {BOOLEAN} 
 */
export KeInsertByKeyDeviceQueue(DeviceQueue, DeviceQueueEntry, _SortKey) {
    result := DllCall("ntoskrnl.exe\KeInsertByKeyDeviceQueue", KDEVICE_QUEUE.Ptr, DeviceQueue, KDEVICE_QUEUE_ENTRY.Ptr, DeviceQueueEntry, "uint", _SortKey, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @returns {Pointer<KDEVICE_QUEUE_ENTRY>} 
 */
export KeRemoveDeviceQueue(DeviceQueue) {
    result := DllCall("ntoskrnl.exe\KeRemoveDeviceQueue", KDEVICE_QUEUE.Ptr, DeviceQueue, KDEVICE_QUEUE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @param {Integer} _SortKey 
 * @returns {Pointer<KDEVICE_QUEUE_ENTRY>} 
 */
export KeRemoveByKeyDeviceQueue(DeviceQueue, _SortKey) {
    result := DllCall("ntoskrnl.exe\KeRemoveByKeyDeviceQueue", KDEVICE_QUEUE.Ptr, DeviceQueue, "uint", _SortKey, KDEVICE_QUEUE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @param {Integer} _SortKey 
 * @returns {Pointer<KDEVICE_QUEUE_ENTRY>} 
 */
export KeRemoveByKeyDeviceQueueIfBusy(DeviceQueue, _SortKey) {
    result := DllCall("ntoskrnl.exe\KeRemoveByKeyDeviceQueueIfBusy", KDEVICE_QUEUE.Ptr, DeviceQueue, "uint", _SortKey, KDEVICE_QUEUE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
 * @param {Pointer<KDEVICE_QUEUE_ENTRY>} DeviceQueueEntry 
 * @returns {BOOLEAN} 
 */
export KeRemoveEntryDeviceQueue(DeviceQueue, DeviceQueueEntry) {
    result := DllCall("ntoskrnl.exe\KeRemoveEntryDeviceQueue", KDEVICE_QUEUE.Ptr, DeviceQueue, KDEVICE_QUEUE_ENTRY.Ptr, DeviceQueueEntry, BOOLEAN)
    return result
}

/**
 * 
 * @param {PKINTERRUPT} Interrupt 
 * @param {Pointer<PKSYNCHRONIZE_ROUTINE>} SynchronizeRoutine 
 * @param {Pointer<Void>} SynchronizeContext 
 * @returns {BOOLEAN} 
 */
export KeSynchronizeExecution(Interrupt, SynchronizeRoutine, SynchronizeContext) {
    SynchronizeContextMarshal := SynchronizeContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeSynchronizeExecution", PKINTERRUPT, Interrupt, "ptr", SynchronizeRoutine, SynchronizeContextMarshal, SynchronizeContext, BOOLEAN)
    return result
}

/**
 * 
 * @param {PKINTERRUPT} Interrupt 
 * @returns {Integer} 
 */
export KeAcquireInterruptSpinLock(Interrupt) {
    result := DllCall("ntoskrnl.exe\KeAcquireInterruptSpinLock", PKINTERRUPT, Interrupt, Int8)
    return result
}

/**
 * 
 * @param {PKINTERRUPT} Interrupt 
 * @param {Integer} OldIrql 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseInterruptSpinLock(Interrupt, OldIrql) {
    DllCall("ntoskrnl.exe\KeReleaseInterruptSpinLock", PKINTERRUPT, Interrupt, "char", OldIrql)
}

/**
 * 
 * @param {Pointer<KEVENT>} Event 
 * @param {EVENT_TYPE} Type 
 * @param {BOOLEAN} State 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeEvent(Event, Type, State) {
    DllCall("ntoskrnl.exe\KeInitializeEvent", KEVENT.Ptr, Event, EVENT_TYPE, Type, BOOLEAN, State)
}

/**
 * 
 * @param {Pointer<KEVENT>} Event 
 * @returns {String} Nothing - always returns an empty string
 */
export KeClearEvent(Event) {
    DllCall("ntoskrnl.exe\KeClearEvent", KEVENT.Ptr, Event)
}

/**
 * 
 * @param {Pointer<KEVENT>} Event 
 * @returns {Integer} 
 */
export KeReadStateEvent(Event) {
    result := DllCall("ntoskrnl.exe\KeReadStateEvent", KEVENT.Ptr, Event, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KEVENT>} Event 
 * @returns {Integer} 
 */
export KeResetEvent(Event) {
    result := DllCall("ntoskrnl.exe\KeResetEvent", KEVENT.Ptr, Event, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KEVENT>} Event 
 * @param {Integer} Increment 
 * @param {BOOLEAN} Wait 
 * @returns {Integer} 
 */
export KeSetEvent(Event, Increment, Wait) {
    result := DllCall("ntoskrnl.exe\KeSetEvent", KEVENT.Ptr, Event, "int", Increment, BOOLEAN, Wait, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KMUTANT>} Mutex 
 * @param {Integer} Level 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeMutex(Mutex, Level) {
    DllCall("ntoskrnl.exe\KeInitializeMutex", KMUTANT.Ptr, Mutex, "uint", Level)
}

/**
 * 
 * @param {Pointer<KMUTANT>} Mutex 
 * @returns {Integer} 
 */
export KeReadStateMutex(Mutex) {
    result := DllCall("ntoskrnl.exe\KeReadStateMutex", KMUTANT.Ptr, Mutex, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KMUTANT>} Mutex 
 * @param {BOOLEAN} Wait 
 * @returns {Integer} 
 */
export KeReleaseMutex(Mutex, Wait) {
    result := DllCall("ntoskrnl.exe\KeReleaseMutex", KMUTANT.Ptr, Mutex, BOOLEAN, Wait, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KSEMAPHORE>} Semaphore 
 * @param {Integer} Count 
 * @param {Integer} Limit 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeSemaphore(Semaphore, Count, Limit) {
    DllCall("ntoskrnl.exe\KeInitializeSemaphore", KSEMAPHORE.Ptr, Semaphore, "int", Count, "int", Limit)
}

/**
 * 
 * @param {Pointer<KSEMAPHORE>} Semaphore 
 * @returns {Integer} 
 */
export KeReadStateSemaphore(Semaphore) {
    result := DllCall("ntoskrnl.exe\KeReadStateSemaphore", KSEMAPHORE.Ptr, Semaphore, Int32)
    return result
}

/**
 * 
 * @param {Pointer<KSEMAPHORE>} Semaphore 
 * @param {Integer} Increment 
 * @param {Integer} Adjustment 
 * @param {BOOLEAN} Wait 
 * @returns {Integer} 
 */
export KeReleaseSemaphore(Semaphore, Increment, Adjustment, Wait) {
    result := DllCall("ntoskrnl.exe\KeReleaseSemaphore", KSEMAPHORE.Ptr, Semaphore, "int", Increment, "int", Adjustment, BOOLEAN, Wait, Int32)
    return result
}

/**
 * 
 * @param {Integer} WaitMode 
 * @param {BOOLEAN} Alertable 
 * @param {Pointer<Integer>} _Interval 
 * @returns {NTSTATUS} 
 */
export KeDelayExecutionThread(WaitMode, Alertable, _Interval) {
    _IntervalMarshal := _Interval is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeDelayExecutionThread", "char", WaitMode, BOOLEAN, Alertable, _IntervalMarshal, _Interval, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PKTHREAD} Thread 
 * @returns {Integer} 
 */
export KeQueryPriorityThread(Thread) {
    result := DllCall("ntoskrnl.exe\KeQueryPriorityThread", PKTHREAD, Thread, Int32)
    return result
}

/**
 * 
 * @param {PKTHREAD} Thread 
 * @param {Pointer<Integer>} UserTime 
 * @returns {Integer} 
 */
export KeQueryRuntimeThread(Thread, UserTime) {
    UserTimeMarshal := UserTime is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryRuntimeThread", PKTHREAD, Thread, UserTimeMarshal, UserTime, UInt32)
    return result
}

/**
 * 
 * @param {PKTHREAD} Thread 
 * @param {Pointer<Integer>} CycleTimeStamp 
 * @returns {Integer} 
 */
export KeQueryTotalCycleTimeThread(Thread, CycleTimeStamp) {
    CycleTimeStampMarshal := CycleTimeStamp is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryTotalCycleTimeThread", PKTHREAD, Thread, CycleTimeStampMarshal, CycleTimeStamp, Int64)
    return result
}

/**
 * 
 * @param {Pointer<KDPC>} Dpc 
 * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
 * @returns {NTSTATUS} 
 */
export KeSetTargetProcessorDpcEx(Dpc, ProcNumber) {
    result := DllCall("ntoskrnl.exe\KeSetTargetProcessorDpcEx", KDPC.Ptr, Dpc, PROCESSOR_NUMBER.Ptr, ProcNumber, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeRevertToUserAffinityThread() {
    DllCall("ntoskrnl.exe\KeRevertToUserAffinityThread")
}

/**
 * 
 * @param {Pointer} Affinity 
 * @returns {String} Nothing - always returns an empty string
 */
export KeSetSystemAffinityThread(Affinity) {
    DllCall("ntoskrnl.exe\KeSetSystemAffinityThread", "ptr", Affinity)
}

/**
 * 
 * @param {Pointer} Affinity 
 * @returns {String} Nothing - always returns an empty string
 */
export KeRevertToUserAffinityThreadEx(Affinity) {
    DllCall("ntoskrnl.exe\KeRevertToUserAffinityThreadEx", "ptr", Affinity)
}

/**
 * 
 * @param {Pointer<GROUP_AFFINITY>} Affinity 
 * @param {Pointer<GROUP_AFFINITY>} PreviousAffinity 
 * @returns {String} Nothing - always returns an empty string
 */
export KeSetSystemGroupAffinityThread(Affinity, PreviousAffinity) {
    DllCall("ntoskrnl.exe\KeSetSystemGroupAffinityThread", GROUP_AFFINITY.Ptr, Affinity, GROUP_AFFINITY.Ptr, PreviousAffinity)
}

/**
 * 
 * @param {Pointer<GROUP_AFFINITY>} PreviousAffinity 
 * @returns {String} Nothing - always returns an empty string
 */
export KeRevertToUserGroupAffinityThread(PreviousAffinity) {
    DllCall("ntoskrnl.exe\KeRevertToUserGroupAffinityThread", GROUP_AFFINITY.Ptr, PreviousAffinity)
}

/**
 * 
 * @param {Pointer} Affinity 
 * @returns {Pointer} 
 */
export KeSetSystemAffinityThreadEx(Affinity) {
    result := DllCall("ntoskrnl.exe\KeSetSystemAffinityThreadEx", "ptr", Affinity, IntPtr)
    return result
}

/**
 * 
 * @param {PKTHREAD} Thread 
 * @param {Integer} _Priority 
 * @returns {Integer} 
 */
export KeSetPriorityThread(Thread, _Priority) {
    result := DllCall("ntoskrnl.exe\KeSetPriorityThread", PKTHREAD, Thread, "int", _Priority, Int32)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeEnterCriticalRegion() {
    DllCall("ntoskrnl.exe\KeEnterCriticalRegion")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeLeaveCriticalRegion() {
    DllCall("ntoskrnl.exe\KeLeaveCriticalRegion")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeEnterGuardedRegion() {
    DllCall("ntoskrnl.exe\KeEnterGuardedRegion")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeLeaveGuardedRegion() {
    DllCall("ntoskrnl.exe\KeLeaveGuardedRegion")
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export KeAreApcsDisabled() {
    result := DllCall("ntoskrnl.exe\KeAreApcsDisabled", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KTIMER>} Timer 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeTimer(Timer) {
    DllCall("ntoskrnl.exe\KeInitializeTimer", KTIMER.Ptr, Timer)
}

/**
 * 
 * @param {Pointer<KTIMER>} Timer 
 * @param {TIMER_TYPE} Type 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeTimerEx(Timer, Type) {
    DllCall("ntoskrnl.exe\KeInitializeTimerEx", KTIMER.Ptr, Timer, TIMER_TYPE, Type)
}

/**
 * 
 * @param {Pointer<KTIMER>} param0 
 * @returns {BOOLEAN} 
 */
export KeCancelTimer(param0) {
    result := DllCall("ntoskrnl.exe\KeCancelTimer", KTIMER.Ptr, param0, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KTIMER>} Timer 
 * @returns {BOOLEAN} 
 */
export KeReadStateTimer(Timer) {
    result := DllCall("ntoskrnl.exe\KeReadStateTimer", KTIMER.Ptr, Timer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KTIMER>} Timer 
 * @param {Integer} DueTime 
 * @param {Pointer<KDPC>} Dpc 
 * @returns {BOOLEAN} 
 */
export KeSetTimer(Timer, DueTime, Dpc) {
    result := DllCall("ntoskrnl.exe\KeSetTimer", KTIMER.Ptr, Timer, "int64", DueTime, KDPC.Ptr, Dpc, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KTIMER>} Timer 
 * @param {Integer} DueTime 
 * @param {Integer} Period 
 * @param {Pointer<KDPC>} Dpc 
 * @returns {BOOLEAN} 
 */
export KeSetTimerEx(Timer, DueTime, Period, Dpc) {
    result := DllCall("ntoskrnl.exe\KeSetTimerEx", KTIMER.Ptr, Timer, "int64", DueTime, "int", Period, KDPC.Ptr, Dpc, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KTIMER>} Timer 
 * @param {Integer} DueTime 
 * @param {Integer} Period 
 * @param {Integer} TolerableDelay 
 * @param {Pointer<KDPC>} Dpc 
 * @returns {BOOLEAN} 
 */
export KeSetCoalescableTimer(Timer, DueTime, Period, TolerableDelay, Dpc) {
    result := DllCall("ntoskrnl.exe\KeSetCoalescableTimer", KTIMER.Ptr, Timer, "int64", DueTime, "uint", Period, "uint", TolerableDelay, KDPC.Ptr, Dpc, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} Count 
 * @param {Pointer<Pointer<Void>>} _Object 
 * @param {WAIT_TYPE} WaitType 
 * @param {KWAIT_REASON} WaitReason 
 * @param {Integer} WaitMode 
 * @param {BOOLEAN} Alertable 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<KWAIT_BLOCK>} WaitBlockArray 
 * @returns {NTSTATUS} 
 */
export KeWaitForMultipleObjects(Count, _Object, WaitType, WaitReason, WaitMode, Alertable, Timeout, WaitBlockArray) {
    _ObjectMarshal := _Object is VarRef ? "ptr*" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeWaitForMultipleObjects", "uint", Count, _ObjectMarshal, _Object, WAIT_TYPE, WaitType, KWAIT_REASON, WaitReason, "char", WaitMode, BOOLEAN, Alertable, TimeoutMarshal, Timeout, KWAIT_BLOCK.Ptr, WaitBlockArray, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {KWAIT_REASON} WaitReason 
 * @param {Integer} WaitMode 
 * @param {BOOLEAN} Alertable 
 * @param {Pointer<Integer>} Timeout 
 * @returns {NTSTATUS} 
 */
export KeWaitForSingleObject(_Object, WaitReason, WaitMode, Alertable, Timeout) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeWaitForSingleObject", _ObjectMarshal, _Object, KWAIT_REASON, WaitReason, "char", WaitMode, BOOLEAN, Alertable, TimeoutMarshal, Timeout, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PKIPI_BROADCAST_WORKER>} BroadcastFunction 
 * @param {Pointer} _Context 
 * @returns {Pointer} 
 */
export KeIpiGenericCall(BroadcastFunction, _Context) {
    result := DllCall("ntoskrnl.exe\KeIpiGenericCall", "ptr", BroadcastFunction, "ptr", _Context, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeSpinLock(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\KeInitializeSpinLock", SpinLockMarshal, SpinLock)
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @returns {BOOLEAN} 
 */
export KeTestSpinLock(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeTestSpinLock", SpinLockMarshal, SpinLock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @returns {BOOLEAN} 
 */
export KeTryToAcquireSpinLockAtDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeTryToAcquireSpinLockAtDpcLevel", SpinLockMarshal, SpinLock, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @returns {Integer} 
 */
export KeAcquireSpinLockForDpc(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeAcquireSpinLockForDpc", SpinLockMarshal, SpinLock, Int8)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @param {Integer} OldIrql 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseSpinLockForDpc(SpinLock, OldIrql) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\KeReleaseSpinLockForDpc", SpinLockMarshal, SpinLock, "char", OldIrql)
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeAcquireInStackQueuedSpinLock(SpinLock, LockHandle) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\KeAcquireInStackQueuedSpinLock", SpinLockMarshal, SpinLock, KLOCK_QUEUE_HANDLE.Ptr, LockHandle)
}

/**
 * 
 * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseInStackQueuedSpinLock(LockHandle) {
    DllCall("ntoskrnl.exe\KeReleaseInStackQueuedSpinLock", KLOCK_QUEUE_HANDLE.Ptr, LockHandle)
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeAcquireInStackQueuedSpinLockAtDpcLevel(SpinLock, LockHandle) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\KeAcquireInStackQueuedSpinLockAtDpcLevel", SpinLockMarshal, SpinLock, KLOCK_QUEUE_HANDLE.Ptr, LockHandle)
}

/**
 * 
 * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseInStackQueuedSpinLockFromDpcLevel(LockHandle) {
    DllCall("ntoskrnl.exe\KeReleaseInStackQueuedSpinLockFromDpcLevel", KLOCK_QUEUE_HANDLE.Ptr, LockHandle)
}

/**
 * 
 * @param {Pointer<Pointer>} SpinLock 
 * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeAcquireInStackQueuedSpinLockForDpc(SpinLock, LockHandle) {
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\KeAcquireInStackQueuedSpinLockForDpc", SpinLockMarshal, SpinLock, KLOCK_QUEUE_HANDLE.Ptr, LockHandle)
}

/**
 * 
 * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseInStackQueuedSpinLockForDpc(LockHandle) {
    DllCall("ntoskrnl.exe\KeReleaseInStackQueuedSpinLockForDpc", KLOCK_QUEUE_HANDLE.Ptr, LockHandle)
}

/**
 * 
 * @param {Pointer<KDPC_WATCHDOG_INFORMATION>} WatchdogInformation 
 * @returns {NTSTATUS} 
 */
export KeQueryDpcWatchdogInformation(WatchdogInformation) {
    result := DllCall("ntoskrnl.exe\KeQueryDpcWatchdogInformation", KDPC_WATCHDOG_INFORMATION.Ptr, WatchdogInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeIsExecutingDpc() {
    result := DllCall("ntoskrnl.exe\KeIsExecutingDpc", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<KBUGCHECK_CALLBACK_RECORD>} CallbackRecord 
 * @returns {BOOLEAN} 
 */
export KeDeregisterBugCheckCallback(CallbackRecord) {
    result := DllCall("ntoskrnl.exe\KeDeregisterBugCheckCallback", KBUGCHECK_CALLBACK_RECORD.Ptr, CallbackRecord, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KBUGCHECK_CALLBACK_RECORD>} CallbackRecord 
 * @param {Pointer<PKBUGCHECK_CALLBACK_ROUTINE>} CallbackRoutine 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} _Component 
 * @returns {BOOLEAN} 
 */
export KeRegisterBugCheckCallback(CallbackRecord, CallbackRoutine, _Buffer, Length, _Component) {
    _ComponentMarshal := _Component is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeRegisterBugCheckCallback", KBUGCHECK_CALLBACK_RECORD.Ptr, CallbackRecord, "ptr", CallbackRoutine, "ptr", _Buffer, "uint", Length, _ComponentMarshal, _Component, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} KtriageDumpDataArray 
 * @param {Integer} _Size 
 * @returns {NTSTATUS} 
 */
export KeInitializeTriageDumpDataArray(KtriageDumpDataArray, _Size) {
    result := DllCall("ntoskrnl.exe\KeInitializeTriageDumpDataArray", "ptr", KtriageDumpDataArray, "uint", _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KTRIAGE_DUMP_DATA_ARRAY>} KtriageDumpDataArray 
 * @param {Pointer<Void>} _Address 
 * @param {Pointer} _Size 
 * @returns {NTSTATUS} 
 */
export KeAddTriageDumpDataBlock(KtriageDumpDataArray, _Address, _Size) {
    _AddressMarshal := _Address is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeAddTriageDumpDataBlock", KTRIAGE_DUMP_DATA_ARRAY.Ptr, KtriageDumpDataArray, _AddressMarshal, _Address, "ptr", _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KBUGCHECK_REASON_CALLBACK_RECORD>} CallbackRecord 
 * @returns {BOOLEAN} 
 */
export KeDeregisterBugCheckReasonCallback(CallbackRecord) {
    result := DllCall("ntoskrnl.exe\KeDeregisterBugCheckReasonCallback", KBUGCHECK_REASON_CALLBACK_RECORD.Ptr, CallbackRecord, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<KBUGCHECK_REASON_CALLBACK_RECORD>} CallbackRecord 
 * @param {Pointer<PKBUGCHECK_REASON_CALLBACK_ROUTINE>} CallbackRoutine 
 * @param {KBUGCHECK_CALLBACK_REASON} Reason 
 * @param {Pointer<Integer>} _Component 
 * @returns {BOOLEAN} 
 */
export KeRegisterBugCheckReasonCallback(CallbackRecord, CallbackRoutine, Reason, _Component) {
    _ComponentMarshal := _Component is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeRegisterBugCheckReasonCallback", KBUGCHECK_REASON_CALLBACK_RECORD.Ptr, CallbackRecord, "ptr", CallbackRoutine, KBUGCHECK_CALLBACK_REASON, Reason, _ComponentMarshal, _Component, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PNMI_CALLBACK>} CallbackRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {Pointer<Void>} 
 */
export KeRegisterNmiCallback(CallbackRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeRegisterNmiCallback", "ptr", CallbackRoutine, _ContextMarshal, _Context, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Handle 
 * @returns {NTSTATUS} 
 */
export KeDeregisterNmiCallback(_Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeDeregisterNmiCallback", _HandleMarshal, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PBOUND_CALLBACK>} CallbackRoutine 
 * @returns {Pointer<Void>} 
 */
export KeRegisterBoundCallback(CallbackRoutine) {
    result := DllCall("ntoskrnl.exe\KeRegisterBoundCallback", "ptr", CallbackRoutine, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Handle 
 * @returns {NTSTATUS} 
 */
export KeDeregisterBoundCallback(_Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeDeregisterBoundCallback", _HandleMarshal, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {BUGCHECK_ERROR} BugCheckCode 
 * @param {Pointer} BugCheckParameter1 
 * @param {Pointer} BugCheckParameter2 
 * @param {Pointer} BugCheckParameter3 
 * @param {Pointer} BugCheckParameter4 
 * @returns {String} Nothing - always returns an empty string
 */
export KeBugCheckEx(BugCheckCode, BugCheckParameter1, BugCheckParameter2, BugCheckParameter3, BugCheckParameter4) {
    DllCall("ntoskrnl.exe\KeBugCheckEx", BUGCHECK_ERROR, BugCheckCode, "ptr", BugCheckParameter1, "ptr", BugCheckParameter2, "ptr", BugCheckParameter3, "ptr", BugCheckParameter4)
}

/**
 * 
 * @param {Pointer<Integer>} CurrentTime 
 * @returns {String} Nothing - always returns an empty string
 */
export KeQuerySystemTimePrecise(CurrentTime) {
    CurrentTimeMarshal := CurrentTime is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\KeQuerySystemTimePrecise", CurrentTimeMarshal, CurrentTime)
}

/**
 * 
 * @param {Pointer<Integer>} QpcTimeStamp 
 * @returns {Integer} 
 */
export KeQueryInterruptTimePrecise(QpcTimeStamp) {
    QpcTimeStampMarshal := QpcTimeStamp is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryInterruptTimePrecise", QpcTimeStampMarshal, QpcTimeStamp, Int64)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} QpcTimeStamp 
 * @returns {Integer} 
 */
export KeQueryUnbiasedInterruptTimePrecise(QpcTimeStamp) {
    QpcTimeStampMarshal := QpcTimeStamp is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryUnbiasedInterruptTimePrecise", QpcTimeStampMarshal, QpcTimeStamp, Int64)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeQueryTimeIncrement() {
    result := DllCall("ntoskrnl.exe\KeQueryTimeIncrement", UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeQueryUnbiasedInterruptTime() {
    result := DllCall("ntoskrnl.exe\KeQueryUnbiasedInterruptTime", Int64)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeGetRecommendedSharedDataAlignment() {
    result := DllCall("ntoskrnl.exe\KeGetRecommendedSharedDataAlignment", UInt32)
    return result
}

/**
 * 
 * @returns {Pointer} 
 */
export KeQueryActiveProcessors() {
    result := DllCall("ntoskrnl.exe\KeQueryActiveProcessors", IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} ActiveProcessors 
 * @returns {Integer} 
 */
export KeQueryActiveProcessorCount(ActiveProcessors) {
    ActiveProcessorsMarshal := ActiveProcessors is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryActiveProcessorCount", ActiveProcessorsMarshal, ActiveProcessors, UInt32)
    return result
}

/**
 * 
 * @param {Integer} GroupNumber 
 * @returns {Integer} 
 */
export KeQueryActiveProcessorCountEx(GroupNumber) {
    result := DllCall("ntoskrnl.exe\KeQueryActiveProcessorCountEx", "ushort", GroupNumber, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeQueryMaximumProcessorCount() {
    result := DllCall("ntoskrnl.exe\KeQueryMaximumProcessorCount", UInt32)
    return result
}

/**
 * 
 * @param {Integer} GroupNumber 
 * @returns {Integer} 
 */
export KeQueryMaximumProcessorCountEx(GroupNumber) {
    result := DllCall("ntoskrnl.exe\KeQueryMaximumProcessorCountEx", "ushort", GroupNumber, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeQueryActiveGroupCount() {
    result := DllCall("ntoskrnl.exe\KeQueryActiveGroupCount", UInt16)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeQueryMaximumGroupCount() {
    result := DllCall("ntoskrnl.exe\KeQueryMaximumGroupCount", UInt16)
    return result
}

/**
 * 
 * @param {Integer} GroupNumber 
 * @returns {Pointer} 
 */
export KeQueryGroupAffinity(GroupNumber) {
    result := DllCall("ntoskrnl.exe\KeQueryGroupAffinity", "ushort", GroupNumber, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
 * @returns {Integer} 
 */
export KeGetCurrentProcessorNumberEx(ProcNumber) {
    result := DllCall("ntoskrnl.exe\KeGetCurrentProcessorNumberEx", PROCESSOR_NUMBER.Ptr, ProcNumber, UInt32)
    return result
}

/**
 * 
 * @param {Integer} NodeNumber 
 * @param {Pointer<GROUP_AFFINITY>} Affinity 
 * @param {Pointer<Integer>} Count 
 * @returns {String} Nothing - always returns an empty string
 */
export KeQueryNodeActiveAffinity(NodeNumber, Affinity, Count) {
    CountMarshal := Count is VarRef ? "ushort*" : "ptr"

    DllCall("ntoskrnl.exe\KeQueryNodeActiveAffinity", "ushort", NodeNumber, GROUP_AFFINITY.Ptr, Affinity, CountMarshal, Count)
}

/**
 * 
 * @param {Integer} NodeNumber 
 * @returns {Integer} 
 */
export KeQueryNodeMaximumProcessorCount(NodeNumber) {
    result := DllCall("ntoskrnl.exe\KeQueryNodeMaximumProcessorCount", "ushort", NodeNumber, UInt16)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeQueryHighestNodeNumber() {
    result := DllCall("ntoskrnl.exe\KeQueryHighestNodeNumber", UInt16)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeGetCurrentNodeNumber() {
    result := DllCall("ntoskrnl.exe\KeGetCurrentNodeNumber", UInt16)
    return result
}

/**
 * 
 * @param {Pointer<PROCESSOR_NUMBER>} ProcessorNumber 
 * @param {LOGICAL_PROCESSOR_RELATIONSHIP} RelationshipType 
 * @param {Integer} Information 
 * @param {Pointer<Integer>} Length 
 * @returns {NTSTATUS} 
 */
export KeQueryLogicalProcessorRelationship(ProcessorNumber, RelationshipType, Information, Length) {
    LengthMarshal := Length is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryLogicalProcessorRelationship", PROCESSOR_NUMBER.Ptr, ProcessorNumber, LOGICAL_PROCESSOR_RELATIONSHIP, RelationshipType, "ptr", Information, LengthMarshal, Length, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export KeShouldYieldProcessor() {
    result := DllCall("ntoskrnl.exe\KeShouldYieldProcessor", UInt32)
    return result
}

/**
 * 
 * @param {Integer} NodeNumber 
 * @param {Pointer<GROUP_AFFINITY>} GroupAffinities 
 * @param {Integer} GroupAffinitiesCount 
 * @param {Pointer<Integer>} GroupAffinitiesRequired 
 * @returns {NTSTATUS} 
 */
export KeQueryNodeActiveAffinity2(NodeNumber, GroupAffinities, GroupAffinitiesCount, GroupAffinitiesRequired) {
    GroupAffinitiesRequiredMarshal := GroupAffinitiesRequired is VarRef ? "ushort*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryNodeActiveAffinity2", "ushort", NodeNumber, GROUP_AFFINITY.Ptr, GroupAffinities, "ushort", GroupAffinitiesCount, GroupAffinitiesRequiredMarshal, GroupAffinitiesRequired, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} NodeNumber 
 * @returns {Integer} 
 */
export KeQueryNodeActiveProcessorCount(NodeNumber) {
    result := DllCall("ntoskrnl.exe\KeQueryNodeActiveProcessorCount", "ushort", NodeNumber, UInt32)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export KeAreAllApcsDisabled() {
    result := DllCall("ntoskrnl.exe\KeAreAllApcsDisabled", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} Mutex 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInitializeGuardedMutex(Mutex) {
    DllCall("ntoskrnl.exe\KeInitializeGuardedMutex", FAST_MUTEX.Ptr, Mutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} Mutex 
 * @returns {String} Nothing - always returns an empty string
 */
export KeAcquireGuardedMutex(Mutex) {
    DllCall("ntoskrnl.exe\KeAcquireGuardedMutex", FAST_MUTEX.Ptr, Mutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} Mutex 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseGuardedMutex(Mutex) {
    DllCall("ntoskrnl.exe\KeReleaseGuardedMutex", FAST_MUTEX.Ptr, Mutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} Mutex 
 * @returns {BOOLEAN} 
 */
export KeTryToAcquireGuardedMutex(Mutex) {
    result := DllCall("ntoskrnl.exe\KeTryToAcquireGuardedMutex", FAST_MUTEX.Ptr, Mutex, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {String} Nothing - always returns an empty string
 */
export KeAcquireGuardedMutexUnsafe(FastMutex) {
    DllCall("ntoskrnl.exe\KeAcquireGuardedMutexUnsafe", FAST_MUTEX.Ptr, FastMutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {String} Nothing - always returns an empty string
 */
export KeReleaseGuardedMutexUnsafe(FastMutex) {
    DllCall("ntoskrnl.exe\KeReleaseGuardedMutexUnsafe", FAST_MUTEX.Ptr, FastMutex)
}

/**
 * 
 * @param {Pointer<PPROCESSOR_CALLBACK_FUNCTION>} CallbackFunction 
 * @param {Pointer<Void>} CallbackContext 
 * @param {Integer} Flags 
 * @returns {Pointer<Void>} 
 */
export KeRegisterProcessorChangeCallback(CallbackFunction, CallbackContext, Flags) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeRegisterProcessorChangeCallback", "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, "uint", Flags, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} CallbackHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export KeDeregisterProcessorChangeCallback(CallbackHandle) {
    CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\KeDeregisterProcessorChangeCallback", CallbackHandleMarshal, CallbackHandle)
}

/**
 * 
 * @param {Integer} ProcIndex 
 * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
 * @returns {NTSTATUS} 
 */
export KeGetProcessorNumberFromIndex(ProcIndex, ProcNumber) {
    result := DllCall("ntoskrnl.exe\KeGetProcessorNumberFromIndex", "uint", ProcIndex, PROCESSOR_NUMBER.Ptr, ProcNumber, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
 * @returns {Integer} 
 */
export KeGetProcessorIndexFromNumber(ProcNumber) {
    result := DllCall("ntoskrnl.exe\KeGetProcessorIndexFromNumber", PROCESSOR_NUMBER.Ptr, ProcNumber, UInt32)
    return result
}

/**
 * 
 * @param {Integer} Mask 
 * @param {Pointer<XSTATE_SAVE>} XStateSave 
 * @returns {NTSTATUS} 
 */
export KeSaveExtendedProcessorState(Mask, XStateSave) {
    result := DllCall("ntoskrnl.exe\KeSaveExtendedProcessorState", "uint", Mask, XSTATE_SAVE.Ptr, XStateSave, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<XSTATE_SAVE>} XStateSave 
 * @returns {String} Nothing - always returns an empty string
 */
export KeRestoreExtendedProcessorState(XStateSave) {
    DllCall("ntoskrnl.exe\KeRestoreExtendedProcessorState", XSTATE_SAVE.Ptr, XStateSave)
}

/**
 * 
 * @param {Integer} AuxiliaryCounterValue 
 * @param {Pointer<Integer>} PerformanceCounterValue 
 * @param {Pointer<Integer>} ConversionError 
 * @returns {NTSTATUS} 
 */
export KeConvertAuxiliaryCounterToPerformanceCounter(AuxiliaryCounterValue, PerformanceCounterValue, ConversionError) {
    PerformanceCounterValueMarshal := PerformanceCounterValue is VarRef ? "uint*" : "ptr"
    ConversionErrorMarshal := ConversionError is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeConvertAuxiliaryCounterToPerformanceCounter", "uint", AuxiliaryCounterValue, PerformanceCounterValueMarshal, PerformanceCounterValue, ConversionErrorMarshal, ConversionError, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} PerformanceCounterValue 
 * @param {Pointer<Integer>} AuxiliaryCounterValue 
 * @param {Pointer<Integer>} ConversionError 
 * @returns {NTSTATUS} 
 */
export KeConvertPerformanceCounterToAuxiliaryCounter(PerformanceCounterValue, AuxiliaryCounterValue, ConversionError) {
    AuxiliaryCounterValueMarshal := AuxiliaryCounterValue is VarRef ? "uint*" : "ptr"
    ConversionErrorMarshal := ConversionError is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeConvertPerformanceCounterToAuxiliaryCounter", "uint", PerformanceCounterValue, AuxiliaryCounterValueMarshal, AuxiliaryCounterValue, ConversionErrorMarshal, ConversionError, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} AuxiliaryCounterFrequency 
 * @returns {NTSTATUS} 
 */
export KeQueryAuxiliaryCounterFrequency(AuxiliaryCounterFrequency) {
    AuxiliaryCounterFrequencyMarshal := AuxiliaryCounterFrequency is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryAuxiliaryCounterFrequency", AuxiliaryCounterFrequencyMarshal, AuxiliaryCounterFrequency, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {NTSTATUS} 
 */
export KdDisableDebugger() {
    result := DllCall("ntoskrnl.exe\KdDisableDebugger", NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {NTSTATUS} 
 */
export KdEnableDebugger() {
    result := DllCall("ntoskrnl.exe\KdEnableDebugger", NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export KdRefreshDebuggerNotPresent() {
    result := DllCall("ntoskrnl.exe\KdRefreshDebuggerNotPresent", BOOLEAN)
    return result
}

/**
 * 
 * @param {KD_OPTION} Option 
 * @param {Integer} InBufferBytes 
 * @param {Pointer<Void>} InBuffer 
 * @param {Integer} OutBufferBytes 
 * @param {Pointer<Void>} OutBuffer 
 * @param {Pointer<Integer>} OutBufferNeeded 
 * @returns {NTSTATUS} 
 */
export KdChangeOption(Option, InBufferBytes, InBuffer, OutBufferBytes, OutBuffer, OutBufferNeeded) {
    InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
    OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
    OutBufferNeededMarshal := OutBufferNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KdChangeOption", KD_OPTION, Option, "uint", InBufferBytes, InBufferMarshal, InBuffer, "uint", OutBufferBytes, OutBufferMarshal, OutBuffer, OutBufferNeededMarshal, OutBufferNeeded, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} NumberOfBytes 
 * @returns {Pointer<Void>} 
 * @deprecated ExAllocatePool is deprecated, use ExAllocatePool2.
 */
export ExAllocatePool(PoolType, NumberOfBytes) {
    result := DllCall("ntoskrnl.exe\ExAllocatePool", POOL_TYPE, PoolType, "ptr", NumberOfBytes, IntPtr)
    return result
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} NumberOfBytes 
 * @returns {Pointer<Void>} 
 * @deprecated ExAllocatePoolWithQuota is deprecated, use ExAllocatePool2.
 */
export ExAllocatePoolWithQuota(PoolType, NumberOfBytes) {
    result := DllCall("ntoskrnl.exe\ExAllocatePoolWithQuota", POOL_TYPE, PoolType, "ptr", NumberOfBytes, IntPtr)
    return result
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Tag 
 * @returns {Pointer<Void>} 
 * @deprecated ExAllocatePoolWithTag is deprecated, use ExAllocatePool2.
 */
export ExAllocatePoolWithTag(PoolType, NumberOfBytes, Tag) {
    result := DllCall("ntoskrnl.exe\ExAllocatePoolWithTag", POOL_TYPE, PoolType, "ptr", NumberOfBytes, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Tag 
 * @param {EX_POOL_PRIORITY} _Priority 
 * @returns {Pointer<Void>} 
 * @deprecated ExAllocatePoolWithTagPriority is deprecated, use ExAllocatePool3.
 */
export ExAllocatePoolWithTagPriority(PoolType, NumberOfBytes, Tag, _Priority) {
    result := DllCall("ntoskrnl.exe\ExAllocatePoolWithTagPriority", POOL_TYPE, PoolType, "ptr", NumberOfBytes, "uint", Tag, EX_POOL_PRIORITY, _Priority, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Tag 
 * @returns {Pointer<Void>} 
 */
export ExAllocatePool2(Flags, NumberOfBytes, Tag) {
    result := DllCall("ntoskrnl.exe\ExAllocatePool2", "uint", Flags, "ptr", NumberOfBytes, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Tag 
 * @param {Pointer<POOL_EXTENDED_PARAMETER>} ExtendedParameters 
 * @param {Integer} ExtendedParametersCount 
 * @returns {Pointer<Void>} 
 */
export ExAllocatePool3(Flags, NumberOfBytes, Tag, ExtendedParameters, ExtendedParametersCount) {
    result := DllCall("ntoskrnl.exe\ExAllocatePool3", "uint", Flags, "ptr", NumberOfBytes, "uint", Tag, POOL_EXTENDED_PARAMETER.Ptr, ExtendedParameters, "uint", ExtendedParametersCount, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} P 
 * @param {Integer} Tag 
 * @param {Pointer<POOL_EXTENDED_PARAMETER>} ExtendedParameters 
 * @param {Integer} ExtendedParametersCount 
 * @returns {String} Nothing - always returns an empty string
 */
export ExFreePool2(P, Tag, ExtendedParameters, ExtendedParametersCount) {
    PMarshal := P is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExFreePool2", PMarshal, P, "uint", Tag, POOL_EXTENDED_PARAMETER.Ptr, ExtendedParameters, "uint", ExtendedParametersCount)
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer} Tag 
 * @param {Pointer<POOL_CREATE_EXTENDED_PARAMS>} Params 
 * @param {Pointer<HANDLE>} PoolHandle 
 * @returns {NTSTATUS} 
 */
export ExCreatePool(Flags, Tag, Params, PoolHandle) {
    result := DllCall("ntoskrnl.exe\ExCreatePool", "uint", Flags, "ptr", Tag, POOL_CREATE_EXTENDED_PARAMS.Ptr, Params, HANDLE.Ptr, PoolHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} PoolHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export ExDestroyPool(PoolHandle) {
    DllCall("ntoskrnl.exe\ExDestroyPool", HANDLE, PoolHandle)
}

/**
 * 
 * @param {HANDLE} SecurePoolHandle 
 * @param {Integer} Tag 
 * @param {Pointer<Void>} Allocation 
 * @param {Pointer} Cookie 
 * @param {Pointer} Offset 
 * @param {Pointer} _Size 
 * @param {Pointer<Void>} _Buffer 
 * @returns {NTSTATUS} 
 */
export ExSecurePoolUpdate(SecurePoolHandle, Tag, Allocation, Cookie, Offset, _Size, _Buffer) {
    AllocationMarshal := Allocation is VarRef ? "ptr" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExSecurePoolUpdate", HANDLE, SecurePoolHandle, "uint", Tag, AllocationMarshal, Allocation, "ptr", Cookie, "ptr", Offset, "ptr", _Size, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} SecurePoolHandle 
 * @param {Integer} Tag 
 * @param {Pointer<Void>} Allocation 
 * @param {Pointer} Cookie 
 * @returns {Integer} 
 */
export ExSecurePoolValidate(SecurePoolHandle, Tag, Allocation, Cookie) {
    AllocationMarshal := Allocation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExSecurePoolValidate", HANDLE, SecurePoolHandle, "uint", Tag, AllocationMarshal, Allocation, "ptr", Cookie, UInt32)
    return result
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Tag 
 * @returns {Pointer<Void>} 
 * @deprecated ExAllocatePoolWithQuotaTag is deprecated, use ExAllocatePool2.
 */
export ExAllocatePoolWithQuotaTag(PoolType, NumberOfBytes, Tag) {
    result := DllCall("ntoskrnl.exe\ExAllocatePoolWithQuotaTag", POOL_TYPE, PoolType, "ptr", NumberOfBytes, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} P 
 * @returns {String} Nothing - always returns an empty string
 */
export ExFreePool(P) {
    PMarshal := P is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExFreePool", PMarshal, P)
}

/**
 * 
 * @param {Pointer<Void>} P 
 * @param {Integer} Tag 
 * @returns {String} Nothing - always returns an empty string
 */
export ExFreePoolWithTag(P, Tag) {
    PMarshal := P is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExFreePoolWithTag", PMarshal, P, "uint", Tag)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {String} Nothing - always returns an empty string
 */
export ExAcquireFastMutexUnsafe(FastMutex) {
    DllCall("ntoskrnl.exe\ExAcquireFastMutexUnsafe", FAST_MUTEX.Ptr, FastMutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseFastMutexUnsafe(FastMutex) {
    DllCall("ntoskrnl.exe\ExReleaseFastMutexUnsafe", FAST_MUTEX.Ptr, FastMutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {String} Nothing - always returns an empty string
 */
export ExAcquireFastMutex(FastMutex) {
    DllCall("ntoskrnl.exe\ExAcquireFastMutex", FAST_MUTEX.Ptr, FastMutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseFastMutex(FastMutex) {
    DllCall("ntoskrnl.exe\ExReleaseFastMutex", FAST_MUTEX.Ptr, FastMutex)
}

/**
 * 
 * @param {Pointer<FAST_MUTEX>} FastMutex 
 * @returns {BOOLEAN} 
 */
export ExTryToAcquireFastMutex(FastMutex) {
    result := DllCall("ntoskrnl.exe\ExTryToAcquireFastMutex", FAST_MUTEX.Ptr, FastMutex, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Addend 
 * @param {Integer} Increment 
 * @param {Pointer<Pointer>} Lock 
 * @returns {Integer} 
 */
export ExInterlockedAddLargeInteger(Addend, Increment, Lock) {
    AddendMarshal := Addend is VarRef ? "int64*" : "ptr"
    LockMarshal := Lock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExInterlockedAddLargeInteger", AddendMarshal, Addend, "int64", Increment, LockMarshal, Lock, Int64)
    return result
}

/**
 * 
 * @param {Integer} _Address 
 * @param {Pointer} Length 
 * @param {Integer} Alignment 
 * @returns {String} Nothing - always returns an empty string
 */
export ProbeForRead(_Address, Length, Alignment) {
    DllCall("ntoskrnl.exe\ProbeForRead", "ptr", _Address, "ptr", Length, "uint", Alignment)
}

/**
 * 
 * @param {NTSTATUS} _Status 
 * @returns {String} Nothing - always returns an empty string
 */
export ExRaiseStatus(_Status) {
    DllCall("ntoskrnl.exe\ExRaiseStatus", NTSTATUS, _Status)
}

/**
 * 
 * @param {Integer} _Address 
 * @param {Pointer} Length 
 * @param {Integer} Alignment 
 * @returns {String} Nothing - always returns an empty string
 */
export ProbeForWrite(_Address, Length, Alignment) {
    DllCall("ntoskrnl.exe\ProbeForWrite", "ptr", _Address, "ptr", Length, "uint", Alignment)
}

/**
 * 
 * @param {Pointer<WORK_QUEUE_ITEM>} WorkItem 
 * @param {WORK_QUEUE_TYPE} QueueType 
 * @returns {String} Nothing - always returns an empty string
 */
export ExQueueWorkItem(WorkItem, QueueType) {
    DllCall("ntoskrnl.exe\ExQueueWorkItem", WORK_QUEUE_ITEM.Ptr, WorkItem, WORK_QUEUE_TYPE, QueueType)
}

/**
 * 
 * @param {Integer} ProcessorFeature 
 * @returns {BOOLEAN} 
 */
export ExIsProcessorFeaturePresent(ProcessorFeature) {
    result := DllCall("ntoskrnl.exe\ExIsProcessorFeaturePresent", "uint", ProcessorFeature, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {NTSTATUS} 
 */
export ExInitializeResourceLite(Resource) {
    result := DllCall("ntoskrnl.exe\ExInitializeResourceLite", ERESOURCE.Ptr, Resource, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {NTSTATUS} 
 */
export ExReinitializeResourceLite(Resource) {
    result := DllCall("ntoskrnl.exe\ExReinitializeResourceLite", ERESOURCE.Ptr, Resource, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {BOOLEAN} Wait 
 * @returns {BOOLEAN} 
 */
export ExAcquireResourceSharedLite(Resource, Wait) {
    result := DllCall("ntoskrnl.exe\ExAcquireResourceSharedLite", ERESOURCE.Ptr, Resource, BOOLEAN, Wait, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {Pointer<Void>} 
 */
export ExEnterCriticalRegionAndAcquireResourceShared(Resource) {
    result := DllCall("ntoskrnl.exe\ExEnterCriticalRegionAndAcquireResourceShared", ERESOURCE.Ptr, Resource, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {BOOLEAN} Wait 
 * @returns {BOOLEAN} 
 */
export ExAcquireResourceExclusiveLite(Resource, Wait) {
    result := DllCall("ntoskrnl.exe\ExAcquireResourceExclusiveLite", ERESOURCE.Ptr, Resource, BOOLEAN, Wait, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {Pointer<Void>} 
 */
export ExEnterCriticalRegionAndAcquireResourceExclusive(Resource) {
    result := DllCall("ntoskrnl.exe\ExEnterCriticalRegionAndAcquireResourceExclusive", ERESOURCE.Ptr, Resource, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {BOOLEAN} Wait 
 * @returns {BOOLEAN} 
 */
export ExAcquireSharedStarveExclusive(Resource, Wait) {
    result := DllCall("ntoskrnl.exe\ExAcquireSharedStarveExclusive", ERESOURCE.Ptr, Resource, BOOLEAN, Wait, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {BOOLEAN} Wait 
 * @returns {BOOLEAN} 
 */
export ExAcquireSharedWaitForExclusive(Resource, Wait) {
    result := DllCall("ntoskrnl.exe\ExAcquireSharedWaitForExclusive", ERESOURCE.Ptr, Resource, BOOLEAN, Wait, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {Pointer<Void>} 
 */
export ExEnterCriticalRegionAndAcquireSharedWaitForExclusive(Resource) {
    result := DllCall("ntoskrnl.exe\ExEnterCriticalRegionAndAcquireSharedWaitForExclusive", ERESOURCE.Ptr, Resource, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseResourceLite(Resource) {
    DllCall("ntoskrnl.exe\ExReleaseResourceLite", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseResourceAndLeaveCriticalRegion(Resource) {
    DllCall("ntoskrnl.exe\ExReleaseResourceAndLeaveCriticalRegion", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {Pointer} ResourceThreadId 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseResourceForThreadLite(Resource, ResourceThreadId) {
    DllCall("ntoskrnl.exe\ExReleaseResourceForThreadLite", ERESOURCE.Ptr, Resource, "ptr", ResourceThreadId)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {Pointer<Void>} OwnerPointer 
 * @returns {String} Nothing - always returns an empty string
 */
export ExSetResourceOwnerPointer(Resource, OwnerPointer) {
    OwnerPointerMarshal := OwnerPointer is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExSetResourceOwnerPointer", ERESOURCE.Ptr, Resource, OwnerPointerMarshal, OwnerPointer)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @param {Pointer<Void>} OwnerPointer 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export ExSetResourceOwnerPointerEx(Resource, OwnerPointer, Flags) {
    OwnerPointerMarshal := OwnerPointer is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExSetResourceOwnerPointerEx", ERESOURCE.Ptr, Resource, OwnerPointerMarshal, OwnerPointer, "uint", Flags)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {String} Nothing - always returns an empty string
 */
export ExConvertExclusiveToSharedLite(Resource) {
    DllCall("ntoskrnl.exe\ExConvertExclusiveToSharedLite", ERESOURCE.Ptr, Resource)
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {NTSTATUS} 
 */
export ExDeleteResourceLite(Resource) {
    result := DllCall("ntoskrnl.exe\ExDeleteResourceLite", ERESOURCE.Ptr, Resource, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {Integer} 
 */
export ExGetExclusiveWaiterCount(Resource) {
    result := DllCall("ntoskrnl.exe\ExGetExclusiveWaiterCount", ERESOURCE.Ptr, Resource, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {Integer} 
 */
export ExGetSharedWaiterCount(Resource) {
    result := DllCall("ntoskrnl.exe\ExGetSharedWaiterCount", ERESOURCE.Ptr, Resource, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {BOOLEAN} 
 */
export ExIsResourceAcquiredExclusiveLite(Resource) {
    result := DllCall("ntoskrnl.exe\ExIsResourceAcquiredExclusiveLite", ERESOURCE.Ptr, Resource, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<ERESOURCE>} Resource 
 * @returns {Integer} 
 */
export ExIsResourceAcquiredSharedLite(Resource) {
    result := DllCall("ntoskrnl.exe\ExIsResourceAcquiredSharedLite", ERESOURCE.Ptr, Resource, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export ExGetPreviousMode() {
    result := DllCall("ntoskrnl.exe\ExGetPreviousMode", Int8)
    return result
}

/**
 * 
 * @param {Integer} DesiredTime 
 * @param {BOOLEAN} SetResolution 
 * @returns {Integer} 
 */
export ExSetTimerResolution(DesiredTime, SetResolution) {
    result := DllCall("ntoskrnl.exe\ExSetTimerResolution", "uint", DesiredTime, BOOLEAN, SetResolution, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} MaximumTime 
 * @param {Pointer<Integer>} MinimumTime 
 * @param {Pointer<Integer>} CurrentTime 
 * @returns {String} Nothing - always returns an empty string
 */
export ExQueryTimerResolution(MaximumTime, MinimumTime, CurrentTime) {
    MaximumTimeMarshal := MaximumTime is VarRef ? "uint*" : "ptr"
    MinimumTimeMarshal := MinimumTime is VarRef ? "uint*" : "ptr"
    CurrentTimeMarshal := CurrentTime is VarRef ? "uint*" : "ptr"

    DllCall("ntoskrnl.exe\ExQueryTimerResolution", MaximumTimeMarshal, MaximumTime, MinimumTimeMarshal, MinimumTime, CurrentTimeMarshal, CurrentTime)
}

/**
 * 
 * @param {Pointer<Integer>} _SystemTime 
 * @param {Pointer<Integer>} LocalTime 
 * @returns {String} Nothing - always returns an empty string
 */
export ExSystemTimeToLocalTime(_SystemTime, LocalTime) {
    _SystemTimeMarshal := _SystemTime is VarRef ? "int64*" : "ptr"
    LocalTimeMarshal := LocalTime is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\ExSystemTimeToLocalTime", _SystemTimeMarshal, _SystemTime, LocalTimeMarshal, LocalTime)
}

/**
 * 
 * @param {Pointer<Integer>} LocalTime 
 * @param {Pointer<Integer>} _SystemTime 
 * @returns {String} Nothing - always returns an empty string
 */
export ExLocalTimeToSystemTime(LocalTime, _SystemTime) {
    LocalTimeMarshal := LocalTime is VarRef ? "int64*" : "ptr"
    _SystemTimeMarshal := _SystemTime is VarRef ? "int64*" : "ptr"

    DllCall("ntoskrnl.exe\ExLocalTimeToSystemTime", LocalTimeMarshal, LocalTime, _SystemTimeMarshal, _SystemTime)
}

/**
 * 
 * @param {Pointer<PEXT_CALLBACK>} Callback 
 * @param {Pointer<Void>} CallbackContext 
 * @param {Integer} Attributes 
 * @returns {PEX_TIMER} 
 */
export ExAllocateTimer(Callback, CallbackContext, Attributes) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExAllocateTimer", "ptr", Callback, CallbackContextMarshal, CallbackContext, "uint", Attributes, PEX_TIMER)
    return result
}

/**
 * 
 * @param {PEX_TIMER} Timer 
 * @param {Integer} DueTime 
 * @param {Integer} Period 
 * @param {Pointer<_EXT_SET_PARAMETERS_V0>} Parameters 
 * @returns {BOOLEAN} 
 */
export ExSetTimer(Timer, DueTime, Period, Parameters) {
    result := DllCall("ntoskrnl.exe\ExSetTimer", PEX_TIMER, Timer, "int64", DueTime, "int64", Period, _EXT_SET_PARAMETERS_V0.Ptr, Parameters, BOOLEAN)
    return result
}

/**
 * 
 * @param {PEX_TIMER} Timer 
 * @param {Pointer<Void>} Parameters 
 * @returns {BOOLEAN} 
 */
export ExCancelTimer(Timer, Parameters) {
    ParametersMarshal := Parameters is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExCancelTimer", PEX_TIMER, Timer, ParametersMarshal, Parameters, BOOLEAN)
    return result
}

/**
 * 
 * @param {PEX_TIMER} Timer 
 * @param {BOOLEAN} Cancel 
 * @param {BOOLEAN} Wait 
 * @param {Pointer<EXT_DELETE_PARAMETERS>} Parameters 
 * @returns {BOOLEAN} 
 */
export ExDeleteTimer(Timer, Cancel, Wait, Parameters) {
    result := DllCall("ntoskrnl.exe\ExDeleteTimer", PEX_TIMER, Timer, BOOLEAN, Cancel, BOOLEAN, Wait, EXT_DELETE_PARAMETERS.Ptr, Parameters, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PCALLBACK_OBJECT>} CallbackObject 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {BOOLEAN} Create 
 * @param {BOOLEAN} AllowMultipleCallbacks 
 * @returns {NTSTATUS} 
 */
export ExCreateCallback(CallbackObject, ObjectAttributes, Create, AllowMultipleCallbacks) {
    CallbackObjectMarshal := CallbackObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExCreateCallback", CallbackObjectMarshal, CallbackObject, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, BOOLEAN, Create, BOOLEAN, AllowMultipleCallbacks, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PCALLBACK_OBJECT} CallbackObject 
 * @param {Pointer<PCALLBACK_FUNCTION>} CallbackFunction 
 * @param {Pointer<Void>} CallbackContext 
 * @returns {Pointer<Void>} 
 */
export ExRegisterCallback(CallbackObject, CallbackFunction, CallbackContext) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExRegisterCallback", PCALLBACK_OBJECT, CallbackObject, "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} CallbackRegistration 
 * @returns {String} Nothing - always returns an empty string
 */
export ExUnregisterCallback(CallbackRegistration) {
    CallbackRegistrationMarshal := CallbackRegistration is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExUnregisterCallback", CallbackRegistrationMarshal, CallbackRegistration)
}

/**
 * 
 * @param {Pointer<Void>} CallbackObject 
 * @param {Pointer<Void>} Argument1 
 * @param {Pointer<Void>} Argument2 
 * @returns {String} Nothing - always returns an empty string
 */
export ExNotifyCallback(CallbackObject, Argument1, Argument2) {
    CallbackObjectMarshal := CallbackObject is VarRef ? "ptr" : "ptr"
    Argument1Marshal := Argument1 is VarRef ? "ptr" : "ptr"
    Argument2Marshal := Argument2 is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ExNotifyCallback", CallbackObjectMarshal, CallbackObject, Argument1Marshal, Argument1, Argument2Marshal, Argument2)
}

/**
 * 
 * @param {SUITE_TYPE} SuiteType 
 * @returns {BOOLEAN} 
 */
export ExVerifySuite(SuiteType) {
    result := DllCall("ntoskrnl.exe\ExVerifySuite", SUITE_TYPE, SuiteType, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @returns {String} Nothing - always returns an empty string
 */
export ExInitializeRundownProtection(RunRef) {
    DllCall("ntoskrnl.exe\ExInitializeRundownProtection", EX_RUNDOWN_REF.Ptr, RunRef)
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReInitializeRundownProtection(RunRef) {
    DllCall("ntoskrnl.exe\ExReInitializeRundownProtection", EX_RUNDOWN_REF.Ptr, RunRef)
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @returns {BOOLEAN} 
 */
export ExAcquireRundownProtection(RunRef) {
    result := DllCall("ntoskrnl.exe\ExAcquireRundownProtection", EX_RUNDOWN_REF.Ptr, RunRef, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @param {Integer} Count 
 * @returns {BOOLEAN} 
 */
export ExAcquireRundownProtectionEx(RunRef, Count) {
    result := DllCall("ntoskrnl.exe\ExAcquireRundownProtectionEx", EX_RUNDOWN_REF.Ptr, RunRef, "uint", Count, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseRundownProtection(RunRef) {
    DllCall("ntoskrnl.exe\ExReleaseRundownProtection", EX_RUNDOWN_REF.Ptr, RunRef)
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @param {Integer} Count 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseRundownProtectionEx(RunRef, Count) {
    DllCall("ntoskrnl.exe\ExReleaseRundownProtectionEx", EX_RUNDOWN_REF.Ptr, RunRef, "uint", Count)
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @returns {String} Nothing - always returns an empty string
 */
export ExRundownCompleted(RunRef) {
    DllCall("ntoskrnl.exe\ExRundownCompleted", EX_RUNDOWN_REF.Ptr, RunRef)
}

/**
 * 
 * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
 * @returns {String} Nothing - always returns an empty string
 */
export ExWaitForRundownProtectionRelease(RunRef) {
    DllCall("ntoskrnl.exe\ExWaitForRundownProtectionRelease", EX_RUNDOWN_REF.Ptr, RunRef)
}

/**
 * 
 * @param {POOL_TYPE} PoolType 
 * @param {Integer} PoolTag 
 * @returns {PEX_RUNDOWN_REF_CACHE_AWARE} 
 */
export ExAllocateCacheAwareRundownProtection(PoolType, PoolTag) {
    result := DllCall("ntoskrnl.exe\ExAllocateCacheAwareRundownProtection", POOL_TYPE, PoolType, "uint", PoolTag, PEX_RUNDOWN_REF_CACHE_AWARE)
    return result
}

/**
 * 
 * @returns {Pointer} 
 */
export ExSizeOfRundownProtectionCacheAware() {
    result := DllCall("ntoskrnl.exe\ExSizeOfRundownProtectionCacheAware", IntPtr)
    return result
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @param {Pointer} RunRefSize 
 * @returns {String} Nothing - always returns an empty string
 */
export ExInitializeRundownProtectionCacheAware(RunRefCacheAware, RunRefSize) {
    DllCall("ntoskrnl.exe\ExInitializeRundownProtectionCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware, "ptr", RunRefSize)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @returns {String} Nothing - always returns an empty string
 */
export ExFreeCacheAwareRundownProtection(RunRefCacheAware) {
    DllCall("ntoskrnl.exe\ExFreeCacheAwareRundownProtection", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @returns {BOOLEAN} 
 */
export ExAcquireRundownProtectionCacheAware(RunRefCacheAware) {
    result := DllCall("ntoskrnl.exe\ExAcquireRundownProtectionCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware, BOOLEAN)
    return result
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseRundownProtectionCacheAware(RunRefCacheAware) {
    DllCall("ntoskrnl.exe\ExReleaseRundownProtectionCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @param {Integer} Count 
 * @returns {BOOLEAN} 
 */
export ExAcquireRundownProtectionCacheAwareEx(RunRefCacheAware, Count) {
    result := DllCall("ntoskrnl.exe\ExAcquireRundownProtectionCacheAwareEx", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware, "uint", Count, BOOLEAN)
    return result
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRef 
 * @param {Integer} Count 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseRundownProtectionCacheAwareEx(RunRef, Count) {
    DllCall("ntoskrnl.exe\ExReleaseRundownProtectionCacheAwareEx", PEX_RUNDOWN_REF_CACHE_AWARE, RunRef, "uint", Count)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRef 
 * @returns {String} Nothing - always returns an empty string
 */
export ExWaitForRundownProtectionReleaseCacheAware(RunRef) {
    DllCall("ntoskrnl.exe\ExWaitForRundownProtectionReleaseCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRef)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReInitializeRundownProtectionCacheAware(RunRefCacheAware) {
    DllCall("ntoskrnl.exe\ExReInitializeRundownProtectionCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @returns {String} Nothing - always returns an empty string
 */
export ExRundownCompletedCacheAware(RunRefCacheAware) {
    DllCall("ntoskrnl.exe\ExRundownCompletedCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export ExInitializeRundownProtectionCacheAwareEx(RunRefCacheAware, Flags) {
    DllCall("ntoskrnl.exe\ExInitializeRundownProtectionCacheAwareEx", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware, "uint", Flags)
}

/**
 * 
 * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
 * @returns {String} Nothing - always returns an empty string
 */
export ExCleanupRundownProtectionCacheAware(RunRefCacheAware) {
    DllCall("ntoskrnl.exe\ExCleanupRundownProtectionCacheAware", PEX_RUNDOWN_REF_CACHE_AWARE, RunRefCacheAware)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @returns {String} Nothing - always returns an empty string
 */
export ExInitializePushLock(PushLock) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\ExInitializePushLock", PushLockMarshal, PushLock)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export ExAcquirePushLockExclusiveEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\ExAcquirePushLockExclusiveEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export ExAcquirePushLockSharedEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\ExAcquirePushLockSharedEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleasePushLockExclusiveEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\ExReleasePushLockExclusiveEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Pointer>} PushLock 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleasePushLockSharedEx(PushLock, Flags) {
    PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\ExReleasePushLockSharedEx", PushLockMarshal, PushLock, "uint", Flags)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {String} Nothing - always returns an empty string
 */
export ExAcquireSpinLockSharedAtDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    DllCall("ntoskrnl.exe\ExAcquireSpinLockSharedAtDpcLevel", SpinLockMarshal, SpinLock)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {Integer} 
 */
export ExAcquireSpinLockShared(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExAcquireSpinLockShared", SpinLockMarshal, SpinLock, Int8)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseSpinLockSharedFromDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    DllCall("ntoskrnl.exe\ExReleaseSpinLockSharedFromDpcLevel", SpinLockMarshal, SpinLock)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @param {Integer} OldIrql 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseSpinLockShared(SpinLock, OldIrql) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    DllCall("ntoskrnl.exe\ExReleaseSpinLockShared", SpinLockMarshal, SpinLock, "char", OldIrql)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {Integer} 
 */
export ExTryConvertSharedSpinLockExclusive(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExTryConvertSharedSpinLockExclusive", SpinLockMarshal, SpinLock, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {String} Nothing - always returns an empty string
 */
export ExAcquireSpinLockExclusiveAtDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    DllCall("ntoskrnl.exe\ExAcquireSpinLockExclusiveAtDpcLevel", SpinLockMarshal, SpinLock)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {Integer} 
 */
export ExAcquireSpinLockExclusive(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExAcquireSpinLockExclusive", SpinLockMarshal, SpinLock, Int8)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseSpinLockExclusiveFromDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    DllCall("ntoskrnl.exe\ExReleaseSpinLockExclusiveFromDpcLevel", SpinLockMarshal, SpinLock)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @param {Integer} OldIrql 
 * @returns {String} Nothing - always returns an empty string
 */
export ExReleaseSpinLockExclusive(SpinLock, OldIrql) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    DllCall("ntoskrnl.exe\ExReleaseSpinLockExclusive", SpinLockMarshal, SpinLock, "char", OldIrql)
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {Integer} 
 */
export ExTryAcquireSpinLockSharedAtDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExTryAcquireSpinLockSharedAtDpcLevel", SpinLockMarshal, SpinLock, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} SpinLock 
 * @returns {Integer} 
 */
export ExTryAcquireSpinLockExclusiveAtDpcLevel(SpinLock) {
    SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExTryAcquireSpinLockExclusiveAtDpcLevel", SpinLockMarshal, SpinLock, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VariableName 
 * @param {Pointer<Guid>} VendorGuid 
 * @param {Integer} Value 
 * @param {Pointer<Integer>} ValueLength 
 * @param {Pointer<Integer>} Attributes 
 * @returns {NTSTATUS} 
 */
export ExGetFirmwareEnvironmentVariable(VariableName, VendorGuid, Value, ValueLength, Attributes) {
    ValueLengthMarshal := ValueLength is VarRef ? "uint*" : "ptr"
    AttributesMarshal := Attributes is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExGetFirmwareEnvironmentVariable", UNICODE_STRING.Ptr, VariableName, Guid.Ptr, VendorGuid, "ptr", Value, ValueLengthMarshal, ValueLength, AttributesMarshal, Attributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VariableName 
 * @param {Pointer<Guid>} VendorGuid 
 * @param {Integer} Value 
 * @param {Integer} ValueLength 
 * @param {Integer} Attributes 
 * @returns {NTSTATUS} 
 */
export ExSetFirmwareEnvironmentVariable(VariableName, VendorGuid, Value, ValueLength, Attributes) {
    result := DllCall("ntoskrnl.exe\ExSetFirmwareEnvironmentVariable", UNICODE_STRING.Ptr, VariableName, Guid.Ptr, VendorGuid, "ptr", Value, "uint", ValueLength, "uint", Attributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export ExIsManufacturingModeEnabled() {
    result := DllCall("ntoskrnl.exe\ExIsManufacturingModeEnabled", BOOLEAN)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export ExIsSoftBoot() {
    result := DllCall("ntoskrnl.exe\ExIsSoftBoot", BOOLEAN)
    return result
}

/**
 * 
 * @returns {FIRMWARE_TYPE} 
 */
export ExGetFirmwareType() {
    result := DllCall("ntoskrnl.exe\ExGetFirmwareType", FIRMWARE_TYPE)
    return result
}

/**
 * 
 * @param {Integer} FirmwareTableProviderSignature 
 * @param {Integer} FirmwareTableBuffer 
 * @param {Integer} BufferLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ExEnumerateSystemFirmwareTables(FirmwareTableProviderSignature, FirmwareTableBuffer, BufferLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExEnumerateSystemFirmwareTables", "uint", FirmwareTableProviderSignature, "ptr", FirmwareTableBuffer, "uint", BufferLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} FirmwareTableProviderSignature 
 * @param {Integer} FirmwareTableID 
 * @param {Integer} FirmwareTableBuffer 
 * @param {Integer} BufferLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ExGetSystemFirmwareTable(FirmwareTableProviderSignature, FirmwareTableID, FirmwareTableBuffer, BufferLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExGetSystemFirmwareTable", "uint", FirmwareTableProviderSignature, "uint", FirmwareTableID, "ptr", FirmwareTableBuffer, "uint", BufferLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PEX_CALLBACK_FUNCTION>} Function 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<Integer>} Cookie 
 * @returns {NTSTATUS} 
 */
export CmRegisterCallback(Function, _Context, Cookie) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CmRegisterCallback", "ptr", Function, _ContextMarshal, _Context, CookieMarshal, Cookie, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Cookie 
 * @returns {NTSTATUS} 
 */
export CmUnRegisterCallback(Cookie) {
    result := DllCall("ntoskrnl.exe\CmUnRegisterCallback", "int64", Cookie, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PEX_CALLBACK_FUNCTION>} Function 
 * @param {Pointer<UNICODE_STRING>} Altitude 
 * @param {Pointer<Void>} Driver 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<Integer>} Cookie 
 * @returns {NTSTATUS} 
 */
export CmRegisterCallbackEx(Function, Altitude, Driver, _Context, Cookie) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    DriverMarshal := Driver is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\CmRegisterCallbackEx", "ptr", Function, UNICODE_STRING.Ptr, Altitude, DriverMarshal, Driver, _ContextMarshal, _Context, CookieMarshal, Cookie, "ptr", Reserved, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Major 
 * @param {Pointer<Integer>} Minor 
 * @returns {String} Nothing - always returns an empty string
 */
export CmGetCallbackVersion(Major, Minor) {
    MajorMarshal := Major is VarRef ? "uint*" : "ptr"
    MinorMarshal := Minor is VarRef ? "uint*" : "ptr"

    DllCall("ntoskrnl.exe\CmGetCallbackVersion", MajorMarshal, Major, MinorMarshal, Minor)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Integer>} Cookie 
 * @param {Pointer<Void>} NewContext 
 * @param {Pointer<Pointer<Void>>} OldContext 
 * @returns {NTSTATUS} 
 */
export CmSetCallbackObjectContext(_Object, Cookie, NewContext, OldContext) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
    NewContextMarshal := NewContext is VarRef ? "ptr" : "ptr"
    OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CmSetCallbackObjectContext", _ObjectMarshal, _Object, CookieMarshal, Cookie, NewContextMarshal, NewContext, OldContextMarshal, OldContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Cookie 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Pointer>} _ObjectID 
 * @param {Pointer<Pointer<UNICODE_STRING>>} ObjectName 
 * @returns {NTSTATUS} 
 */
export CmCallbackGetKeyObjectID(Cookie, _Object, _ObjectID, ObjectName) {
    CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    _ObjectIDMarshal := _ObjectID is VarRef ? "ptr*" : "ptr"
    ObjectNameMarshal := ObjectName is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CmCallbackGetKeyObjectID", CookieMarshal, Cookie, _ObjectMarshal, _Object, _ObjectIDMarshal, _ObjectID, ObjectNameMarshal, ObjectName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Cookie 
 * @param {Pointer<Void>} _Object 
 * @returns {Pointer<Void>} 
 */
export CmGetBoundTransaction(Cookie, _Object) {
    CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\CmGetBoundTransaction", CookieMarshal, Cookie, _ObjectMarshal, _Object, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} Cookie 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<Pointer>} _ObjectID 
 * @param {Pointer<Pointer<UNICODE_STRING>>} ObjectName 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export CmCallbackGetKeyObjectIDEx(Cookie, _Object, _ObjectID, ObjectName, Flags) {
    CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    _ObjectIDMarshal := _ObjectID is VarRef ? "ptr*" : "ptr"
    ObjectNameMarshal := ObjectName is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\CmCallbackGetKeyObjectIDEx", CookieMarshal, Cookie, _ObjectMarshal, _Object, _ObjectIDMarshal, _ObjectID, ObjectNameMarshal, ObjectName, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @returns {String} Nothing - always returns an empty string
 */
export CmCallbackReleaseKeyObjectIDEx(ObjectName) {
    DllCall("ntoskrnl.exe\CmCallbackReleaseKeyObjectIDEx", UNICODE_STRING.Ptr, ObjectName)
}

/**
 * 
 * @returns {MM_SYSTEMSIZE} 
 */
export MmQuerySystemSize() {
    result := DllCall("ntoskrnl.exe\MmQuerySystemSize", MM_SYSTEMSIZE)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} VerifierFlags 
 * @returns {NTSTATUS} 
 */
export MmIsVerifierEnabled(VerifierFlags) {
    VerifierFlagsMarshal := VerifierFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmIsVerifierEnabled", VerifierFlagsMarshal, VerifierFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ThunkBuffer 
 * @param {Integer} ThunkBufferSize 
 * @returns {NTSTATUS} 
 */
export MmAddVerifierThunks(ThunkBuffer, ThunkBufferSize) {
    result := DllCall("ntoskrnl.exe\MmAddVerifierThunks", "ptr", ThunkBuffer, "uint", ThunkBufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer} EntryRoutine 
 * @param {Integer} ThunkBuffer 
 * @param {Integer} ThunkBufferSize 
 * @returns {NTSTATUS} 
 */
export MmAddVerifierSpecialThunks(EntryRoutine, ThunkBuffer, ThunkBufferSize) {
    result := DllCall("ntoskrnl.exe\MmAddVerifierSpecialThunks", "ptr", EntryRoutine, "ptr", ThunkBuffer, "uint", ThunkBufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Pointer<FILE_SEGMENT_ELEMENT>} SegmentArray 
 * @param {Integer} AccessMode 
 * @param {LOCK_OPERATION} Operation 
 * @returns {String} Nothing - always returns an empty string
 */
export MmProbeAndLockSelectedPages(MemoryDescriptorList, SegmentArray, AccessMode, Operation) {
    DllCall("ntoskrnl.exe\MmProbeAndLockSelectedPages", MDL.Ptr, MemoryDescriptorList, FILE_SEGMENT_ELEMENT.Ptr, SegmentArray, "char", AccessMode, LOCK_OPERATION, Operation)
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {PEPROCESS} Process 
 * @param {Integer} AccessMode 
 * @param {LOCK_OPERATION} Operation 
 * @returns {String} Nothing - always returns an empty string
 */
export MmProbeAndLockProcessPages(MemoryDescriptorList, Process, AccessMode, Operation) {
    DllCall("ntoskrnl.exe\MmProbeAndLockProcessPages", MDL.Ptr, MemoryDescriptorList, PEPROCESS, Process, "char", AccessMode, LOCK_OPERATION, Operation)
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} AccessMode 
 * @param {LOCK_OPERATION} Operation 
 * @returns {String} Nothing - always returns an empty string
 */
export MmProbeAndLockPages(MemoryDescriptorList, AccessMode, Operation) {
    DllCall("ntoskrnl.exe\MmProbeAndLockPages", MDL.Ptr, MemoryDescriptorList, "char", AccessMode, LOCK_OPERATION, Operation)
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnlockPages(MemoryDescriptorList) {
    DllCall("ntoskrnl.exe\MmUnlockPages", MDL.Ptr, MemoryDescriptorList)
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @returns {String} Nothing - always returns an empty string
 */
export MmBuildMdlForNonPagedPool(MemoryDescriptorList) {
    DllCall("ntoskrnl.exe\MmBuildMdlForNonPagedPool", MDL.Ptr, MemoryDescriptorList)
}

/**
 * 
 * @param {Pointer<MM_PHYSICAL_ADDRESS_LIST>} PhysicalAddressList 
 * @param {Pointer} NumberOfEntries 
 * @param {Pointer<Pointer<MDL>>} NewMdl 
 * @returns {NTSTATUS} 
 */
export MmAllocateMdlForIoSpace(PhysicalAddressList, NumberOfEntries, NewMdl) {
    NewMdlMarshal := NewMdl is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmAllocateMdlForIoSpace", MM_PHYSICAL_ADDRESS_LIST.Ptr, PhysicalAddressList, "ptr", NumberOfEntries, NewMdlMarshal, NewMdl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @returns {Integer} 
 */
export MmAreMdlPagesCached(MemoryDescriptorList) {
    result := DllCall("ntoskrnl.exe\MmAreMdlPagesCached", MDL.Ptr, MemoryDescriptorList, UInt32)
    return result
}

/**
 * 
 * @param {Integer} StartAddress 
 * @param {Integer} NumberOfBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export MmSetPermanentCacheAttribute(StartAddress, NumberOfBytes, CacheType, Flags) {
    result := DllCall("ntoskrnl.exe\MmSetPermanentCacheAttribute", "int64", StartAddress, "int64", NumberOfBytes, MEMORY_CACHING_TYPE, CacheType, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} AccessMode 
 * @returns {Pointer<Void>} 
 */
export MmMapLockedPages(MemoryDescriptorList, AccessMode) {
    result := DllCall("ntoskrnl.exe\MmMapLockedPages", MDL.Ptr, MemoryDescriptorList, "char", AccessMode, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} Protection 
 * @param {Pointer<PMM_MDL_ROUTINE>} DriverRoutine 
 * @param {Pointer<Void>} DriverContext 
 * @returns {NTSTATUS} 
 */
export MmMapMdl(MemoryDescriptorList, Protection, DriverRoutine, DriverContext) {
    DriverContextMarshal := DriverContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapMdl", MDL.Ptr, MemoryDescriptorList, "uint", Protection, "ptr", DriverRoutine, DriverContextMarshal, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Va 
 * @param {Integer} PageTotal 
 * @param {Pointer<MDL>} MemoryDumpMdl 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export MmMapMemoryDumpMdlEx(Va, PageTotal, MemoryDumpMdl, Flags) {
    VaMarshal := Va is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapMemoryDumpMdlEx", VaMarshal, Va, "uint", PageTotal, MDL.Ptr, MemoryDumpMdl, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} StartAddress 
 * @param {Pointer} NumberOfBytes 
 * @returns {Integer} 
 */
export MmIsIoSpaceActive(StartAddress, NumberOfBytes) {
    result := DllCall("ntoskrnl.exe\MmIsIoSpaceActive", "int64", StartAddress, "ptr", NumberOfBytes, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} _Mdl 
 * @param {Integer} NumberOfBytes 
 * @returns {NTSTATUS} 
 */
export MmAdvanceMdl(_Mdl, NumberOfBytes) {
    result := DllCall("ntoskrnl.exe\MmAdvanceMdl", MDL.Ptr, _Mdl, "uint", NumberOfBytes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} NewProtect 
 * @returns {NTSTATUS} 
 */
export MmProtectMdlSystemAddress(MemoryDescriptorList, NewProtect) {
    result := DllCall("ntoskrnl.exe\MmProtectMdlSystemAddress", MDL.Ptr, MemoryDescriptorList, "uint", NewProtect, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} AccessMode 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @param {Pointer<Void>} RequestedAddress 
 * @param {Integer} BugCheckOnFailure 
 * @param {Integer} _Priority 
 * @returns {Pointer<Void>} 
 */
export MmMapLockedPagesSpecifyCache(MemoryDescriptorList, AccessMode, CacheType, RequestedAddress, BugCheckOnFailure, _Priority) {
    RequestedAddressMarshal := RequestedAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapLockedPagesSpecifyCache", MDL.Ptr, MemoryDescriptorList, "char", AccessMode, MEMORY_CACHING_TYPE, CacheType, RequestedAddressMarshal, RequestedAddress, "uint", BugCheckOnFailure, "uint", _Priority, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} BaseAddress 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnmapLockedPages(BaseAddress, MemoryDescriptorList) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmUnmapLockedPages", BaseAddressMarshal, BaseAddress, MDL.Ptr, MemoryDescriptorList)
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} PoolTag 
 * @param {Integer} Flags 
 * @returns {Pointer<Void>} 
 */
export MmAllocateMappingAddressEx(NumberOfBytes, PoolTag, Flags) {
    result := DllCall("ntoskrnl.exe\MmAllocateMappingAddressEx", "ptr", NumberOfBytes, "uint", PoolTag, "uint", Flags, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} PoolTag 
 * @returns {Pointer<Void>} 
 */
export MmAllocateMappingAddress(NumberOfBytes, PoolTag) {
    result := DllCall("ntoskrnl.exe\MmAllocateMappingAddress", "ptr", NumberOfBytes, "uint", PoolTag, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} BaseAddress 
 * @param {Integer} PoolTag 
 * @returns {String} Nothing - always returns an empty string
 */
export MmFreeMappingAddress(BaseAddress, PoolTag) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmFreeMappingAddress", BaseAddressMarshal, BaseAddress, "uint", PoolTag)
}

/**
 * 
 * @param {Pointer<Void>} MappingAddress 
 * @param {Integer} PoolTag 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @returns {Pointer<Void>} 
 */
export MmMapLockedPagesWithReservedMapping(MappingAddress, PoolTag, MemoryDescriptorList, CacheType) {
    MappingAddressMarshal := MappingAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapLockedPagesWithReservedMapping", MappingAddressMarshal, MappingAddress, "uint", PoolTag, MDL.Ptr, MemoryDescriptorList, MEMORY_CACHING_TYPE, CacheType, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} BaseAddress 
 * @param {Integer} PoolTag 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnmapReservedMapping(BaseAddress, PoolTag, MemoryDescriptorList) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmUnmapReservedMapping", BaseAddressMarshal, BaseAddress, "uint", PoolTag, MDL.Ptr, MemoryDescriptorList)
}

/**
 * 
 * @param {Integer} LowAddress 
 * @param {Integer} HighAddress 
 * @param {Integer} SkipBytes 
 * @param {Pointer} TotalBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @param {Integer} IdealNode 
 * @param {Integer} Flags 
 * @returns {Pointer<MDL>} 
 */
export MmAllocateNodePagesForMdlEx(LowAddress, HighAddress, SkipBytes, TotalBytes, CacheType, IdealNode, Flags) {
    result := DllCall("ntoskrnl.exe\MmAllocateNodePagesForMdlEx", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, MEMORY_CACHING_TYPE, CacheType, "uint", IdealNode, "uint", Flags, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Integer} LowAddress 
 * @param {Integer} HighAddress 
 * @param {Integer} SkipBytes 
 * @param {Pointer} TotalBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @param {Integer} IdealNode 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} PartitionObject 
 * @returns {Pointer<MDL>} 
 */
export MmAllocatePartitionNodePagesForMdlEx(LowAddress, HighAddress, SkipBytes, TotalBytes, CacheType, IdealNode, Flags, PartitionObject) {
    PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmAllocatePartitionNodePagesForMdlEx", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, MEMORY_CACHING_TYPE, CacheType, "uint", IdealNode, "uint", Flags, PartitionObjectMarshal, PartitionObject, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Integer} LowAddress 
 * @param {Integer} HighAddress 
 * @param {Integer} SkipBytes 
 * @param {Pointer} TotalBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @param {Integer} Flags 
 * @returns {Pointer<MDL>} 
 */
export MmAllocatePagesForMdlEx(LowAddress, HighAddress, SkipBytes, TotalBytes, CacheType, Flags) {
    result := DllCall("ntoskrnl.exe\MmAllocatePagesForMdlEx", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, MEMORY_CACHING_TYPE, CacheType, "uint", Flags, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Integer} LowAddress 
 * @param {Integer} HighAddress 
 * @param {Integer} SkipBytes 
 * @param {Pointer} TotalBytes 
 * @returns {Pointer<MDL>} 
 */
export MmAllocatePagesForMdl(LowAddress, HighAddress, SkipBytes, TotalBytes) {
    result := DllCall("ntoskrnl.exe\MmAllocatePagesForMdl", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export MmFreePagesFromMdlEx(MemoryDescriptorList, Flags) {
    DllCall("ntoskrnl.exe\MmFreePagesFromMdlEx", MDL.Ptr, MemoryDescriptorList, "uint", Flags)
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @returns {String} Nothing - always returns an empty string
 */
export MmFreePagesFromMdl(MemoryDescriptorList) {
    DllCall("ntoskrnl.exe\MmFreePagesFromMdl", MDL.Ptr, MemoryDescriptorList)
}

/**
 * 
 * @param {Integer} PhysicalAddress 
 * @param {Pointer} NumberOfBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @returns {Pointer<Void>} 
 */
export MmMapIoSpace(PhysicalAddress, NumberOfBytes, CacheType) {
    result := DllCall("ntoskrnl.exe\MmMapIoSpace", "int64", PhysicalAddress, "ptr", NumberOfBytes, MEMORY_CACHING_TYPE, CacheType, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} BaseAddress 
 * @param {Pointer} NumberOfBytes 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnmapIoSpace(BaseAddress, NumberOfBytes) {
    DllCall("ntoskrnl.exe\MmUnmapIoSpace", "ptr", BaseAddress, "ptr", NumberOfBytes)
}

/**
 * 
 * @param {Integer} PhysicalAddress 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Protect 
 * @returns {Pointer<Void>} 
 */
export MmMapIoSpaceEx(PhysicalAddress, NumberOfBytes, Protect) {
    result := DllCall("ntoskrnl.exe\MmMapIoSpaceEx", "int64", PhysicalAddress, "ptr", NumberOfBytes, "uint", Protect, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} HighestAcceptableAddress 
 * @returns {Pointer<Void>} 
 */
export MmAllocateContiguousMemory(NumberOfBytes, HighestAcceptableAddress) {
    result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemory", "ptr", NumberOfBytes, "int64", HighestAcceptableAddress, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} LowestAcceptableAddress 
 * @param {Integer} HighestAcceptableAddress 
 * @param {Integer} BoundaryAddressMultiple 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @returns {Pointer<Void>} 
 */
export MmAllocateContiguousMemorySpecifyCache(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, CacheType) {
    result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemorySpecifyCache", "ptr", NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, MEMORY_CACHING_TYPE, CacheType, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} LowestAcceptableAddress 
 * @param {Integer} HighestAcceptableAddress 
 * @param {Integer} BoundaryAddressMultiple 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @param {Integer} PreferredNode 
 * @returns {Pointer<Void>} 
 */
export MmAllocateContiguousMemorySpecifyCacheNode(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, CacheType, PreferredNode) {
    result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemorySpecifyCacheNode", "ptr", NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, MEMORY_CACHING_TYPE, CacheType, "uint", PreferredNode, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} LowestAcceptableAddress 
 * @param {Integer} HighestAcceptableAddress 
 * @param {Integer} BoundaryAddressMultiple 
 * @param {Integer} Protect 
 * @param {Integer} PreferredNode 
 * @returns {Pointer<Void>} 
 */
export MmAllocateContiguousNodeMemory(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, Protect, PreferredNode) {
    result := DllCall("ntoskrnl.exe\MmAllocateContiguousNodeMemory", "ptr", NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, "uint", Protect, "uint", PreferredNode, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} NumberOfBytes 
 * @param {Integer} LowestAcceptableAddress 
 * @param {Integer} HighestAcceptableAddress 
 * @param {Integer} BoundaryAddressMultiple 
 * @param {Integer} PreferredNode 
 * @param {Integer} Protect 
 * @param {Pointer<Void>} PartitionObject 
 * @param {Integer} Tag 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} BaseAddress 
 * @returns {NTSTATUS} 
 */
export MmAllocateContiguousMemoryEx(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, PreferredNode, Protect, PartitionObject, Tag, Flags, BaseAddress) {
    NumberOfBytesMarshal := NumberOfBytes is VarRef ? "ptr*" : "ptr"
    PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemoryEx", NumberOfBytesMarshal, NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, "uint", PreferredNode, "uint", Protect, PartitionObjectMarshal, PartitionObject, "uint", Tag, "uint", Flags, BaseAddressMarshal, BaseAddress, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} BaseAddress 
 * @returns {String} Nothing - always returns an empty string
 */
export MmFreeContiguousMemory(BaseAddress) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmFreeContiguousMemory", BaseAddressMarshal, BaseAddress)
}

/**
 * 
 * @param {Integer} BaseAddress 
 * @param {Pointer} NumberOfBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @returns {String} Nothing - always returns an empty string
 */
export MmFreeContiguousMemorySpecifyCache(BaseAddress, NumberOfBytes, CacheType) {
    DllCall("ntoskrnl.exe\MmFreeContiguousMemorySpecifyCache", "ptr", BaseAddress, "ptr", NumberOfBytes, MEMORY_CACHING_TYPE, CacheType)
}

/**
 * 
 * @param {Integer} Base 
 * @param {Pointer} Length 
 * @returns {Pointer} 
 */
export MmSizeOfMdl(Base, Length) {
    result := DllCall("ntoskrnl.exe\MmSizeOfMdl", "ptr", Base, "ptr", Length, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {Integer} Base 
 * @param {Pointer} Length 
 * @returns {Pointer<MDL>} 
 */
export MmCreateMdl(MemoryDescriptorList, Base, Length) {
    result := DllCall("ntoskrnl.exe\MmCreateMdl", MDL.Ptr, MemoryDescriptorList, "ptr", Base, "ptr", Length, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} MemoryDescriptorList 
 * @param {MM_MDL_PAGE_CONTENTS_STATE} State 
 * @returns {MM_MDL_PAGE_CONTENTS_STATE} 
 */
export MmMdlPageContentsState(MemoryDescriptorList, State) {
    result := DllCall("ntoskrnl.exe\MmMdlPageContentsState", MDL.Ptr, MemoryDescriptorList, MM_MDL_PAGE_CONTENTS_STATE, State, MM_MDL_PAGE_CONTENTS_STATE)
    return result
}

/**
 * 
 * @param {Pointer<Void>} AddressWithinSection 
 * @returns {Pointer<Void>} 
 */
export MmLockPagableDataSection(AddressWithinSection) {
    AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmLockPagableDataSection", AddressWithinSectionMarshal, AddressWithinSection, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} AddressWithinSection 
 * @returns {String} Nothing - always returns an empty string
 */
export MmResetDriverPaging(AddressWithinSection) {
    AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmResetDriverPaging", AddressWithinSectionMarshal, AddressWithinSection)
}

/**
 * 
 * @param {Pointer<Void>} AddressWithinSection 
 * @returns {Pointer<Void>} 
 */
export MmPageEntireDriver(AddressWithinSection) {
    AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmPageEntireDriver", AddressWithinSectionMarshal, AddressWithinSection, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ImageSectionHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnlockPagableImageSection(ImageSectionHandle) {
    ImageSectionHandleMarshal := ImageSectionHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmUnlockPagableImageSection", ImageSectionHandleMarshal, ImageSectionHandle)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @returns {Integer} 
 */
export MmIsDriverSuspectForVerifier(DriverObject) {
    result := DllCall("ntoskrnl.exe\MmIsDriverSuspectForVerifier", DRIVER_OBJECT.Ptr, DriverObject, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @returns {Integer} 
 */
export MmIsDriverVerifying(DriverObject) {
    result := DllCall("ntoskrnl.exe\MmIsDriverVerifying", DRIVER_OBJECT.Ptr, DriverObject, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} AddressWithinSection 
 * @returns {Integer} 
 */
export MmIsDriverVerifyingByAddress(AddressWithinSection) {
    AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmIsDriverVerifyingByAddress", AddressWithinSectionMarshal, AddressWithinSection, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} AddressWithinSection 
 * @param {Pointer} _Size 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export MmProtectDriverSection(AddressWithinSection, _Size, Flags) {
    AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmProtectDriverSection", AddressWithinSectionMarshal, AddressWithinSection, "ptr", _Size, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @returns {String} Nothing - always returns an empty string
 */
export SeCaptureSubjectContext(SubjectContext) {
    DllCall("ntoskrnl.exe\SeCaptureSubjectContext", SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext)
}

/**
 * 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @returns {String} Nothing - always returns an empty string
 */
export SeLockSubjectContext(SubjectContext) {
    DllCall("ntoskrnl.exe\SeLockSubjectContext", SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext)
}

/**
 * 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @returns {String} Nothing - always returns an empty string
 */
export SeUnlockSubjectContext(SubjectContext) {
    DllCall("ntoskrnl.exe\SeUnlockSubjectContext", SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext)
}

/**
 * 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @returns {String} Nothing - always returns an empty string
 */
export SeReleaseSubjectContext(SubjectContext) {
    DllCall("ntoskrnl.exe\SeReleaseSubjectContext", SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext)
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} ParentDescriptor 
 * @param {PSECURITY_DESCRIPTOR} ExplicitDescriptor 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor 
 * @param {BOOLEAN} IsDirectoryObject 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {POOL_TYPE} PoolType 
 * @returns {NTSTATUS} 
 */
export SeAssignSecurity(ParentDescriptor, ExplicitDescriptor, NewDescriptor, IsDirectoryObject, SubjectContext, GenericMapping, PoolType) {
    result := DllCall("ntoskrnl.exe\SeAssignSecurity", PSECURITY_DESCRIPTOR, ParentDescriptor, PSECURITY_DESCRIPTOR, ExplicitDescriptor, PSECURITY_DESCRIPTOR.Ptr, NewDescriptor, BOOLEAN, IsDirectoryObject, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext, GENERIC_MAPPING.Ptr, GenericMapping, POOL_TYPE, PoolType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _ObjectType 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {PSECURITY_DESCRIPTOR} ParentSecurityDescriptor 
 * @returns {Integer} 
 */
export SeComputeAutoInheritByObjectType(_ObjectType, _SecurityDescriptor, ParentSecurityDescriptor) {
    _ObjectTypeMarshal := _ObjectType is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeComputeAutoInheritByObjectType", _ObjectTypeMarshal, _ObjectType, PSECURITY_DESCRIPTOR, _SecurityDescriptor, PSECURITY_DESCRIPTOR, ParentSecurityDescriptor, UInt32)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} ParentDescriptor 
 * @param {PSECURITY_DESCRIPTOR} ExplicitDescriptor 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor 
 * @param {Pointer<Guid>} _ObjectType 
 * @param {BOOLEAN} IsDirectoryObject 
 * @param {Integer} AutoInheritFlags 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {POOL_TYPE} PoolType 
 * @returns {NTSTATUS} 
 */
export SeAssignSecurityEx(ParentDescriptor, ExplicitDescriptor, NewDescriptor, _ObjectType, IsDirectoryObject, AutoInheritFlags, SubjectContext, GenericMapping, PoolType) {
    result := DllCall("ntoskrnl.exe\SeAssignSecurityEx", PSECURITY_DESCRIPTOR, ParentDescriptor, PSECURITY_DESCRIPTOR, ExplicitDescriptor, PSECURITY_DESCRIPTOR.Ptr, NewDescriptor, Guid.Ptr, _ObjectType, BOOLEAN, IsDirectoryObject, "uint", AutoInheritFlags, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectContext, GENERIC_MAPPING.Ptr, GenericMapping, POOL_TYPE, PoolType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _SecurityDescriptor 
 * @returns {NTSTATUS} 
 */
export SeDeassignSecurity(_SecurityDescriptor) {
    result := DllCall("ntoskrnl.exe\SeDeassignSecurity", PSECURITY_DESCRIPTOR.Ptr, _SecurityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
 * @param {BOOLEAN} SubjectContextLocked 
 * @param {Integer} DesiredAccess 
 * @param {Integer} PreviouslyGrantedAccess 
 * @param {Pointer<Pointer<PRIVILEGE_SET>>} Privileges 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @param {Integer} AccessMode 
 * @param {Pointer<Integer>} GrantedAccess 
 * @param {Pointer<Integer>} AccessStatus 
 * @returns {BOOLEAN} 
 */
export SeAccessCheck(_SecurityDescriptor, SubjectSecurityContext, SubjectContextLocked, DesiredAccess, PreviouslyGrantedAccess, Privileges, GenericMapping, AccessMode, GrantedAccess, AccessStatus) {
    PrivilegesMarshal := Privileges is VarRef ? "ptr*" : "ptr"
    GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
    AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeAccessCheck", PSECURITY_DESCRIPTOR, _SecurityDescriptor, SECURITY_SUBJECT_CONTEXT.Ptr, SubjectSecurityContext, BOOLEAN, SubjectContextLocked, "uint", DesiredAccess, "uint", PreviouslyGrantedAccess, PrivilegesMarshal, Privileges, GENERIC_MAPPING.Ptr, GenericMapping, "char", AccessMode, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SE_ADT_PARAMETER_ARRAY>} AuditParameters 
 * @param {SE_ADT_PARAMETER_TYPE} Type 
 * @param {Integer} Index 
 * @param {Pointer<Void>} Data 
 * @returns {NTSTATUS} 
 */
export SeSetAuditParameter(AuditParameters, Type, Index, Data) {
    DataMarshal := Data is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\SeSetAuditParameter", SE_ADT_PARAMETER_ARRAY.Ptr, AuditParameters, SE_ADT_PARAMETER_TYPE, Type, "uint", Index, DataMarshal, Data, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Pointer<UNICODE_STRING>} SourceName 
 * @param {PSID} UserSid 
 * @param {Pointer<SE_ADT_PARAMETER_ARRAY>} AuditParameters 
 * @returns {NTSTATUS} 
 */
export SeReportSecurityEvent(Flags, SourceName, UserSid, AuditParameters) {
    result := DllCall("ntoskrnl.exe\SeReportSecurityEvent", "uint", Flags, UNICODE_STRING.Ptr, SourceName, PSID, UserSid, SE_ADT_PARAMETER_ARRAY.Ptr, AuditParameters, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Length 
 * @param {Integer} _SecurityDescriptor 
 * @returns {BOOLEAN} 
 */
export SeValidSecurityDescriptor(Length, _SecurityDescriptor) {
    result := DllCall("ntoskrnl.exe\SeValidSecurityDescriptor", "uint", Length, "ptr", _SecurityDescriptor, BOOLEAN)
    return result
}

/**
 * 
 * @param {SE_IMAGE_TYPE} _ImageType 
 * @param {SE_IMAGE_VERIFICATION_CALLBACK_TYPE} CallbackType 
 * @param {Pointer<PSE_IMAGE_VERIFICATION_CALLBACK_FUNCTION>} CallbackFunction 
 * @param {Pointer<Void>} CallbackContext 
 * @param {Pointer<Pointer<Void>>} CallbackHandle 
 * @returns {NTSTATUS} 
 */
export SeRegisterImageVerificationCallback(_ImageType, CallbackType, CallbackFunction, CallbackContext, CallbackHandle) {
    static Token := 0 ;Reserved parameters must always be NULL

    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
    CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\SeRegisterImageVerificationCallback", SE_IMAGE_TYPE, _ImageType, SE_IMAGE_VERIFICATION_CALLBACK_TYPE, CallbackType, "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, "ptr", Token, CallbackHandleMarshal, CallbackHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} CallbackHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export SeUnregisterImageVerificationCallback(CallbackHandle) {
    CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\SeUnregisterImageVerificationCallback", CallbackHandleMarshal, CallbackHandle)
}

/**
 * 
 * @param {Pointer<HANDLE>} ThreadHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<CLIENT_ID>} ClientId 
 * @param {Pointer<PKSTART_ROUTINE>} StartRoutine 
 * @param {Pointer<Void>} StartContext 
 * @returns {NTSTATUS} 
 */
export PsCreateSystemThread(ThreadHandle, DesiredAccess, ObjectAttributes, ProcessHandle, ClientId, StartRoutine, StartContext) {
    StartContextMarshal := StartContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PsCreateSystemThread", HANDLE.Ptr, ThreadHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, HANDLE, ProcessHandle, CLIENT_ID.Ptr, ClientId, "ptr", StartRoutine, StartContextMarshal, StartContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {NTSTATUS} ExitStatus 
 * @returns {NTSTATUS} 
 */
export PsTerminateSystemThread(ExitStatus) {
    result := DllCall("ntoskrnl.exe\PsTerminateSystemThread", NTSTATUS, ExitStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} ApcContext 
 * @param {Pointer<Pointer<Void>>} ApcRoutine 
 * @returns {NTSTATUS} 
 */
export PsWrapApcWow64Thread(ApcContext, ApcRoutine) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr*" : "ptr"
    ApcRoutineMarshal := ApcRoutine is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsWrapApcWow64Thread", ApcContextMarshal, ApcContext, ApcRoutineMarshal, ApcRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} MajorVersion 
 * @param {Pointer<Integer>} MinorVersion 
 * @param {Pointer<Integer>} BuildNumber 
 * @param {Pointer<UNICODE_STRING>} CSDVersion 
 * @returns {BOOLEAN} 
 */
export PsGetVersion(MajorVersion, MinorVersion, BuildNumber, CSDVersion) {
    MajorVersionMarshal := MajorVersion is VarRef ? "uint*" : "ptr"
    MinorVersionMarshal := MinorVersion is VarRef ? "uint*" : "ptr"
    BuildNumberMarshal := BuildNumber is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsGetVersion", MajorVersionMarshal, MajorVersion, MinorVersionMarshal, MinorVersion, BuildNumberMarshal, BuildNumber, UNICODE_STRING.Ptr, CSDVersion, BOOLEAN)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @param {Pointer<Integer>} CycleTimeStamp 
 * @returns {Integer} 
 */
export PsQueryTotalCycleTimeProcess(Process, CycleTimeStamp) {
    CycleTimeStampMarshal := CycleTimeStamp is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsQueryTotalCycleTimeProcess", PEPROCESS, Process, CycleTimeStampMarshal, CycleTimeStamp, Int64)
    return result
}

/**
 * 
 * @param {Pointer<PAFFINITY_TOKEN>} AffinityToken 
 * @returns {NTSTATUS} 
 */
export PsAllocateAffinityToken(AffinityToken) {
    AffinityTokenMarshal := AffinityToken is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsAllocateAffinityToken", AffinityTokenMarshal, AffinityToken, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PAFFINITY_TOKEN} AffinityToken 
 * @returns {String} Nothing - always returns an empty string
 */
export PsFreeAffinityToken(AffinityToken) {
    DllCall("ntoskrnl.exe\PsFreeAffinityToken", PAFFINITY_TOKEN, AffinityToken)
}

/**
 * 
 * @param {Pointer<GROUP_AFFINITY>} GroupAffinities 
 * @param {Integer} GroupCount 
 * @param {PAFFINITY_TOKEN} AffinityToken 
 * @returns {NTSTATUS} 
 */
export PsSetSystemMultipleGroupAffinityThread(GroupAffinities, GroupCount, AffinityToken) {
    result := DllCall("ntoskrnl.exe\PsSetSystemMultipleGroupAffinityThread", GROUP_AFFINITY.Ptr, GroupAffinities, "ushort", GroupCount, PAFFINITY_TOKEN, AffinityToken, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PAFFINITY_TOKEN} AffinityToken 
 * @returns {String} Nothing - always returns an empty string
 */
export PsRevertToUserMultipleGroupAffinityThread(AffinityToken) {
    DllCall("ntoskrnl.exe\PsRevertToUserMultipleGroupAffinityThread", PAFFINITY_TOKEN, AffinityToken)
}

/**
 * 
 * @param {Pointer<Integer>} Irql 
 * @returns {String} Nothing - always returns an empty string
 */
export IoAcquireCancelSpinLock(Irql) {
    IrqlMarshal := Irql is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\IoAcquireCancelSpinLock", IrqlMarshal, Irql)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<Void>} ClientIdentificationAddress 
 * @param {Integer} DriverObjectExtensionSize 
 * @param {Pointer<Pointer<Void>>} DriverObjectExtension 
 * @returns {NTSTATUS} 
 */
export IoAllocateDriverObjectExtension(DriverObject, ClientIdentificationAddress, DriverObjectExtensionSize, DriverObjectExtension) {
    ClientIdentificationAddressMarshal := ClientIdentificationAddress is VarRef ? "ptr" : "ptr"
    DriverObjectExtensionMarshal := DriverObjectExtension is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAllocateDriverObjectExtension", DRIVER_OBJECT.Ptr, DriverObject, ClientIdentificationAddressMarshal, ClientIdentificationAddress, "uint", DriverObjectExtensionSize, DriverObjectExtensionMarshal, DriverObjectExtension, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} IoObject 
 * @param {Integer} EntrySize 
 * @returns {Pointer<Void>} 
 */
export IoAllocateErrorLogEntry(IoObject, EntrySize) {
    IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAllocateErrorLogEntry", IoObjectMarshal, IoObject, "char", EntrySize, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} StackSize 
 * @param {BOOLEAN} ChargeQuota 
 * @returns {Pointer<IRP>} 
 */
export IoAllocateIrp(StackSize, ChargeQuota) {
    result := DllCall("ntoskrnl.exe\IoAllocateIrp", "char", StackSize, BOOLEAN, ChargeQuota, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} StackSize 
 * @param {BOOLEAN} ChargeQuota 
 * @returns {Pointer<IRP>} 
 */
export IoAllocateIrpEx(DeviceObject, StackSize, ChargeQuota) {
    result := DllCall("ntoskrnl.exe\IoAllocateIrpEx", DEVICE_OBJECT.Ptr, DeviceObject, "char", StackSize, BOOLEAN, ChargeQuota, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VirtualAddress 
 * @param {Integer} Length 
 * @param {BOOLEAN} SecondaryBuffer 
 * @param {BOOLEAN} ChargeQuota 
 * @param {Pointer<IRP>} _Irp 
 * @returns {Pointer<MDL>} 
 */
export IoAllocateMdl(VirtualAddress, Length, SecondaryBuffer, ChargeQuota, _Irp) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAllocateMdl", VirtualAddressMarshal, VirtualAddress, "uint", Length, BOOLEAN, SecondaryBuffer, BOOLEAN, ChargeQuota, IRP.Ptr, _Irp, MDL.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
 * @param {Pointer<UNICODE_STRING>} TargetDevice 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} AttachedDevice 
 * @returns {NTSTATUS} 
 */
export IoAttachDevice(SourceDevice, TargetDevice, AttachedDevice) {
    AttachedDeviceMarshal := AttachedDevice is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAttachDevice", DEVICE_OBJECT.Ptr, SourceDevice, UNICODE_STRING.Ptr, TargetDevice, AttachedDeviceMarshal, AttachedDevice, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
 * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoAttachDeviceToDeviceStack(SourceDevice, TargetDevice) {
    result := DllCall("ntoskrnl.exe\IoAttachDeviceToDeviceStack", DEVICE_OBJECT.Ptr, SourceDevice, DEVICE_OBJECT.Ptr, TargetDevice, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Integer} MajorFunction 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Void>} _Buffer 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} StartingOffset 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {Pointer<IRP>} 
 */
export IoBuildAsynchronousFsdRequest(MajorFunction, DeviceObject, _Buffer, Length, StartingOffset, IoStatusBlock) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoBuildAsynchronousFsdRequest", "uint", MajorFunction, DEVICE_OBJECT.Ptr, DeviceObject, _BufferMarshal, _Buffer, "uint", Length, StartingOffsetMarshal, StartingOffset, IO_STATUS_BLOCK.Ptr, IoStatusBlock, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Integer} IoControlCode 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Void>} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Pointer<Void>} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @param {BOOLEAN} InternalDeviceIoControl 
 * @param {Pointer<KEVENT>} Event 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {Pointer<IRP>} 
 */
export IoBuildDeviceIoControlRequest(IoControlCode, DeviceObject, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, InternalDeviceIoControl, Event, IoStatusBlock) {
    InputBufferMarshal := InputBuffer is VarRef ? "ptr" : "ptr"
    OutputBufferMarshal := OutputBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoBuildDeviceIoControlRequest", "uint", IoControlCode, DEVICE_OBJECT.Ptr, DeviceObject, InputBufferMarshal, InputBuffer, "uint", InputBufferLength, OutputBufferMarshal, OutputBuffer, "uint", OutputBufferLength, BOOLEAN, InternalDeviceIoControl, KEVENT.Ptr, Event, IO_STATUS_BLOCK.Ptr, IoStatusBlock, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<MDL>} SourceMdl 
 * @param {Pointer<MDL>} TargetMdl 
 * @param {Pointer<Void>} VirtualAddress 
 * @param {Integer} Length 
 * @returns {String} Nothing - always returns an empty string
 */
export IoBuildPartialMdl(SourceMdl, TargetMdl, VirtualAddress, Length) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoBuildPartialMdl", MDL.Ptr, SourceMdl, MDL.Ptr, TargetMdl, VirtualAddressMarshal, VirtualAddress, "uint", Length)
}

/**
 * 
 * @param {Pointer<BOOTDISK_INFORMATION>} BootDiskInformation 
 * @param {Integer} _Size 
 * @returns {NTSTATUS} 
 */
export IoGetBootDiskInformation(BootDiskInformation, _Size) {
    result := DllCall("ntoskrnl.exe\IoGetBootDiskInformation", BOOTDISK_INFORMATION.Ptr, BootDiskInformation, "uint", _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<BOOTDISK_INFORMATION_LITE>>} BootDiskInformation 
 * @returns {NTSTATUS} 
 */
export IoGetBootDiskInformationLite(BootDiskInformation) {
    BootDiskInformationMarshal := BootDiskInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetBootDiskInformationLite", BootDiskInformationMarshal, BootDiskInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} MajorFunction 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Void>} _Buffer 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} StartingOffset 
 * @param {Pointer<KEVENT>} Event 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @returns {Pointer<IRP>} 
 */
export IoBuildSynchronousFsdRequest(MajorFunction, DeviceObject, _Buffer, Length, StartingOffset, Event, IoStatusBlock) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoBuildSynchronousFsdRequest", "uint", MajorFunction, DEVICE_OBJECT.Ptr, DeviceObject, _BufferMarshal, _Buffer, "uint", Length, StartingOffsetMarshal, StartingOffset, KEVENT.Ptr, Event, IO_STATUS_BLOCK.Ptr, IoStatusBlock, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export IofCallDriver(DeviceObject, _Irp) {
    result := DllCall("ntoskrnl.exe\IofCallDriver", DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export IoCancelIrp(_Irp) {
    result := DllCall("ntoskrnl.exe\IoCancelIrp", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} DesiredAccess 
 * @param {Integer} DesiredShareAccess 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {BOOLEAN} Update 
 * @returns {NTSTATUS} 
 */
export IoCheckShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, Update) {
    result := DllCall("ntoskrnl.exe\IoCheckShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, BOOLEAN, Update, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} DesiredAccess 
 * @param {Integer} DesiredShareAccess 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {BOOLEAN} Update 
 * @param {Pointer<BOOLEAN>} WritePermission 
 * @returns {NTSTATUS} 
 */
export IoCheckShareAccessEx(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, Update, WritePermission) {
    WritePermissionMarshal := WritePermission is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCheckShareAccessEx", "uint", DesiredAccess, "uint", DesiredShareAccess, FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, BOOLEAN, Update, WritePermissionMarshal, WritePermission, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} DesiredAccess 
 * @param {Integer} DesiredShareAccess 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
 * @param {Integer} IoShareAccessFlags 
 * @returns {NTSTATUS} 
 */
export IoCheckLinkShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
    result := DllCall("ntoskrnl.exe\IoCheckLinkShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, LINK_SHARE_ACCESS.Ptr, LinkShareAccess, "uint", IoShareAccessFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} PriorityBoost 
 * @returns {String} Nothing - always returns an empty string
 */
export IofCompleteRequest(_Irp, PriorityBoost) {
    DllCall("ntoskrnl.exe\IofCompleteRequest", IRP.Ptr, _Irp, "char", PriorityBoost)
}

/**
 * 
 * @param {Pointer<PKINTERRUPT>} InterruptObject 
 * @param {Pointer<PKSERVICE_ROUTINE>} ServiceRoutine 
 * @param {Pointer<Void>} ServiceContext 
 * @param {Pointer<Pointer>} SpinLock 
 * @param {Integer} Vector 
 * @param {Integer} Irql 
 * @param {Integer} SynchronizeIrql 
 * @param {KINTERRUPT_MODE} InterruptMode 
 * @param {BOOLEAN} ShareVector 
 * @param {Pointer} ProcessorEnableMask 
 * @param {BOOLEAN} FloatingSave 
 * @returns {NTSTATUS} 
 */
export IoConnectInterrupt(InterruptObject, ServiceRoutine, ServiceContext, SpinLock, Vector, Irql, SynchronizeIrql, InterruptMode, ShareVector, ProcessorEnableMask, FloatingSave) {
    InterruptObjectMarshal := InterruptObject is VarRef ? "ptr*" : "ptr"
    ServiceContextMarshal := ServiceContext is VarRef ? "ptr" : "ptr"
    SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoConnectInterrupt", InterruptObjectMarshal, InterruptObject, "ptr", ServiceRoutine, ServiceContextMarshal, ServiceContext, SpinLockMarshal, SpinLock, "uint", Vector, "char", Irql, "char", SynchronizeIrql, KINTERRUPT_MODE, InterruptMode, BOOLEAN, ShareVector, "ptr", ProcessorEnableMask, BOOLEAN, FloatingSave, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_CONNECT_INTERRUPT_PARAMETERS>} Parameters 
 * @returns {NTSTATUS} 
 */
export IoConnectInterruptEx(Parameters) {
    result := DllCall("ntoskrnl.exe\IoConnectInterruptEx", IO_CONNECT_INTERRUPT_PARAMETERS.Ptr, Parameters, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Integer} DeviceExtensionSize 
 * @param {Pointer<UNICODE_STRING>} DeviceName 
 * @param {Integer} DeviceType 
 * @param {Integer} DeviceCharacteristics 
 * @param {BOOLEAN} Exclusive 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export IoCreateDevice(DriverObject, DeviceExtensionSize, DeviceName, DeviceType, DeviceCharacteristics, Exclusive, DeviceObject) {
    DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCreateDevice", DRIVER_OBJECT.Ptr, DriverObject, "uint", DeviceExtensionSize, UNICODE_STRING.Ptr, DeviceName, "uint", DeviceType, "uint", DeviceCharacteristics, BOOLEAN, Exclusive, DeviceObjectMarshal, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} MajorVersion 
 * @param {Integer} MinorVersion 
 * @returns {BOOLEAN} 
 */
export IoIsWdmVersionAvailable(MajorVersion, MinorVersion) {
    result := DllCall("ntoskrnl.exe\IoIsWdmVersionAvailable", "char", MajorVersion, "char", MinorVersion, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} FileHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} AllocationSize 
 * @param {Integer} FileAttributes 
 * @param {Integer} ShareAccess 
 * @param {Integer} Disposition 
 * @param {Integer} CreateOptions 
 * @param {Pointer<Void>} EaBuffer 
 * @param {Integer} EaLength 
 * @param {CREATE_FILE_TYPE} CreateFileType 
 * @param {Pointer<Void>} InternalParameters 
 * @param {Integer} Options 
 * @returns {NTSTATUS} 
 */
export IoCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, Disposition, CreateOptions, EaBuffer, EaLength, CreateFileType, InternalParameters, Options) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"
    EaBufferMarshal := EaBuffer is VarRef ? "ptr" : "ptr"
    InternalParametersMarshal := InternalParameters is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCreateFile", HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", Disposition, "uint", CreateOptions, EaBufferMarshal, EaBuffer, "uint", EaLength, CREATE_FILE_TYPE, CreateFileType, InternalParametersMarshal, InternalParameters, "uint", Options, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} EventName 
 * @param {Pointer<HANDLE>} EventHandle 
 * @returns {Pointer<KEVENT>} 
 */
export IoCreateNotificationEvent(EventName, EventHandle) {
    result := DllCall("ntoskrnl.exe\IoCreateNotificationEvent", UNICODE_STRING.Ptr, EventName, HANDLE.Ptr, EventHandle, KEVENT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {Pointer<UNICODE_STRING>} DeviceName 
 * @returns {NTSTATUS} 
 */
export IoCreateSymbolicLink(SymbolicLinkName, DeviceName) {
    result := DllCall("ntoskrnl.exe\IoCreateSymbolicLink", UNICODE_STRING.Ptr, SymbolicLinkName, UNICODE_STRING.Ptr, DeviceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} EventName 
 * @param {Pointer<HANDLE>} EventHandle 
 * @returns {Pointer<KEVENT>} 
 */
export IoCreateSynchronizationEvent(EventName, EventHandle) {
    result := DllCall("ntoskrnl.exe\IoCreateSynchronizationEvent", UNICODE_STRING.Ptr, EventName, HANDLE.Ptr, EventHandle, KEVENT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {Pointer<UNICODE_STRING>} DeviceName 
 * @returns {NTSTATUS} 
 */
export IoCreateUnprotectedSymbolicLink(SymbolicLinkName, DeviceName) {
    result := DllCall("ntoskrnl.exe\IoCreateUnprotectedSymbolicLink", UNICODE_STRING.Ptr, SymbolicLinkName, UNICODE_STRING.Ptr, DeviceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoDeleteDevice(DeviceObject) {
    DllCall("ntoskrnl.exe\IoDeleteDevice", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @returns {NTSTATUS} 
 */
export IoDeleteSymbolicLink(SymbolicLinkName) {
    result := DllCall("ntoskrnl.exe\IoDeleteSymbolicLink", UNICODE_STRING.Ptr, SymbolicLinkName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
 * @returns {String} Nothing - always returns an empty string
 */
export IoDetachDevice(TargetDevice) {
    DllCall("ntoskrnl.exe\IoDetachDevice", DEVICE_OBJECT.Ptr, TargetDevice)
}

/**
 * 
 * @param {PKINTERRUPT} InterruptObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoDisconnectInterrupt(InterruptObject) {
    DllCall("ntoskrnl.exe\IoDisconnectInterrupt", PKINTERRUPT, InterruptObject)
}

/**
 * 
 * @param {Pointer<IO_DISCONNECT_INTERRUPT_PARAMETERS>} Parameters 
 * @returns {String} Nothing - always returns an empty string
 */
export IoDisconnectInterruptEx(Parameters) {
    DllCall("ntoskrnl.exe\IoDisconnectInterruptEx", IO_DISCONNECT_INTERRUPT_PARAMETERS.Ptr, Parameters)
}

/**
 * 
 * @param {Pointer<IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS>} Parameters 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReportInterruptActive(Parameters) {
    DllCall("ntoskrnl.exe\IoReportInterruptActive", IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS.Ptr, Parameters)
}

/**
 * 
 * @param {Pointer<IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS>} Parameters 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReportInterruptInactive(Parameters) {
    DllCall("ntoskrnl.exe\IoReportInterruptInactive", IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS.Ptr, Parameters)
}

/**
 * 
 * @param {PKINTERRUPT} InterruptObject 
 * @param {Pointer<GROUP_AFFINITY>} GroupAffinity 
 * @returns {NTSTATUS} 
 */
export IoGetAffinityInterrupt(InterruptObject, GroupAffinity) {
    result := DllCall("ntoskrnl.exe\IoGetAffinityInterrupt", PKINTERRUPT, InterruptObject, GROUP_AFFINITY.Ptr, GroupAffinity, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeIrp(_Irp) {
    DllCall("ntoskrnl.exe\IoFreeIrp", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<MDL>} _Mdl 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeMdl(_Mdl) {
    DllCall("ntoskrnl.exe\IoFreeMdl", MDL.Ptr, _Mdl)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetAttachedDeviceReference(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoGetAttachedDeviceReference", DEVICE_OBJECT.Ptr, DeviceObject, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<Void>} ClientIdentificationAddress 
 * @returns {Pointer<Void>} 
 */
export IoGetDriverObjectExtension(DriverObject, ClientIdentificationAddress) {
    ClientIdentificationAddressMarshal := ClientIdentificationAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDriverObjectExtension", DRIVER_OBJECT.Ptr, DriverObject, ClientIdentificationAddressMarshal, ClientIdentificationAddress, IntPtr)
    return result
}

/**
 * 
 * @returns {PEPROCESS} 
 */
export IoGetCurrentProcess() {
    result := DllCall("ntoskrnl.exe\IoGetCurrentProcess", PEPROCESS)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} ObjectName 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<Pointer<FILE_OBJECT>>} FileObject 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceObjectPointer(ObjectName, DesiredAccess, FileObject, DeviceObject) {
    FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
    DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDeviceObjectPointer", UNICODE_STRING.Ptr, ObjectName, "uint", DesiredAccess, FileObjectMarshal, FileObject, DeviceObjectMarshal, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<DEVICE_DESCRIPTION>} DeviceDescription 
 * @param {Pointer<Integer>} NumberOfMapRegisters 
 * @returns {Pointer<DMA_ADAPTER>} 
 */
export IoGetDmaAdapter(PhysicalDeviceObject, DeviceDescription, NumberOfMapRegisters) {
    NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDmaAdapter", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, DEVICE_DESCRIPTION.Ptr, DeviceDescription, NumberOfMapRegistersMarshal, NumberOfMapRegisters, DMA_ADAPTER.Ptr)
    return result
}

/**
 * 
 * @param {Integer} _Version 
 * @param {Pointer<DMA_IOMMU_INTERFACE>} InterfaceOut 
 * @returns {NTSTATUS} 
 */
export IoGetIommuInterface(_Version, InterfaceOut) {
    result := DllCall("ntoskrnl.exe\IoGetIommuInterface", "uint", _Version, DMA_IOMMU_INTERFACE.Ptr, InterfaceOut, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} _Version 
 * @param {Integer} Flags 
 * @param {Pointer<DMA_IOMMU_INTERFACE_EX>} InterfaceOut 
 * @returns {NTSTATUS} 
 */
export IoGetIommuInterfaceEx(_Version, Flags, InterfaceOut) {
    result := DllCall("ntoskrnl.exe\IoGetIommuInterfaceEx", "uint", _Version, "uint", Flags, DMA_IOMMU_INTERFACE_EX.Ptr, InterfaceOut, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export IoForwardIrpSynchronously(DeviceObject, _Irp) {
    result := DllCall("ntoskrnl.exe\IoForwardIrpSynchronously", DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export IoSynchronousCallDriver(DeviceObject, _Irp) {
    result := DllCall("ntoskrnl.exe\IoSynchronousCallDriver", DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {Pointer<Void>} 
 */
export IoGetInitialStack() {
    result := DllCall("ntoskrnl.exe\IoGetInitialStack", IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} LowLimit 
 * @param {Pointer<Pointer>} HighLimit 
 * @returns {String} Nothing - always returns an empty string
 */
export IoGetStackLimits(LowLimit, HighLimit) {
    LowLimitMarshal := LowLimit is VarRef ? "ptr*" : "ptr"
    HighLimitMarshal := HighLimit is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\IoGetStackLimits", LowLimitMarshal, LowLimit, HighLimitMarshal, HighLimit)
}

/**
 * 
 * @param {Pointer} RegionStart 
 * @param {Pointer} RegionSize 
 * @returns {Integer} 
 */
export IoWithinStackLimits(RegionStart, RegionSize) {
    result := DllCall("ntoskrnl.exe\IoWithinStackLimits", "ptr", RegionStart, "ptr", RegionSize, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Pointer<DEVICE_OBJECT>} 
 */
export IoGetRelatedDeviceObject(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetRelatedDeviceObject", FILE_OBJECT.Ptr, FileObject, DEVICE_OBJECT.Ptr)
    return result
}

/**
 * 
 * @returns {Pointer<IRP>} 
 */
export IoGetTopLevelIrp() {
    result := DllCall("ntoskrnl.exe\IoGetTopLevelIrp", IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} PacketSize 
 * @param {Integer} StackSize 
 * @returns {String} Nothing - always returns an empty string
 */
export IoInitializeIrp(_Irp, PacketSize, StackSize) {
    DllCall("ntoskrnl.exe\IoInitializeIrp", IRP.Ptr, _Irp, "ushort", PacketSize, "char", StackSize)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export IoCleanupIrp(_Irp) {
    DllCall("ntoskrnl.exe\IoCleanupIrp", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} PacketSize 
 * @param {Integer} StackSize 
 * @returns {String} Nothing - always returns an empty string
 */
export IoInitializeIrpEx(_Irp, DeviceObject, PacketSize, StackSize) {
    DllCall("ntoskrnl.exe\IoInitializeIrpEx", IRP.Ptr, _Irp, DEVICE_OBJECT.Ptr, DeviceObject, "ushort", PacketSize, "char", StackSize)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<PIO_TIMER_ROUTINE>} TimerRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export IoInitializeTimer(DeviceObject, TimerRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoInitializeTimer", DEVICE_OBJECT.Ptr, DeviceObject, "ptr", TimerRoutine, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {NTSTATUS} Iostatus 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReuseIrp(_Irp, Iostatus) {
    DllCall("ntoskrnl.exe\IoReuseIrp", IRP.Ptr, _Irp, NTSTATUS, Iostatus)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export IoRegisterShutdownNotification(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoRegisterShutdownNotification", DEVICE_OBJECT.Ptr, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export IoRegisterLastChanceShutdownNotification(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoRegisterLastChanceShutdownNotification", DEVICE_OBJECT.Ptr, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Irql 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReleaseCancelSpinLock(Irql) {
    DllCall("ntoskrnl.exe\IoReleaseCancelSpinLock", "char", Irql)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRemoveShareAccess(FileObject, ShareAccess) {
    DllCall("ntoskrnl.exe\IoRemoveShareAccess", FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRemoveLinkShareAccess(FileObject, ShareAccess, LinkShareAccess) {
    DllCall("ntoskrnl.exe\IoRemoveLinkShareAccess", FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, LINK_SHARE_ACCESS.Ptr, LinkShareAccess)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
 * @param {Integer} IoShareAccessFlags 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRemoveLinkShareAccessEx(FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
    DllCall("ntoskrnl.exe\IoRemoveLinkShareAccessEx", FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, LINK_SHARE_ACCESS.Ptr, LinkShareAccess, "uint", IoShareAccessFlags)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<PIO_COMPLETION_ROUTINE>} CompletionRoutine 
 * @param {Pointer<Void>} _Context 
 * @param {BOOLEAN} InvokeOnSuccess 
 * @param {BOOLEAN} InvokeOnError 
 * @param {BOOLEAN} InvokeOnCancel 
 * @returns {NTSTATUS} 
 */
export IoSetCompletionRoutineEx(DeviceObject, _Irp, CompletionRoutine, _Context, InvokeOnSuccess, InvokeOnError, InvokeOnCancel) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoSetCompletionRoutineEx", DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, "ptr", CompletionRoutine, _ContextMarshal, _Context, BOOLEAN, InvokeOnSuccess, BOOLEAN, InvokeOnError, BOOLEAN, InvokeOnCancel, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} DesiredAccess 
 * @param {Integer} DesiredShareAccess 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess) {
    DllCall("ntoskrnl.exe\IoSetShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess)
}

/**
 * 
 * @param {Integer} DesiredAccess 
 * @param {Integer} DesiredShareAccess 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<BOOLEAN>} WritePermission 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetShareAccessEx(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, WritePermission) {
    WritePermissionMarshal := WritePermission is VarRef ? "char*" : "ptr"

    DllCall("ntoskrnl.exe\IoSetShareAccessEx", "uint", DesiredAccess, "uint", DesiredShareAccess, FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, WritePermissionMarshal, WritePermission)
}

/**
 * 
 * @param {Integer} DesiredAccess 
 * @param {Integer} DesiredShareAccess 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
 * @param {Integer} IoShareAccessFlags 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetLinkShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
    DllCall("ntoskrnl.exe\IoSetLinkShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, LINK_SHARE_ACCESS.Ptr, LinkShareAccess, "uint", IoShareAccessFlags)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetTopLevelIrp(_Irp) {
    DllCall("ntoskrnl.exe\IoSetTopLevelIrp", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<IO_REMOVE_LOCK>} Lock 
 * @param {Integer} AllocateTag 
 * @param {Integer} MaxLockedMinutes 
 * @param {Integer} HighWatermark 
 * @param {Integer} RemlockSize 
 * @returns {String} Nothing - always returns an empty string
 */
export IoInitializeRemoveLockEx(Lock, AllocateTag, MaxLockedMinutes, HighWatermark, RemlockSize) {
    DllCall("ntoskrnl.exe\IoInitializeRemoveLockEx", IO_REMOVE_LOCK.Ptr, Lock, "uint", AllocateTag, "uint", MaxLockedMinutes, "uint", HighWatermark, "uint", RemlockSize)
}

/**
 * 
 * @param {Pointer<IO_REMOVE_LOCK>} RemoveLock 
 * @param {Pointer<Void>} Tag 
 * @param {PSTR} _File 
 * @param {Integer} Line 
 * @param {Integer} RemlockSize 
 * @returns {NTSTATUS} 
 */
export IoAcquireRemoveLockEx(RemoveLock, Tag, _File, Line, RemlockSize) {
    _File := _File is String ? StrPtr(_File) : _File

    TagMarshal := Tag is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAcquireRemoveLockEx", IO_REMOVE_LOCK.Ptr, RemoveLock, TagMarshal, Tag, "ptr", _File, "uint", Line, "uint", RemlockSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_REMOVE_LOCK>} RemoveLock 
 * @param {Pointer<Void>} Tag 
 * @param {Integer} RemlockSize 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReleaseRemoveLockEx(RemoveLock, Tag, RemlockSize) {
    TagMarshal := Tag is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoReleaseRemoveLockEx", IO_REMOVE_LOCK.Ptr, RemoveLock, TagMarshal, Tag, "uint", RemlockSize)
}

/**
 * 
 * @param {Pointer<IO_REMOVE_LOCK>} RemoveLock 
 * @param {Pointer<Void>} Tag 
 * @param {Integer} RemlockSize 
 * @returns {String} Nothing - always returns an empty string
 */
export IoReleaseRemoveLockAndWaitEx(RemoveLock, Tag, RemlockSize) {
    TagMarshal := Tag is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoReleaseRemoveLockAndWaitEx", IO_REMOVE_LOCK.Ptr, RemoveLock, TagMarshal, Tag, "uint", RemlockSize)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} StackSize 
 * @returns {Integer} 
 */
export IoSizeOfIrpEx(DeviceObject, StackSize) {
    result := DllCall("ntoskrnl.exe\IoSizeOfIrpEx", DEVICE_OBJECT.Ptr, DeviceObject, "char", StackSize, UInt16)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {BOOLEAN} Cancelable 
 * @returns {String} Nothing - always returns an empty string
 */
export IoStartNextPacket(DeviceObject, Cancelable) {
    DllCall("ntoskrnl.exe\IoStartNextPacket", DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN, Cancelable)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {BOOLEAN} Cancelable 
 * @param {Integer} Key 
 * @returns {String} Nothing - always returns an empty string
 */
export IoStartNextPacketByKey(DeviceObject, Cancelable, Key) {
    DllCall("ntoskrnl.exe\IoStartNextPacketByKey", DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN, Cancelable, "uint", Key)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Integer>} Key 
 * @param {Pointer<DRIVER_CANCEL>} CancelFunction 
 * @returns {String} Nothing - always returns an empty string
 */
export IoStartPacket(DeviceObject, _Irp, Key, CancelFunction) {
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    DllCall("ntoskrnl.exe\IoStartPacket", DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, KeyMarshal, Key, "ptr", CancelFunction)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {BOOLEAN} DeferredStartIo 
 * @param {BOOLEAN} NonCancelable 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetStartIoAttributes(DeviceObject, DeferredStartIo, NonCancelable) {
    DllCall("ntoskrnl.exe\IoSetStartIoAttributes", DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN, DeferredStartIo, BOOLEAN, NonCancelable)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoStartTimer(DeviceObject) {
    DllCall("ntoskrnl.exe\IoStartTimer", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoStopTimer(DeviceObject) {
    DllCall("ntoskrnl.exe\IoStopTimer", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUnregisterShutdownNotification(DeviceObject) {
    DllCall("ntoskrnl.exe\IoUnregisterShutdownNotification", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUpdateShareAccess(FileObject, ShareAccess) {
    DllCall("ntoskrnl.exe\IoUpdateShareAccess", FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUpdateLinkShareAccess(FileObject, ShareAccess, LinkShareAccess) {
    DllCall("ntoskrnl.exe\IoUpdateLinkShareAccess", FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, LINK_SHARE_ACCESS.Ptr, LinkShareAccess)
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<SHARE_ACCESS>} ShareAccess 
 * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
 * @param {Integer} IoShareAccessFlags 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUpdateLinkShareAccessEx(FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
    DllCall("ntoskrnl.exe\IoUpdateLinkShareAccessEx", FILE_OBJECT.Ptr, FileObject, SHARE_ACCESS.Ptr, ShareAccess, LINK_SHARE_ACCESS.Ptr, LinkShareAccess, "uint", IoShareAccessFlags)
}

/**
 * 
 * @param {Pointer<Void>} ElEntry 
 * @returns {String} Nothing - always returns an empty string
 */
export IoWriteErrorLogEntry(ElEntry) {
    ElEntryMarshal := ElEntry is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoWriteErrorLogEntry", ElEntryMarshal, ElEntry)
}

/**
 * 
 * @param {Pointer<Void>} IoObject 
 * @param {Pointer<HANDLE>} ThreadHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<CLIENT_ID>} ClientId 
 * @param {Pointer<PKSTART_ROUTINE>} StartRoutine 
 * @param {Pointer<Void>} StartContext 
 * @returns {NTSTATUS} 
 */
export IoCreateSystemThread(IoObject, ThreadHandle, DesiredAccess, ObjectAttributes, ProcessHandle, ClientId, StartRoutine, StartContext) {
    IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"
    StartContextMarshal := StartContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCreateSystemThread", IoObjectMarshal, IoObject, HANDLE.Ptr, ThreadHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, HANDLE, ProcessHandle, CLIENT_ID.Ptr, ClientId, "ptr", StartRoutine, StartContextMarshal, StartContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {PIO_WORKITEM} 
 */
export IoAllocateWorkItem(DeviceObject) {
    result := DllCall("ntoskrnl.exe\IoAllocateWorkItem", DEVICE_OBJECT.Ptr, DeviceObject, PIO_WORKITEM)
    return result
}

/**
 * 
 * @param {PIO_WORKITEM} IoWorkItem 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeWorkItem(IoWorkItem) {
    DllCall("ntoskrnl.exe\IoFreeWorkItem", PIO_WORKITEM, IoWorkItem)
}

/**
 * 
 * @param {PIO_WORKITEM} IoWorkItem 
 * @param {Pointer<PIO_WORKITEM_ROUTINE>} WorkerRoutine 
 * @param {WORK_QUEUE_TYPE} QueueType 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export IoQueueWorkItem(IoWorkItem, WorkerRoutine, QueueType, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoQueueWorkItem", PIO_WORKITEM, IoWorkItem, "ptr", WorkerRoutine, WORK_QUEUE_TYPE, QueueType, _ContextMarshal, _Context)
}

/**
 * 
 * @param {PIO_WORKITEM} IoWorkItem 
 * @param {Pointer<PIO_WORKITEM_ROUTINE_EX>} WorkerRoutine 
 * @param {WORK_QUEUE_TYPE} QueueType 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export IoQueueWorkItemEx(IoWorkItem, WorkerRoutine, QueueType, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoQueueWorkItemEx", PIO_WORKITEM, IoWorkItem, "ptr", WorkerRoutine, WORK_QUEUE_TYPE, QueueType, _ContextMarshal, _Context)
}

/**
 * 
 * @returns {Integer} 
 */
export IoSizeofWorkItem() {
    result := DllCall("ntoskrnl.exe\IoSizeofWorkItem", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} IoObject 
 * @param {PIO_WORKITEM} IoWorkItem 
 * @returns {String} Nothing - always returns an empty string
 */
export IoInitializeWorkItem(IoObject, IoWorkItem) {
    IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoInitializeWorkItem", IoObjectMarshal, IoObject, PIO_WORKITEM, IoWorkItem)
}

/**
 * 
 * @param {PIO_WORKITEM} IoWorkItem 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUninitializeWorkItem(IoWorkItem) {
    DllCall("ntoskrnl.exe\IoUninitializeWorkItem", PIO_WORKITEM, IoWorkItem)
}

/**
 * 
 * @param {PIO_WORKITEM} IoWorkItem 
 * @param {Pointer<PIO_WORKITEM_ROUTINE_EX>} WorkerRoutine 
 * @param {WORK_QUEUE_TYPE} QueueType 
 * @param {Pointer<Void>} _Context 
 * @returns {BOOLEAN} 
 */
export IoTryQueueWorkItem(IoWorkItem, WorkerRoutine, QueueType, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoTryQueueWorkItem", PIO_WORKITEM, IoWorkItem, "ptr", WorkerRoutine, WORK_QUEUE_TYPE, QueueType, _ContextMarshal, _Context, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} Action 
 * @returns {NTSTATUS} 
 */
export IoWMIRegistrationControl(DeviceObject, Action) {
    result := DllCall("ntoskrnl.exe\IoWMIRegistrationControl", DEVICE_OBJECT.Ptr, DeviceObject, "uint", Action, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} Guid 
 * @param {Integer} InstanceCount 
 * @param {Pointer<Integer>} FirstInstanceId 
 * @returns {NTSTATUS} 
 */
export IoWMIAllocateInstanceIds(Guid, InstanceCount, FirstInstanceId) {
    FirstInstanceIdMarshal := FirstInstanceId is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIAllocateInstanceIds", Guid.Ptr, Guid, "uint", InstanceCount, FirstInstanceIdMarshal, FirstInstanceId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {BOOLEAN} CombineNames 
 * @param {Pointer<UNICODE_STRING>} SuggestedInstanceName 
 * @returns {NTSTATUS} 
 */
export IoWMISuggestInstanceName(PhysicalDeviceObject, SymbolicLinkName, CombineNames, SuggestedInstanceName) {
    result := DllCall("ntoskrnl.exe\IoWMISuggestInstanceName", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UNICODE_STRING.Ptr, SymbolicLinkName, BOOLEAN, CombineNames, UNICODE_STRING.Ptr, SuggestedInstanceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} WnodeEventItem 
 * @returns {NTSTATUS} 
 */
export IoWMIWriteEvent(WnodeEventItem) {
    WnodeEventItemMarshal := WnodeEventItem is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIWriteEvent", WnodeEventItemMarshal, WnodeEventItem, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} Guid 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<Pointer<Void>>} DataBlockObject 
 * @returns {NTSTATUS} 
 */
export IoWMIOpenBlock(Guid, DesiredAccess, DataBlockObject) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIOpenBlock", Guid.Ptr, Guid, "uint", DesiredAccess, DataBlockObjectMarshal, DataBlockObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {Pointer<Integer>} InOutBufferSize 
 * @param {Integer} OutBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMIQueryAllData(DataBlockObject, InOutBufferSize, OutBuffer) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"
    InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIQueryAllData", DataBlockObjectMarshal, DataBlockObject, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} DataBlockObjectList 
 * @param {Integer} ObjectCount 
 * @param {Pointer<Integer>} InOutBufferSize 
 * @param {Integer} OutBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMIQueryAllDataMultiple(DataBlockObjectList, ObjectCount, InOutBufferSize, OutBuffer) {
    DataBlockObjectListMarshal := DataBlockObjectList is VarRef ? "ptr*" : "ptr"
    InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIQueryAllDataMultiple", DataBlockObjectListMarshal, DataBlockObjectList, "uint", ObjectCount, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Pointer<Integer>} InOutBufferSize 
 * @param {Integer} OutBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMIQuerySingleInstance(DataBlockObject, InstanceName, InOutBufferSize, OutBuffer) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"
    InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIQuerySingleInstance", DataBlockObjectMarshal, DataBlockObject, UNICODE_STRING.Ptr, InstanceName, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} DataBlockObjectList 
 * @param {Pointer<UNICODE_STRING>} InstanceNames 
 * @param {Integer} ObjectCount 
 * @param {Pointer<Integer>} InOutBufferSize 
 * @param {Integer} OutBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMIQuerySingleInstanceMultiple(DataBlockObjectList, InstanceNames, ObjectCount, InOutBufferSize, OutBuffer) {
    DataBlockObjectListMarshal := DataBlockObjectList is VarRef ? "ptr*" : "ptr"
    InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIQuerySingleInstanceMultiple", DataBlockObjectListMarshal, DataBlockObjectList, UNICODE_STRING.Ptr, InstanceNames, "uint", ObjectCount, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Integer} _Version 
 * @param {Integer} ValueBufferSize 
 * @param {Integer} ValueBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMISetSingleInstance(DataBlockObject, InstanceName, _Version, ValueBufferSize, ValueBuffer) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMISetSingleInstance", DataBlockObjectMarshal, DataBlockObject, UNICODE_STRING.Ptr, InstanceName, "uint", _Version, "uint", ValueBufferSize, "ptr", ValueBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Integer} DataItemId 
 * @param {Integer} _Version 
 * @param {Integer} ValueBufferSize 
 * @param {Integer} ValueBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMISetSingleItem(DataBlockObject, InstanceName, DataItemId, _Version, ValueBufferSize, ValueBuffer) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMISetSingleItem", DataBlockObjectMarshal, DataBlockObject, UNICODE_STRING.Ptr, InstanceName, "uint", DataItemId, "uint", _Version, "uint", ValueBufferSize, "ptr", ValueBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @param {Integer} MethodId 
 * @param {Integer} InBufferSize 
 * @param {Pointer<Integer>} OutBufferSize 
 * @param {Integer} InOutBuffer 
 * @returns {NTSTATUS} 
 */
export IoWMIExecuteMethod(DataBlockObject, InstanceName, MethodId, InBufferSize, OutBufferSize, InOutBuffer) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"
    OutBufferSizeMarshal := OutBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIExecuteMethod", DataBlockObjectMarshal, DataBlockObject, UNICODE_STRING.Ptr, InstanceName, "uint", MethodId, "uint", InBufferSize, OutBufferSizeMarshal, OutBufferSize, "ptr", InOutBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<WMI_NOTIFICATION_CALLBACK>} Callback 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export IoWMISetNotificationCallback(_Object, Callback, _Context) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMISetNotificationCallback", _ObjectMarshal, _Object, "ptr", Callback, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @returns {NTSTATUS} 
 */
export IoWMIHandleToInstanceName(DataBlockObject, FileHandle, InstanceName) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIHandleToInstanceName", DataBlockObjectMarshal, DataBlockObject, HANDLE, FileHandle, UNICODE_STRING.Ptr, InstanceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataBlockObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<UNICODE_STRING>} InstanceName 
 * @returns {NTSTATUS} 
 */
export IoWMIDeviceObjectToInstanceName(DataBlockObject, DeviceObject, InstanceName) {
    DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWMIDeviceObjectToInstanceName", DataBlockObjectMarshal, DataBlockObject, DEVICE_OBJECT.Ptr, DeviceObject, UNICODE_STRING.Ptr, InstanceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export IoIs32bitProcess(_Irp) {
    result := DllCall("ntoskrnl.exe\IoIs32bitProcess", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export IoIsInitiator32bitProcess(_Irp) {
    result := DllCall("ntoskrnl.exe\IoIsInitiator32bitProcess", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ElEntry 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeErrorLogEntry(ElEntry) {
    ElEntryMarshal := ElEntry is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoFreeErrorLogEntry", ElEntryMarshal, ElEntry)
}

/**
 * 
 * @param {Pointer<IO_CSQ>} Csq 
 * @param {Pointer<PIO_CSQ_INSERT_IRP>} CsqInsertIrp 
 * @param {Pointer<PIO_CSQ_REMOVE_IRP>} CsqRemoveIrp 
 * @param {Pointer<PIO_CSQ_PEEK_NEXT_IRP>} CsqPeekNextIrp 
 * @param {Pointer<PIO_CSQ_ACQUIRE_LOCK>} CsqAcquireLock 
 * @param {Pointer<PIO_CSQ_RELEASE_LOCK>} CsqReleaseLock 
 * @param {Pointer<PIO_CSQ_COMPLETE_CANCELED_IRP>} CsqCompleteCanceledIrp 
 * @returns {NTSTATUS} 
 */
export IoCsqInitialize(Csq, CsqInsertIrp, CsqRemoveIrp, CsqPeekNextIrp, CsqAcquireLock, CsqReleaseLock, CsqCompleteCanceledIrp) {
    result := DllCall("ntoskrnl.exe\IoCsqInitialize", IO_CSQ.Ptr, Csq, "ptr", CsqInsertIrp, "ptr", CsqRemoveIrp, "ptr", CsqPeekNextIrp, "ptr", CsqAcquireLock, "ptr", CsqReleaseLock, "ptr", CsqCompleteCanceledIrp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_CSQ>} Csq 
 * @param {Pointer<PIO_CSQ_INSERT_IRP_EX>} CsqInsertIrp 
 * @param {Pointer<PIO_CSQ_REMOVE_IRP>} CsqRemoveIrp 
 * @param {Pointer<PIO_CSQ_PEEK_NEXT_IRP>} CsqPeekNextIrp 
 * @param {Pointer<PIO_CSQ_ACQUIRE_LOCK>} CsqAcquireLock 
 * @param {Pointer<PIO_CSQ_RELEASE_LOCK>} CsqReleaseLock 
 * @param {Pointer<PIO_CSQ_COMPLETE_CANCELED_IRP>} CsqCompleteCanceledIrp 
 * @returns {NTSTATUS} 
 */
export IoCsqInitializeEx(Csq, CsqInsertIrp, CsqRemoveIrp, CsqPeekNextIrp, CsqAcquireLock, CsqReleaseLock, CsqCompleteCanceledIrp) {
    result := DllCall("ntoskrnl.exe\IoCsqInitializeEx", IO_CSQ.Ptr, Csq, "ptr", CsqInsertIrp, "ptr", CsqRemoveIrp, "ptr", CsqPeekNextIrp, "ptr", CsqAcquireLock, "ptr", CsqReleaseLock, "ptr", CsqCompleteCanceledIrp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_CSQ>} Csq 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<IO_CSQ_IRP_CONTEXT>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export IoCsqInsertIrp(Csq, _Irp, _Context) {
    DllCall("ntoskrnl.exe\IoCsqInsertIrp", IO_CSQ.Ptr, Csq, IRP.Ptr, _Irp, IO_CSQ_IRP_CONTEXT.Ptr, _Context)
}

/**
 * 
 * @param {Pointer<IO_CSQ>} Csq 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<IO_CSQ_IRP_CONTEXT>} _Context 
 * @param {Pointer<Void>} InsertContext 
 * @returns {NTSTATUS} 
 */
export IoCsqInsertIrpEx(Csq, _Irp, _Context, InsertContext) {
    InsertContextMarshal := InsertContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCsqInsertIrpEx", IO_CSQ.Ptr, Csq, IRP.Ptr, _Irp, IO_CSQ_IRP_CONTEXT.Ptr, _Context, InsertContextMarshal, InsertContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IO_CSQ>} Csq 
 * @param {Pointer<Void>} PeekContext 
 * @returns {Pointer<IRP>} 
 */
export IoCsqRemoveNextIrp(Csq, PeekContext) {
    PeekContextMarshal := PeekContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCsqRemoveNextIrp", IO_CSQ.Ptr, Csq, PeekContextMarshal, PeekContext, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<IO_CSQ>} Csq 
 * @param {Pointer<IO_CSQ_IRP_CONTEXT>} _Context 
 * @returns {Pointer<IRP>} 
 */
export IoCsqRemoveIrp(Csq, _Context) {
    result := DllCall("ntoskrnl.exe\IoCsqRemoveIrp", IO_CSQ.Ptr, Csq, IO_CSQ_IRP_CONTEXT.Ptr, _Context, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} RequiredAccess 
 * @returns {NTSTATUS} 
 */
export IoValidateDeviceIoControlAccess(_Irp, RequiredAccess) {
    result := DllCall("ntoskrnl.exe\IoValidateDeviceIoControlAccess", IRP.Ptr, _Irp, "uint", RequiredAccess, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {IO_PRIORITY_HINT} 
 */
export IoGetIoPriorityHint(_Irp) {
    result := DllCall("ntoskrnl.exe\IoGetIoPriorityHint", IRP.Ptr, _Irp, IO_PRIORITY_HINT)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {IO_PRIORITY_HINT} PriorityHint 
 * @returns {NTSTATUS} 
 */
export IoSetIoPriorityHint(_Irp, PriorityHint) {
    result := DllCall("ntoskrnl.exe\IoSetIoPriorityHint", IRP.Ptr, _Irp, IO_PRIORITY_HINT, PriorityHint, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Integer} Length 
 * @param {Pointer<Void>} Signature 
 * @param {Pointer<Pointer<Void>>} StreamIdentifier 
 * @returns {NTSTATUS} 
 */
export IoAllocateSfioStreamIdentifier(FileObject, Length, Signature, StreamIdentifier) {
    SignatureMarshal := Signature is VarRef ? "ptr" : "ptr"
    StreamIdentifierMarshal := StreamIdentifier is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAllocateSfioStreamIdentifier", FILE_OBJECT.Ptr, FileObject, "uint", Length, SignatureMarshal, Signature, StreamIdentifierMarshal, StreamIdentifier, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Void>} Signature 
 * @returns {Pointer<Void>} 
 */
export IoGetSfioStreamIdentifier(FileObject, Signature) {
    SignatureMarshal := Signature is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetSfioStreamIdentifier", FILE_OBJECT.Ptr, FileObject, SignatureMarshal, Signature, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {Pointer<Void>} Signature 
 * @returns {NTSTATUS} 
 */
export IoFreeSfioStreamIdentifier(FileObject, Signature) {
    SignatureMarshal := Signature is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoFreeSfioStreamIdentifier", FILE_OBJECT.Ptr, FileObject, SignatureMarshal, Signature, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Pointer<Void>>} IoAttributionHandle 
 * @returns {NTSTATUS} 
 */
export IoGetIoAttributionHandle(_Irp, IoAttributionHandle) {
    IoAttributionHandleMarshal := IoAttributionHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetIoAttributionHandle", IRP.Ptr, _Irp, IoAttributionHandleMarshal, IoAttributionHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} OpaqueHandle 
 * @param {Pointer<IO_ATTRIBUTION_INFORMATION>} AttributionInformation 
 * @returns {NTSTATUS} 
 */
export IoRecordIoAttribution(OpaqueHandle, AttributionInformation) {
    OpaqueHandleMarshal := OpaqueHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoRecordIoAttribution", OpaqueHandleMarshal, OpaqueHandle, IO_ATTRIBUTION_INFORMATION.Ptr, AttributionInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Void>} AttributionSource 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export IoSetIoAttributionIrp(_Irp, AttributionSource, Flags) {
    AttributionSourceMarshal := AttributionSource is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoSetIoAttributionIrp", IRP.Ptr, _Irp, AttributionSourceMarshal, AttributionSource, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {IO_CONTAINER_INFORMATION_CLASS} InformationClass 
 * @param {Pointer<Void>} ContainerObject 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {NTSTATUS} 
 */
export IoGetContainerInformation(InformationClass, ContainerObject, _Buffer, BufferLength) {
    ContainerObjectMarshal := ContainerObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetContainerInformation", IO_CONTAINER_INFORMATION_CLASS, InformationClass, ContainerObjectMarshal, ContainerObject, "ptr", _Buffer, "uint", BufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {IO_CONTAINER_NOTIFICATION_CLASS} NotificationClass 
 * @param {Pointer<PIO_CONTAINER_NOTIFICATION_FUNCTION>} CallbackFunction 
 * @param {Integer} NotificationInformation 
 * @param {Integer} NotificationInformationLength 
 * @param {Pointer<Void>} CallbackRegistration 
 * @returns {NTSTATUS} 
 */
export IoRegisterContainerNotification(NotificationClass, CallbackFunction, NotificationInformation, NotificationInformationLength, CallbackRegistration) {
    CallbackRegistrationMarshal := CallbackRegistration is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoRegisterContainerNotification", IO_CONTAINER_NOTIFICATION_CLASS, NotificationClass, "ptr", CallbackFunction, "ptr", NotificationInformation, "uint", NotificationInformationLength, CallbackRegistrationMarshal, CallbackRegistration, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} CallbackRegistration 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUnregisterContainerNotification(CallbackRegistration) {
    CallbackRegistrationMarshal := CallbackRegistration is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoUnregisterContainerNotification", CallbackRegistrationMarshal, CallbackRegistration)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer} _Size 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} DataHandle 
 * @returns {NTSTATUS} 
 */
export IoReserveKsrPersistentMemory(DriverObject, PhysicalDeviceObject, _Size, Flags, DataHandle) {
    DataHandleMarshal := DataHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReserveKsrPersistentMemory", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, "ptr", _Size, "uint", Flags, DataHandleMarshal, DataHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataHandle 
 * @returns {NTSTATUS} 
 */
export IoFreeKsrPersistentMemory(DataHandle) {
    DataHandleMarshal := DataHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoFreeKsrPersistentMemory", DataHandleMarshal, DataHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<Pointer>} BufferSize 
 * @returns {NTSTATUS} 
 */
export IoQueryKsrPersistentMemorySize(DriverObject, PhysicalDeviceObject, BufferSize) {
    BufferSizeMarshal := BufferSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoQueryKsrPersistentMemorySize", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, BufferSizeMarshal, BufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Integer} _Buffer 
 * @param {Pointer<Pointer>} _Size 
 * @returns {NTSTATUS} 
 */
export IoAcquireKsrPersistentMemory(DriverObject, PhysicalDeviceObject, _Buffer, _Size) {
    _SizeMarshal := _Size is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAcquireKsrPersistentMemory", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, "ptr", _Buffer, _SizeMarshal, _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DataHandle 
 * @param {Integer} _Buffer 
 * @param {Pointer} _Size 
 * @returns {NTSTATUS} 
 */
export IoWriteKsrPersistentMemory(DataHandle, _Buffer, _Size) {
    DataHandleMarshal := DataHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoWriteKsrPersistentMemory", DataHandleMarshal, DataHandle, "ptr", _Buffer, "ptr", _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
 * @param {Pointer<PIO_PERSISTED_MEMORY_ENUMERATION_CALLBACK>} Callback 
 * @param {Pointer<Void>} CallbackContext 
 * @returns {NTSTATUS} 
 */
export IoEnumerateKsrPersistentMemoryEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, Callback, CallbackContext) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoEnumerateKsrPersistentMemoryEx", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UNICODE_STRING.Ptr, PhysicalDeviceId, "ptr", Callback, CallbackContextMarshal, CallbackContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
 * @param {Pointer<Integer>} DataTag 
 * @param {Integer} DataVersion 
 * @param {Pointer} _Size 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} DataHandle 
 * @returns {NTSTATUS} 
 */
export IoReserveKsrPersistentMemoryEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, _Size, Flags, DataHandle) {
    DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
    DataHandleMarshal := DataHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReserveKsrPersistentMemoryEx", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UNICODE_STRING.Ptr, PhysicalDeviceId, DataTagMarshal, DataTag, "uint", DataVersion, "ptr", _Size, "uint", Flags, DataHandleMarshal, DataHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
 * @param {Pointer<Integer>} DataTag 
 * @param {Pointer<Integer>} DataVersion 
 * @param {Pointer<Pointer>} BufferSize 
 * @returns {NTSTATUS} 
 */
export IoQueryKsrPersistentMemorySizeEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, BufferSize) {
    DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
    DataVersionMarshal := DataVersion is VarRef ? "uint*" : "ptr"
    BufferSizeMarshal := BufferSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoQueryKsrPersistentMemorySizeEx", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UNICODE_STRING.Ptr, PhysicalDeviceId, DataTagMarshal, DataTag, DataVersionMarshal, DataVersion, BufferSizeMarshal, BufferSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
 * @param {Pointer<Integer>} DataTag 
 * @param {Pointer<Integer>} DataVersion 
 * @param {Integer} _Buffer 
 * @param {Pointer<Pointer>} _Size 
 * @returns {NTSTATUS} 
 */
export IoAcquireKsrPersistentMemoryEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, _Buffer, _Size) {
    DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
    DataVersionMarshal := DataVersion is VarRef ? "uint*" : "ptr"
    _SizeMarshal := _Size is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAcquireKsrPersistentMemoryEx", DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UNICODE_STRING.Ptr, PhysicalDeviceId, DataTagMarshal, DataTag, DataVersionMarshal, DataVersion, "ptr", _Buffer, _SizeMarshal, _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {TRACE_INFORMATION_CLASS} TraceInformationClass 
 * @param {Integer} TraceInformation 
 * @param {Integer} TraceInformationLength 
 * @param {Pointer<Integer>} RequiredLength 
 * @param {Pointer<Void>} _Buffer 
 * @returns {NTSTATUS} 
 */
export WmiQueryTraceInformation(TraceInformationClass, TraceInformation, TraceInformationLength, RequiredLength, _Buffer) {
    RequiredLengthMarshal := RequiredLength is VarRef ? "uint*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WmiQueryTraceInformation", TRACE_INFORMATION_CLASS, TraceInformationClass, "ptr", TraceInformation, "uint", TraceInformationLength, RequiredLengthMarshal, RequiredLength, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} ProviderId 
 * @param {Pointer<PETWENABLECALLBACK>} EnableCallback 
 * @param {Pointer<Void>} CallbackContext 
 * @param {Pointer<REGHANDLE>} _RegHandle 
 * @returns {NTSTATUS} 
 */
export EtwRegister(ProviderId, EnableCallback, CallbackContext, _RegHandle) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\EtwRegister", Guid.Ptr, ProviderId, "ptr", EnableCallback, CallbackContextMarshal, CallbackContext, REGHANDLE.Ptr, _RegHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @returns {NTSTATUS} 
 */
export EtwUnregister(_RegHandle) {
    result := DllCall("ntoskrnl.exe\EtwUnregister", REGHANDLE, _RegHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {EVENT_INFO_CLASS} InformationClass 
 * @param {Integer} EventInformation 
 * @param {Integer} InformationLength 
 * @returns {NTSTATUS} 
 */
export EtwSetInformation(_RegHandle, InformationClass, EventInformation, InformationLength) {
    result := DllCall("ntoskrnl.exe\EtwSetInformation", REGHANDLE, _RegHandle, EVENT_INFO_CLASS, InformationClass, "ptr", EventInformation, "uint", InformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
 * @returns {BOOLEAN} 
 */
export EtwEventEnabled(_RegHandle, EventDescriptor) {
    result := DllCall("ntdll.dll\EtwEventEnabled", REGHANDLE, _RegHandle, EVENT_DESCRIPTOR.Ptr, EventDescriptor, BOOLEAN)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {Integer} Level 
 * @param {Integer} Keyword 
 * @returns {BOOLEAN} 
 */
export EtwProviderEnabled(_RegHandle, Level, Keyword) {
    result := DllCall("ntoskrnl.exe\EtwProviderEnabled", REGHANDLE, _RegHandle, "char", Level, "uint", Keyword, BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} ControlCode 
 * @param {Pointer<Guid>} ActivityId 
 * @returns {NTSTATUS} 
 */
export EtwActivityIdControl(ControlCode, ActivityId) {
    result := DllCall("ntoskrnl.exe\EtwActivityIdControl", "uint", ControlCode, Guid.Ptr, ActivityId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
 * @param {Pointer<Guid>} ActivityId 
 * @param {Integer} UserDataCount 
 * @param {Pointer<EVENT_DATA_DESCRIPTOR>} _UserData 
 * @returns {NTSTATUS} 
 */
export EtwWrite(_RegHandle, EventDescriptor, ActivityId, UserDataCount, _UserData) {
    result := DllCall("ntoskrnl.exe\EtwWrite", REGHANDLE, _RegHandle, EVENT_DESCRIPTOR.Ptr, EventDescriptor, Guid.Ptr, ActivityId, "uint", UserDataCount, EVENT_DATA_DESCRIPTOR.Ptr, _UserData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
 * @param {Pointer<Guid>} ActivityId 
 * @param {Pointer<Guid>} RelatedActivityId 
 * @param {Integer} UserDataCount 
 * @param {Pointer<EVENT_DATA_DESCRIPTOR>} _UserData 
 * @returns {NTSTATUS} 
 */
export EtwWriteTransfer(_RegHandle, EventDescriptor, ActivityId, RelatedActivityId, UserDataCount, _UserData) {
    result := DllCall("ntoskrnl.exe\EtwWriteTransfer", REGHANDLE, _RegHandle, EVENT_DESCRIPTOR.Ptr, EventDescriptor, Guid.Ptr, ActivityId, Guid.Ptr, RelatedActivityId, "uint", UserDataCount, EVENT_DATA_DESCRIPTOR.Ptr, _UserData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {Integer} Level 
 * @param {Integer} Keyword 
 * @param {Pointer<Guid>} ActivityId 
 * @param {PWSTR} _String 
 * @returns {NTSTATUS} 
 */
export EtwWriteString(_RegHandle, Level, Keyword, ActivityId, _String) {
    _String := _String is String ? StrPtr(_String) : _String

    result := DllCall("ntoskrnl.exe\EtwWriteString", REGHANDLE, _RegHandle, "char", Level, "uint", Keyword, Guid.Ptr, ActivityId, "ptr", _String, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {REGHANDLE} _RegHandle 
 * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
 * @param {Integer} Filter 
 * @param {Integer} Flags 
 * @param {Pointer<Guid>} ActivityId 
 * @param {Pointer<Guid>} RelatedActivityId 
 * @param {Integer} UserDataCount 
 * @param {Pointer<EVENT_DATA_DESCRIPTOR>} _UserData 
 * @returns {NTSTATUS} 
 */
export EtwWriteEx(_RegHandle, EventDescriptor, Filter, Flags, ActivityId, RelatedActivityId, UserDataCount, _UserData) {
    result := DllCall("ntoskrnl.exe\EtwWriteEx", REGHANDLE, _RegHandle, EVENT_DESCRIPTOR.Ptr, EventDescriptor, "uint", Filter, "uint", Flags, Guid.Ptr, ActivityId, Guid.Ptr, RelatedActivityId, "uint", UserDataCount, EVENT_DATA_DESCRIPTOR.Ptr, _UserData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} CveId 
 * @param {Pointer<UNICODE_STRING>} AdditionalDetails 
 * @returns {NTSTATUS} 
 */
export SeEtwWriteKMCveEvent(CveId, AdditionalDetails) {
    result := DllCall("ntoskrnl.exe\SeEtwWriteKMCveEvent", UNICODE_STRING.Ptr, CveId, UNICODE_STRING.Ptr, AdditionalDetails, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {DEVICE_RELATION_TYPE} Type 
 * @returns {String} Nothing - always returns an empty string
 */
export IoInvalidateDeviceRelations(DeviceObject, Type) {
    DllCall("ntoskrnl.exe\IoInvalidateDeviceRelations", DEVICE_OBJECT.Ptr, DeviceObject, DEVICE_RELATION_TYPE, Type)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRequestDeviceEject(PhysicalDeviceObject) {
    DllCall("ntoskrnl.exe\IoRequestDeviceEject", DEVICE_OBJECT.Ptr, PhysicalDeviceObject)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<PIO_DEVICE_EJECT_CALLBACK>} Callback 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @returns {NTSTATUS} 
 */
export IoRequestDeviceEjectEx(PhysicalDeviceObject, Callback, _Context, DriverObject) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoRequestDeviceEjectEx", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, "ptr", Callback, _ContextMarshal, _Context, DRIVER_OBJECT.Ptr, DriverObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {DEVICE_REGISTRY_PROPERTY} DeviceProperty 
 * @param {Integer} BufferLength 
 * @param {Integer} PropertyBuffer 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceProperty(DeviceObject, DeviceProperty, BufferLength, PropertyBuffer, ResultLength) {
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDeviceProperty", DEVICE_OBJECT.Ptr, DeviceObject, DEVICE_REGISTRY_PROPERTY, DeviceProperty, "uint", BufferLength, "ptr", PropertyBuffer, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} DevInstKeyType 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<HANDLE>} DeviceRegKey 
 * @returns {NTSTATUS} 
 */
export IoOpenDeviceRegistryKey(DeviceObject, DevInstKeyType, DesiredAccess, DeviceRegKey) {
    result := DllCall("ntoskrnl.exe\IoOpenDeviceRegistryKey", DEVICE_OBJECT.Ptr, DeviceObject, "uint", DevInstKeyType, "uint", DesiredAccess, HANDLE.Ptr, DeviceRegKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<Guid>} InterfaceClassGuid 
 * @param {Pointer<UNICODE_STRING>} ReferenceString 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @returns {NTSTATUS} 
 */
export IoRegisterDeviceInterface(PhysicalDeviceObject, InterfaceClassGuid, ReferenceString, SymbolicLinkName) {
    result := DllCall("ntoskrnl.exe\IoRegisterDeviceInterface", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, Guid.Ptr, InterfaceClassGuid, UNICODE_STRING.Ptr, ReferenceString, UNICODE_STRING.Ptr, SymbolicLinkName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<HANDLE>} DeviceInterfaceRegKey 
 * @returns {NTSTATUS} 
 */
export IoOpenDeviceInterfaceRegistryKey(SymbolicLinkName, DesiredAccess, DeviceInterfaceRegKey) {
    result := DllCall("ntoskrnl.exe\IoOpenDeviceInterfaceRegistryKey", UNICODE_STRING.Ptr, SymbolicLinkName, "uint", DesiredAccess, HANDLE.Ptr, DeviceInterfaceRegKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {BOOLEAN} Enable 
 * @returns {NTSTATUS} 
 */
export IoSetDeviceInterfaceState(SymbolicLinkName, Enable) {
    result := DllCall("ntoskrnl.exe\IoSetDeviceInterfaceState", UNICODE_STRING.Ptr, SymbolicLinkName, BOOLEAN, Enable, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} InterfaceClassGuid 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Integer} Flags 
 * @param {Pointer<PWSTR>} SymbolicLinkList 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceInterfaces(InterfaceClassGuid, PhysicalDeviceObject, Flags, SymbolicLinkList) {
    SymbolicLinkListMarshal := SymbolicLinkList is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDeviceInterfaces", Guid.Ptr, InterfaceClassGuid, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, "uint", Flags, SymbolicLinkListMarshal, SymbolicLinkList, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {Pointer<Guid>} AliasInterfaceClassGuid 
 * @param {Pointer<UNICODE_STRING>} AliasSymbolicLinkName 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceInterfaceAlias(SymbolicLinkName, AliasInterfaceClassGuid, AliasSymbolicLinkName) {
    result := DllCall("ntoskrnl.exe\IoGetDeviceInterfaceAlias", UNICODE_STRING.Ptr, SymbolicLinkName, Guid.Ptr, AliasInterfaceClassGuid, UNICODE_STRING.Ptr, AliasSymbolicLinkName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {IO_NOTIFICATION_EVENT_CATEGORY} EventCategory 
 * @param {Integer} EventCategoryFlags 
 * @param {Pointer<Void>} EventCategoryData 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DRIVER_NOTIFICATION_CALLBACK_ROUTINE>} CallbackRoutine 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<Pointer<Void>>} NotificationEntry 
 * @returns {NTSTATUS} 
 */
export IoRegisterPlugPlayNotification(EventCategory, EventCategoryFlags, EventCategoryData, DriverObject, CallbackRoutine, _Context, NotificationEntry) {
    EventCategoryDataMarshal := EventCategoryData is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    NotificationEntryMarshal := NotificationEntry is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoRegisterPlugPlayNotification", IO_NOTIFICATION_EVENT_CATEGORY, EventCategory, "uint", EventCategoryFlags, EventCategoryDataMarshal, EventCategoryData, DRIVER_OBJECT.Ptr, DriverObject, "ptr", CallbackRoutine, _ContextMarshal, _Context, NotificationEntryMarshal, NotificationEntry, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NotificationEntry 
 * @returns {NTSTATUS} 
 */
export IoUnregisterPlugPlayNotification(NotificationEntry) {
    NotificationEntryMarshal := NotificationEntry is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoUnregisterPlugPlayNotification", NotificationEntryMarshal, NotificationEntry, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NotificationEntry 
 * @returns {NTSTATUS} 
 */
export IoUnregisterPlugPlayNotificationEx(NotificationEntry) {
    NotificationEntryMarshal := NotificationEntry is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoUnregisterPlugPlayNotificationEx", NotificationEntryMarshal, NotificationEntry, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<Void>} NotificationStructure 
 * @returns {NTSTATUS} 
 */
export IoReportTargetDeviceChange(PhysicalDeviceObject, NotificationStructure) {
    NotificationStructureMarshal := NotificationStructure is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReportTargetDeviceChange", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, NotificationStructureMarshal, NotificationStructure, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoInvalidateDeviceState(PhysicalDeviceObject) {
    DllCall("ntoskrnl.exe\IoInvalidateDeviceState", DEVICE_OBJECT.Ptr, PhysicalDeviceObject)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {Pointer<Void>} NotificationStructure 
 * @param {Pointer<PDEVICE_CHANGE_COMPLETE_CALLBACK>} Callback 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export IoReportTargetDeviceChangeAsynchronous(PhysicalDeviceObject, NotificationStructure, Callback, _Context) {
    NotificationStructureMarshal := NotificationStructure is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReportTargetDeviceChangeAsynchronous", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, NotificationStructureMarshal, NotificationStructure, "ptr", Callback, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {DRIVER_DIRECTORY_TYPE} DirectoryType 
 * @param {Integer} Flags 
 * @param {Pointer<HANDLE>} DriverDirectoryHandle 
 * @returns {NTSTATUS} 
 */
export IoGetDriverDirectory(DriverObject, DirectoryType, Flags, DriverDirectoryHandle) {
    result := DllCall("ntoskrnl.exe\IoGetDriverDirectory", DRIVER_OBJECT.Ptr, DriverObject, DRIVER_DIRECTORY_TYPE, DirectoryType, "uint", Flags, HANDLE.Ptr, DriverDirectoryHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
 * @param {DEVICE_DIRECTORY_TYPE} DirectoryType 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} Reserved 
 * @param {Pointer<HANDLE>} DeviceDirectoryHandle 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceDirectory(PhysicalDeviceObject, DirectoryType, Flags, Reserved, DeviceDirectoryHandle) {
    ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDeviceDirectory", DEVICE_OBJECT.Ptr, PhysicalDeviceObject, DEVICE_DIRECTORY_TYPE, DirectoryType, "uint", Flags, ReservedMarshal, Reserved, HANDLE.Ptr, DeviceDirectoryHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {DRIVER_REGKEY_TYPE} RegKeyType 
 * @param {Integer} DesiredAccess 
 * @param {Integer} Flags 
 * @param {Pointer<HANDLE>} DriverRegKey 
 * @returns {NTSTATUS} 
 */
export IoOpenDriverRegistryKey(DriverObject, RegKeyType, DesiredAccess, Flags, DriverRegKey) {
    result := DllCall("ntoskrnl.exe\IoOpenDriverRegistryKey", DRIVER_OBJECT.Ptr, DriverObject, DRIVER_REGKEY_TYPE, RegKeyType, "uint", DesiredAccess, "uint", Flags, HANDLE.Ptr, DriverRegKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} Pdo 
 * @param {Pointer<DEVPROPKEY>} _PropertyKey 
 * @param {Integer} Lcid 
 * @param {Integer} Flags 
 * @param {Integer} Type 
 * @param {Integer} _Size 
 * @param {Integer} Data 
 * @returns {NTSTATUS} 
 */
export IoSetDevicePropertyData(Pdo, _PropertyKey, Lcid, Flags, Type, _Size, Data) {
    result := DllCall("ntoskrnl.exe\IoSetDevicePropertyData", DEVICE_OBJECT.Ptr, Pdo, DEVPROPKEY.Ptr, _PropertyKey, "uint", Lcid, "uint", Flags, "uint", Type, "uint", _Size, "ptr", Data, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} Pdo 
 * @param {Pointer<DEVPROPKEY>} _PropertyKey 
 * @param {Integer} Lcid 
 * @param {Integer} _Size 
 * @param {Integer} Data 
 * @param {Pointer<Integer>} RequiredSize 
 * @param {Pointer<DEVPROPTYPE>} Type 
 * @returns {NTSTATUS} 
 */
export IoGetDevicePropertyData(Pdo, _PropertyKey, Lcid, _Size, Data, RequiredSize, Type) {
    static Flags := 0 ;Reserved parameters must always be NULL

    RequiredSizeMarshal := RequiredSize is VarRef ? "uint*" : "ptr"
    TypeMarshal := Type is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDevicePropertyData", DEVICE_OBJECT.Ptr, Pdo, DEVPROPKEY.Ptr, _PropertyKey, "uint", Lcid, "uint", Flags, "uint", _Size, "ptr", Data, RequiredSizeMarshal, RequiredSize, TypeMarshal, Type, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {Pointer<DEVPROPKEY>} _PropertyKey 
 * @param {Integer} Lcid 
 * @param {Integer} Flags 
 * @param {Integer} Type 
 * @param {Integer} _Size 
 * @param {Integer} Data 
 * @returns {NTSTATUS} 
 */
export IoSetDeviceInterfacePropertyData(SymbolicLinkName, _PropertyKey, Lcid, Flags, Type, _Size, Data) {
    result := DllCall("ntoskrnl.exe\IoSetDeviceInterfacePropertyData", UNICODE_STRING.Ptr, SymbolicLinkName, DEVPROPKEY.Ptr, _PropertyKey, "uint", Lcid, "uint", Flags, "uint", Type, "uint", _Size, "ptr", Data, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
 * @param {Pointer<DEVPROPKEY>} _PropertyKey 
 * @param {Integer} Lcid 
 * @param {Integer} _Size 
 * @param {Integer} Data 
 * @param {Pointer<Integer>} RequiredSize 
 * @param {Pointer<DEVPROPTYPE>} Type 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceInterfacePropertyData(SymbolicLinkName, _PropertyKey, Lcid, _Size, Data, RequiredSize, Type) {
    static Flags := 0 ;Reserved parameters must always be NULL

    RequiredSizeMarshal := RequiredSize is VarRef ? "uint*" : "ptr"
    TypeMarshal := Type is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDeviceInterfacePropertyData", UNICODE_STRING.Ptr, SymbolicLinkName, DEVPROPKEY.Ptr, _PropertyKey, "uint", Lcid, "uint", Flags, "uint", _Size, "ptr", Data, RequiredSizeMarshal, RequiredSize, TypeMarshal, Type, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} Pdo 
 * @param {Pointer<Integer>} NodeNumber 
 * @returns {NTSTATUS} 
 */
export IoGetDeviceNumaNode(Pdo, NodeNumber) {
    NodeNumberMarshal := NodeNumber is VarRef ? "ushort*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetDeviceNumaNode", DEVICE_OBJECT.Ptr, Pdo, NodeNumberMarshal, NodeNumber, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} TargetPdo 
 * @param {Pointer<DEVICE_OBJECT>} SparePdo 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export IoReplacePartitionUnit(TargetPdo, SparePdo, Flags) {
    result := DllCall("ntoskrnl.exe\IoReplacePartitionUnit", DEVICE_OBJECT.Ptr, TargetPdo, DEVICE_OBJECT.Ptr, SparePdo, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export KeFlushWriteBuffer() {
    DllCall("HAL.dll\KeFlushWriteBuffer")
}

/**
 * 
 * @param {Pointer<Integer>} PerformanceFrequency 
 * @returns {Integer} 
 */
export KeQueryPerformanceCounter(PerformanceFrequency) {
    PerformanceFrequencyMarshal := PerformanceFrequency is VarRef ? "int64*" : "ptr"

    result := DllCall("HAL.dll\KeQueryPerformanceCounter", PerformanceFrequencyMarshal, PerformanceFrequency, Int64)
    return result
}

/**
 * 
 * @param {Integer} MicroSeconds 
 * @returns {String} Nothing - always returns an empty string
 */
export KeStallExecutionProcessor(MicroSeconds) {
    DllCall("HAL.dll\KeStallExecutionProcessor", "uint", MicroSeconds)
}

/**
 * 
 * @param {Pointer<Void>} MemoryMap 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Address 
 * @param {Pointer} Length 
 * @param {Integer} Tag 
 * @returns {String} Nothing - always returns an empty string
 */
export PoSetHiberRange(MemoryMap, Flags, _Address, Length, Tag) {
    MemoryMapMarshal := MemoryMap is VarRef ? "ptr" : "ptr"
    _AddressMarshal := _Address is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PoSetHiberRange", MemoryMapMarshal, MemoryMap, "uint", Flags, _AddressMarshal, _Address, "ptr", Length, "uint", Tag)
}

/**
 * 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export PoSetSystemState(Flags) {
    DllCall("ntoskrnl.exe\PoSetSystemState", "uint", Flags)
}

/**
 * 
 * @param {Pointer<Void>} StateHandle 
 * @param {Integer} Flags 
 * @returns {Pointer<Void>} 
 */
export PoRegisterSystemState(StateHandle, Flags) {
    StateHandleMarshal := StateHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoRegisterSystemState", StateHandleMarshal, StateHandle, "uint", Flags, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} PowerRequest 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<COUNTED_REASON_CONTEXT>} _Context 
 * @returns {NTSTATUS} 
 */
export PoCreatePowerRequest(PowerRequest, DeviceObject, _Context) {
    PowerRequestMarshal := PowerRequest is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoCreatePowerRequest", PowerRequestMarshal, PowerRequest, DEVICE_OBJECT.Ptr, DeviceObject, COUNTED_REASON_CONTEXT.Ptr, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PowerRequest 
 * @param {POWER_REQUEST_TYPE} Type 
 * @returns {NTSTATUS} 
 */
export PoSetPowerRequest(PowerRequest, Type) {
    PowerRequestMarshal := PowerRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoSetPowerRequest", PowerRequestMarshal, PowerRequest, POWER_REQUEST_TYPE, Type, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PowerRequest 
 * @param {POWER_REQUEST_TYPE} Type 
 * @returns {NTSTATUS} 
 */
export PoClearPowerRequest(PowerRequest, Type) {
    PowerRequestMarshal := PowerRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoClearPowerRequest", PowerRequestMarshal, PowerRequest, POWER_REQUEST_TYPE, Type, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PowerRequest 
 * @returns {String} Nothing - always returns an empty string
 */
export PoDeletePowerRequest(PowerRequest) {
    PowerRequestMarshal := PowerRequest is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PoDeletePowerRequest", PowerRequestMarshal, PowerRequest)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} MinorFunction 
 * @param {POWER_STATE} PowerState 
 * @param {Pointer<PREQUEST_POWER_COMPLETE>} CompletionFunction 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<Pointer<IRP>>} _Irp 
 * @returns {NTSTATUS} 
 */
export PoRequestPowerIrp(DeviceObject, MinorFunction, PowerState, CompletionFunction, _Context, _Irp) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    _IrpMarshal := _Irp is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoRequestPowerIrp", DEVICE_OBJECT.Ptr, DeviceObject, "char", MinorFunction, POWER_STATE, PowerState, "ptr", CompletionFunction, _ContextMarshal, _Context, _IrpMarshal, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export PoSetSystemWake(_Irp) {
    DllCall("ntoskrnl.exe\PoSetSystemWake", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export PoSetSystemWakeDevice(DeviceObject) {
    DllCall("ntoskrnl.exe\PoSetSystemWakeDevice", DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {BOOLEAN} 
 */
export PoGetSystemWake(_Irp) {
    result := DllCall("ntoskrnl.exe\PoGetSystemWake", IRP.Ptr, _Irp, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} StateHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export PoUnregisterSystemState(StateHandle) {
    StateHandleMarshal := StateHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PoUnregisterSystemState", StateHandleMarshal, StateHandle)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {POWER_STATE_TYPE} Type 
 * @param {POWER_STATE} State 
 * @returns {POWER_STATE} 
 */
export PoSetPowerState(DeviceObject, Type, State) {
    result := DllCall("ntoskrnl.exe\PoSetPowerState", DEVICE_OBJECT.Ptr, DeviceObject, POWER_STATE_TYPE, Type, POWER_STATE, State, POWER_STATE)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export PoCallDriver(DeviceObject, _Irp) {
    result := DllCall("ntoskrnl.exe\PoCallDriver", DEVICE_OBJECT.Ptr, DeviceObject, IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export PoStartNextPowerIrp(_Irp) {
    DllCall("ntoskrnl.exe\PoStartNextPowerIrp", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} ConservationIdleTime 
 * @param {Integer} PerformanceIdleTime 
 * @param {DEVICE_POWER_STATE} State 
 * @returns {Pointer<Integer>} 
 */
export PoRegisterDeviceForIdleDetection(DeviceObject, ConservationIdleTime, PerformanceIdleTime, State) {
    result := DllCall("ntoskrnl.exe\PoRegisterDeviceForIdleDetection", DEVICE_OBJECT.Ptr, DeviceObject, "uint", ConservationIdleTime, "uint", PerformanceIdleTime, DEVICE_POWER_STATE, State, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} IdlePointer 
 * @returns {String} Nothing - always returns an empty string
 */
export PoSetDeviceBusyEx(IdlePointer) {
    IdlePointerMarshal := IdlePointer is VarRef ? "uint*" : "ptr"

    DllCall("ntoskrnl.exe\PoSetDeviceBusyEx", IdlePointerMarshal, IdlePointer)
}

/**
 * 
 * @param {Pointer<Integer>} IdlePointer 
 * @returns {String} Nothing - always returns an empty string
 */
export PoStartDeviceBusy(IdlePointer) {
    IdlePointerMarshal := IdlePointer is VarRef ? "uint*" : "ptr"

    DllCall("ntoskrnl.exe\PoStartDeviceBusy", IdlePointerMarshal, IdlePointer)
}

/**
 * 
 * @param {Pointer<Integer>} IdlePointer 
 * @returns {String} Nothing - always returns an empty string
 */
export PoEndDeviceBusy(IdlePointer) {
    IdlePointerMarshal := IdlePointer is VarRef ? "uint*" : "ptr"

    DllCall("ntoskrnl.exe\PoEndDeviceBusy", IdlePointerMarshal, IdlePointer)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} Pdo 
 * @param {Pointer<Integer>} SecondsRemaining 
 * @returns {BOOLEAN} 
 */
export PoQueryWatchdogTime(Pdo, SecondsRemaining) {
    SecondsRemainingMarshal := SecondsRemaining is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoQueryWatchdogTime", DEVICE_OBJECT.Ptr, Pdo, SecondsRemainingMarshal, SecondsRemaining, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Guid>} SettingGuid 
 * @param {Pointer<PPOWER_SETTING_CALLBACK>} Callback 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<Pointer<Void>>} _Handle 
 * @returns {NTSTATUS} 
 */
export PoRegisterPowerSettingCallback(DeviceObject, SettingGuid, Callback, _Context, _Handle) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
    _HandleMarshal := _Handle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoRegisterPowerSettingCallback", DEVICE_OBJECT.Ptr, DeviceObject, Guid.Ptr, SettingGuid, "ptr", Callback, _ContextMarshal, _Context, _HandleMarshal, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Handle 
 * @returns {NTSTATUS} 
 */
export PoUnregisterPowerSettingCallback(_Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoUnregisterPowerSettingCallback", _HandleMarshal, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} Pdo 
 * @param {Pointer<PO_FX_DEVICE_V1>} Device 
 * @param {Pointer<POHANDLE>} _Handle 
 * @returns {NTSTATUS} 
 */
export PoFxRegisterDevice(Pdo, Device, _Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoFxRegisterDevice", DEVICE_OBJECT.Ptr, Pdo, PO_FX_DEVICE_V1.Ptr, Device, _HandleMarshal, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxStartDevicePowerManagement(_Handle) {
    DllCall("ntoskrnl.exe\PoFxStartDevicePowerManagement", POHANDLE, _Handle)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxUnregisterDevice(_Handle) {
    DllCall("ntoskrnl.exe\PoFxUnregisterDevice", POHANDLE, _Handle)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @returns {NTSTATUS} 
 */
export PoFxRegisterCrashdumpDevice(_Handle) {
    result := DllCall("ntoskrnl.exe\PoFxRegisterCrashdumpDevice", POHANDLE, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export PoFxPowerOnCrashdumpDevice(_Handle, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoFxPowerOnCrashdumpDevice", POHANDLE, _Handle, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxActivateComponent(_Handle, _Component, Flags) {
    DllCall("ntoskrnl.exe\PoFxActivateComponent", POHANDLE, _Handle, "uint", _Component, "uint", Flags)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxCompleteDevicePowerNotRequired(_Handle) {
    DllCall("ntoskrnl.exe\PoFxCompleteDevicePowerNotRequired", POHANDLE, _Handle)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxCompleteIdleCondition(_Handle, _Component) {
    DllCall("ntoskrnl.exe\PoFxCompleteIdleCondition", POHANDLE, _Handle, "uint", _Component)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxCompleteIdleState(_Handle, _Component) {
    DllCall("ntoskrnl.exe\PoFxCompleteIdleState", POHANDLE, _Handle, "uint", _Component)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @param {Integer} Flags 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxIdleComponent(_Handle, _Component, Flags) {
    DllCall("ntoskrnl.exe\PoFxIdleComponent", POHANDLE, _Handle, "uint", _Component, "uint", Flags)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @param {Integer} Latency 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxSetComponentLatency(_Handle, _Component, Latency) {
    DllCall("ntoskrnl.exe\PoFxSetComponentLatency", POHANDLE, _Handle, "uint", _Component, "uint", Latency)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @param {Integer} Residency 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxSetComponentResidency(_Handle, _Component, Residency) {
    DllCall("ntoskrnl.exe\PoFxSetComponentResidency", POHANDLE, _Handle, "uint", _Component, "uint", Residency)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @param {BOOLEAN} WakeHint 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxSetComponentWake(_Handle, _Component, WakeHint) {
    DllCall("ntoskrnl.exe\PoFxSetComponentWake", POHANDLE, _Handle, "uint", _Component, BOOLEAN, WakeHint)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} IdleTimeout 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxSetDeviceIdleTimeout(_Handle, IdleTimeout) {
    DllCall("ntoskrnl.exe\PoFxSetDeviceIdleTimeout", POHANDLE, _Handle, "uint", IdleTimeout)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxReportDevicePoweredOn(_Handle) {
    DllCall("ntoskrnl.exe\PoFxReportDevicePoweredOn", POHANDLE, _Handle)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Pointer<Guid>} PowerControlCode 
 * @param {Pointer<Void>} InBuffer 
 * @param {Pointer} InBufferSize 
 * @param {Pointer<Void>} OutBuffer 
 * @param {Pointer} OutBufferSize 
 * @param {Pointer<Pointer>} BytesReturned 
 * @returns {NTSTATUS} 
 */
export PoFxPowerControl(_Handle, PowerControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned) {
    InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
    OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
    BytesReturnedMarshal := BytesReturned is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoFxPowerControl", POHANDLE, _Handle, Guid.Ptr, PowerControlCode, InBufferMarshal, InBuffer, "ptr", InBufferSize, OutBufferMarshal, OutBuffer, "ptr", OutBufferSize, BytesReturnedMarshal, BytesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} Pdo 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxNotifySurprisePowerOn(Pdo) {
    DllCall("ntoskrnl.exe\PoFxNotifySurprisePowerOn", DEVICE_OBJECT.Ptr, Pdo)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} _Component 
 * @param {Integer} Flags 
 * @param {Pointer<PPO_FX_COMPONENT_PERF_STATE_CALLBACK>} ComponentPerfStateCallback 
 * @param {Pointer<PO_FX_COMPONENT_PERF_INFO>} InputStateInfo 
 * @param {Pointer<Pointer<PO_FX_COMPONENT_PERF_INFO>>} OutputStateInfo 
 * @returns {NTSTATUS} 
 */
export PoFxRegisterComponentPerfStates(_Handle, _Component, Flags, ComponentPerfStateCallback, InputStateInfo, OutputStateInfo) {
    OutputStateInfoMarshal := OutputStateInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoFxRegisterComponentPerfStates", POHANDLE, _Handle, "uint", _Component, "uint", Flags, "ptr", ComponentPerfStateCallback, PO_FX_COMPONENT_PERF_INFO.Ptr, InputStateInfo, OutputStateInfoMarshal, OutputStateInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} Flags 
 * @param {Integer} _Component 
 * @param {Pointer<PO_FX_PERF_STATE_CHANGE>} PerfChange 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxIssueComponentPerfStateChange(_Handle, Flags, _Component, PerfChange, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PoFxIssueComponentPerfStateChange", POHANDLE, _Handle, "uint", Flags, "uint", _Component, PO_FX_PERF_STATE_CHANGE.Ptr, PerfChange, _ContextMarshal, _Context)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} Flags 
 * @param {Integer} _Component 
 * @param {Integer} PerfChangesCount 
 * @param {Pointer<PO_FX_PERF_STATE_CHANGE>} PerfChanges 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxIssueComponentPerfStateChangeMultiple(_Handle, Flags, _Component, PerfChangesCount, PerfChanges, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PoFxIssueComponentPerfStateChangeMultiple", POHANDLE, _Handle, "uint", Flags, "uint", _Component, "uint", PerfChangesCount, PO_FX_PERF_STATE_CHANGE.Ptr, PerfChanges, _ContextMarshal, _Context)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Integer} Flags 
 * @param {Integer} _Component 
 * @param {Integer} SetIndex 
 * @param {Pointer<Integer>} CurrentPerf 
 * @returns {NTSTATUS} 
 */
export PoFxQueryCurrentComponentPerfState(_Handle, Flags, _Component, SetIndex, CurrentPerf) {
    CurrentPerfMarshal := CurrentPerf is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoFxQueryCurrentComponentPerfState", POHANDLE, _Handle, "uint", Flags, "uint", _Component, "uint", SetIndex, CurrentPerfMarshal, CurrentPerf, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {DEVICE_POWER_STATE} TargetState 
 * @returns {NTSTATUS} 
 */
export PoFxSetTargetDripsDevicePowerState(_Handle, TargetState) {
    result := DllCall("ntoskrnl.exe\PoFxSetTargetDripsDevicePowerState", POHANDLE, _Handle, DEVICE_POWER_STATE, TargetState, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxCompleteDirectedPowerDown(_Handle) {
    DllCall("ntoskrnl.exe\PoFxCompleteDirectedPowerDown", POHANDLE, _Handle)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} ThermalRequest 
 * @param {Pointer<DEVICE_OBJECT>} TargetDeviceObject 
 * @param {Pointer<DEVICE_OBJECT>} PolicyDeviceObject 
 * @param {Pointer<COUNTED_REASON_CONTEXT>} _Context 
 * @param {Integer} Flags 
 * @returns {NTSTATUS} 
 */
export PoCreateThermalRequest(ThermalRequest, TargetDeviceObject, PolicyDeviceObject, _Context, Flags) {
    ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PoCreateThermalRequest", ThermalRequestMarshal, ThermalRequest, DEVICE_OBJECT.Ptr, TargetDeviceObject, DEVICE_OBJECT.Ptr, PolicyDeviceObject, COUNTED_REASON_CONTEXT.Ptr, _Context, "uint", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ThermalRequest 
 * @param {PO_THERMAL_REQUEST_TYPE} Type 
 * @returns {BOOLEAN} 
 */
export PoGetThermalRequestSupport(ThermalRequest, Type) {
    ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoGetThermalRequestSupport", ThermalRequestMarshal, ThermalRequest, PO_THERMAL_REQUEST_TYPE, Type, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ThermalRequest 
 * @param {Integer} Throttle 
 * @returns {NTSTATUS} 
 */
export PoSetThermalPassiveCooling(ThermalRequest, Throttle) {
    ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoSetThermalPassiveCooling", ThermalRequestMarshal, ThermalRequest, "char", Throttle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ThermalRequest 
 * @param {BOOLEAN} Engaged 
 * @returns {NTSTATUS} 
 */
export PoSetThermalActiveCooling(ThermalRequest, Engaged) {
    ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PoSetThermalActiveCooling", ThermalRequestMarshal, ThermalRequest, BOOLEAN, Engaged, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ThermalRequest 
 * @returns {String} Nothing - always returns an empty string
 */
export PoDeleteThermalRequest(ThermalRequest) {
    ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PoDeleteThermalRequest", ThermalRequestMarshal, ThermalRequest)
}

/**
 * 
 * @param {POHANDLE} _Handle 
 * @param {Pointer<PPO_FX_DRIPS_WATCHDOG_CALLBACK>} Callback 
 * @param {BOOLEAN} IncludeChildDevices 
 * @param {Pointer<DRIVER_OBJECT>} MatchingDriverObject 
 * @returns {String} Nothing - always returns an empty string
 */
export PoFxRegisterDripsWatchdogCallback(_Handle, Callback, IncludeChildDevices, MatchingDriverObject) {
    DllCall("ntoskrnl.exe\PoFxRegisterDripsWatchdogCallback", POHANDLE, _Handle, "ptr", Callback, BOOLEAN, IncludeChildDevices, DRIVER_OBJECT.Ptr, MatchingDriverObject)
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} DesiredAccess 
 * @param {POBJECT_TYPE} _ObjectType 
 * @param {Integer} AccessMode 
 * @param {Pointer<Pointer<Void>>} _Object 
 * @param {Pointer<OBJECT_HANDLE_INFORMATION>} HandleInformation 
 * @returns {NTSTATUS} 
 */
export ObReferenceObjectByHandle(_Handle, DesiredAccess, _ObjectType, AccessMode, _Object, HandleInformation) {
    _ObjectMarshal := _Object is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObReferenceObjectByHandle", HANDLE, _Handle, "uint", DesiredAccess, POBJECT_TYPE, _ObjectType, "char", AccessMode, _ObjectMarshal, _Object, OBJECT_HANDLE_INFORMATION.Ptr, HandleInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} DesiredAccess 
 * @param {POBJECT_TYPE} _ObjectType 
 * @param {Integer} AccessMode 
 * @param {Integer} Tag 
 * @param {Pointer<Pointer<Void>>} _Object 
 * @param {Pointer<OBJECT_HANDLE_INFORMATION>} HandleInformation 
 * @returns {NTSTATUS} 
 */
export ObReferenceObjectByHandleWithTag(_Handle, DesiredAccess, _ObjectType, AccessMode, Tag, _Object, HandleInformation) {
    _ObjectMarshal := _Object is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObReferenceObjectByHandleWithTag", HANDLE, _Handle, "uint", DesiredAccess, POBJECT_TYPE, _ObjectType, "char", AccessMode, "uint", Tag, _ObjectMarshal, _Object, OBJECT_HANDLE_INFORMATION.Ptr, HandleInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @returns {BOOLEAN} 
 */
export ObReferenceObjectSafe(_Object) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObReferenceObjectSafe", _ObjectMarshal, _Object, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} Tag 
 * @returns {BOOLEAN} 
 */
export ObReferenceObjectSafeWithTag(_Object, Tag) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObReferenceObjectSafeWithTag", _ObjectMarshal, _Object, "uint", Tag, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @param {Integer} PreviousMode 
 * @returns {NTSTATUS} 
 */
export ObCloseHandle(_Handle, PreviousMode) {
    result := DllCall("ntoskrnl.exe\ObCloseHandle", HANDLE, _Handle, "char", PreviousMode, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @returns {Pointer} 
 */
export ObfReferenceObject(_Object) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObfReferenceObject", _ObjectMarshal, _Object, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} Tag 
 * @returns {Pointer} 
 */
export ObfReferenceObjectWithTag(_Object, Tag) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObfReferenceObjectWithTag", _ObjectMarshal, _Object, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} DesiredAccess 
 * @param {POBJECT_TYPE} _ObjectType 
 * @param {Integer} AccessMode 
 * @returns {NTSTATUS} 
 */
export ObReferenceObjectByPointer(_Object, DesiredAccess, _ObjectType, AccessMode) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObReferenceObjectByPointer", _ObjectMarshal, _Object, "uint", DesiredAccess, POBJECT_TYPE, _ObjectType, "char", AccessMode, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} DesiredAccess 
 * @param {POBJECT_TYPE} _ObjectType 
 * @param {Integer} AccessMode 
 * @param {Integer} Tag 
 * @returns {NTSTATUS} 
 */
export ObReferenceObjectByPointerWithTag(_Object, DesiredAccess, _ObjectType, AccessMode, Tag) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObReferenceObjectByPointerWithTag", _ObjectMarshal, _Object, "uint", DesiredAccess, POBJECT_TYPE, _ObjectType, "char", AccessMode, "uint", Tag, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @returns {Pointer} 
 */
export ObfDereferenceObject(_Object) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObfDereferenceObject", _ObjectMarshal, _Object, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} Tag 
 * @returns {Pointer} 
 */
export ObfDereferenceObjectWithTag(_Object, Tag) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ObfDereferenceObjectWithTag", _ObjectMarshal, _Object, "uint", Tag, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @returns {String} Nothing - always returns an empty string
 */
export ObDereferenceObjectDeferDelete(_Object) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ObDereferenceObjectDeferDelete", _ObjectMarshal, _Object)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Integer} Tag 
 * @returns {String} Nothing - always returns an empty string
 */
export ObDereferenceObjectDeferDeleteWithTag(_Object, Tag) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ObDereferenceObjectDeferDeleteWithTag", _ObjectMarshal, _Object, "uint", Tag)
}

/**
 * 
 * @param {Pointer<Void>} _Object 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _SecurityDescriptor 
 * @param {Pointer<BOOLEAN>} MemoryAllocated 
 * @returns {NTSTATUS} 
 */
export ObGetObjectSecurity(_Object, _SecurityDescriptor, MemoryAllocated) {
    _ObjectMarshal := _Object is VarRef ? "ptr" : "ptr"
    MemoryAllocatedMarshal := MemoryAllocated is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObGetObjectSecurity", _ObjectMarshal, _Object, PSECURITY_DESCRIPTOR.Ptr, _SecurityDescriptor, MemoryAllocatedMarshal, MemoryAllocated, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
 * @param {BOOLEAN} MemoryAllocated 
 * @returns {String} Nothing - always returns an empty string
 */
export ObReleaseObjectSecurity(_SecurityDescriptor, MemoryAllocated) {
    DllCall("ntoskrnl.exe\ObReleaseObjectSecurity", PSECURITY_DESCRIPTOR, _SecurityDescriptor, BOOLEAN, MemoryAllocated)
}

/**
 * 
 * @param {Pointer<OB_CALLBACK_REGISTRATION>} CallbackRegistration 
 * @param {Pointer<Pointer<Void>>} RegistrationHandle 
 * @returns {NTSTATUS} 
 */
export ObRegisterCallbacks(CallbackRegistration, RegistrationHandle) {
    RegistrationHandleMarshal := RegistrationHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ObRegisterCallbacks", OB_CALLBACK_REGISTRATION.Ptr, CallbackRegistration, RegistrationHandleMarshal, RegistrationHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} RegistrationHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export ObUnRegisterCallbacks(RegistrationHandle) {
    RegistrationHandleMarshal := RegistrationHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\ObUnRegisterCallbacks", RegistrationHandleMarshal, RegistrationHandle)
}

/**
 * 
 * @returns {Integer} 
 */
export ObGetFilterVersion() {
    result := DllCall("ntoskrnl.exe\ObGetFilterVersion", UInt16)
    return result
}

/**
 * 
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
 * @returns {NTSTATUS} 
 */
export ZwCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateFile", HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} FileHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} ShareAccess 
 * @param {Integer} OpenOptions 
 * @returns {NTSTATUS} 
 */
export ZwOpenFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, OpenOptions) {
    result := DllCall("ntdll.dll\ZwOpenFile", HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", ShareAccess, "uint", OpenOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DriverServiceName 
 * @returns {NTSTATUS} 
 */
export ZwLoadDriver(DriverServiceName) {
    result := DllCall("ntdll.dll\ZwLoadDriver", UNICODE_STRING.Ptr, DriverServiceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DriverServiceName 
 * @returns {NTSTATUS} 
 */
export ZwUnloadDriver(DriverServiceName) {
    result := DllCall("ntdll.dll\ZwUnloadDriver", UNICODE_STRING.Ptr, DriverServiceName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
    result := DllCall("ntdll.dll\ZwQueryInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
    result := DllCall("ntdll.dll\ZwSetInformationFile", HANDLE, FileHandle, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Key 
 * @returns {NTSTATUS} 
 */
export ZwReadFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, _Buffer, Length, ByteOffset, Key) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwReadFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} ByteOffset 
 * @param {Pointer<Integer>} Key 
 * @returns {NTSTATUS} 
 */
export ZwWriteFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, _Buffer, Length, ByteOffset, Key) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
    ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
    KeyMarshal := Key is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwWriteFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", _Buffer, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @returns {NTSTATUS} 
 */
export ZwClose(_Handle) {
    result := DllCall("ntdll.dll\ZwClose", HANDLE, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} _Handle 
 * @returns {NTSTATUS} 
 */
export ZwMakeTemporaryObject(_Handle) {
    result := DllCall("ntdll.dll\ZwMakeTemporaryObject", HANDLE, _Handle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Integer>} MaximumSize 
 * @param {Integer} SectionPageProtection 
 * @param {Integer} AllocationAttributes 
 * @param {HANDLE} FileHandle 
 * @returns {NTSTATUS} 
 */
export ZwCreateSection(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle) {
    MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateSection", HANDLE.Ptr, SectionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, HANDLE, FileHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} LinkHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenSymbolicLinkObject(LinkHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenSymbolicLinkObject", HANDLE.Ptr, LinkHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} LinkHandle 
 * @param {Pointer<UNICODE_STRING>} LinkTarget 
 * @param {Pointer<Integer>} ReturnedLength 
 * @returns {NTSTATUS} 
 */
export ZwQuerySymbolicLinkObject(LinkHandle, LinkTarget, ReturnedLength) {
    ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQuerySymbolicLinkObject", HANDLE, LinkHandle, UNICODE_STRING.Ptr, LinkTarget, ReturnedLengthMarshal, ReturnedLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TmHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Integer} CreateOptions 
 * @param {Integer} CommitStrength 
 * @returns {NTSTATUS} 
 */
export ZwCreateTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, CreateOptions, CommitStrength) {
    result := DllCall("ntdll.dll\ZwCreateTransactionManager", HANDLE.Ptr, TmHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, UNICODE_STRING.Ptr, LogFileName, "uint", CreateOptions, "uint", CommitStrength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TmHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Pointer<Guid>} TmIdentity 
 * @param {Integer} OpenOptions 
 * @returns {NTSTATUS} 
 */
export ZwOpenTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, TmIdentity, OpenOptions) {
    result := DllCall("ntdll.dll\ZwOpenTransactionManager", HANDLE.Ptr, TmHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, UNICODE_STRING.Ptr, LogFileName, Guid.Ptr, TmIdentity, "uint", OpenOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionManagerHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwRollforwardTransactionManager(TransactionManagerHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwRollforwardTransactionManager", HANDLE, TransactionManagerHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionManagerHandle 
 * @returns {NTSTATUS} 
 */
export ZwRecoverTransactionManager(TransactionManagerHandle) {
    result := DllCall("ntdll.dll\ZwRecoverTransactionManager", HANDLE, TransactionManagerHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionManagerHandle 
 * @param {TRANSACTIONMANAGER_INFORMATION_CLASS} TransactionManagerInformationClass 
 * @param {Integer} TransactionManagerInformation 
 * @param {Integer} TransactionManagerInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationTransactionManager(TransactionManagerHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryInformationTransactionManager", HANDLE, TransactionManagerHandle, TRANSACTIONMANAGER_INFORMATION_CLASS, TransactionManagerInformationClass, "ptr", TransactionManagerInformation, "uint", TransactionManagerInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TmHandle 
 * @param {TRANSACTIONMANAGER_INFORMATION_CLASS} TransactionManagerInformationClass 
 * @param {Pointer<Void>} TransactionManagerInformation 
 * @param {Integer} TransactionManagerInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationTransactionManager(TmHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength) {
    TransactionManagerInformationMarshal := TransactionManagerInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwSetInformationTransactionManager", HANDLE, TmHandle, TRANSACTIONMANAGER_INFORMATION_CLASS, TransactionManagerInformationClass, TransactionManagerInformationMarshal, TransactionManagerInformation, "uint", TransactionManagerInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} RootObjectHandle 
 * @param {KTMOBJECT_TYPE} QueryType 
 * @param {Integer} ObjectCursor 
 * @param {Integer} ObjectCursorLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwEnumerateTransactionObject(RootObjectHandle, QueryType, ObjectCursor, ObjectCursorLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwEnumerateTransactionObject", HANDLE, RootObjectHandle, KTMOBJECT_TYPE, QueryType, "ptr", ObjectCursor, "uint", ObjectCursorLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Guid>} Uow 
 * @param {HANDLE} TmHandle 
 * @param {Integer} CreateOptions 
 * @param {Integer} _IsolationLevel 
 * @param {Integer} IsolationFlags 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<UNICODE_STRING>} Description 
 * @returns {NTSTATUS} 
 */
export ZwCreateTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle, CreateOptions, _IsolationLevel, IsolationFlags, Timeout, Description) {
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, Guid.Ptr, Uow, HANDLE, TmHandle, "uint", CreateOptions, "uint", _IsolationLevel, "uint", IsolationFlags, TimeoutMarshal, Timeout, UNICODE_STRING.Ptr, Description, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} TransactionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Guid>} Uow 
 * @param {HANDLE} TmHandle 
 * @returns {NTSTATUS} 
 */
export ZwOpenTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle) {
    result := DllCall("ntdll.dll\ZwOpenTransaction", HANDLE.Ptr, TransactionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, Guid.Ptr, Uow, HANDLE, TmHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {TRANSACTION_INFORMATION_CLASS} TransactionInformationClass 
 * @param {Integer} TransactionInformation 
 * @param {Integer} TransactionInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryInformationTransaction", HANDLE, TransactionHandle, TRANSACTION_INFORMATION_CLASS, TransactionInformationClass, "ptr", TransactionInformation, "uint", TransactionInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {TRANSACTION_INFORMATION_CLASS} TransactionInformationClass 
 * @param {Pointer<Void>} TransactionInformation 
 * @param {Integer} TransactionInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength) {
    TransactionInformationMarshal := TransactionInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwSetInformationTransaction", HANDLE, TransactionHandle, TRANSACTION_INFORMATION_CLASS, TransactionInformationClass, TransactionInformationMarshal, TransactionInformation, "uint", TransactionInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {BOOLEAN} Wait 
 * @returns {NTSTATUS} 
 */
export ZwCommitTransaction(TransactionHandle, Wait) {
    result := DllCall("ntdll.dll\ZwCommitTransaction", HANDLE, TransactionHandle, BOOLEAN, Wait, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} TransactionHandle 
 * @param {BOOLEAN} Wait 
 * @returns {NTSTATUS} 
 */
export ZwRollbackTransaction(TransactionHandle, Wait) {
    result := DllCall("ntdll.dll\ZwRollbackTransaction", HANDLE, TransactionHandle, BOOLEAN, Wait, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} ResourceManagerHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} TmHandle 
 * @param {Pointer<Guid>} ResourceManagerGuid 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} CreateOptions 
 * @param {Pointer<UNICODE_STRING>} Description 
 * @returns {NTSTATUS} 
 */
export ZwCreateResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, ResourceManagerGuid, ObjectAttributes, CreateOptions, Description) {
    result := DllCall("ntdll.dll\ZwCreateResourceManager", HANDLE.Ptr, ResourceManagerHandle, "uint", DesiredAccess, HANDLE, TmHandle, Guid.Ptr, ResourceManagerGuid, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", CreateOptions, UNICODE_STRING.Ptr, Description, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} ResourceManagerHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} TmHandle 
 * @param {Pointer<Guid>} ResourceManagerGuid 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, ResourceManagerGuid, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenResourceManager", HANDLE.Ptr, ResourceManagerHandle, "uint", DesiredAccess, HANDLE, TmHandle, Guid.Ptr, ResourceManagerGuid, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @returns {NTSTATUS} 
 */
export ZwRecoverResourceManager(ResourceManagerHandle) {
    result := DllCall("ntdll.dll\ZwRecoverResourceManager", HANDLE, ResourceManagerHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {Pointer<TRANSACTION_NOTIFICATION>} TransactionNotification 
 * @param {Integer} NotificationLength 
 * @param {Pointer<Integer>} Timeout 
 * @param {Pointer<Integer>} ReturnLength 
 * @param {Integer} Asynchronous 
 * @param {Pointer} AsynchronousContext 
 * @returns {NTSTATUS} 
 */
export ZwGetNotificationResourceManager(ResourceManagerHandle, TransactionNotification, NotificationLength, Timeout, ReturnLength, Asynchronous, AsynchronousContext) {
    TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwGetNotificationResourceManager", HANDLE, ResourceManagerHandle, TRANSACTION_NOTIFICATION.Ptr, TransactionNotification, "uint", NotificationLength, TimeoutMarshal, Timeout, ReturnLengthMarshal, ReturnLength, "uint", Asynchronous, "ptr", AsynchronousContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {RESOURCEMANAGER_INFORMATION_CLASS} ResourceManagerInformationClass 
 * @param {Integer} ResourceManagerInformation 
 * @param {Integer} ResourceManagerInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryInformationResourceManager", HANDLE, ResourceManagerHandle, RESOURCEMANAGER_INFORMATION_CLASS, ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {RESOURCEMANAGER_INFORMATION_CLASS} ResourceManagerInformationClass 
 * @param {Integer} ResourceManagerInformation 
 * @param {Integer} ResourceManagerInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength) {
    result := DllCall("ntdll.dll\ZwSetInformationResourceManager", HANDLE, ResourceManagerHandle, RESOURCEMANAGER_INFORMATION_CLASS, ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EnlistmentHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} ResourceManagerHandle 
 * @param {HANDLE} TransactionHandle 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Integer} CreateOptions 
 * @param {Integer} NotificationMask 
 * @param {Pointer<Void>} EnlistmentKey 
 * @returns {NTSTATUS} 
 */
export ZwCreateEnlistment(EnlistmentHandle, DesiredAccess, ResourceManagerHandle, TransactionHandle, ObjectAttributes, CreateOptions, NotificationMask, EnlistmentKey) {
    EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwCreateEnlistment", HANDLE.Ptr, EnlistmentHandle, "uint", DesiredAccess, HANDLE, ResourceManagerHandle, HANDLE, TransactionHandle, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, "uint", CreateOptions, "uint", NotificationMask, EnlistmentKeyMarshal, EnlistmentKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EnlistmentHandle 
 * @param {Integer} DesiredAccess 
 * @param {HANDLE} RmHandle 
 * @param {Pointer<Guid>} EnlistmentGuid 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenEnlistment(EnlistmentHandle, DesiredAccess, RmHandle, EnlistmentGuid, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenEnlistment", HANDLE.Ptr, EnlistmentHandle, "uint", DesiredAccess, HANDLE, RmHandle, Guid.Ptr, EnlistmentGuid, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {ENLISTMENT_INFORMATION_CLASS} EnlistmentInformationClass 
 * @param {Integer} EnlistmentInformation 
 * @param {Integer} EnlistmentInformationLength 
 * @param {Pointer<Integer>} ReturnLength 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength, ReturnLength) {
    ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\ZwQueryInformationEnlistment", HANDLE, EnlistmentHandle, ENLISTMENT_INFORMATION_CLASS, EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {ENLISTMENT_INFORMATION_CLASS} EnlistmentInformationClass 
 * @param {Integer} EnlistmentInformation 
 * @param {Integer} EnlistmentInformationLength 
 * @returns {NTSTATUS} 
 */
export ZwSetInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength) {
    result := DllCall("ntdll.dll\ZwSetInformationEnlistment", HANDLE, EnlistmentHandle, ENLISTMENT_INFORMATION_CLASS, EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Void>} EnlistmentKey 
 * @returns {NTSTATUS} 
 */
export ZwRecoverEnlistment(EnlistmentHandle, EnlistmentKey) {
    EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwRecoverEnlistment", HANDLE, EnlistmentHandle, EnlistmentKeyMarshal, EnlistmentKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwPrePrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwPrePrepareEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwPrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwPrepareEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwCommitEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwCommitEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwRollbackEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwRollbackEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwPrePrepareComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwPrePrepareComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwPrepareComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwPrepareComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwCommitComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwCommitComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwReadOnlyEnlistment(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwReadOnlyEnlistment", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwRollbackComplete(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwRollbackComplete", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} EnlistmentHandle 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export ZwSinglePhaseReject(EnlistmentHandle, TmVirtualClock) {
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntdll.dll\ZwSinglePhaseReject", HANDLE, EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @returns {NTSTATUS} 
 */
export ZwQueryInformationByName(ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass) {
    result := DllCall("ntdll.dll\ZwQueryInformationByName", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Determines whether two LSNs from the same stream are equal.
 * @remarks
 * CLFS_LSN_NULL (the smallest LSN) and CLFS_LSN_INVALID (larger than any valid LSN) are valid arguments to this function.
 * 
 * LSNs from different streams are not comparable. Do not use this function to compare LSNs from different streams.
 * @param {Pointer<CLS_LSN>} plsn1 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be compared with  <i>plsn2</i>.
 * @param {Pointer<CLS_LSN>} plsn2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be compared with  <i>plsn1</i>.
 * @returns {BOOLEAN} Returns <b>TRUE</b> if the two LSNs are equal; otherwise,  <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/nf-clfs-clfslsnequal
 */
export ClfsLsnEqual(plsn1, plsn2) {
    result := DllCall("CLFS.SYS\ClfsLsnEqual", CLS_LSN.Ptr, plsn1, CLS_LSN.Ptr, plsn2, BOOLEAN)
    return result
}

/**
 * Determines whether one LSN is less than another LSN. The two LSNs must be from the same stream.
 * @remarks
 * CLFS_LSN_NULL (the smallest LSN) and CLFS_LSN_INVALID (larger than any valid LSN) are valid arguments to this function.
 * 
 * LSNs from different streams are not comparable. Do not use this function to compare LSNs from different streams.
 * @param {Pointer<CLS_LSN>} plsn1 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be compared with  <i>plsn2</i>.
 * @param {Pointer<CLS_LSN>} plsn2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be compared with  <i>plsn1</i>.
 * @returns {BOOLEAN} <b>TRUE</b> if <i>plsn1</i> is strictly less than <i>plsn2</i>; otherwise,  <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/nf-clfs-clfslsnless
 */
export ClfsLsnLess(plsn1, plsn2) {
    result := DllCall("CLFS.SYS\ClfsLsnLess", CLS_LSN.Ptr, plsn1, CLS_LSN.Ptr, plsn2, BOOLEAN)
    return result
}

/**
 * Determines whether one LSN is greater than another LSN. The two LSNs must be from the same stream.
 * @remarks
 * CLFS_LSN_NULL (the smallest LSN) and CLFS_LSN_INVALID (larger than any valid LSN) are valid arguments to this function.
 * 
 * LSNs from different streams are not comparable. Do not use this function to compare LSNs from different streams.
 * @param {Pointer<CLS_LSN>} plsn1 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be compared with  <i>plsn2</i>.
 * @param {Pointer<CLS_LSN>} plsn2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be compared with  <i>plsn1</i>.
 * @returns {BOOLEAN} <b>TRUE</b> if <i>plsn1</i> is strictly greater than <i>plsn2</i>; otherwise,  <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/nf-clfs-clfslsngreater
 */
export ClfsLsnGreater(plsn1, plsn2) {
    result := DllCall("CLFS.SYS\ClfsLsnGreater", CLS_LSN.Ptr, plsn1, CLS_LSN.Ptr, plsn2, BOOLEAN)
    return result
}

/**
 * Determines whether a specified LSN is equal to the smallest possible LSN, which is CLFS_LSN_NULL.
 * @param {Pointer<CLS_LSN>} plsn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_lsn">CLFS_LSN</a> structure to be tested.
 * @returns {BOOLEAN} <b>TRUE</b> if <i>plsn</i> is equal to CLFS_LSN_NULL; otherwise,  <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/nf-clfs-clfslsnnull
 */
export ClfsLsnNull(plsn) {
    result := DllCall("CLFS.SYS\ClfsLsnNull", CLS_LSN.Ptr, plsn, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {Integer} 
 */
export ClfsLsnContainer(plsn) {
    result := DllCall("CLFS.SYS\ClfsLsnContainer", CLS_LSN.Ptr, plsn, UInt32)
    return result
}

/**
 * 
 * @param {Integer} cidContainer 
 * @param {Integer} offBlock 
 * @param {Integer} cRecord 
 * @returns {CLS_LSN} 
 */
export ClfsLsnCreate(cidContainer, offBlock, cRecord) {
    result := DllCall("CLFS.SYS\ClfsLsnCreate", "uint", cidContainer, "uint", offBlock, "uint", cRecord, CLS_LSN)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {Integer} 
 */
export ClfsLsnBlockOffset(plsn) {
    result := DllCall("CLFS.SYS\ClfsLsnBlockOffset", CLS_LSN.Ptr, plsn, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {Integer} 
 */
export ClfsLsnRecordSequence(plsn) {
    result := DllCall("CLFS.SYS\ClfsLsnRecordSequence", CLS_LSN.Ptr, plsn, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {BOOLEAN} 
 */
export ClfsLsnInvalid(plsn) {
    result := DllCall("CLFS.SYS\ClfsLsnInvalid", CLS_LSN.Ptr, plsn, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} LogFile 
 * @param {Pointer<CLFS_MGMT_CLIENT_REGISTRATION>} RegistrationData 
 * @param {Pointer<Pointer<Void>>} ClientCookie 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtRegisterManagedClient(LogFile, RegistrationData, ClientCookie) {
    ClientCookieMarshal := ClientCookie is VarRef ? "ptr*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtRegisterManagedClient", FILE_OBJECT.Ptr, LogFile, CLFS_MGMT_CLIENT_REGISTRATION.Ptr, RegistrationData, ClientCookieMarshal, ClientCookie, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ClientCookie 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtDeregisterManagedClient(ClientCookie) {
    ClientCookieMarshal := ClientCookie is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtDeregisterManagedClient", ClientCookieMarshal, ClientCookie, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Client 
 * @param {NTSTATUS} Reason 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtTailAdvanceFailure(Client, Reason) {
    ClientMarshal := Client is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtTailAdvanceFailure", ClientMarshal, Client, NTSTATUS, Reason, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} Client 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtHandleLogFileFull(Client) {
    ClientMarshal := Client is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtHandleLogFileFull", ClientMarshal, Client, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} LogFile 
 * @param {Integer} Policy 
 * @param {Integer} PolicyLength 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtInstallPolicy(LogFile, Policy, PolicyLength) {
    result := DllCall("CLFS.SYS\ClfsMgmtInstallPolicy", FILE_OBJECT.Ptr, LogFile, "ptr", Policy, "uint", PolicyLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} LogFile 
 * @param {CLFS_MGMT_POLICY_TYPE} PolicyType 
 * @param {Integer} Policy 
 * @param {Pointer<Integer>} PolicyLength 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtQueryPolicy(LogFile, PolicyType, Policy, PolicyLength) {
    PolicyLengthMarshal := PolicyLength is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtQueryPolicy", FILE_OBJECT.Ptr, LogFile, CLFS_MGMT_POLICY_TYPE, PolicyType, "ptr", Policy, PolicyLengthMarshal, PolicyLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} LogFile 
 * @param {CLFS_MGMT_POLICY_TYPE} PolicyType 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtRemovePolicy(LogFile, PolicyType) {
    result := DllCall("CLFS.SYS\ClfsMgmtRemovePolicy", FILE_OBJECT.Ptr, LogFile, CLFS_MGMT_POLICY_TYPE, PolicyType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} LogFile 
 * @param {Pointer<Integer>} NewSizeInContainers 
 * @param {Pointer<Integer>} ResultingSizeInContainers 
 * @param {Pointer<PCLFS_SET_LOG_SIZE_COMPLETE_CALLBACK>} CompletionRoutine 
 * @param {Pointer<Void>} CompletionRoutineData 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtSetLogFileSize(LogFile, NewSizeInContainers, ResultingSizeInContainers, CompletionRoutine, CompletionRoutineData) {
    NewSizeInContainersMarshal := NewSizeInContainers is VarRef ? "uint*" : "ptr"
    ResultingSizeInContainersMarshal := ResultingSizeInContainers is VarRef ? "uint*" : "ptr"
    CompletionRoutineDataMarshal := CompletionRoutineData is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtSetLogFileSize", FILE_OBJECT.Ptr, LogFile, NewSizeInContainersMarshal, NewSizeInContainers, ResultingSizeInContainersMarshal, ResultingSizeInContainers, "ptr", CompletionRoutine, CompletionRoutineDataMarshal, CompletionRoutineData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} LogFile 
 * @param {Pointer<Pointer<Void>>} ClientCookie 
 * @param {Pointer<Integer>} NewSizeInContainers 
 * @param {Pointer<Integer>} ResultingSizeInContainers 
 * @param {Pointer<PCLFS_SET_LOG_SIZE_COMPLETE_CALLBACK>} CompletionRoutine 
 * @param {Pointer<Void>} CompletionRoutineData 
 * @returns {NTSTATUS} 
 */
export ClfsMgmtSetLogFileSizeAsClient(LogFile, ClientCookie, NewSizeInContainers, ResultingSizeInContainers, CompletionRoutine, CompletionRoutineData) {
    ClientCookieMarshal := ClientCookie is VarRef ? "ptr*" : "ptr"
    NewSizeInContainersMarshal := NewSizeInContainers is VarRef ? "uint*" : "ptr"
    ResultingSizeInContainersMarshal := ResultingSizeInContainers is VarRef ? "uint*" : "ptr"
    CompletionRoutineDataMarshal := CompletionRoutineData is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsMgmtSetLogFileSizeAsClient", FILE_OBJECT.Ptr, LogFile, ClientCookieMarshal, ClientCookie, NewSizeInContainersMarshal, NewSizeInContainers, ResultingSizeInContainersMarshal, ResultingSizeInContainers, "ptr", CompletionRoutine, CompletionRoutineDataMarshal, CompletionRoutineData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {NTSTATUS} 
 */
export ClfsInitialize() {
    result := DllCall("CLFS.SYS\ClfsInitialize", NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export ClfsFinalize() {
    DllCall("CLFS.SYS\ClfsFinalize")
}

/**
 * 
 * @param {Pointer<Pointer<FILE_OBJECT>>} pplfoLog 
 * @param {Pointer<UNICODE_STRING>} puszLogFileName 
 * @param {Integer} fDesiredAccess 
 * @param {Integer} dwShareMode 
 * @param {PSECURITY_DESCRIPTOR} psdLogFile 
 * @param {Integer} fCreateDisposition 
 * @param {Integer} fCreateOptions 
 * @param {Integer} fFlagsAndAttributes 
 * @param {Integer} fLogOptionFlag 
 * @param {Integer} pvContext 
 * @param {Integer} cbContext 
 * @returns {NTSTATUS} 
 */
export ClfsCreateLogFile(pplfoLog, puszLogFileName, fDesiredAccess, dwShareMode, psdLogFile, fCreateDisposition, fCreateOptions, fFlagsAndAttributes, fLogOptionFlag, pvContext, cbContext) {
    pplfoLogMarshal := pplfoLog is VarRef ? "ptr*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsCreateLogFile", pplfoLogMarshal, pplfoLog, UNICODE_STRING.Ptr, puszLogFileName, "uint", fDesiredAccess, "uint", dwShareMode, PSECURITY_DESCRIPTOR, psdLogFile, "uint", fCreateDisposition, "uint", fCreateOptions, "uint", fFlagsAndAttributes, "uint", fLogOptionFlag, "ptr", pvContext, "uint", cbContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @returns {NTSTATUS} 
 */
export ClfsDeleteLogByPointer(plfoLog) {
    result := DllCall("CLFS.SYS\ClfsDeleteLogByPointer", FILE_OBJECT.Ptr, plfoLog, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} puszLogFileName 
 * @param {Pointer<Void>} pvReserved 
 * @param {Integer} fLogOptionFlag 
 * @param {Integer} pvContext 
 * @param {Integer} cbContext 
 * @returns {NTSTATUS} 
 */
export ClfsDeleteLogFile(puszLogFileName, pvReserved, fLogOptionFlag, pvContext, cbContext) {
    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsDeleteLogFile", UNICODE_STRING.Ptr, puszLogFileName, pvReservedMarshal, pvReserved, "uint", fLogOptionFlag, "ptr", pvContext, "uint", cbContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Pointer<Integer>} pcbContainer 
 * @param {Pointer<UNICODE_STRING>} puszContainerPath 
 * @returns {NTSTATUS} 
 */
export ClfsAddLogContainer(plfoLog, pcbContainer, puszContainerPath) {
    pcbContainerMarshal := pcbContainer is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsAddLogContainer", FILE_OBJECT.Ptr, plfoLog, pcbContainerMarshal, pcbContainer, UNICODE_STRING.Ptr, puszContainerPath, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Integer} cContainers 
 * @param {Pointer<Integer>} pcbContainer 
 * @param {Pointer<UNICODE_STRING>} rguszContainerPath 
 * @returns {NTSTATUS} 
 */
export ClfsAddLogContainerSet(plfoLog, cContainers, pcbContainer, rguszContainerPath) {
    pcbContainerMarshal := pcbContainer is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsAddLogContainerSet", FILE_OBJECT.Ptr, plfoLog, "ushort", cContainers, pcbContainerMarshal, pcbContainer, UNICODE_STRING.Ptr, rguszContainerPath, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Pointer<UNICODE_STRING>} puszContainerPath 
 * @param {BOOLEAN} fForce 
 * @returns {NTSTATUS} 
 */
export ClfsRemoveLogContainer(plfoLog, puszContainerPath, fForce) {
    result := DllCall("CLFS.SYS\ClfsRemoveLogContainer", FILE_OBJECT.Ptr, plfoLog, UNICODE_STRING.Ptr, puszContainerPath, BOOLEAN, fForce, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Integer} cContainers 
 * @param {Pointer<UNICODE_STRING>} rgwszContainerPath 
 * @param {BOOLEAN} fForce 
 * @returns {NTSTATUS} 
 */
export ClfsRemoveLogContainerSet(plfoLog, cContainers, rgwszContainerPath, fForce) {
    result := DllCall("CLFS.SYS\ClfsRemoveLogContainerSet", FILE_OBJECT.Ptr, plfoLog, "ushort", cContainers, UNICODE_STRING.Ptr, rgwszContainerPath, BOOLEAN, fForce, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Pointer<CLS_LSN>} plsnArchiveTail 
 * @returns {NTSTATUS} 
 */
export ClfsSetArchiveTail(plfoLog, plsnArchiveTail) {
    result := DllCall("CLFS.SYS\ClfsSetArchiveTail", FILE_OBJECT.Ptr, plfoLog, CLS_LSN.Ptr, plsnArchiveTail, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Pointer<CLS_LSN>} plsnEnd 
 * @returns {NTSTATUS} 
 */
export ClfsSetEndOfLog(plfoLog, plsnEnd) {
    result := DllCall("CLFS.SYS\ClfsSetEndOfLog", FILE_OBJECT.Ptr, plfoLog, CLS_LSN.Ptr, plsnEnd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Integer} cFromContainer 
 * @param {Integer} cContainers 
 * @param {Integer} eScanMode 
 * @param {Pointer<CLS_SCAN_CONTEXT>} pcxScan 
 * @returns {NTSTATUS} 
 */
export ClfsCreateScanContext(plfoLog, cFromContainer, cContainers, eScanMode, pcxScan) {
    result := DllCall("CLFS.SYS\ClfsCreateScanContext", FILE_OBJECT.Ptr, plfoLog, "uint", cFromContainer, "uint", cContainers, "char", eScanMode, CLS_SCAN_CONTEXT.Ptr, pcxScan, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CLS_SCAN_CONTEXT>} pcxScan 
 * @param {Integer} eScanMode 
 * @returns {NTSTATUS} 
 */
export ClfsScanLogContainers(pcxScan, eScanMode) {
    result := DllCall("CLFS.SYS\ClfsScanLogContainers", CLS_SCAN_CONTEXT.Ptr, pcxScan, "char", eScanMode, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Integer} cidLogicalContainer 
 * @param {Pointer<UNICODE_STRING>} puszContainerName 
 * @param {Pointer<Integer>} pcActualLenContainerName 
 * @returns {NTSTATUS} 
 */
export ClfsGetContainerName(plfoLog, cidLogicalContainer, puszContainerName, pcActualLenContainerName) {
    pcActualLenContainerNameMarshal := pcActualLenContainerName is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsGetContainerName", FILE_OBJECT.Ptr, plfoLog, "uint", cidLogicalContainer, UNICODE_STRING.Ptr, puszContainerName, pcActualLenContainerNameMarshal, pcActualLenContainerName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Integer} pinfoBuffer 
 * @param {Pointer<Integer>} pcbInfoBuffer 
 * @returns {NTSTATUS} 
 */
export ClfsGetLogFileInformation(plfoLog, pinfoBuffer, pcbInfoBuffer) {
    pcbInfoBufferMarshal := pcbInfoBuffer is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsGetLogFileInformation", FILE_OBJECT.Ptr, plfoLog, "ptr", pinfoBuffer, pcbInfoBufferMarshal, pcbInfoBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {CLS_LOG_INFORMATION_CLASS} eInformationClass 
 * @param {Integer} pinfoInputBuffer 
 * @param {Integer} cbinfoInputBuffer 
 * @param {Integer} pinfoBuffer 
 * @param {Pointer<Integer>} pcbInfoBuffer 
 * @returns {NTSTATUS} 
 */
export ClfsQueryLogFileInformation(plfoLog, eInformationClass, pinfoInputBuffer, cbinfoInputBuffer, pinfoBuffer, pcbInfoBuffer) {
    pcbInfoBufferMarshal := pcbInfoBuffer is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsQueryLogFileInformation", FILE_OBJECT.Ptr, plfoLog, CLS_LOG_INFORMATION_CLASS, eInformationClass, "ptr", pinfoInputBuffer, "uint", cbinfoInputBuffer, "ptr", pinfoBuffer, pcbInfoBufferMarshal, pcbInfoBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {CLS_LOG_INFORMATION_CLASS} eInformationClass 
 * @param {Integer} pinfoBuffer 
 * @param {Integer} cbBuffer 
 * @returns {NTSTATUS} 
 */
export ClfsSetLogFileInformation(plfoLog, eInformationClass, pinfoBuffer, cbBuffer) {
    result := DllCall("CLFS.SYS\ClfsSetLogFileInformation", FILE_OBJECT.Ptr, plfoLog, CLS_LOG_INFORMATION_CLASS, eInformationClass, "ptr", pinfoBuffer, "uint", cbBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Pointer<Pointer<Void>>} ppvRestartBuffer 
 * @param {Pointer<Integer>} pcbRestartBuffer 
 * @param {Pointer<CLS_LSN>} plsn 
 * @param {Pointer<Pointer<Void>>} ppvReadContext 
 * @returns {NTSTATUS} 
 */
export ClfsReadRestartArea(pvMarshalContext, ppvRestartBuffer, pcbRestartBuffer, plsn, ppvReadContext) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    ppvRestartBufferMarshal := ppvRestartBuffer is VarRef ? "ptr*" : "ptr"
    pcbRestartBufferMarshal := pcbRestartBuffer is VarRef ? "uint*" : "ptr"
    ppvReadContextMarshal := ppvReadContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsReadRestartArea", pvMarshalContextMarshal, pvMarshalContext, ppvRestartBufferMarshal, ppvRestartBuffer, pcbRestartBufferMarshal, pcbRestartBuffer, CLS_LSN.Ptr, plsn, ppvReadContextMarshal, ppvReadContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvReadContext 
 * @param {Pointer<Pointer<Void>>} ppvRestartBuffer 
 * @param {Pointer<Integer>} pcbRestartBuffer 
 * @param {Pointer<CLS_LSN>} plsnRestart 
 * @returns {NTSTATUS} 
 */
export ClfsReadPreviousRestartArea(pvReadContext, ppvRestartBuffer, pcbRestartBuffer, plsnRestart) {
    pvReadContextMarshal := pvReadContext is VarRef ? "ptr" : "ptr"
    ppvRestartBufferMarshal := ppvRestartBuffer is VarRef ? "ptr*" : "ptr"
    pcbRestartBufferMarshal := pcbRestartBuffer is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsReadPreviousRestartArea", pvReadContextMarshal, pvReadContext, ppvRestartBufferMarshal, ppvRestartBuffer, pcbRestartBufferMarshal, pcbRestartBuffer, CLS_LSN.Ptr, plsnRestart, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Integer} pvRestartBuffer 
 * @param {Integer} cbRestartBuffer 
 * @param {Pointer<CLS_LSN>} plsnBase 
 * @param {Integer} fFlags 
 * @param {Pointer<Integer>} pcbWritten 
 * @param {Pointer<CLS_LSN>} plsnNext 
 * @returns {NTSTATUS} 
 */
export ClfsWriteRestartArea(pvMarshalContext, pvRestartBuffer, cbRestartBuffer, plsnBase, fFlags, pcbWritten, plsnNext) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsWriteRestartArea", pvMarshalContextMarshal, pvMarshalContext, "ptr", pvRestartBuffer, "uint", cbRestartBuffer, CLS_LSN.Ptr, plsnBase, "uint", fFlags, pcbWrittenMarshal, pcbWritten, CLS_LSN.Ptr, plsnNext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Pointer<CLS_LSN>} plsnBase 
 * @param {Integer} fFlags 
 * @returns {NTSTATUS} 
 */
export ClfsAdvanceLogBase(pvMarshalContext, plsnBase, fFlags) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsAdvanceLogBase", pvMarshalContextMarshal, pvMarshalContext, CLS_LSN.Ptr, plsnBase, "uint", fFlags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @returns {NTSTATUS} 
 */
export ClfsCloseAndResetLogFile(plfoLog) {
    result := DllCall("CLFS.SYS\ClfsCloseAndResetLogFile", FILE_OBJECT.Ptr, plfoLog, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @returns {NTSTATUS} 
 */
export ClfsCloseLogFileObject(plfoLog) {
    result := DllCall("CLFS.SYS\ClfsCloseLogFileObject", FILE_OBJECT.Ptr, plfoLog, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {POOL_TYPE} ePoolType 
 * @param {Pointer<PALLOCATE_FUNCTION>} pfnAllocBuffer 
 * @param {Pointer<PFREE_FUNCTION>} pfnFreeBuffer 
 * @param {Integer} cbMarshallingBuffer 
 * @param {Integer} cMaxWriteBuffers 
 * @param {Integer} cMaxReadBuffers 
 * @param {Pointer<Pointer<Void>>} ppvMarshalContext 
 * @returns {NTSTATUS} 
 */
export ClfsCreateMarshallingArea(plfoLog, ePoolType, pfnAllocBuffer, pfnFreeBuffer, cbMarshallingBuffer, cMaxWriteBuffers, cMaxReadBuffers, ppvMarshalContext) {
    ppvMarshalContextMarshal := ppvMarshalContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsCreateMarshallingArea", FILE_OBJECT.Ptr, plfoLog, POOL_TYPE, ePoolType, "ptr", pfnAllocBuffer, "ptr", pfnFreeBuffer, "uint", cbMarshallingBuffer, "uint", cMaxWriteBuffers, "uint", cMaxReadBuffers, ppvMarshalContextMarshal, ppvMarshalContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {POOL_TYPE} ePoolType 
 * @param {Pointer<PALLOCATE_FUNCTION>} pfnAllocBuffer 
 * @param {Pointer<PFREE_FUNCTION>} pfnFreeBuffer 
 * @param {Integer} cbMarshallingBuffer 
 * @param {Integer} cMaxWriteBuffers 
 * @param {Integer} cMaxReadBuffers 
 * @param {Integer} cAlignmentSize 
 * @param {Integer} fFlags 
 * @param {Pointer<Pointer<Void>>} ppvMarshalContext 
 * @returns {NTSTATUS} 
 */
export ClfsCreateMarshallingAreaEx(plfoLog, ePoolType, pfnAllocBuffer, pfnFreeBuffer, cbMarshallingBuffer, cMaxWriteBuffers, cMaxReadBuffers, cAlignmentSize, fFlags, ppvMarshalContext) {
    ppvMarshalContextMarshal := ppvMarshalContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsCreateMarshallingAreaEx", FILE_OBJECT.Ptr, plfoLog, POOL_TYPE, ePoolType, "ptr", pfnAllocBuffer, "ptr", pfnFreeBuffer, "uint", cbMarshallingBuffer, "uint", cMaxWriteBuffers, "uint", cMaxReadBuffers, "uint", cAlignmentSize, "uint", fFlags, ppvMarshalContextMarshal, ppvMarshalContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @returns {NTSTATUS} 
 */
export ClfsDeleteMarshallingArea(pvMarshalContext) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsDeleteMarshallingArea", pvMarshalContextMarshal, pvMarshalContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Pointer<CLS_WRITE_ENTRY>} rgWriteEntries 
 * @param {Integer} cWriteEntries 
 * @param {Pointer<CLS_LSN>} plsnUndoNext 
 * @param {Pointer<CLS_LSN>} plsnPrevious 
 * @param {Integer} cReserveRecords 
 * @param {Pointer<Integer>} rgcbReservation 
 * @param {Integer} fFlags 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {NTSTATUS} 
 */
export ClfsReserveAndAppendLog(pvMarshalContext, rgWriteEntries, cWriteEntries, plsnUndoNext, plsnPrevious, cReserveRecords, rgcbReservation, fFlags, plsn) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    rgcbReservationMarshal := rgcbReservation is VarRef ? "int64*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsReserveAndAppendLog", pvMarshalContextMarshal, pvMarshalContext, CLS_WRITE_ENTRY.Ptr, rgWriteEntries, "uint", cWriteEntries, CLS_LSN.Ptr, plsnUndoNext, CLS_LSN.Ptr, plsnPrevious, "uint", cReserveRecords, rgcbReservationMarshal, rgcbReservation, "uint", fFlags, CLS_LSN.Ptr, plsn, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Pointer<CLS_WRITE_ENTRY>} rgWriteEntries 
 * @param {Integer} cWriteEntries 
 * @param {Integer} cbEntryAlignment 
 * @param {Pointer<CLS_LSN>} plsnUndoNext 
 * @param {Pointer<CLS_LSN>} plsnPrevious 
 * @param {Integer} cReserveRecords 
 * @param {Pointer<Integer>} rgcbReservation 
 * @param {Integer} fFlags 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {NTSTATUS} 
 */
export ClfsReserveAndAppendLogAligned(pvMarshalContext, rgWriteEntries, cWriteEntries, cbEntryAlignment, plsnUndoNext, plsnPrevious, cReserveRecords, rgcbReservation, fFlags, plsn) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    rgcbReservationMarshal := rgcbReservation is VarRef ? "int64*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsReserveAndAppendLogAligned", pvMarshalContextMarshal, pvMarshalContext, CLS_WRITE_ENTRY.Ptr, rgWriteEntries, "uint", cWriteEntries, "uint", cbEntryAlignment, CLS_LSN.Ptr, plsnUndoNext, CLS_LSN.Ptr, plsnPrevious, "uint", cReserveRecords, rgcbReservationMarshal, rgcbReservation, "uint", fFlags, CLS_LSN.Ptr, plsn, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Integer} cRecords 
 * @param {Pointer<Integer>} rgcbReservation 
 * @param {Pointer<Integer>} pcbAlignReservation 
 * @returns {NTSTATUS} 
 */
export ClfsAlignReservedLog(pvMarshalContext, cRecords, rgcbReservation, pcbAlignReservation) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    rgcbReservationMarshal := rgcbReservation is VarRef ? "int64*" : "ptr"
    pcbAlignReservationMarshal := pcbAlignReservation is VarRef ? "int64*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsAlignReservedLog", pvMarshalContextMarshal, pvMarshalContext, "uint", cRecords, rgcbReservationMarshal, rgcbReservation, pcbAlignReservationMarshal, pcbAlignReservation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Integer} cRecords 
 * @param {Pointer<Integer>} pcbAdjustment 
 * @returns {NTSTATUS} 
 */
export ClfsAllocReservedLog(pvMarshalContext, cRecords, pcbAdjustment) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    pcbAdjustmentMarshal := pcbAdjustment is VarRef ? "int64*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsAllocReservedLog", pvMarshalContextMarshal, pvMarshalContext, "uint", cRecords, pcbAdjustmentMarshal, pcbAdjustment, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Integer} cRecords 
 * @param {Pointer<Integer>} pcbAdjustment 
 * @returns {NTSTATUS} 
 */
export ClfsFreeReservedLog(pvMarshalContext, cRecords, pcbAdjustment) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    pcbAdjustmentMarshal := pcbAdjustment is VarRef ? "int64*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsFreeReservedLog", pvMarshalContextMarshal, pvMarshalContext, "uint", cRecords, pcbAdjustmentMarshal, pcbAdjustment, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @returns {NTSTATUS} 
 */
export ClfsFlushBuffers(pvMarshalContext) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsFlushBuffers", pvMarshalContextMarshal, pvMarshalContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Pointer<CLS_LSN>} plsnFlush 
 * @param {Pointer<CLS_LSN>} plsnLastFlushed 
 * @returns {NTSTATUS} 
 */
export ClfsFlushToLsn(pvMarshalContext, plsnFlush, plsnLastFlushed) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsFlushToLsn", pvMarshalContextMarshal, pvMarshalContext, CLS_LSN.Ptr, plsnFlush, CLS_LSN.Ptr, plsnLastFlushed, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvMarshalContext 
 * @param {Pointer<CLS_LSN>} plsnFirst 
 * @param {CLFS_CONTEXT_MODE} peContextMode 
 * @param {Pointer<Pointer<Void>>} ppvReadBuffer 
 * @param {Pointer<Integer>} pcbReadBuffer 
 * @param {Pointer<Integer>} peRecordType 
 * @param {Pointer<CLS_LSN>} plsnUndoNext 
 * @param {Pointer<CLS_LSN>} plsnPrevious 
 * @param {Pointer<Pointer<Void>>} ppvReadContext 
 * @returns {NTSTATUS} 
 */
export ClfsReadLogRecord(pvMarshalContext, plsnFirst, peContextMode, ppvReadBuffer, pcbReadBuffer, peRecordType, plsnUndoNext, plsnPrevious, ppvReadContext) {
    pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
    ppvReadBufferMarshal := ppvReadBuffer is VarRef ? "ptr*" : "ptr"
    pcbReadBufferMarshal := pcbReadBuffer is VarRef ? "uint*" : "ptr"
    peRecordTypeMarshal := peRecordType is VarRef ? "char*" : "ptr"
    ppvReadContextMarshal := ppvReadContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsReadLogRecord", pvMarshalContextMarshal, pvMarshalContext, CLS_LSN.Ptr, plsnFirst, CLFS_CONTEXT_MODE, peContextMode, ppvReadBufferMarshal, ppvReadBuffer, pcbReadBufferMarshal, pcbReadBuffer, peRecordTypeMarshal, peRecordType, CLS_LSN.Ptr, plsnUndoNext, CLS_LSN.Ptr, plsnPrevious, ppvReadContextMarshal, ppvReadContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvReadContext 
 * @param {Pointer<Pointer<Void>>} ppvBuffer 
 * @param {Pointer<Integer>} pcbBuffer 
 * @param {Pointer<Integer>} peRecordType 
 * @param {Pointer<CLS_LSN>} plsnUser 
 * @param {Pointer<CLS_LSN>} plsnUndoNext 
 * @param {Pointer<CLS_LSN>} plsnPrevious 
 * @param {Pointer<CLS_LSN>} plsnRecord 
 * @returns {NTSTATUS} 
 */
export ClfsReadNextLogRecord(pvReadContext, ppvBuffer, pcbBuffer, peRecordType, plsnUser, plsnUndoNext, plsnPrevious, plsnRecord) {
    pvReadContextMarshal := pvReadContext is VarRef ? "ptr" : "ptr"
    ppvBufferMarshal := ppvBuffer is VarRef ? "ptr*" : "ptr"
    pcbBufferMarshal := pcbBuffer is VarRef ? "uint*" : "ptr"
    peRecordTypeMarshal := peRecordType is VarRef ? "char*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsReadNextLogRecord", pvReadContextMarshal, pvReadContext, ppvBufferMarshal, ppvBuffer, pcbBufferMarshal, pcbBuffer, peRecordTypeMarshal, peRecordType, CLS_LSN.Ptr, plsnUser, CLS_LSN.Ptr, plsnUndoNext, CLS_LSN.Ptr, plsnPrevious, CLS_LSN.Ptr, plsnRecord, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pvCursorContext 
 * @returns {NTSTATUS} 
 */
export ClfsTerminateReadLog(pvCursorContext) {
    pvCursorContextMarshal := pvCursorContext is VarRef ? "ptr" : "ptr"

    result := DllCall("CLFS.SYS\ClfsTerminateReadLog", pvCursorContextMarshal, pvCursorContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} plfoLog 
 * @param {Integer} pvStatsBuffer 
 * @param {Integer} cbStatsBuffer 
 * @param {CLFS_IOSTATS_CLASS} eStatsClass 
 * @param {Pointer<Integer>} pcbStatsWritten 
 * @returns {NTSTATUS} 
 */
export ClfsGetIoStatistics(plfoLog, pvStatsBuffer, cbStatsBuffer, eStatsClass, pcbStatsWritten) {
    pcbStatsWrittenMarshal := pcbStatsWritten is VarRef ? "uint*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsGetIoStatistics", FILE_OBJECT.Ptr, plfoLog, "ptr", pvStatsBuffer, "uint", cbStatsBuffer, CLFS_IOSTATS_CLASS, eStatsClass, pcbStatsWrittenMarshal, pcbStatsWritten, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {CLS_LSN} 
 */
export ClfsLaterLsn(plsn) {
    result := DllCall("CLFS.SYS\ClfsLaterLsn", CLS_LSN.Ptr, plsn, CLS_LSN)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsn 
 * @returns {CLS_LSN} 
 */
export ClfsEarlierLsn(plsn) {
    result := DllCall("CLFS.SYS\ClfsEarlierLsn", CLS_LSN.Ptr, plsn, CLS_LSN)
    return result
}

/**
 * 
 * @param {Pointer<CLS_LSN>} plsnStart 
 * @param {Pointer<CLS_LSN>} plsnFinish 
 * @param {Integer} cbContainer 
 * @param {Integer} cbMaxBlock 
 * @param {Pointer<Integer>} pcbDifference 
 * @returns {NTSTATUS} 
 */
export ClfsLsnDifference(plsnStart, plsnFinish, cbContainer, cbMaxBlock, pcbDifference) {
    pcbDifferenceMarshal := pcbDifference is VarRef ? "int64*" : "ptr"

    result := DllCall("CLFS.SYS\ClfsLsnDifference", CLS_LSN.Ptr, plsnStart, CLS_LSN.Ptr, plsnFinish, "uint", cbContainer, "uint", cbMaxBlock, pcbDifferenceMarshal, pcbDifference, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Pointer>} TransactionManager 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Pointer<Guid>} TmId 
 * @param {Integer} CreateOptions 
 * @returns {NTSTATUS} 
 */
export TmInitializeTransactionManager(TransactionManager, LogFileName, TmId, CreateOptions) {
    TransactionManagerMarshal := TransactionManager is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmInitializeTransactionManager", TransactionManagerMarshal, TransactionManager, UNICODE_STRING.Ptr, LogFileName, Guid.Ptr, TmId, "uint", CreateOptions, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} LogFileName 
 * @param {Pointer<Guid>} ExistingTransactionManagerGuid 
 * @returns {NTSTATUS} 
 */
export TmRenameTransactionManager(LogFileName, ExistingTransactionManagerGuid) {
    result := DllCall("ntoskrnl.exe\TmRenameTransactionManager", UNICODE_STRING.Ptr, LogFileName, Guid.Ptr, ExistingTransactionManagerGuid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KTM>} Tm 
 * @param {Pointer<Integer>} TargetVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmRecoverTransactionManager(Tm, TargetVirtualClock) {
    TmMarshal := Tm is VarRef ? "ptr*" : "ptr"
    TargetVirtualClockMarshal := TargetVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRecoverTransactionManager", TmMarshal, Tm, TargetVirtualClockMarshal, TargetVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {BOOLEAN} Wait 
 * @returns {NTSTATUS} 
 */
export TmCommitTransaction(Transaction, Wait) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmCommitTransaction", TransactionMarshal, Transaction, BOOLEAN, Wait, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {BOOLEAN} Wait 
 * @returns {NTSTATUS} 
 */
export TmRollbackTransaction(Transaction, Wait) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRollbackTransaction", TransactionMarshal, Transaction, BOOLEAN, Wait, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} EnlistmentHandle 
 * @param {Integer} PreviousMode 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<Pointer>} ResourceManager 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {Integer} CreateOptions 
 * @param {Integer} NotificationMask 
 * @param {Pointer<Void>} EnlistmentKey 
 * @returns {NTSTATUS} 
 */
export TmCreateEnlistment(EnlistmentHandle, PreviousMode, DesiredAccess, ObjectAttributes, ResourceManager, Transaction, CreateOptions, NotificationMask, EnlistmentKey) {
    ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
    EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\TmCreateEnlistment", HANDLE.Ptr, EnlistmentHandle, "char", PreviousMode, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, ResourceManagerMarshal, ResourceManager, TransactionMarshal, Transaction, "uint", CreateOptions, "uint", NotificationMask, EnlistmentKeyMarshal, EnlistmentKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Void>} EnlistmentKey 
 * @returns {NTSTATUS} 
 */
export TmRecoverEnlistment(Enlistment, EnlistmentKey) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRecoverEnlistment", EnlistmentMarshal, Enlistment, EnlistmentKeyMarshal, EnlistmentKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmPrePrepareEnlistment(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmPrePrepareEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmPrepareEnlistment(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmPrepareEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmCommitEnlistment(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmCommitEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmRollbackEnlistment(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRollbackEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmPrePrepareComplete(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmPrePrepareComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmPrepareComplete(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmPrepareComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmReadOnlyEnlistment(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmReadOnlyEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmCommitComplete(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmCommitComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmRollbackComplete(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRollbackComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Pointer<Void>>} Key 
 * @returns {NTSTATUS} 
 */
export TmReferenceEnlistmentKey(Enlistment, Key) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    KeyMarshal := Key is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmReferenceEnlistmentKey", EnlistmentMarshal, Enlistment, KeyMarshal, Key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<BOOLEAN>} LastReference 
 * @returns {NTSTATUS} 
 */
export TmDereferenceEnlistmentKey(Enlistment, LastReference) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    LastReferenceMarshal := LastReference is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmDereferenceEnlistmentKey", EnlistmentMarshal, Enlistment, LastReferenceMarshal, LastReference, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmSinglePhaseReject(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmSinglePhaseReject", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KENLISTMENT>} Enlistment 
 * @param {Pointer<Integer>} TmVirtualClock 
 * @returns {NTSTATUS} 
 */
export TmRequestOutcomeEnlistment(Enlistment, TmVirtualClock) {
    EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
    TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRequestOutcomeEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
 * @param {Pointer<PTM_RM_NOTIFICATION>} CallbackRoutine 
 * @param {Pointer<Void>} RMKey 
 * @returns {NTSTATUS} 
 */
export TmEnableCallbacks(ResourceManager, CallbackRoutine, RMKey) {
    ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"
    RMKeyMarshal := RMKey is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\TmEnableCallbacks", ResourceManagerMarshal, ResourceManager, "ptr", CallbackRoutine, RMKeyMarshal, RMKey, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
 * @returns {NTSTATUS} 
 */
export TmRecoverResourceManager(ResourceManager) {
    ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmRecoverResourceManager", ResourceManagerMarshal, ResourceManager, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
 * @param {Integer} RequestCookie 
 * @param {Integer} BufferLength 
 * @param {Pointer<Void>} _Buffer 
 * @returns {NTSTATUS} 
 */
export TmPropagationComplete(ResourceManager, RequestCookie, BufferLength, _Buffer) {
    ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\TmPropagationComplete", ResourceManagerMarshal, ResourceManager, "uint", RequestCookie, "uint", BufferLength, _BufferMarshal, _Buffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
 * @param {Integer} RequestCookie 
 * @param {NTSTATUS} _Status 
 * @returns {NTSTATUS} 
 */
export TmPropagationFailed(ResourceManager, RequestCookie, _Status) {
    ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmPropagationFailed", ResourceManagerMarshal, ResourceManager, "uint", RequestCookie, NTSTATUS, _Status, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @param {Pointer<Guid>} TransactionId 
 * @returns {String} Nothing - always returns an empty string
 */
export TmGetTransactionId(Transaction, TransactionId) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\TmGetTransactionId", TransactionMarshal, Transaction, Guid.Ptr, TransactionId)
}

/**
 * 
 * @param {Pointer<KTRANSACTION>} Transaction 
 * @returns {BOOLEAN} 
 */
export TmIsTransactionActive(Transaction) {
    TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\TmIsTransactionActive", TransactionMarshal, Transaction, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PPCW_REGISTRATION>} Registration 
 * @param {Pointer<PCW_REGISTRATION_INFORMATION>} Info 
 * @returns {NTSTATUS} 
 */
export PcwRegister(Registration, Info) {
    RegistrationMarshal := Registration is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PcwRegister", RegistrationMarshal, Registration, PCW_REGISTRATION_INFORMATION.Ptr, Info, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PPCW_REGISTRATION} Registration 
 * @returns {String} Nothing - always returns an empty string
 */
export PcwUnregister(Registration) {
    DllCall("ntoskrnl.exe\PcwUnregister", PPCW_REGISTRATION, Registration)
}

/**
 * 
 * @param {Pointer<PPCW_INSTANCE>} Instance 
 * @param {PPCW_REGISTRATION} Registration 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {Integer} Count 
 * @param {Pointer<PCW_DATA>} Data 
 * @returns {NTSTATUS} 
 */
export PcwCreateInstance(Instance, Registration, Name, Count, Data) {
    InstanceMarshal := Instance is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PcwCreateInstance", InstanceMarshal, Instance, PPCW_REGISTRATION, Registration, UNICODE_STRING.Ptr, Name, "uint", Count, PCW_DATA.Ptr, Data, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PPCW_INSTANCE} Instance 
 * @returns {String} Nothing - always returns an empty string
 */
export PcwCloseInstance(Instance) {
    DllCall("ntoskrnl.exe\PcwCloseInstance", PPCW_INSTANCE, Instance)
}

/**
 * 
 * @param {PPCW_BUFFER} _Buffer 
 * @param {Pointer<UNICODE_STRING>} Name 
 * @param {Integer} Id 
 * @param {Integer} Count 
 * @param {Pointer<PCW_DATA>} Data 
 * @returns {NTSTATUS} 
 */
export PcwAddInstance(_Buffer, Name, Id, Count, Data) {
    result := DllCall("ntoskrnl.exe\PcwAddInstance", PPCW_BUFFER, _Buffer, UNICODE_STRING.Ptr, Name, "uint", Id, "uint", Count, PCW_DATA.Ptr, Data, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} _Handle 
 * @param {PEPROCESS} TargetProcess 
 * @param {Pointer<MDL>} _Mdl 
 * @param {Integer} DevicePageProtection 
 * @param {Integer} Attributes 
 * @returns {NTSTATUS} 
 */
export VslCreateSecureSection(_Handle, TargetProcess, _Mdl, DevicePageProtection, Attributes) {
    result := DllCall("ntoskrnl.exe\VslCreateSecureSection", HANDLE.Ptr, _Handle, PEPROCESS, TargetProcess, MDL.Ptr, _Mdl, "uint", DevicePageProtection, "uint", Attributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} GlobalHandle 
 * @returns {NTSTATUS} 
 */
export VslDeleteSecureSection(GlobalHandle) {
    result := DllCall("ntoskrnl.exe\VslDeleteSecureSection", HANDLE, GlobalHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<INIT_ONCE>} RunOnce 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlRunOnceInitialize(RunOnce) {
    DllCall("ntdll.dll\RtlRunOnceInitialize", INIT_ONCE.Ptr, RunOnce)
}

/**
 * 
 * @param {Pointer<INIT_ONCE>} RunOnce 
 * @param {Pointer<PRTL_RUN_ONCE_INIT_FN>} InitFn 
 * @param {Pointer<Void>} Parameter 
 * @param {Pointer<Pointer<Void>>} _Context 
 * @returns {NTSTATUS} 
 */
export RtlRunOnceExecuteOnce(RunOnce, InitFn, Parameter, _Context) {
    ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlRunOnceExecuteOnce", INIT_ONCE.Ptr, RunOnce, "ptr", InitFn, ParameterMarshal, Parameter, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<INIT_ONCE>} RunOnce 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer<Void>>} _Context 
 * @returns {NTSTATUS} 
 */
export RtlRunOnceBeginInitialize(RunOnce, Flags, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlRunOnceBeginInitialize", INIT_ONCE.Ptr, RunOnce, "uint", Flags, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<INIT_ONCE>} RunOnce 
 * @param {Integer} Flags 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export RtlRunOnceComplete(RunOnce, Flags, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlRunOnceComplete", INIT_ONCE.Ptr, RunOnce, "uint", Flags, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<PRTL_AVL_COMPARE_ROUTINE>} CompareRoutine 
 * @param {Pointer<PRTL_AVL_ALLOCATE_ROUTINE>} AllocateRoutine 
 * @param {Pointer<PRTL_AVL_FREE_ROUTINE>} FreeRoutine 
 * @param {Pointer<Void>} TableContext 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlInitializeGenericTableAvl(Table, CompareRoutine, AllocateRoutine, FreeRoutine, TableContext) {
    TableContextMarshal := TableContext is VarRef ? "ptr" : "ptr"

    DllCall("ntdll.dll\RtlInitializeGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, "ptr", CompareRoutine, "ptr", AllocateRoutine, "ptr", FreeRoutine, TableContextMarshal, TableContext)
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<BOOLEAN>} NewElement 
 * @returns {Pointer<Void>} 
 */
export RtlInsertElementGenericTableAvl(Table, _Buffer, BufferSize, NewElement) {
    NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlInsertElementGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, "ptr", _Buffer, "uint", BufferSize, NewElementMarshal, NewElement, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<BOOLEAN>} NewElement 
 * @param {Pointer<Void>} NodeOrParent 
 * @param {TABLE_SEARCH_RESULT} SearchResult 
 * @returns {Pointer<Void>} 
 */
export RtlInsertElementGenericTableFullAvl(Table, _Buffer, BufferSize, NewElement, NodeOrParent, SearchResult) {
    NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"
    NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlInsertElementGenericTableFullAvl", RTL_AVL_TABLE.Ptr, Table, "ptr", _Buffer, "uint", BufferSize, NewElementMarshal, NewElement, NodeOrParentMarshal, NodeOrParent, TABLE_SEARCH_RESULT, SearchResult, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @returns {BOOLEAN} 
 */
export RtlDeleteElementGenericTableAvl(Table, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlDeleteElementGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, _BufferMarshal, _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<Void>} NodeOrParent 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlDeleteElementGenericTableAvlEx(Table, NodeOrParent) {
    NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr" : "ptr"

    DllCall("ntdll.dll\RtlDeleteElementGenericTableAvlEx", RTL_AVL_TABLE.Ptr, Table, NodeOrParentMarshal, NodeOrParent)
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @returns {Pointer<Void>} 
 */
export RtlLookupElementGenericTableAvl(Table, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlLookupElementGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, _BufferMarshal, _Buffer, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @param {Pointer<Pointer<Void>>} NodeOrParent 
 * @param {Pointer<TABLE_SEARCH_RESULT>} SearchResult 
 * @returns {Pointer<Void>} 
 */
export RtlLookupElementGenericTableFullAvl(Table, _Buffer, NodeOrParent, SearchResult) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr*" : "ptr"
    SearchResultMarshal := SearchResult is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlLookupElementGenericTableFullAvl", RTL_AVL_TABLE.Ptr, Table, _BufferMarshal, _Buffer, NodeOrParentMarshal, NodeOrParent, SearchResultMarshal, SearchResult, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {BOOLEAN} Restart 
 * @returns {Pointer<Void>} 
 */
export RtlEnumerateGenericTableAvl(Table, Restart) {
    result := DllCall("ntdll.dll\RtlEnumerateGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, BOOLEAN, Restart, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<Pointer<Void>>} RestartKey 
 * @returns {Pointer<Void>} 
 */
export RtlEnumerateGenericTableWithoutSplayingAvl(Table, RestartKey) {
    RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlEnumerateGenericTableWithoutSplayingAvl", RTL_AVL_TABLE.Ptr, Table, RestartKeyMarshal, RestartKey, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @param {Pointer<Pointer<Void>>} RestartKey 
 * @returns {Pointer<Void>} 
 */
export RtlLookupFirstMatchingElementGenericTableAvl(Table, _Buffer, RestartKey) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlLookupFirstMatchingElementGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, _BufferMarshal, _Buffer, RestartKeyMarshal, RestartKey, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Pointer<PRTL_AVL_MATCH_FUNCTION>} MatchFunction 
 * @param {Pointer<Void>} MatchData 
 * @param {Integer} NextFlag 
 * @param {Pointer<Pointer<Void>>} RestartKey 
 * @param {Pointer<Integer>} DeleteCount 
 * @param {Pointer<Void>} _Buffer 
 * @returns {Pointer<Void>} 
 */
export RtlEnumerateGenericTableLikeADirectory(Table, MatchFunction, MatchData, NextFlag, RestartKey, DeleteCount, _Buffer) {
    MatchDataMarshal := MatchData is VarRef ? "ptr" : "ptr"
    RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"
    DeleteCountMarshal := DeleteCount is VarRef ? "uint*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlEnumerateGenericTableLikeADirectory", RTL_AVL_TABLE.Ptr, Table, "ptr", MatchFunction, MatchDataMarshal, MatchData, "uint", NextFlag, RestartKeyMarshal, RestartKey, DeleteCountMarshal, DeleteCount, _BufferMarshal, _Buffer, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @param {Integer} I 
 * @returns {Pointer<Void>} 
 */
export RtlGetElementGenericTableAvl(Table, I) {
    result := DllCall("ntdll.dll\RtlGetElementGenericTableAvl", RTL_AVL_TABLE.Ptr, Table, "uint", I, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @returns {Integer} 
 */
export RtlNumberGenericTableElementsAvl(Table) {
    result := DllCall("ntdll.dll\RtlNumberGenericTableElementsAvl", RTL_AVL_TABLE.Ptr, Table, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_AVL_TABLE>} Table 
 * @returns {BOOLEAN} 
 */
export RtlIsGenericTableEmptyAvl(Table) {
    result := DllCall("ntdll.dll\RtlIsGenericTableEmptyAvl", RTL_AVL_TABLE.Ptr, Table, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @returns {Pointer<RTL_SPLAY_LINKS>} 
 */
export RtlSplay(Links) {
    result := DllCall("ntdll.dll\RtlSplay", RTL_SPLAY_LINKS.Ptr, Links, RTL_SPLAY_LINKS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @returns {Pointer<RTL_SPLAY_LINKS>} 
 */
export RtlDelete(Links) {
    result := DllCall("ntdll.dll\RtlDelete", RTL_SPLAY_LINKS.Ptr, Links, RTL_SPLAY_LINKS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @param {Pointer<Pointer<RTL_SPLAY_LINKS>>} Root 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlDeleteNoSplay(Links, Root) {
    RootMarshal := Root is VarRef ? "ptr*" : "ptr"

    DllCall("ntdll.dll\RtlDeleteNoSplay", RTL_SPLAY_LINKS.Ptr, Links, RootMarshal, Root)
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @returns {Pointer<RTL_SPLAY_LINKS>} 
 */
export RtlSubtreeSuccessor(Links) {
    result := DllCall("ntdll.dll\RtlSubtreeSuccessor", RTL_SPLAY_LINKS.Ptr, Links, RTL_SPLAY_LINKS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @returns {Pointer<RTL_SPLAY_LINKS>} 
 */
export RtlSubtreePredecessor(Links) {
    result := DllCall("ntdll.dll\RtlSubtreePredecessor", RTL_SPLAY_LINKS.Ptr, Links, RTL_SPLAY_LINKS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @returns {Pointer<RTL_SPLAY_LINKS>} 
 */
export RtlRealSuccessor(Links) {
    result := DllCall("ntdll.dll\RtlRealSuccessor", RTL_SPLAY_LINKS.Ptr, Links, RTL_SPLAY_LINKS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_SPLAY_LINKS>} Links 
 * @returns {Pointer<RTL_SPLAY_LINKS>} 
 */
export RtlRealPredecessor(Links) {
    result := DllCall("ntdll.dll\RtlRealPredecessor", RTL_SPLAY_LINKS.Ptr, Links, RTL_SPLAY_LINKS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Pointer<PRTL_GENERIC_COMPARE_ROUTINE>} CompareRoutine 
 * @param {Pointer<PRTL_GENERIC_ALLOCATE_ROUTINE>} AllocateRoutine 
 * @param {Pointer<PRTL_GENERIC_FREE_ROUTINE>} FreeRoutine 
 * @param {Pointer<Void>} TableContext 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlInitializeGenericTable(Table, CompareRoutine, AllocateRoutine, FreeRoutine, TableContext) {
    TableContextMarshal := TableContext is VarRef ? "ptr" : "ptr"

    DllCall("ntdll.dll\RtlInitializeGenericTable", RTL_GENERIC_TABLE.Ptr, Table, "ptr", CompareRoutine, "ptr", AllocateRoutine, "ptr", FreeRoutine, TableContextMarshal, TableContext)
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<BOOLEAN>} NewElement 
 * @returns {Pointer<Void>} 
 */
export RtlInsertElementGenericTable(Table, _Buffer, BufferSize, NewElement) {
    NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"

    result := DllCall("ntdll.dll\RtlInsertElementGenericTable", RTL_GENERIC_TABLE.Ptr, Table, "ptr", _Buffer, "uint", BufferSize, NewElementMarshal, NewElement, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSize 
 * @param {Pointer<BOOLEAN>} NewElement 
 * @param {Pointer<Void>} NodeOrParent 
 * @param {TABLE_SEARCH_RESULT} SearchResult 
 * @returns {Pointer<Void>} 
 */
export RtlInsertElementGenericTableFull(Table, _Buffer, BufferSize, NewElement, NodeOrParent, SearchResult) {
    NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"
    NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlInsertElementGenericTableFull", RTL_GENERIC_TABLE.Ptr, Table, "ptr", _Buffer, "uint", BufferSize, NewElementMarshal, NewElement, NodeOrParentMarshal, NodeOrParent, TABLE_SEARCH_RESULT, SearchResult, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @returns {BOOLEAN} 
 */
export RtlDeleteElementGenericTable(Table, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlDeleteElementGenericTable", RTL_GENERIC_TABLE.Ptr, Table, _BufferMarshal, _Buffer, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @returns {Pointer<Void>} 
 */
export RtlLookupElementGenericTable(Table, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlLookupElementGenericTable", RTL_GENERIC_TABLE.Ptr, Table, _BufferMarshal, _Buffer, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Pointer<Void>} _Buffer 
 * @param {Pointer<Pointer<Void>>} NodeOrParent 
 * @param {Pointer<TABLE_SEARCH_RESULT>} SearchResult 
 * @returns {Pointer<Void>} 
 */
export RtlLookupElementGenericTableFull(Table, _Buffer, NodeOrParent, SearchResult) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
    NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr*" : "ptr"
    SearchResultMarshal := SearchResult is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlLookupElementGenericTableFull", RTL_GENERIC_TABLE.Ptr, Table, _BufferMarshal, _Buffer, NodeOrParentMarshal, NodeOrParent, SearchResultMarshal, SearchResult, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {BOOLEAN} Restart 
 * @returns {Pointer<Void>} 
 */
export RtlEnumerateGenericTable(Table, Restart) {
    result := DllCall("ntdll.dll\RtlEnumerateGenericTable", RTL_GENERIC_TABLE.Ptr, Table, BOOLEAN, Restart, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Pointer<Pointer<Void>>} RestartKey 
 * @returns {Pointer<Void>} 
 */
export RtlEnumerateGenericTableWithoutSplaying(Table, RestartKey) {
    RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlEnumerateGenericTableWithoutSplaying", RTL_GENERIC_TABLE.Ptr, Table, RestartKeyMarshal, RestartKey, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @param {Integer} I 
 * @returns {Pointer<Void>} 
 */
export RtlGetElementGenericTable(Table, I) {
    result := DllCall("ntdll.dll\RtlGetElementGenericTable", RTL_GENERIC_TABLE.Ptr, Table, "uint", I, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @returns {Integer} 
 */
export RtlNumberGenericTableElements(Table) {
    result := DllCall("ntdll.dll\RtlNumberGenericTableElements", RTL_GENERIC_TABLE.Ptr, Table, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<RTL_GENERIC_TABLE>} Table 
 * @returns {BOOLEAN} 
 */
export RtlIsGenericTableEmpty(Table) {
    result := DllCall("ntdll.dll\RtlIsGenericTableEmpty", RTL_GENERIC_TABLE.Ptr, Table, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<RTL_DYNAMIC_HASH_TABLE>>} HashTable 
 * @param {Integer} Shift 
 * @returns {BOOLEAN} 
 */
export RtlCreateHashTable(HashTable, Shift) {
    static Flags := 0 ;Reserved parameters must always be NULL

    HashTableMarshal := HashTable is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlCreateHashTable", HashTableMarshal, HashTable, "uint", Shift, "uint", Flags, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<RTL_DYNAMIC_HASH_TABLE>>} HashTable 
 * @param {Integer} InitialSize 
 * @param {Integer} Shift 
 * @returns {BOOLEAN} 
 */
export RtlCreateHashTableEx(HashTable, InitialSize, Shift) {
    static Flags := 0 ;Reserved parameters must always be NULL

    HashTableMarshal := HashTable is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlCreateHashTableEx", HashTableMarshal, HashTable, "uint", InitialSize, "uint", Shift, "uint", Flags, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlDeleteHashTable(HashTable) {
    DllCall("ntdll.dll\RtlDeleteHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable)
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} Entry 
 * @param {Pointer} Signature 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} _Context 
 * @returns {BOOLEAN} 
 */
export RtlInsertEntryHashTable(HashTable, Entry, Signature, _Context) {
    result := DllCall("ntdll.dll\RtlInsertEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr, Entry, "ptr", Signature, RTL_DYNAMIC_HASH_TABLE_CONTEXT.Ptr, _Context, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} Entry 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} _Context 
 * @returns {BOOLEAN} 
 */
export RtlRemoveEntryHashTable(HashTable, Entry, _Context) {
    result := DllCall("ntdll.dll\RtlRemoveEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr, Entry, RTL_DYNAMIC_HASH_TABLE_CONTEXT.Ptr, _Context, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer} Signature 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} _Context 
 * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
 */
export RtlLookupEntryHashTable(HashTable, Signature, _Context) {
    result := DllCall("ntdll.dll\RtlLookupEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, "ptr", Signature, RTL_DYNAMIC_HASH_TABLE_CONTEXT.Ptr, _Context, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} _Context 
 * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
 */
export RtlGetNextEntryHashTable(HashTable, _Context) {
    result := DllCall("ntdll.dll\RtlGetNextEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_CONTEXT.Ptr, _Context, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {BOOLEAN} 
 */
export RtlInitEnumerationHashTable(HashTable, _Enumerator) {
    result := DllCall("ntdll.dll\RtlInitEnumerationHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
 */
export RtlEnumerateEntryHashTable(HashTable, _Enumerator) {
    result := DllCall("ntdll.dll\RtlEnumerateEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlEndEnumerationHashTable(HashTable, _Enumerator) {
    DllCall("ntdll.dll\RtlEndEnumerationHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator)
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {BOOLEAN} 
 */
export RtlInitWeakEnumerationHashTable(HashTable, _Enumerator) {
    result := DllCall("ntdll.dll\RtlInitWeakEnumerationHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
 */
export RtlWeaklyEnumerateEntryHashTable(HashTable, _Enumerator) {
    result := DllCall("ntdll.dll\RtlWeaklyEnumerateEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlEndWeakEnumerationHashTable(HashTable, _Enumerator) {
    DllCall("ntdll.dll\RtlEndWeakEnumerationHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator)
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {BOOLEAN} 
 */
export RtlInitStrongEnumerationHashTable(HashTable, _Enumerator) {
    result := DllCall("ntdll.dll\RtlInitStrongEnumerationHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
 */
export RtlStronglyEnumerateEntryHashTable(HashTable, _Enumerator) {
    result := DllCall("ntdll.dll\RtlStronglyEnumerateEntryHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator, RTL_DYNAMIC_HASH_TABLE_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} _Enumerator 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlEndStrongEnumerationHashTable(HashTable, _Enumerator) {
    DllCall("ntdll.dll\RtlEndStrongEnumerationHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, RTL_DYNAMIC_HASH_TABLE_ENUMERATOR.Ptr, _Enumerator)
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @returns {BOOLEAN} 
 */
export RtlExpandHashTable(HashTable) {
    result := DllCall("ntdll.dll\RtlExpandHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
 * @returns {BOOLEAN} 
 */
export RtlContractHashTable(HashTable) {
    result := DllCall("ntdll.dll\RtlContractHashTable", RTL_DYNAMIC_HASH_TABLE.Ptr, HashTable, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} CallersAddress 
 * @param {Pointer<Pointer<Void>>} CallersCaller 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlGetCallersAddress(CallersAddress, CallersCaller) {
    CallersAddressMarshal := CallersAddress is VarRef ? "ptr*" : "ptr"
    CallersCallerMarshal := CallersCaller is VarRef ? "ptr*" : "ptr"

    DllCall("ntdll.dll\RtlGetCallersAddress", CallersAddressMarshal, CallersAddress, CallersCallerMarshal, CallersCaller)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} Callers 
 * @param {Integer} Count 
 * @param {Integer} Flags 
 * @returns {Integer} 
 */
export RtlWalkFrameChain(Callers, Count, Flags) {
    CallersMarshal := Callers is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlWalkFrameChain", CallersMarshal, Callers, "uint", Count, "uint", Flags, UInt32)
    return result
}

/**
 * 
 * @param {Integer} FeatureMask 
 * @returns {Integer} 
 */
export RtlGetEnabledExtendedFeatures(FeatureMask) {
    result := DllCall("ntdll.dll\RtlGetEnabledExtendedFeatures", "uint", FeatureMask, Int64)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<STRING>} SourceString 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlCopyString(DestinationString, SourceString) {
    DllCall("ntdll.dll\RtlCopyString", STRING.Ptr, DestinationString, STRING.Ptr, SourceString)
}

/**
 * 
 * @param {CHAR} Character 
 * @returns {CHAR} 
 */
export RtlUpperChar(Character) {
    result := DllCall("ntdll.dll\RtlUpperChar", CHAR, Character, CHAR)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} String1 
 * @param {Pointer<STRING>} String2 
 * @param {BOOLEAN} CaseInSensitive 
 * @returns {Integer} 
 */
export RtlCompareString(String1, String2, CaseInSensitive) {
    result := DllCall("ntdll.dll\RtlCompareString", STRING.Ptr, String1, STRING.Ptr, String2, BOOLEAN, CaseInSensitive, Int32)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} String1 
 * @param {Pointer<STRING>} String2 
 * @param {BOOLEAN} CaseInSensitive 
 * @returns {BOOLEAN} 
 */
export RtlEqualString(String1, String2, CaseInSensitive) {
    result := DllCall("ntdll.dll\RtlEqualString", STRING.Ptr, String1, STRING.Ptr, String2, BOOLEAN, CaseInSensitive, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<STRING>} DestinationString 
 * @param {Pointer<STRING>} SourceString 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlUpperString(DestinationString, SourceString) {
    DllCall("ntdll.dll\RtlUpperString", STRING.Ptr, DestinationString, STRING.Ptr, SourceString)
}

/**
 * Compares two Unicode strings to determine whether one string is a prefix of the other.
 * @param {Pointer<UNICODE_STRING>} String1 Pointer to the first string, which might be a prefix of the buffered Unicode string at *String2*.
 * @param {Pointer<UNICODE_STRING>} String2 Pointer to the second string.
 * @param {BOOLEAN} CaseInSensitive If **TRUE**, case should be ignored when doing the comparison.
 * @returns {BOOLEAN} **TRUE** if *String1* is a prefix of *String2*.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlprefixunicodestring
 */
export RtlPrefixUnicodeString(String1, String2, CaseInSensitive) {
    result := DllCall("ntdll.dll\RtlPrefixUnicodeString", UNICODE_STRING.Ptr, String1, UNICODE_STRING.Ptr, String2, BOOLEAN, CaseInSensitive, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} String1 
 * @param {Pointer<UNICODE_STRING>} String2 
 * @param {BOOLEAN} CaseInSensitive 
 * @returns {BOOLEAN} 
 */
export RtlSuffixUnicodeString(String1, String2, CaseInSensitive) {
    result := DllCall("ntoskrnl.exe\RtlSuffixUnicodeString", UNICODE_STRING.Ptr, String1, UNICODE_STRING.Ptr, String2, BOOLEAN, CaseInSensitive, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DestinationString 
 * @param {Pointer<UNICODE_STRING>} SourceString 
 * @param {BOOLEAN} AllocateDestinationString 
 * @returns {NTSTATUS} 
 */
export RtlUpcaseUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
    result := DllCall("ntdll.dll\RtlUpcaseUnicodeString", UNICODE_STRING.Ptr, DestinationString, UNICODE_STRING.Ptr, SourceString, BOOLEAN, AllocateDestinationString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} PrimaryHandle 
 * @param {HANDLE} FallbackHandle 
 * @param {Pointer<UNICODE_STRING>} _ValueName 
 * @param {Integer} ValueLength 
 * @param {Pointer<Integer>} ValueType 
 * @param {Integer} ValueData 
 * @param {Pointer<Integer>} ResultLength 
 * @returns {NTSTATUS} 
 */
export RtlQueryRegistryValueWithFallback(PrimaryHandle, FallbackHandle, _ValueName, ValueLength, ValueType, ValueData, ResultLength) {
    ValueTypeMarshal := ValueType is VarRef ? "uint*" : "ptr"
    ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlQueryRegistryValueWithFallback", HANDLE, PrimaryHandle, HANDLE, FallbackHandle, UNICODE_STRING.Ptr, _ValueName, "uint", ValueLength, ValueTypeMarshal, ValueType, "ptr", ValueData, ResultLengthMarshal, ResultLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} AccessMask 
 * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
 * @returns {String} Nothing - always returns an empty string
 */
export RtlMapGenericMask(AccessMask, GenericMapping) {
    AccessMaskMarshal := AccessMask is VarRef ? "uint*" : "ptr"

    DllCall("ntdll.dll\RtlMapGenericMask", AccessMaskMarshal, AccessMask, GENERIC_MAPPING.Ptr, GenericMapping)
}

/**
 * 
 * @param {Pointer<Void>} VolumeDeviceObject 
 * @param {Pointer<UNICODE_STRING>} DosName 
 * @returns {NTSTATUS} 
 */
export RtlVolumeDeviceToDosName(VolumeDeviceObject, DosName) {
    VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlVolumeDeviceToDosName", VolumeDeviceObjectMarshal, VolumeDeviceObject, UNICODE_STRING.Ptr, DosName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSTR} Prompt 
 * @param {Integer} Response 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export DbgPrompt(Prompt, Response, Length) {
    Prompt := Prompt is String ? StrPtr(Prompt) : Prompt

    result := DllCall("ntdll.dll\DbgPrompt", "ptr", Prompt, "ptr", Response, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export RtlGetActiveConsoleId() {
    result := DllCall("ntdll.dll\RtlGetActiveConsoleId", UInt32)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export RtlGetConsoleSessionForegroundProcessId() {
    result := DllCall("ntdll.dll\RtlGetConsoleSessionForegroundProcessId", Int64)
    return result
}

/**
 * Retrieves a bit mask that identifies the product suites available on the system. If this function is called in an application that runs in the context of a server silo, the suite mask for the server silo is retrieved instead.
 * @remarks
 * You should not rely upon only the 0x00000001 flag to determine whether Small Business Server has been installed on the system, as both this flag and the 0x00000020 flag are set when this product suite is installed. If you upgrade this installation to Windows Server, Standard Edition, the 0x00000020 flag will be cleared however, the 0x00000001 flag will remain set. In this case, this indicates that Small Business Server was once installed on this system. If this installation is further upgraded to Windows Server, Enterprise Edition, the 0x00000001 flag will remain set.
 * @returns {Integer} This function has no parameters.
 * 
 * 
 * A bit mask that identifies the product suites available on the system. The bit mask can include the following values.
 * 
 * 
 * 
 * | Return value                                                                          | Description                                                                                                                                                                                                                                             |
 * |---------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <dl> <dt>0x00000001</dt> </dl> | Microsoft Small Business Server was once installed on the system, but may have been upgraded to another version of Windows. Refer to the Remarks section for more information about this bit flag.<br/>                                           |
 * | <dl> <dt>0x00000002</dt> </dl> | Windows 10 Enterprise, Windows 8.1 Enterprise, Windows Server 2008 Enterprise, Windows Server 2003, Enterprise Edition, or Windows 2000 Advanced Server is installed. Refer to the Remarks section for more information about this bit flag.<br/> |
 * | <dl> <dt>0x00000004</dt> </dl> | Microsoft BackOffice components are installed.<br/>                                                                                                                                                                                               |
 * | <dl> <dt>0x00000008</dt> </dl> | Communications Server 2003, Communications Server 2005, Communications Server 2007, or Communications Server 2007 R2 is installed.<br/>                                                                                                           |
 * | <dl> <dt>0x00000010</dt> </dl> | Terminal Services is installed. This value is always set.<br/> If **TerminalServer** is set but **SingleUserTS** is not set, the system is running in application server mode.<br/>                                                         |
 * | <dl> <dt>0x00000020</dt> </dl> | Microsoft Small Business Server is installed with the restrictive client license in force. Refer to the Remarks section for more information about this bit flag.<br/>                                                                            |
 * | <dl> <dt>0x00000040</dt> </dl> | Windows XP Embedded is installed.<br/>                                                                                                                                                                                                            |
 * | <dl> <dt>0x00000080</dt> </dl> | Windows Server 2008 Datacenter, Windows Server 2003, Datacenter Edition, or Windows 2000 Datacenter Server is installed.<br/>                                                                                                                     |
 * | <dl> <dt>0x00000100</dt> </dl> | Remote Desktop is supported, but only one interactive session is supported. This value is set unless the system is running in application server mode.<br/>                                                                                       |
 * | <dl> <dt>0x00000200</dt> </dl> | Windows Vista Home Premium, Windows Vista Home Basic, or Windows XP Home Edition is installed.<br/>                                                                                                                                               |
 * | <dl> <dt>0x00000400</dt> </dl> | Windows Server 2003, Web Edition is installed.<br/>                                                                                                                                                                                               |
 * | <dl> <dt>0x00002000</dt> </dl> | Windows Storage Server 2003 R2 or Windows Storage Server 2003 is installed.<br/>                                                                                                                                                                  |
 * | <dl> <dt>0x00004000</dt> </dl> | Windows Server 2003, Compute Cluster Edition is installed.<br/>                                                                                                                                                                                   |
 * | <dl> <dt>0x00008000</dt> </dl> | Windows Home Server is installed.<br/>                                                                                                                                                                                                            |
 * @see https://learn.microsoft.com/windows/win32/SysInfo/rtlgetsuitemask
 */
export RtlGetSuiteMask() {
    result := DllCall("ntdll.dll\RtlGetSuiteMask", UInt32)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export RtlIsMultiSessionSku() {
    result := DllCall("ntdll.dll\RtlIsMultiSessionSku", BOOLEAN)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export RtlIsStateSeparationEnabled() {
    result := DllCall("ntdll.dll\RtlIsStateSeparationEnabled", BOOLEAN)
    return result
}

/**
 * 
 * @param {PWSTR} SourceID 
 * @param {PWSTR} CustomValue 
 * @param {PWSTR} DefaultPath 
 * @param {STATE_LOCATION_TYPE} StateLocationType 
 * @param {Integer} TargetPath 
 * @param {Integer} BufferLengthIn 
 * @param {Pointer<Integer>} BufferLengthOut 
 * @returns {NTSTATUS} 
 */
export RtlGetPersistedStateLocation(SourceID, CustomValue, DefaultPath, StateLocationType, TargetPath, BufferLengthIn, BufferLengthOut) {
    SourceID := SourceID is String ? StrPtr(SourceID) : SourceID
    CustomValue := CustomValue is String ? StrPtr(CustomValue) : CustomValue
    DefaultPath := DefaultPath is String ? StrPtr(DefaultPath) : DefaultPath

    BufferLengthOutMarshal := BufferLengthOut is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetPersistedStateLocation", "ptr", SourceID, "ptr", CustomValue, "ptr", DefaultPath, STATE_LOCATION_TYPE, StateLocationType, "ptr", TargetPath, "uint", BufferLengthIn, BufferLengthOutMarshal, BufferLengthOut, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSTR} apiSetName 
 * @returns {NTSTATUS} 
 */
export RtlIsApiSetImplemented(apiSetName) {
    apiSetName := apiSetName is String ? StrPtr(apiSetName) : apiSetName

    result := DllCall("ntdll.dll\RtlIsApiSetImplemented", "ptr", apiSetName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export RtlIsMultiUsersInSessionSku() {
    result := DllCall("ntdll.dll\RtlIsMultiUsersInSessionSku", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<NT_PRODUCT_TYPE>} NtProductType 
 * @returns {BOOLEAN} 
 */
export RtlGetNtProductType(NtProductType) {
    NtProductTypeMarshal := NtProductType is VarRef ? "int*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetNtProductType", NtProductTypeMarshal, NtProductType, BOOLEAN)
    return result
}

/**
 * 
 * @returns {PWSTR} 
 */
export RtlGetNtSystemRoot() {
    result := DllCall("ntdll.dll\RtlGetNtSystemRoot", PWSTR)
    return result
}

/**
 * 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _SecurityDescriptor 
 * @param {Integer} SecurityDescriptorLength 
 * @param {Pointer<PSECURITY_DESCRIPTOR>} NewSecurityDescriptor 
 * @param {Pointer<Integer>} NewSecurityDescriptorLength 
 * @param {BOOLEAN} CheckOnly 
 * @returns {BOOLEAN} 
 */
export RtlNormalizeSecurityDescriptor(_SecurityDescriptor, SecurityDescriptorLength, NewSecurityDescriptor, NewSecurityDescriptorLength, CheckOnly) {
    NewSecurityDescriptorLengthMarshal := NewSecurityDescriptorLength is VarRef ? "uint*" : "ptr"

    result := DllCall("ntdll.dll\RtlNormalizeSecurityDescriptor", PSECURITY_DESCRIPTOR.Ptr, _SecurityDescriptor, "uint", SecurityDescriptorLength, PSECURITY_DESCRIPTOR.Ptr, NewSecurityDescriptor, NewSecurityDescriptorLengthMarshal, NewSecurityDescriptorLength, BOOLEAN, CheckOnly, BOOLEAN)
    return result
}

/**
 * 
 * @param {RTL_SYSTEM_GLOBAL_DATA_ID} DataId 
 * @param {Pointer<Void>} _Buffer 
 * @param {Integer} _Size 
 * @returns {NTSTATUS} 
 */
export RtlSetSystemGlobalData(DataId, _Buffer, _Size) {
    _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\RtlSetSystemGlobalData", RTL_SYSTEM_GLOBAL_DATA_ID, DataId, _BufferMarshal, _Buffer, "uint", _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<KEVENT>} Event 
 * @param {Integer} Increment 
 * @param {BOOLEAN} Wait 
 * @returns {Integer} 
 */
export KePulseEvent(Event, Increment, Wait) {
    result := DllCall("ntoskrnl.exe\KePulseEvent", KEVENT.Ptr, Event, "int", Increment, BOOLEAN, Wait, Int32)
    return result
}

/**
 * 
 * @param {Pointer<PEXPAND_STACK_CALLOUT>} Callout 
 * @param {Pointer<Void>} Parameter 
 * @param {Pointer} _Size 
 * @returns {NTSTATUS} 
 */
export KeExpandKernelStackAndCallout(Callout, Parameter, _Size) {
    ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeExpandKernelStackAndCallout", "ptr", Callout, ParameterMarshal, Parameter, "ptr", _Size, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PEXPAND_STACK_CALLOUT>} Callout 
 * @param {Pointer<Void>} Parameter 
 * @param {Pointer} _Size 
 * @param {BOOLEAN} Wait 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export KeExpandKernelStackAndCalloutEx(Callout, Parameter, _Size, Wait, _Context) {
    ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\KeExpandKernelStackAndCalloutEx", "ptr", Callout, ParameterMarshal, Parameter, "ptr", _Size, BOOLEAN, Wait, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PKTHREAD} Thread 
 * @param {Integer} Increment 
 * @returns {Integer} 
 */
export KeSetBasePriorityThread(Thread, Increment) {
    result := DllCall("ntoskrnl.exe\KeSetBasePriorityThread", PKTHREAD, Thread, "int", Increment, Int32)
    return result
}

/**
 * 
 * @param {BUGCHECK_ERROR} BugCheckCode 
 * @returns {String} Nothing - always returns an empty string
 */
export KeBugCheck(BugCheckCode) {
    DllCall("ntoskrnl.exe\KeBugCheck", BUGCHECK_ERROR, BugCheckCode)
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export KeInvalidateAllCaches() {
    result := DllCall("ntoskrnl.exe\KeInvalidateAllCaches", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} BaseAddress 
 * @param {Integer} Length 
 * @returns {String} Nothing - always returns an empty string
 */
export KeInvalidateRangeAllCaches(BaseAddress, Length) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\KeInvalidateRangeAllCaches", BaseAddressMarshal, BaseAddress, "uint", Length)
}

/**
 * 
 * @param {Pointer<HARDWARE_COUNTER>} CounterArray 
 * @param {Integer} Count 
 * @returns {NTSTATUS} 
 */
export KeSetHardwareCounterConfiguration(CounterArray, Count) {
    result := DllCall("ntoskrnl.exe\KeSetHardwareCounterConfiguration", HARDWARE_COUNTER.Ptr, CounterArray, "uint", Count, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HARDWARE_COUNTER>} CounterArray 
 * @param {Integer} MaximumCount 
 * @param {Pointer<Integer>} Count 
 * @returns {NTSTATUS} 
 */
export KeQueryHardwareCounterConfiguration(CounterArray, MaximumCount, Count) {
    CountMarshal := Count is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\KeQueryHardwareCounterConfiguration", HARDWARE_COUNTER.Ptr, CounterArray, "uint", MaximumCount, CountMarshal, Count, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export ExRaiseDatatypeMisalignment() {
    DllCall("ntoskrnl.exe\ExRaiseDatatypeMisalignment")
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export ExRaiseAccessViolation() {
    DllCall("ntoskrnl.exe\ExRaiseAccessViolation")
}

/**
 * 
 * @param {Pointer<ZONE_HEADER>} Zone 
 * @param {Integer} BlockSize 
 * @param {Pointer<Void>} InitialSegment 
 * @param {Integer} InitialSegmentSize 
 * @returns {NTSTATUS} 
 */
export ExInitializeZone(Zone, BlockSize, InitialSegment, InitialSegmentSize) {
    InitialSegmentMarshal := InitialSegment is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExInitializeZone", ZONE_HEADER.Ptr, Zone, "uint", BlockSize, InitialSegmentMarshal, InitialSegment, "uint", InitialSegmentSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ZONE_HEADER>} Zone 
 * @param {Pointer<Void>} Segment 
 * @param {Integer} SegmentSize 
 * @returns {NTSTATUS} 
 */
export ExExtendZone(Zone, Segment, SegmentSize) {
    SegmentMarshal := Segment is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\ExExtendZone", ZONE_HEADER.Ptr, Zone, SegmentMarshal, Segment, "uint", SegmentSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<ZONE_HEADER>} Zone 
 * @param {Pointer<Void>} Segment 
 * @param {Integer} SegmentSize 
 * @param {Pointer<Pointer>} Lock 
 * @returns {NTSTATUS} 
 */
export ExInterlockedExtendZone(Zone, Segment, SegmentSize, Lock) {
    SegmentMarshal := Segment is VarRef ? "ptr" : "ptr"
    LockMarshal := Lock is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\ExInterlockedExtendZone", ZONE_HEADER.Ptr, Zone, SegmentMarshal, Segment, "uint", SegmentSize, LockMarshal, Lock, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} Uuid 
 * @returns {NTSTATUS} 
 */
export ExUuidCreate(Uuid) {
    result := DllCall("ntoskrnl.exe\ExUuidCreate", Guid.Ptr, Uuid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export MmIsThisAnNtAsSystem() {
    result := DllCall("ntoskrnl.exe\MmIsThisAnNtAsSystem", BOOLEAN)
    return result
}

/**
 * 
 * @param {Integer} BaseAddress 
 * @param {Pointer} NumberOfBytes 
 * @param {Pointer<Void>} PageAddress 
 * @returns {NTSTATUS} 
 */
export MmMapUserAddressesToPage(BaseAddress, NumberOfBytes, PageAddress) {
    PageAddressMarshal := PageAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapUserAddressesToPage", "ptr", BaseAddress, "ptr", NumberOfBytes, PageAddressMarshal, PageAddress, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} StartAddress 
 * @param {Pointer<Integer>} NumberOfBytes 
 * @returns {NTSTATUS} 
 */
export MmAddPhysicalMemory(StartAddress, NumberOfBytes) {
    StartAddressMarshal := StartAddress is VarRef ? "int64*" : "ptr"
    NumberOfBytesMarshal := NumberOfBytes is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmAddPhysicalMemory", StartAddressMarshal, StartAddress, NumberOfBytesMarshal, NumberOfBytes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VirtualAddress 
 * @param {Pointer<Pointer>} NumberOfBytes 
 * @param {Pointer<MDL>} NewMdl 
 * @param {MM_ROTATE_DIRECTION} _Direction 
 * @param {Pointer<PMM_ROTATE_COPY_CALLBACK_FUNCTION>} CopyFunction 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export MmRotatePhysicalView(VirtualAddress, NumberOfBytes, NewMdl, _Direction, CopyFunction, _Context) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"
    NumberOfBytesMarshal := NumberOfBytes is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmRotatePhysicalView", VirtualAddressMarshal, VirtualAddress, NumberOfBytesMarshal, NumberOfBytes, MDL.Ptr, NewMdl, MM_ROTATE_DIRECTION, _Direction, "ptr", CopyFunction, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} StartAddress 
 * @param {Pointer<Integer>} NumberOfBytes 
 * @returns {NTSTATUS} 
 */
export MmRemovePhysicalMemory(StartAddress, NumberOfBytes) {
    StartAddressMarshal := StartAddress is VarRef ? "int64*" : "ptr"
    NumberOfBytesMarshal := NumberOfBytes is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmRemovePhysicalMemory", StartAddressMarshal, StartAddress, NumberOfBytesMarshal, NumberOfBytes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {Pointer<PHYSICAL_MEMORY_RANGE>} 
 */
export MmGetPhysicalMemoryRanges() {
    result := DllCall("ntoskrnl.exe\MmGetPhysicalMemoryRanges", PHYSICAL_MEMORY_RANGE.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PartitionObject 
 * @returns {Pointer<PHYSICAL_MEMORY_RANGE>} 
 */
export MmGetPhysicalMemoryRangesEx(PartitionObject) {
    PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmGetPhysicalMemoryRangesEx", PartitionObjectMarshal, PartitionObject, PHYSICAL_MEMORY_RANGE.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PartitionObject 
 * @param {Integer} Flags 
 * @returns {Pointer<PHYSICAL_MEMORY_RANGE>} 
 */
export MmGetPhysicalMemoryRangesEx2(PartitionObject, Flags) {
    PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmGetPhysicalMemoryRangesEx2", PartitionObjectMarshal, PartitionObject, "uint", Flags, PHYSICAL_MEMORY_RANGE.Ptr)
    return result
}

/**
 * 
 * @param {Integer} PhysicalAddress 
 * @param {Pointer} NumberOfBytes 
 * @param {MEMORY_CACHING_TYPE} CacheType 
 * @returns {Pointer<Void>} 
 */
export MmMapVideoDisplay(PhysicalAddress, NumberOfBytes, CacheType) {
    result := DllCall("ntoskrnl.exe\MmMapVideoDisplay", "int64", PhysicalAddress, "ptr", NumberOfBytes, MEMORY_CACHING_TYPE, CacheType, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} BaseAddress 
 * @param {Pointer} NumberOfBytes 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnmapVideoDisplay(BaseAddress, NumberOfBytes) {
    DllCall("ntoskrnl.exe\MmUnmapVideoDisplay", "ptr", BaseAddress, "ptr", NumberOfBytes)
}

/**
 * 
 * @param {Pointer<Void>} BaseAddress 
 * @returns {Integer} 
 */
export MmGetPhysicalAddress(BaseAddress) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmGetPhysicalAddress", BaseAddressMarshal, BaseAddress, Int64)
    return result
}

/**
 * 
 * @param {Integer} PhysicalAddress 
 * @param {Pointer<MEMORY_CACHING_TYPE>} CacheType 
 * @returns {NTSTATUS} 
 */
export MmGetCacheAttribute(PhysicalAddress, CacheType) {
    CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmGetCacheAttribute", "int64", PhysicalAddress, CacheTypeMarshal, CacheType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} TargetAddress 
 * @param {MM_COPY_ADDRESS} SourceAddress 
 * @param {Pointer} NumberOfBytes 
 * @param {Integer} Flags 
 * @param {Pointer<Pointer>} NumberOfBytesTransferred 
 * @returns {NTSTATUS} 
 */
export MmCopyMemory(TargetAddress, SourceAddress, NumberOfBytes, Flags, NumberOfBytesTransferred) {
    TargetAddressMarshal := TargetAddress is VarRef ? "ptr" : "ptr"
    NumberOfBytesTransferredMarshal := NumberOfBytesTransferred is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmCopyMemory", TargetAddressMarshal, TargetAddress, MM_COPY_ADDRESS, SourceAddress, "ptr", NumberOfBytes, "uint", Flags, NumberOfBytesTransferredMarshal, NumberOfBytesTransferred, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} PhysicalAddress 
 * @param {Integer} Flags 
 * @param {Pointer<MEMORY_CACHING_TYPE>} CacheType 
 * @returns {NTSTATUS} 
 */
export MmGetCacheAttributeEx(PhysicalAddress, Flags, CacheType) {
    CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmGetCacheAttributeEx", "int64", PhysicalAddress, "uint", Flags, CacheTypeMarshal, CacheType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} PhysicalAddress 
 * @returns {Pointer<Void>} 
 */
export MmGetVirtualForPhysical(PhysicalAddress) {
    result := DllCall("ntoskrnl.exe\MmGetVirtualForPhysical", "int64", PhysicalAddress, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer} NumberOfBytes 
 * @returns {Pointer<Void>} 
 */
export MmAllocateNonCachedMemory(NumberOfBytes) {
    result := DllCall("ntoskrnl.exe\MmAllocateNonCachedMemory", "ptr", NumberOfBytes, IntPtr)
    return result
}

/**
 * 
 * @param {Integer} BaseAddress 
 * @param {Pointer} NumberOfBytes 
 * @returns {String} Nothing - always returns an empty string
 */
export MmFreeNonCachedMemory(BaseAddress, NumberOfBytes) {
    DllCall("ntoskrnl.exe\MmFreeNonCachedMemory", "ptr", BaseAddress, "ptr", NumberOfBytes)
}

/**
 * 
 * @param {Pointer<Void>} VirtualAddress 
 * @returns {BOOLEAN} 
 */
export MmIsAddressValid(VirtualAddress) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmIsAddressValid", VirtualAddressMarshal, VirtualAddress, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VirtualAddress 
 * @returns {BOOLEAN} 
 */
export MmIsNonPagedSystemAddressValid(VirtualAddress) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmIsNonPagedSystemAddressValid", VirtualAddressMarshal, VirtualAddress, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ImageSectionHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export MmLockPagableSectionByHandle(ImageSectionHandle) {
    ImageSectionHandleMarshal := ImageSectionHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\MmLockPagableSectionByHandle", ImageSectionHandleMarshal, ImageSectionHandle)
}

/**
 * 
 * @param {Integer} _Address 
 * @param {Pointer} _Size 
 * @param {Integer} ProbeMode 
 * @returns {HANDLE} 
 */
export MmSecureVirtualMemory(_Address, _Size, ProbeMode) {
    result := DllCall("ntoskrnl.exe\MmSecureVirtualMemory", "ptr", _Address, "ptr", _Size, "uint", ProbeMode, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {Integer} _Address 
 * @param {Pointer} _Size 
 * @param {Integer} ProbeMode 
 * @param {Integer} Flags 
 * @returns {HANDLE} 
 */
export MmSecureVirtualMemoryEx(_Address, _Size, ProbeMode, Flags) {
    result := DllCall("ntoskrnl.exe\MmSecureVirtualMemoryEx", "ptr", _Address, "ptr", _Size, "uint", ProbeMode, "uint", Flags, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} SecureHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export MmUnsecureVirtualMemory(SecureHandle) {
    DllCall("ntoskrnl.exe\MmUnsecureVirtualMemory", HANDLE, SecureHandle)
}

/**
 * 
 * @param {Pointer<Void>} _Section 
 * @param {Pointer<Pointer<Void>>} MappedBase 
 * @param {Pointer<Pointer>} ViewSize 
 * @param {Pointer<Integer>} SectionOffset 
 * @param {Pointer} Flags 
 * @returns {NTSTATUS} 
 */
export MmMapViewInSystemSpaceEx(_Section, MappedBase, ViewSize, SectionOffset, Flags) {
    _SectionMarshal := _Section is VarRef ? "ptr" : "ptr"
    MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
    ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"
    SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapViewInSystemSpaceEx", _SectionMarshal, _Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, SectionOffsetMarshal, SectionOffset, "ptr", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Section 
 * @param {Pointer<Pointer<Void>>} MappedBase 
 * @param {Pointer<Pointer>} ViewSize 
 * @returns {NTSTATUS} 
 */
export MmMapViewInSystemSpace(_Section, MappedBase, ViewSize) {
    _SectionMarshal := _Section is VarRef ? "ptr" : "ptr"
    MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
    ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapViewInSystemSpace", _SectionMarshal, _Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MappedBase 
 * @returns {NTSTATUS} 
 */
export MmUnmapViewInSystemSpace(MappedBase) {
    MappedBaseMarshal := MappedBase is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmUnmapViewInSystemSpace", MappedBaseMarshal, MappedBase, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Section 
 * @param {Pointer<Pointer<Void>>} MappedBase 
 * @param {Pointer<Pointer>} ViewSize 
 * @param {Pointer<Integer>} SectionOffset 
 * @param {Pointer} Flags 
 * @returns {NTSTATUS} 
 */
export MmMapViewInSessionSpaceEx(_Section, MappedBase, ViewSize, SectionOffset, Flags) {
    _SectionMarshal := _Section is VarRef ? "ptr" : "ptr"
    MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
    ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"
    SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapViewInSessionSpaceEx", _SectionMarshal, _Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, SectionOffsetMarshal, SectionOffset, "ptr", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Section 
 * @param {Pointer<Pointer<Void>>} MappedBase 
 * @param {Pointer<Pointer>} ViewSize 
 * @returns {NTSTATUS} 
 */
export MmMapViewInSessionSpace(_Section, MappedBase, ViewSize) {
    _SectionMarshal := _Section is VarRef ? "ptr" : "ptr"
    MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
    ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\MmMapViewInSessionSpace", _SectionMarshal, _Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MappedBase 
 * @returns {NTSTATUS} 
 */
export MmUnmapViewInSessionSpace(MappedBase) {
    MappedBaseMarshal := MappedBase is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\MmUnmapViewInSessionSpace", MappedBaseMarshal, MappedBase, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {NTSTATUS} 
 */
export MmCreateMirror() {
    result := DllCall("ntoskrnl.exe\MmCreateMirror", NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {LUID} PrivilegeValue 
 * @param {Integer} PreviousMode 
 * @returns {BOOLEAN} 
 */
export SeSinglePrivilegeCheck(PrivilegeValue, PreviousMode) {
    result := DllCall("ntoskrnl.exe\SeSinglePrivilegeCheck", LUID, PrivilegeValue, "char", PreviousMode, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PCREATE_PROCESS_NOTIFY_ROUTINE>} NotifyRoutine 
 * @param {BOOLEAN} Remove 
 * @returns {NTSTATUS} 
 */
export PsSetCreateProcessNotifyRoutine(NotifyRoutine, Remove) {
    result := DllCall("ntoskrnl.exe\PsSetCreateProcessNotifyRoutine", "ptr", NotifyRoutine, BOOLEAN, Remove, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PCREATE_PROCESS_NOTIFY_ROUTINE_EX>} NotifyRoutine 
 * @param {BOOLEAN} Remove 
 * @returns {NTSTATUS} 
 */
export PsSetCreateProcessNotifyRoutineEx(NotifyRoutine, Remove) {
    result := DllCall("ntoskrnl.exe\PsSetCreateProcessNotifyRoutineEx", "ptr", NotifyRoutine, BOOLEAN, Remove, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSCREATEPROCESSNOTIFYTYPE} NotifyType 
 * @param {Pointer<Void>} NotifyInformation 
 * @param {BOOLEAN} Remove 
 * @returns {NTSTATUS} 
 */
export PsSetCreateProcessNotifyRoutineEx2(NotifyType, NotifyInformation, Remove) {
    NotifyInformationMarshal := NotifyInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PsSetCreateProcessNotifyRoutineEx2", PSCREATEPROCESSNOTIFYTYPE, NotifyType, NotifyInformationMarshal, NotifyInformation, BOOLEAN, Remove, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PCREATE_THREAD_NOTIFY_ROUTINE>} NotifyRoutine 
 * @returns {NTSTATUS} 
 */
export PsSetCreateThreadNotifyRoutine(NotifyRoutine) {
    result := DllCall("ntoskrnl.exe\PsSetCreateThreadNotifyRoutine", "ptr", NotifyRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSCREATETHREADNOTIFYTYPE} NotifyType 
 * @param {Pointer<Void>} NotifyInformation 
 * @returns {NTSTATUS} 
 */
export PsSetCreateThreadNotifyRoutineEx(NotifyType, NotifyInformation) {
    NotifyInformationMarshal := NotifyInformation is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PsSetCreateThreadNotifyRoutineEx", PSCREATETHREADNOTIFYTYPE, NotifyType, NotifyInformationMarshal, NotifyInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PCREATE_THREAD_NOTIFY_ROUTINE>} NotifyRoutine 
 * @returns {NTSTATUS} 
 */
export PsRemoveCreateThreadNotifyRoutine(NotifyRoutine) {
    result := DllCall("ntoskrnl.exe\PsRemoveCreateThreadNotifyRoutine", "ptr", NotifyRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PLOAD_IMAGE_NOTIFY_ROUTINE>} NotifyRoutine 
 * @returns {NTSTATUS} 
 */
export PsSetLoadImageNotifyRoutine(NotifyRoutine) {
    result := DllCall("ntoskrnl.exe\PsSetLoadImageNotifyRoutine", "ptr", NotifyRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PLOAD_IMAGE_NOTIFY_ROUTINE>} NotifyRoutine 
 * @param {Pointer} Flags 
 * @returns {NTSTATUS} 
 */
export PsSetLoadImageNotifyRoutineEx(NotifyRoutine, Flags) {
    result := DllCall("ntoskrnl.exe\PsSetLoadImageNotifyRoutineEx", "ptr", NotifyRoutine, "ptr", Flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PLOAD_IMAGE_NOTIFY_ROUTINE>} NotifyRoutine 
 * @returns {NTSTATUS} 
 */
export PsRemoveLoadImageNotifyRoutine(NotifyRoutine) {
    result := DllCall("ntoskrnl.exe\PsRemoveLoadImageNotifyRoutine", "ptr", NotifyRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {HANDLE} 
 */
export PsGetCurrentProcessId() {
    result := DllCall("ntoskrnl.exe\PsGetCurrentProcessId", HANDLE.Owned)
    return result
}

/**
 * 
 * @returns {HANDLE} 
 */
export PsGetCurrentThreadId() {
    result := DllCall("ntoskrnl.exe\PsGetCurrentThreadId", HANDLE.Owned)
    return result
}

/**
 * 
 * @param {BOOLEAN} Prefetching 
 * @returns {BOOLEAN} 
 */
export PsSetCurrentThreadPrefetching(Prefetching) {
    result := DllCall("ntoskrnl.exe\PsSetCurrentThreadPrefetching", BOOLEAN, Prefetching, BOOLEAN)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export PsIsCurrentThreadPrefetching() {
    result := DllCall("ntoskrnl.exe\PsIsCurrentThreadPrefetching", BOOLEAN)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @returns {Integer} 
 */
export PsGetProcessCreateTimeQuadPart(Process) {
    result := DllCall("ntoskrnl.exe\PsGetProcessCreateTimeQuadPart", PEPROCESS, Process, Int64)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @returns {Integer} 
 */
export PsGetProcessStartKey(Process) {
    result := DllCall("ntoskrnl.exe\PsGetProcessStartKey", PEPROCESS, Process, Int64)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @returns {NTSTATUS} 
 */
export PsGetProcessExitStatus(Process) {
    result := DllCall("ntoskrnl.exe\PsGetProcessExitStatus", PEPROCESS, Process, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {NTSTATUS} 
 */
export PsGetThreadExitStatus(Thread) {
    result := DllCall("ntoskrnl.exe\PsGetThreadExitStatus", PETHREAD, Thread, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PEPROCESS} Process 
 * @returns {HANDLE} 
 */
export PsGetProcessId(Process) {
    result := DllCall("ntoskrnl.exe\PsGetProcessId", PEPROCESS, Process, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {HANDLE} 
 */
export PsGetThreadId(Thread) {
    result := DllCall("ntoskrnl.exe\PsGetThreadId", PETHREAD, Thread, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @param {Pointer} Key 
 * @param {Integer} Flags 
 * @returns {Pointer<Void>} 
 */
export PsGetThreadProperty(Thread, Key, Flags) {
    result := DllCall("ntoskrnl.exe\PsGetThreadProperty", PETHREAD, Thread, "ptr", Key, "uint", Flags, IntPtr)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {HANDLE} 
 */
export PsGetThreadProcessId(Thread) {
    result := DllCall("ntoskrnl.exe\PsGetThreadProcessId", PETHREAD, Thread, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {Integer} 
 */
export PsGetThreadCreateTime(Thread) {
    result := DllCall("ntoskrnl.exe\PsGetThreadCreateTime", PETHREAD, Thread, Int64)
    return result
}

/**
 * 
 * @returns {Pointer<Void>} 
 */
export PsGetCurrentThreadTeb() {
    result := DllCall("ntoskrnl.exe\PsGetCurrentThreadTeb", IntPtr)
    return result
}

/**
 * 
 * @param {PEJOB} Job 
 * @param {Pointer<PESILO>} Silo 
 * @returns {NTSTATUS} 
 */
export PsGetJobSilo(Job, Silo) {
    SiloMarshal := Silo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsGetJobSilo", PEJOB, Job, SiloMarshal, Silo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PEJOB} Job 
 * @param {Pointer<PESILO>} ServerSilo 
 * @returns {NTSTATUS} 
 */
export PsGetJobServerSilo(Job, ServerSilo) {
    ServerSiloMarshal := ServerSilo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsGetJobServerSilo", PEJOB, Job, ServerSiloMarshal, ServerSilo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {PESILO} 
 */
export PsGetEffectiveServerSilo(Silo) {
    result := DllCall("ntoskrnl.exe\PsGetEffectiveServerSilo", PESILO, Silo, PESILO)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {PESILO} 
 */
export PsAttachSiloToCurrentThread(Silo) {
    result := DllCall("ntoskrnl.exe\PsAttachSiloToCurrentThread", PESILO, Silo, PESILO)
    return result
}

/**
 * 
 * @param {PESILO} PreviousSilo 
 * @returns {String} Nothing - always returns an empty string
 */
export PsDetachSiloFromCurrentThread(PreviousSilo) {
    DllCall("ntoskrnl.exe\PsDetachSiloFromCurrentThread", PESILO, PreviousSilo)
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {BOOLEAN} 
 */
export PsIsHostSilo(Silo) {
    result := DllCall("ntoskrnl.exe\PsIsHostSilo", PESILO, Silo, BOOLEAN)
    return result
}

/**
 * 
 * @returns {PESILO} 
 */
export PsGetHostSilo() {
    result := DllCall("ntoskrnl.exe\PsGetHostSilo", PESILO)
    return result
}

/**
 * 
 * @returns {PESILO} 
 */
export PsGetCurrentSilo() {
    result := DllCall("ntoskrnl.exe\PsGetCurrentSilo", PESILO)
    return result
}

/**
 * 
 * @returns {PESILO} 
 */
export PsGetCurrentServerSilo() {
    result := DllCall("ntoskrnl.exe\PsGetCurrentServerSilo", PESILO)
    return result
}

/**
 * 
 * @returns {Pointer<UNICODE_STRING>} 
 */
export PsGetCurrentServerSiloName() {
    result := DllCall("ntoskrnl.exe\PsGetCurrentServerSiloName", UNICODE_STRING.Ptr)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export PsIsCurrentThreadInServerSilo() {
    result := DllCall("ntoskrnl.exe\PsIsCurrentThreadInServerSilo", BOOLEAN)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {NTSTATUS} 
 */
export PsAcquireSiloHardReference(Silo) {
    result := DllCall("ntoskrnl.exe\PsAcquireSiloHardReference", PESILO, Silo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {String} Nothing - always returns an empty string
 */
export PsReleaseSiloHardReference(Silo) {
    DllCall("ntoskrnl.exe\PsReleaseSiloHardReference", PESILO, Silo)
}

/**
 * 
 * @param {Pointer} Reserved 
 * @param {Pointer<Integer>} ReturnedContextSlot 
 * @returns {NTSTATUS} 
 */
export PsAllocSiloContextSlot(Reserved, ReturnedContextSlot) {
    ReturnedContextSlotMarshal := ReturnedContextSlot is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsAllocSiloContextSlot", "ptr", Reserved, ReturnedContextSlotMarshal, ReturnedContextSlot, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ContextSlot 
 * @returns {NTSTATUS} 
 */
export PsFreeSiloContextSlot(ContextSlot) {
    result := DllCall("ntoskrnl.exe\PsFreeSiloContextSlot", "uint", ContextSlot, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} _Size 
 * @param {POOL_TYPE} PoolType 
 * @param {Pointer<SILO_CONTEXT_CLEANUP_CALLBACK>} ContextCleanupCallback 
 * @param {Pointer<Pointer<Void>>} ReturnedSiloContext 
 * @returns {NTSTATUS} 
 */
export PsCreateSiloContext(Silo, _Size, PoolType, ContextCleanupCallback, ReturnedSiloContext) {
    ReturnedSiloContextMarshal := ReturnedSiloContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsCreateSiloContext", PESILO, Silo, "uint", _Size, POOL_TYPE, PoolType, "ptr", ContextCleanupCallback, ReturnedSiloContextMarshal, ReturnedSiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @param {Pointer<Void>} SiloContext 
 * @returns {NTSTATUS} 
 */
export PsInsertSiloContext(Silo, ContextSlot, SiloContext) {
    SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PsInsertSiloContext", PESILO, Silo, "uint", ContextSlot, SiloContextMarshal, SiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @param {Pointer<Void>} NewSiloContext 
 * @param {Pointer<Pointer<Void>>} OldSiloContext 
 * @returns {NTSTATUS} 
 */
export PsReplaceSiloContext(Silo, ContextSlot, NewSiloContext, OldSiloContext) {
    NewSiloContextMarshal := NewSiloContext is VarRef ? "ptr" : "ptr"
    OldSiloContextMarshal := OldSiloContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsReplaceSiloContext", PESILO, Silo, "uint", ContextSlot, NewSiloContextMarshal, NewSiloContext, OldSiloContextMarshal, OldSiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @param {Pointer<Pointer<Void>>} ReturnedSiloContext 
 * @returns {NTSTATUS} 
 */
export PsGetSiloContext(Silo, ContextSlot, ReturnedSiloContext) {
    ReturnedSiloContextMarshal := ReturnedSiloContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsGetSiloContext", PESILO, Silo, "uint", ContextSlot, ReturnedSiloContextMarshal, ReturnedSiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @param {Pointer<Pointer<Void>>} RemovedSiloContext 
 * @returns {NTSTATUS} 
 */
export PsRemoveSiloContext(Silo, ContextSlot, RemovedSiloContext) {
    RemovedSiloContextMarshal := RemovedSiloContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsRemoveSiloContext", PESILO, Silo, "uint", ContextSlot, RemovedSiloContextMarshal, RemovedSiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} SiloContext 
 * @returns {String} Nothing - always returns an empty string
 */
export PsReferenceSiloContext(SiloContext) {
    SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PsReferenceSiloContext", SiloContextMarshal, SiloContext)
}

/**
 * 
 * @param {Pointer<Void>} SiloContext 
 * @returns {String} Nothing - always returns an empty string
 */
export PsDereferenceSiloContext(SiloContext) {
    SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\PsDereferenceSiloContext", SiloContextMarshal, SiloContext)
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @param {Pointer<Void>} SiloContext 
 * @returns {NTSTATUS} 
 */
export PsInsertPermanentSiloContext(Silo, ContextSlot, SiloContext) {
    SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\PsInsertPermanentSiloContext", PESILO, Silo, "uint", ContextSlot, SiloContextMarshal, SiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @returns {NTSTATUS} 
 */
export PsMakeSiloContextPermanent(Silo, ContextSlot) {
    result := DllCall("ntoskrnl.exe\PsMakeSiloContextPermanent", PESILO, Silo, "uint", ContextSlot, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @param {Integer} ContextSlot 
 * @param {Pointer<Pointer<Void>>} ReturnedSiloContext 
 * @returns {NTSTATUS} 
 */
export PsGetPermanentSiloContext(Silo, ContextSlot, ReturnedSiloContext) {
    ReturnedSiloContextMarshal := ReturnedSiloContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsGetPermanentSiloContext", PESILO, Silo, "uint", ContextSlot, ReturnedSiloContextMarshal, ReturnedSiloContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SILO_MONITOR_REGISTRATION>} Registration 
 * @param {Pointer<PSILO_MONITOR>} ReturnedMonitor 
 * @returns {NTSTATUS} 
 */
export PsRegisterSiloMonitor(Registration, ReturnedMonitor) {
    ReturnedMonitorMarshal := ReturnedMonitor is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\PsRegisterSiloMonitor", SILO_MONITOR_REGISTRATION.Ptr, Registration, ReturnedMonitorMarshal, ReturnedMonitor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSILO_MONITOR} _Monitor 
 * @returns {NTSTATUS} 
 */
export PsStartSiloMonitor(_Monitor) {
    result := DllCall("ntoskrnl.exe\PsStartSiloMonitor", PSILO_MONITOR, _Monitor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {PSILO_MONITOR} _Monitor 
 * @returns {Integer} 
 */
export PsGetSiloMonitorContextSlot(_Monitor) {
    result := DllCall("ntoskrnl.exe\PsGetSiloMonitorContextSlot", PSILO_MONITOR, _Monitor, UInt32)
    return result
}

/**
 * 
 * @param {PSILO_MONITOR} _Monitor 
 * @returns {String} Nothing - always returns an empty string
 */
export PsUnregisterSiloMonitor(_Monitor) {
    DllCall("ntoskrnl.exe\PsUnregisterSiloMonitor", PSILO_MONITOR, _Monitor)
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {Integer} 
 */
export PsGetServerSiloServiceSessionId(Silo) {
    result := DllCall("ntoskrnl.exe\PsGetServerSiloServiceSessionId", PESILO, Silo, UInt32)
    return result
}

/**
 * 
 * @param {PESILO} ServerSilo 
 * @param {NTSTATUS} ExitStatus 
 * @returns {String} Nothing - always returns an empty string
 */
export PsTerminateServerSilo(ServerSilo, ExitStatus) {
    DllCall("ntoskrnl.exe\PsTerminateServerSilo", PESILO, ServerSilo, NTSTATUS, ExitStatus)
}

/**
 * 
 * @param {PEJOB} Job 
 * @returns {PESILO} 
 */
export PsGetParentSilo(Job) {
    result := DllCall("ntoskrnl.exe\PsGetParentSilo", PEJOB, Job, PESILO)
    return result
}

/**
 * 
 * @param {PETHREAD} Thread 
 * @returns {PESILO} 
 */
export PsGetThreadServerSilo(Thread) {
    result := DllCall("ntoskrnl.exe\PsGetThreadServerSilo", PETHREAD, Thread, PESILO)
    return result
}

/**
 * 
 * @param {PESILO} Silo 
 * @returns {Pointer<Guid>} 
 */
export PsGetSiloContainerId(Silo) {
    result := DllCall("ntoskrnl.exe\PsGetSiloContainerId", PESILO, Silo, Guid.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} NumberOfMapRegisters 
 * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export IoAllocateAdapterChannel(AdapterObject, DeviceObject, NumberOfMapRegisters, ExecutionRoutine, _Context) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAllocateAdapterChannel", AdapterObjectMarshal, AdapterObject, DEVICE_OBJECT.Ptr, DeviceObject, "uint", NumberOfMapRegisters, "ptr", ExecutionRoutine, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CONTROLLER_OBJECT>} ControllerObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export IoAllocateController(ControllerObject, DeviceObject, ExecutionRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoAllocateController", CONTROLLER_OBJECT.Ptr, ControllerObject, DEVICE_OBJECT.Ptr, DeviceObject, "ptr", ExecutionRoutine, _ContextMarshal, _Context)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} RegistryPath 
 * @param {Pointer<UNICODE_STRING>} DriverClassName 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<IO_RESOURCE_REQUIREMENTS_LIST>} RequestedResources 
 * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
 * @returns {NTSTATUS} 
 */
export IoAssignResources(RegistryPath, DriverClassName, DriverObject, DeviceObject, RequestedResources, AllocatedResources) {
    AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAssignResources", UNICODE_STRING.Ptr, RegistryPath, UNICODE_STRING.Ptr, DriverClassName, DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, DeviceObject, IO_RESOURCE_REQUIREMENTS_LIST.Ptr, RequestedResources, AllocatedResourcesMarshal, AllocatedResources, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
 * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
 * @returns {NTSTATUS} 
 */
export IoAttachDeviceByPointer(SourceDevice, TargetDevice) {
    result := DllCall("ntoskrnl.exe\IoAttachDeviceByPointer", DEVICE_OBJECT.Ptr, SourceDevice, DEVICE_OBJECT.Ptr, TargetDevice, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} _Size 
 * @returns {Pointer<CONTROLLER_OBJECT>} 
 */
export IoCreateController(_Size) {
    result := DllCall("ntoskrnl.exe\IoCreateController", "uint", _Size, CONTROLLER_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<CONTROLLER_OBJECT>} ControllerObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoDeleteController(ControllerObject) {
    DllCall("ntoskrnl.exe\IoDeleteController", CONTROLLER_OBJECT.Ptr, ControllerObject)
}

/**
 * 
 * @param {Pointer<CONTROLLER_OBJECT>} ControllerObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeController(ControllerObject) {
    DllCall("ntoskrnl.exe\IoFreeController", CONTROLLER_OBJECT.Ptr, ControllerObject)
}

/**
 * 
 * @returns {Pointer<CONFIGURATION_INFORMATION>} 
 */
export IoGetConfigurationInformation() {
    result := DllCall("ntoskrnl.exe\IoGetConfigurationInformation", CONFIGURATION_INFORMATION.Ptr)
    return result
}

/**
 * 
 * @returns {Pointer<GENERIC_MAPPING>} 
 */
export IoGetFileObjectGenericMapping() {
    result := DllCall("ntoskrnl.exe\IoGetFileObjectGenericMapping", GENERIC_MAPPING.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoCancelFileOpen(DeviceObject, FileObject) {
    DllCall("ntoskrnl.exe\IoCancelFileOpen", DEVICE_OBJECT.Ptr, DeviceObject, FILE_OBJECT.Ptr, FileObject)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} StackSize 
 * @returns {Pointer<IRP>} 
 */
export IoMakeAssociatedIrp(_Irp, StackSize) {
    result := DllCall("ntoskrnl.exe\IoMakeAssociatedIrp", IRP.Ptr, _Irp, "char", StackSize, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} StackSize 
 * @returns {Pointer<IRP>} 
 */
export IoMakeAssociatedIrpEx(_Irp, DeviceObject, StackSize) {
    result := DllCall("ntoskrnl.exe\IoMakeAssociatedIrpEx", IRP.Ptr, _Irp, DEVICE_OBJECT.Ptr, DeviceObject, "char", StackSize, IRP.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<INTERFACE_TYPE>} BusType 
 * @param {Pointer<Integer>} BusNumber 
 * @param {Pointer<CONFIGURATION_TYPE>} ControllerType 
 * @param {Pointer<Integer>} ControllerNumber 
 * @param {Pointer<CONFIGURATION_TYPE>} PeripheralType 
 * @param {Pointer<Integer>} PeripheralNumber 
 * @param {Pointer<PIO_QUERY_DEVICE_ROUTINE>} CalloutRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export IoQueryDeviceDescription(BusType, BusNumber, ControllerType, ControllerNumber, PeripheralType, PeripheralNumber, CalloutRoutine, _Context) {
    BusTypeMarshal := BusType is VarRef ? "int*" : "ptr"
    BusNumberMarshal := BusNumber is VarRef ? "uint*" : "ptr"
    ControllerTypeMarshal := ControllerType is VarRef ? "int*" : "ptr"
    ControllerNumberMarshal := ControllerNumber is VarRef ? "uint*" : "ptr"
    PeripheralTypeMarshal := PeripheralType is VarRef ? "int*" : "ptr"
    PeripheralNumberMarshal := PeripheralNumber is VarRef ? "uint*" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoQueryDeviceDescription", BusTypeMarshal, BusType, BusNumberMarshal, BusNumber, ControllerTypeMarshal, ControllerType, ControllerNumberMarshal, ControllerNumber, PeripheralTypeMarshal, PeripheralType, PeripheralNumberMarshal, PeripheralNumber, "ptr", CalloutRoutine, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<VPB>} _Vpb 
 * @param {Pointer<DEVICE_OBJECT>} RealDeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRaiseHardError(_Irp, _Vpb, RealDeviceObject) {
    DllCall("ntoskrnl.exe\IoRaiseHardError", IRP.Ptr, _Irp, VPB.Ptr, _Vpb, DEVICE_OBJECT.Ptr, RealDeviceObject)
}

/**
 * 
 * @param {NTSTATUS} ErrorStatus 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @param {PKTHREAD} Thread 
 * @returns {BOOLEAN} 
 */
export IoRaiseInformationalHardError(ErrorStatus, _String, Thread) {
    result := DllCall("ntoskrnl.exe\IoRaiseInformationalHardError", NTSTATUS, ErrorStatus, UNICODE_STRING.Ptr, _String, PKTHREAD, Thread, BOOLEAN)
    return result
}

/**
 * 
 * @param {BOOLEAN} EnableHardErrors 
 * @returns {BOOLEAN} 
 */
export IoSetThreadHardErrorMode(EnableHardErrors) {
    result := DllCall("ntoskrnl.exe\IoSetThreadHardErrorMode", BOOLEAN, EnableHardErrors, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DRIVER_REINITIALIZE>} DriverReinitializationRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRegisterBootDriverReinitialization(DriverObject, DriverReinitializationRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoRegisterBootDriverReinitialization", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverReinitializationRoutine, _ContextMarshal, _Context)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DRIVER_REINITIALIZE>} DriverReinitializationRoutine 
 * @param {Pointer<Void>} _Context 
 * @returns {String} Nothing - always returns an empty string
 */
export IoRegisterDriverReinitialization(DriverObject, DriverReinitializationRoutine, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoRegisterDriverReinitialization", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverReinitializationRoutine, _ContextMarshal, _Context)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} DriverClassName 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Integer} DriverList 
 * @param {Integer} DriverListSize 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} DeviceList 
 * @param {Integer} DeviceListSize 
 * @param {BOOLEAN} OverrideConflict 
 * @param {Pointer<BOOLEAN>} ConflictDetected 
 * @returns {NTSTATUS} 
 */
export IoReportResourceUsage(DriverClassName, DriverObject, DriverList, DriverListSize, DeviceObject, DeviceList, DeviceListSize, OverrideConflict, ConflictDetected) {
    ConflictDetectedMarshal := ConflictDetected is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReportResourceUsage", UNICODE_STRING.Ptr, DriverClassName, DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverList, "uint", DriverListSize, DEVICE_OBJECT.Ptr, DeviceObject, "ptr", DeviceList, "uint", DeviceListSize, BOOLEAN, OverrideConflict, ConflictDetectedMarshal, ConflictDetected, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {INTERFACE_TYPE} InterfaceType 
 * @param {Integer} BusNumber 
 * @param {Integer} BusAddress 
 * @param {Pointer<Integer>} AddressSpace 
 * @param {Pointer<Integer>} TranslatedAddress 
 * @returns {BOOLEAN} 
 */
export IoTranslateBusAddress(InterfaceType, BusNumber, BusAddress, AddressSpace, TranslatedAddress) {
    AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
    TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoTranslateBusAddress", INTERFACE_TYPE, InterfaceType, "uint", BusNumber, "int64", BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetHardErrorOrVerifyDevice(_Irp, DeviceObject) {
    DllCall("ntoskrnl.exe\IoSetHardErrorOrVerifyDevice", IRP.Ptr, _Irp, DEVICE_OBJECT.Ptr, DeviceObject)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} SectorSize 
 * @param {Integer} MBRTypeIdentifier 
 * @param {Pointer<Pointer<Void>>} _Buffer 
 * @returns {String} Nothing - always returns an empty string
 */
export HalExamineMBR(DeviceObject, SectorSize, MBRTypeIdentifier, _Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

    DllCall("ntoskrnl.exe\HalExamineMBR", DEVICE_OBJECT.Ptr, DeviceObject, "uint", SectorSize, "uint", MBRTypeIdentifier, _BufferMarshal, _Buffer)
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} SectorSize 
 * @param {BOOLEAN} ReturnRecognizedPartitions 
 * @param {Pointer<Pointer<DRIVE_LAYOUT_INFORMATION>>} PartitionBuffer 
 * @returns {NTSTATUS} 
 */
export IoReadPartitionTable(DeviceObject, SectorSize, ReturnRecognizedPartitions, PartitionBuffer) {
    PartitionBufferMarshal := PartitionBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReadPartitionTable", DEVICE_OBJECT.Ptr, DeviceObject, "uint", SectorSize, BOOLEAN, ReturnRecognizedPartitions, PartitionBufferMarshal, PartitionBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} SectorSize 
 * @param {Integer} PartitionNumber 
 * @param {Integer} PartitionType 
 * @returns {NTSTATUS} 
 */
export IoSetPartitionInformation(DeviceObject, SectorSize, PartitionNumber, PartitionType) {
    result := DllCall("ntoskrnl.exe\IoSetPartitionInformation", DEVICE_OBJECT.Ptr, DeviceObject, "uint", SectorSize, "uint", PartitionNumber, "uint", PartitionType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} SectorSize 
 * @param {Integer} SectorsPerTrack 
 * @param {Integer} NumberOfHeads 
 * @param {Pointer<DRIVE_LAYOUT_INFORMATION>} PartitionBuffer 
 * @returns {NTSTATUS} 
 */
export IoWritePartitionTable(DeviceObject, SectorSize, SectorsPerTrack, NumberOfHeads, PartitionBuffer) {
    result := DllCall("ntoskrnl.exe\IoWritePartitionTable", DEVICE_OBJECT.Ptr, DeviceObject, "uint", SectorSize, "uint", SectorsPerTrack, "uint", NumberOfHeads, DRIVE_LAYOUT_INFORMATION.Ptr, PartitionBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<CREATE_DISK>} Disk 
 * @returns {NTSTATUS} 
 */
export IoCreateDisk(DeviceObject, Disk) {
    result := DllCall("ntoskrnl.exe\IoCreateDisk", DEVICE_OBJECT.Ptr, DeviceObject, CREATE_DISK.Ptr, Disk, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<Pointer<DRIVE_LAYOUT_INFORMATION_EX>>} DriveLayout 
 * @returns {NTSTATUS} 
 */
export IoReadPartitionTableEx(DeviceObject, DriveLayout) {
    DriveLayoutMarshal := DriveLayout is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReadPartitionTableEx", DEVICE_OBJECT.Ptr, DeviceObject, DriveLayoutMarshal, DriveLayout, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Pointer<DRIVE_LAYOUT_INFORMATION_EX>} DriveLayout 
 * @returns {NTSTATUS} 
 */
export IoWritePartitionTableEx(DeviceObject, DriveLayout) {
    result := DllCall("ntoskrnl.exe\IoWritePartitionTableEx", DEVICE_OBJECT.Ptr, DeviceObject, DRIVE_LAYOUT_INFORMATION_EX.Ptr, DriveLayout, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} PartitionNumber 
 * @param {Pointer<SET_PARTITION_INFORMATION_EX>} PartitionInfo 
 * @returns {NTSTATUS} 
 */
export IoSetPartitionInformationEx(DeviceObject, PartitionNumber, PartitionInfo) {
    result := DllCall("ntoskrnl.exe\IoSetPartitionInformationEx", DEVICE_OBJECT.Ptr, DeviceObject, "uint", PartitionNumber, SET_PARTITION_INFORMATION_EX.Ptr, PartitionInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {BOOLEAN} FixErrors 
 * @returns {NTSTATUS} 
 */
export IoVerifyPartitionTable(DeviceObject, FixErrors) {
    result := DllCall("ntoskrnl.exe\IoVerifyPartitionTable", DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN, FixErrors, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} BytesPerSector 
 * @param {Pointer<DISK_SIGNATURE>} Signature 
 * @returns {NTSTATUS} 
 */
export IoReadDiskSignature(DeviceObject, BytesPerSector, Signature) {
    result := DllCall("ntoskrnl.exe\IoReadDiskSignature", DEVICE_OBJECT.Ptr, DeviceObject, "uint", BytesPerSector, DISK_SIGNATURE.Ptr, Signature, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VolumeDeviceObject 
 * @param {Pointer<UNICODE_STRING>} DosName 
 * @returns {NTSTATUS} 
 */
export IoVolumeDeviceToDosName(VolumeDeviceObject, DosName) {
    VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoVolumeDeviceToDosName", VolumeDeviceObjectMarshal, VolumeDeviceObject, UNICODE_STRING.Ptr, DosName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VolumeDeviceObject 
 * @param {Pointer<UNICODE_STRING>} GuidPath 
 * @returns {NTSTATUS} 
 */
export IoVolumeDeviceToGuidPath(VolumeDeviceObject, GuidPath) {
    VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoVolumeDeviceToGuidPath", VolumeDeviceObjectMarshal, VolumeDeviceObject, UNICODE_STRING.Ptr, GuidPath, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VolumeDeviceObject 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export IoVolumeDeviceToGuid(VolumeDeviceObject, Guid) {
    VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoVolumeDeviceToGuid", VolumeDeviceObjectMarshal, VolumeDeviceObject, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VolumeDeviceName 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export IoVolumeDeviceNameToGuid(VolumeDeviceName, Guid) {
    result := DllCall("ntoskrnl.exe\IoVolumeDeviceNameToGuid", UNICODE_STRING.Ptr, VolumeDeviceName, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VolumeDeviceName 
 * @param {Pointer<UNICODE_STRING>} GuidPath 
 * @returns {NTSTATUS} 
 */
export IoVolumeDeviceNameToGuidPath(VolumeDeviceName, GuidPath) {
    result := DllCall("ntoskrnl.exe\IoVolumeDeviceNameToGuidPath", UNICODE_STRING.Ptr, VolumeDeviceName, UNICODE_STRING.Ptr, GuidPath, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} VolumeNameString 
 * @returns {NTSTATUS} 
 */
export IoSetSystemPartition(VolumeNameString) {
    result := DllCall("ntoskrnl.exe\IoSetSystemPartition", UNICODE_STRING.Ptr, VolumeNameString, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} FileHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} AllocationSize 
 * @param {Integer} FileAttributes 
 * @param {Integer} ShareAccess 
 * @param {Integer} Disposition 
 * @param {Integer} CreateOptions 
 * @param {Pointer<Void>} EaBuffer 
 * @param {Integer} EaLength 
 * @param {CREATE_FILE_TYPE} CreateFileType 
 * @param {Pointer<Void>} InternalParameters 
 * @param {Integer} Options 
 * @param {Pointer<Void>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export IoCreateFileSpecifyDeviceObjectHint(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, Disposition, CreateOptions, EaBuffer, EaLength, CreateFileType, InternalParameters, Options, DeviceObject) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"
    EaBufferMarshal := EaBuffer is VarRef ? "ptr" : "ptr"
    InternalParametersMarshal := InternalParameters is VarRef ? "ptr" : "ptr"
    DeviceObjectMarshal := DeviceObject is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCreateFileSpecifyDeviceObjectHint", HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", Disposition, "uint", CreateOptions, EaBufferMarshal, EaBuffer, "uint", EaLength, CREATE_FILE_TYPE, CreateFileType, InternalParametersMarshal, InternalParameters, "uint", Options, DeviceObjectMarshal, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Pointer<IO_FOEXT_SILO_PARAMETERS>} 
 */
export IoGetSiloParameters(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetSiloParameters", FILE_OBJECT.Ptr, FileObject, IO_FOEXT_SILO_PARAMETERS.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {PESILO} 
 */
export IoGetSilo(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetSilo", FILE_OBJECT.Ptr, FileObject, PESILO)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {Pointer<TXN_PARAMETER_BLOCK>} 
 */
export IoGetTransactionParameterBlock(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetTransactionParameterBlock", FILE_OBJECT.Ptr, FileObject, TXN_PARAMETER_BLOCK.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} FileHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Pointer<Integer>} AllocationSize 
 * @param {Integer} FileAttributes 
 * @param {Integer} ShareAccess 
 * @param {Integer} Disposition 
 * @param {Integer} CreateOptions 
 * @param {Pointer<Void>} EaBuffer 
 * @param {Integer} EaLength 
 * @param {CREATE_FILE_TYPE} CreateFileType 
 * @param {Pointer<Void>} InternalParameters 
 * @param {Integer} Options 
 * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
 * @returns {NTSTATUS} 
 */
export IoCreateFileEx(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, Disposition, CreateOptions, EaBuffer, EaLength, CreateFileType, InternalParameters, Options, DriverContext) {
    AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"
    EaBufferMarshal := EaBuffer is VarRef ? "ptr" : "ptr"
    InternalParametersMarshal := InternalParameters is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoCreateFileEx", HANDLE.Ptr, FileHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", Disposition, "uint", CreateOptions, EaBufferMarshal, EaBuffer, "uint", EaLength, CREATE_FILE_TYPE, CreateFileType, InternalParametersMarshal, InternalParameters, "uint", Options, IO_DRIVER_CREATE_CONTEXT.Ptr, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Pointer>} ExtraCreateParameter 
 * @returns {NTSTATUS} 
 */
export IoSetIrpExtraCreateParameter(_Irp, ExtraCreateParameter) {
    ExtraCreateParameterMarshal := ExtraCreateParameter is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoSetIrpExtraCreateParameter", IRP.Ptr, _Irp, ExtraCreateParameterMarshal, ExtraCreateParameter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {String} Nothing - always returns an empty string
 */
export IoClearIrpExtraCreateParameter(_Irp) {
    DllCall("ntoskrnl.exe\IoClearIrpExtraCreateParameter", IRP.Ptr, _Irp)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Pointer<Pointer>>} ExtraCreateParameter 
 * @returns {NTSTATUS} 
 */
export IoGetIrpExtraCreateParameter(_Irp, ExtraCreateParameter) {
    ExtraCreateParameterMarshal := ExtraCreateParameter is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetIrpExtraCreateParameter", IRP.Ptr, _Irp, ExtraCreateParameterMarshal, ExtraCreateParameter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} FileInformation 
 * @param {Integer} Length 
 * @param {FILE_INFORMATION_CLASS} FileInformationClass 
 * @param {Integer} Options 
 * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
 * @returns {NTSTATUS} 
 */
export IoQueryInformationByName(ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass, Options, DriverContext) {
    result := DllCall("ntoskrnl.exe\IoQueryInformationByName", OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "ptr", FileInformation, "uint", Length, FILE_INFORMATION_CLASS, FileInformationClass, "uint", Options, IO_DRIVER_CREATE_CONTEXT.Ptr, DriverContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
 * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} AttachedToDeviceObject 
 * @returns {NTSTATUS} 
 */
export IoAttachDeviceToDeviceStackSafe(SourceDevice, TargetDevice, AttachedToDeviceObject) {
    AttachedToDeviceObjectMarshal := AttachedToDeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoAttachDeviceToDeviceStackSafe", DEVICE_OBJECT.Ptr, SourceDevice, DEVICE_OBJECT.Ptr, TargetDevice, AttachedToDeviceObjectMarshal, AttachedToDeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {BOOLEAN} 
 */
export IoIsFileOriginRemote(FileObject) {
    result := DllCall("ntoskrnl.exe\IoIsFileOriginRemote", FILE_OBJECT.Ptr, FileObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {BOOLEAN} Remote 
 * @returns {NTSTATUS} 
 */
export IoSetFileOrigin(FileObject, Remote) {
    result := DllCall("ntoskrnl.exe\IoSetFileOrigin", FILE_OBJECT.Ptr, FileObject, BOOLEAN, Remote, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {BOOLEAN} 
 */
export IoIsFileObjectIgnoringSharing(FileObject) {
    result := DllCall("ntoskrnl.exe\IoIsFileObjectIgnoringSharing", FILE_OBJECT.Ptr, FileObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {NTSTATUS} 
 */
export IoSetFileObjectIgnoreSharing(FileObject) {
    result := DllCall("ntoskrnl.exe\IoSetFileObjectIgnoreSharing", FILE_OBJECT.Ptr, FileObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {IO_PAGING_PRIORITY} 
 */
export IoGetPagingIoPriority(_Irp) {
    result := DllCall("ntoskrnl.exe\IoGetPagingIoPriority", IRP.Ptr, _Irp, IO_PAGING_PRIORITY)
    return result
}

/**
 * 
 * @param {Pointer<PBOOT_DRIVER_CALLBACK_FUNCTION>} CallbackFunction 
 * @param {Pointer<Void>} CallbackContext 
 * @returns {Pointer<Void>} 
 */
export IoRegisterBootDriverCallback(CallbackFunction, CallbackContext) {
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\IoRegisterBootDriverCallback", "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} CallbackHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export IoUnregisterBootDriverCallback(CallbackHandle) {
    CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

    DllCall("ntoskrnl.exe\IoUnregisterBootDriverCallback", CallbackHandleMarshal, CallbackHandle)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export IoGetActivityIdIrp(_Irp, Guid) {
    result := DllCall("ntoskrnl.exe\IoGetActivityIdIrp", IRP.Ptr, _Irp, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Guid>} Guid 
 * @returns {NTSTATUS} 
 */
export IoSetActivityIdIrp(_Irp, Guid) {
    result := DllCall("ntoskrnl.exe\IoSetActivityIdIrp", IRP.Ptr, _Irp, Guid.Ptr, Guid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Guid>} PropagatedId 
 * @param {Pointer<Pointer<Guid>>} OriginalId 
 * @returns {NTSTATUS} 
 */
export IoPropagateActivityIdToThread(_Irp, PropagatedId, OriginalId) {
    OriginalIdMarshal := OriginalId is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoPropagateActivityIdToThread", IRP.Ptr, _Irp, Guid.Ptr, PropagatedId, OriginalIdMarshal, OriginalId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} ActivityId 
 * @returns {Pointer<Guid>} 
 */
export IoSetActivityIdThread(ActivityId) {
    result := DllCall("ntoskrnl.exe\IoSetActivityIdThread", Guid.Ptr, ActivityId, Guid.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} OriginalId 
 * @returns {String} Nothing - always returns an empty string
 */
export IoClearActivityIdThread(OriginalId) {
    DllCall("ntoskrnl.exe\IoClearActivityIdThread", Guid.Ptr, OriginalId)
}

/**
 * 
 * @returns {Pointer<Guid>} 
 */
export IoGetActivityIdThread() {
    result := DllCall("ntoskrnl.exe\IoGetActivityIdThread", Guid.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} ActivityId 
 * @param {Pointer<Guid>} RelatedActivityId 
 * @returns {String} Nothing - always returns an empty string
 */
export IoTransferActivityId(ActivityId, RelatedActivityId) {
    DllCall("ntoskrnl.exe\IoTransferActivityId", Guid.Ptr, ActivityId, Guid.Ptr, RelatedActivityId)
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Pointer<Integer>} ZeroingOffset 
 * @returns {NTSTATUS} 
 */
export IoGetFsZeroingOffset(_Irp, ZeroingOffset) {
    ZeroingOffsetMarshal := ZeroingOffset is VarRef ? "uint*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoGetFsZeroingOffset", IRP.Ptr, _Irp, ZeroingOffsetMarshal, ZeroingOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @returns {NTSTATUS} 
 */
export IoSetFsZeroingOffsetRequired(_Irp) {
    result := DllCall("ntoskrnl.exe\IoSetFsZeroingOffsetRequired", IRP.Ptr, _Irp, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} _Irp 
 * @param {Integer} ZeroingOffset 
 * @returns {NTSTATUS} 
 */
export IoSetFsZeroingOffset(_Irp, ZeroingOffset) {
    result := DllCall("ntoskrnl.exe\IoSetFsZeroingOffset", IRP.Ptr, _Irp, "uint", ZeroingOffset, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {NTSTATUS} _Status 
 * @returns {Integer} 
 */
export IoIsValidIrpStatus(_Status) {
    result := DllCall("ntoskrnl.exe\IoIsValidIrpStatus", NTSTATUS, _Status, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PEPROCESS} Process 
 * @returns {NTSTATUS} 
 */
export IoIncrementKeepAliveCount(FileObject, Process) {
    result := DllCall("ntoskrnl.exe\IoIncrementKeepAliveCount", FILE_OBJECT.Ptr, FileObject, PEPROCESS, Process, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @param {PEPROCESS} Process 
 * @returns {NTSTATUS} 
 */
export IoDecrementKeepAliveCount(FileObject, Process) {
    result := DllCall("ntoskrnl.exe\IoDecrementKeepAliveCount", FILE_OBJECT.Ptr, FileObject, PEPROCESS, Process, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<FILE_OBJECT>} FileObject 
 * @returns {PEPROCESS} 
 */
export IoGetInitiatorProcess(FileObject) {
    result := DllCall("ntoskrnl.exe\IoGetInitiatorProcess", FILE_OBJECT.Ptr, FileObject, PEPROCESS)
    return result
}

/**
 * 
 * @param {Pointer<IRP>} MasterIrp 
 * @param {NTSTATUS} _Status 
 * @returns {String} Nothing - always returns an empty string
 */
export IoSetMasterIrpStatus(MasterIrp, _Status) {
    DllCall("ntoskrnl.exe\IoSetMasterIrpStatus", IRP.Ptr, MasterIrp, NTSTATUS, _Status)
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<UNICODE_STRING>} FullPath 
 * @returns {NTSTATUS} 
 */
export IoQueryFullDriverPath(DriverObject, FullPath) {
    result := DllCall("ntoskrnl.exe\IoQueryFullDriverPath", DRIVER_OBJECT.Ptr, DriverObject, UNICODE_STRING.Ptr, FullPath, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {INTERFACE_TYPE} LegacyBusType 
 * @param {Integer} BusNumber 
 * @param {Integer} SlotNumber 
 * @param {Pointer<CM_RESOURCE_LIST>} ResourceList 
 * @param {Pointer<IO_RESOURCE_REQUIREMENTS_LIST>} ResourceRequirements 
 * @param {BOOLEAN} ResourceAssigned 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
 * @returns {NTSTATUS} 
 */
export IoReportDetectedDevice(DriverObject, LegacyBusType, BusNumber, SlotNumber, ResourceList, ResourceRequirements, ResourceAssigned, DeviceObject) {
    DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReportDetectedDevice", DRIVER_OBJECT.Ptr, DriverObject, INTERFACE_TYPE, LegacyBusType, "uint", BusNumber, "uint", SlotNumber, CM_RESOURCE_LIST.Ptr, ResourceList, IO_RESOURCE_REQUIREMENTS_LIST.Ptr, ResourceRequirements, BOOLEAN, ResourceAssigned, DeviceObjectMarshal, DeviceObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @returns {NTSTATUS} 
 */
export IoReportRootDevice(DriverObject) {
    result := DllCall("ntoskrnl.exe\IoReportRootDevice", DRIVER_OBJECT.Ptr, DriverObject, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Integer} DriverList 
 * @param {Integer} DriverListSize 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} DeviceList 
 * @param {Integer} DeviceListSize 
 * @param {Pointer<BOOLEAN>} ConflictDetected 
 * @returns {NTSTATUS} 
 */
export IoReportResourceForDetection(DriverObject, DriverList, DriverListSize, DeviceObject, DeviceList, DeviceListSize, ConflictDetected) {
    ConflictDetectedMarshal := ConflictDetected is VarRef ? "char*" : "ptr"

    result := DllCall("ntoskrnl.exe\IoReportResourceForDetection", DRIVER_OBJECT.Ptr, DriverObject, "ptr", DriverList, "uint", DriverListSize, DEVICE_OBJECT.Ptr, DeviceObject, "ptr", DeviceList, "uint", DeviceListSize, ConflictDetectedMarshal, ConflictDetected, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PHAL_RESET_DISPLAY_PARAMETERS>} ResetDisplayParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export HalAcquireDisplayOwnership(ResetDisplayParameters) {
    DllCall("HAL.dll\HalAcquireDisplayOwnership", "ptr", ResetDisplayParameters)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} RegistryPath 
 * @param {Pointer<UNICODE_STRING>} DriverClassName 
 * @param {Pointer<DRIVER_OBJECT>} DriverObject 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {INTERFACE_TYPE} BusType 
 * @param {Integer} BusNumber 
 * @param {Integer} SlotNumber 
 * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
 * @returns {NTSTATUS} 
 */
export HalAssignSlotResources(RegistryPath, DriverClassName, DriverObject, DeviceObject, BusType, BusNumber, SlotNumber, AllocatedResources) {
    AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"

    result := DllCall("HAL.dll\HalAssignSlotResources", UNICODE_STRING.Ptr, RegistryPath, UNICODE_STRING.Ptr, DriverClassName, DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, DeviceObject, INTERFACE_TYPE, BusType, "uint", BusNumber, "uint", SlotNumber, AllocatedResourcesMarshal, AllocatedResources, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {INTERFACE_TYPE} InterfaceType 
 * @param {Integer} BusNumber 
 * @param {Integer} BusInterruptLevel 
 * @param {Integer} BusInterruptVector 
 * @param {Pointer<Integer>} Irql 
 * @param {Pointer<Pointer>} Affinity 
 * @returns {Integer} 
 */
export HalGetInterruptVector(InterfaceType, BusNumber, BusInterruptLevel, BusInterruptVector, Irql, Affinity) {
    IrqlMarshal := Irql is VarRef ? "char*" : "ptr"
    AffinityMarshal := Affinity is VarRef ? "ptr*" : "ptr"

    result := DllCall("HAL.dll\HalGetInterruptVector", INTERFACE_TYPE, InterfaceType, "uint", BusNumber, "uint", BusInterruptLevel, "uint", BusInterruptVector, IrqlMarshal, Irql, AffinityMarshal, Affinity, UInt32)
    return result
}

/**
 * 
 * @param {BUS_DATA_TYPE} BusDataType 
 * @param {Integer} BusNumber 
 * @param {Integer} SlotNumber 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export HalSetBusData(BusDataType, BusNumber, SlotNumber, _Buffer, Length) {
    result := DllCall("HAL.dll\HalSetBusData", BUS_DATA_TYPE, BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", _Buffer, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @param {BUS_DATA_TYPE} BusDataType 
 * @param {Integer} BusNumber 
 * @param {Integer} SlotNumber 
 * @param {Integer} _Buffer 
 * @param {Integer} Offset 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export HalSetBusDataByOffset(BusDataType, BusNumber, SlotNumber, _Buffer, Offset, Length) {
    result := DllCall("HAL.dll\HalSetBusDataByOffset", BUS_DATA_TYPE, BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", _Buffer, "uint", Offset, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @param {INTERFACE_TYPE} InterfaceType 
 * @param {Integer} BusNumber 
 * @param {Integer} BusAddress 
 * @param {Pointer<Integer>} AddressSpace 
 * @param {Pointer<Integer>} TranslatedAddress 
 * @returns {BOOLEAN} 
 */
export HalTranslateBusAddress(InterfaceType, BusNumber, BusAddress, AddressSpace, TranslatedAddress) {
    AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
    TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"

    result := DllCall("HAL.dll\HalTranslateBusAddress", INTERFACE_TYPE, InterfaceType, "uint", BusNumber, "int64", BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Pointer<Integer>} NumberOfMapRegisters 
 * @returns {Pointer<Void>} 
 */
export HalAllocateCrashDumpRegisters(AdapterObject, NumberOfMapRegisters) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

    result := DllCall("HAL.dll\HalAllocateCrashDumpRegisters", AdapterObjectMarshal, AdapterObject, NumberOfMapRegistersMarshal, NumberOfMapRegisters, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} _Adapter 
 * @param {Integer} NumberOfMapRegisters 
 * @param {HAL_DMA_CRASH_DUMP_REGISTER_TYPE} Type 
 * @param {Pointer<Pointer<Void>>} MapRegisterBase 
 * @param {Pointer<Integer>} MapRegistersAvailable 
 * @returns {NTSTATUS} 
 */
export HalDmaAllocateCrashDumpRegistersEx(_Adapter, NumberOfMapRegisters, Type, MapRegisterBase, MapRegistersAvailable) {
    _AdapterMarshal := _Adapter is VarRef ? "ptr*" : "ptr"
    MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr*" : "ptr"
    MapRegistersAvailableMarshal := MapRegistersAvailable is VarRef ? "uint*" : "ptr"

    result := DllCall("HAL.dll\HalDmaAllocateCrashDumpRegistersEx", _AdapterMarshal, _Adapter, "uint", NumberOfMapRegisters, HAL_DMA_CRASH_DUMP_REGISTER_TYPE, Type, MapRegisterBaseMarshal, MapRegisterBase, MapRegistersAvailableMarshal, MapRegistersAvailable, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} _Adapter 
 * @param {HAL_DMA_CRASH_DUMP_REGISTER_TYPE} Type 
 * @returns {NTSTATUS} 
 */
export HalDmaFreeCrashDumpRegistersEx(_Adapter, Type) {
    _AdapterMarshal := _Adapter is VarRef ? "ptr*" : "ptr"

    result := DllCall("HAL.dll\HalDmaFreeCrashDumpRegistersEx", _AdapterMarshal, _Adapter, HAL_DMA_CRASH_DUMP_REGISTER_TYPE, Type, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {BUS_DATA_TYPE} BusDataType 
 * @param {Integer} BusNumber 
 * @param {Integer} SlotNumber 
 * @param {Integer} _Buffer 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export HalGetBusData(BusDataType, BusNumber, SlotNumber, _Buffer, Length) {
    result := DllCall("HAL.dll\HalGetBusData", BUS_DATA_TYPE, BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", _Buffer, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @param {BUS_DATA_TYPE} BusDataType 
 * @param {Integer} BusNumber 
 * @param {Integer} SlotNumber 
 * @param {Integer} _Buffer 
 * @param {Integer} Offset 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export HalGetBusDataByOffset(BusDataType, BusNumber, SlotNumber, _Buffer, Offset, Length) {
    result := DllCall("HAL.dll\HalGetBusDataByOffset", BUS_DATA_TYPE, BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", _Buffer, "uint", Offset, "uint", Length, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<DEVICE_DESCRIPTION>} DeviceDescription 
 * @param {Pointer<Integer>} NumberOfMapRegisters 
 * @returns {Pointer<_ADAPTER_OBJECT>} 
 */
export HalGetAdapter(DeviceDescription, NumberOfMapRegisters) {
    NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

    result := DllCall("HAL.dll\HalGetAdapter", DEVICE_DESCRIPTION.Ptr, DeviceDescription, NumberOfMapRegistersMarshal, NumberOfMapRegisters, _ADAPTER_OBJECT.Ptr)
    return result
}

/**
 * 
 * @param {Integer} Frequency 
 * @returns {BOOLEAN} 
 */
export HalMakeBeep(Frequency) {
    result := DllCall("HAL.dll\HalMakeBeep", "uint", Frequency, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Pointer<WAIT_CONTEXT_BLOCK>} Wcb 
 * @param {Integer} NumberOfMapRegisters 
 * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
 * @returns {NTSTATUS} 
 */
export HalAllocateAdapterChannel(AdapterObject, Wcb, NumberOfMapRegisters, ExecutionRoutine) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("HAL.dll\HalAllocateAdapterChannel", AdapterObjectMarshal, AdapterObject, WAIT_CONTEXT_BLOCK.Ptr, Wcb, "uint", NumberOfMapRegisters, "ptr", ExecutionRoutine, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Integer} Length 
 * @param {Pointer<Integer>} LogicalAddress 
 * @param {BOOLEAN} CacheEnabled 
 * @returns {Pointer<Void>} 
 */
export HalAllocateCommonBuffer(AdapterObject, Length, LogicalAddress, CacheEnabled) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"

    result := DllCall("HAL.dll\HalAllocateCommonBuffer", AdapterObjectMarshal, AdapterObject, "uint", Length, LogicalAddressMarshal, LogicalAddress, BOOLEAN, CacheEnabled, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Integer} Length 
 * @param {Integer} LogicalAddress 
 * @param {Pointer<Void>} VirtualAddress 
 * @param {BOOLEAN} CacheEnabled 
 * @returns {String} Nothing - always returns an empty string
 */
export HalFreeCommonBuffer(AdapterObject, Length, LogicalAddress, VirtualAddress, CacheEnabled) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

    DllCall("HAL.dll\HalFreeCommonBuffer", AdapterObjectMarshal, AdapterObject, "uint", Length, "int64", LogicalAddress, VirtualAddressMarshal, VirtualAddress, BOOLEAN, CacheEnabled)
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @returns {Integer} 
 */
export HalReadDmaCounter(AdapterObject) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("HAL.dll\HalReadDmaCounter", AdapterObjectMarshal, AdapterObject, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Pointer<MDL>} _Mdl 
 * @param {Pointer<Void>} MapRegisterBase 
 * @param {Pointer<Void>} CurrentVa 
 * @param {Integer} Length 
 * @param {BOOLEAN} WriteToDevice 
 * @returns {BOOLEAN} 
 */
export IoFlushAdapterBuffers(AdapterObject, _Mdl, MapRegisterBase, CurrentVa, Length, WriteToDevice) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
    CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"

    result := DllCall("HAL.dll\IoFlushAdapterBuffers", AdapterObjectMarshal, AdapterObject, MDL.Ptr, _Mdl, MapRegisterBaseMarshal, MapRegisterBase, CurrentVaMarshal, CurrentVa, "uint", Length, BOOLEAN, WriteToDevice, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeAdapterChannel(AdapterObject) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"

    DllCall("HAL.dll\IoFreeAdapterChannel", AdapterObjectMarshal, AdapterObject)
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Pointer<Void>} MapRegisterBase 
 * @param {Integer} NumberOfMapRegisters 
 * @returns {String} Nothing - always returns an empty string
 */
export IoFreeMapRegisters(AdapterObject, MapRegisterBase, NumberOfMapRegisters) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"

    DllCall("HAL.dll\IoFreeMapRegisters", AdapterObjectMarshal, AdapterObject, MapRegisterBaseMarshal, MapRegisterBase, "uint", NumberOfMapRegisters)
}

/**
 * 
 * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
 * @param {Pointer<MDL>} _Mdl 
 * @param {Pointer<Void>} MapRegisterBase 
 * @param {Pointer<Void>} CurrentVa 
 * @param {Pointer<Integer>} Length 
 * @param {BOOLEAN} WriteToDevice 
 * @returns {Integer} 
 */
export IoMapTransfer(AdapterObject, _Mdl, MapRegisterBase, CurrentVa, Length, WriteToDevice) {
    AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
    MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
    CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"
    LengthMarshal := Length is VarRef ? "uint*" : "ptr"

    result := DllCall("HAL.dll\IoMapTransfer", AdapterObjectMarshal, AdapterObject, MDL.Ptr, _Mdl, MapRegisterBaseMarshal, MapRegisterBase, CurrentVaMarshal, CurrentVa, LengthMarshal, Length, BOOLEAN, WriteToDevice, Int64)
    return result
}

/**
 * 
 * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
 * @param {Pointer<WHEA_ERROR_RECORD>} ErrorRecord 
 * @returns {String} Nothing - always returns an empty string
 */
export HalBugCheckSystem(ErrorSource, ErrorRecord) {
    DllCall("HAL.dll\HalBugCheckSystem", WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, WHEA_ERROR_RECORD.Ptr, ErrorRecord)
}

/**
 * 
 * @param {Pointer<GROUP_AFFINITY>} GroupAffinty 
 * @param {Integer} GroupCount 
 * @param {Pointer<PHYSICAL_COUNTER_RESOURCE_LIST>} ResourceList 
 * @param {Pointer<HANDLE>} CounterSetHandle 
 * @returns {NTSTATUS} 
 */
export HalAllocateHardwareCounters(GroupAffinty, GroupCount, ResourceList, CounterSetHandle) {
    result := DllCall("HAL.dll\HalAllocateHardwareCounters", GROUP_AFFINITY.Ptr, GroupAffinty, "uint", GroupCount, PHYSICAL_COUNTER_RESOURCE_LIST.Ptr, ResourceList, HANDLE.Ptr, CounterSetHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} CounterSetHandle 
 * @returns {NTSTATUS} 
 */
export HalFreeHardwareCounters(CounterSetHandle) {
    result := DllCall("HAL.dll\HalFreeHardwareCounters", HANDLE, CounterSetHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {NTSTATUS} _Status 
 * @returns {BOOLEAN} 
 */
export FsRtlIsTotalDeviceFailure(_Status) {
    result := DllCall("ntoskrnl.exe\FsRtlIsTotalDeviceFailure", NTSTATUS, _Status, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} FileHandle 
 * @param {HANDLE} Event 
 * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
 * @param {Pointer<Void>} ApcContext 
 * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
 * @param {Integer} IoControlCode 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @returns {NTSTATUS} 
 */
export ZwDeviceIoControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, IoControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
    ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwDeviceIoControlFile", HANDLE, FileHandle, HANDLE, Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, "uint", IoControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} _String 
 * @returns {NTSTATUS} 
 */
export ZwDisplayString(_String) {
    result := DllCall("ntdll.dll\ZwDisplayString", UNICODE_STRING.Ptr, _String, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {POWER_INFORMATION_LEVEL} InformationLevel 
 * @param {Integer} InputBuffer 
 * @param {Integer} InputBufferLength 
 * @param {Integer} OutputBuffer 
 * @param {Integer} OutputBufferLength 
 * @returns {NTSTATUS} 
 */
export ZwPowerInformation(InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
    result := DllCall("ntdll.dll\ZwPowerInformation", POWER_INFORMATION_LEVEL, InformationLevel, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<LUID>} _Luid 
 * @returns {NTSTATUS} 
 */
export ZwAllocateLocallyUniqueId(_Luid) {
    result := DllCall("ntdll.dll\ZwAllocateLocallyUniqueId", LUID.Ptr, _Luid, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER>} Configuration 
 * @param {Integer} NumberPreallocatedErrorReports 
 * @returns {NTSTATUS} 
 */
export WheaAddErrorSourceDeviceDriver(_Context, Configuration, NumberPreallocatedErrorReports) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaAddErrorSourceDeviceDriver", _ContextMarshal, _Context, WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER.Ptr, Configuration, "uint", NumberPreallocatedErrorReports, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER>} Configuration 
 * @param {Integer} NumBuffersToPreallocate 
 * @param {Integer} MaxDataLength 
 * @returns {NTSTATUS} 
 */
export WheaAddErrorSourceDeviceDriverV1(_Context, Configuration, NumBuffersToPreallocate, MaxDataLength) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaAddErrorSourceDeviceDriverV1", _ContextMarshal, _Context, WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER.Ptr, Configuration, "uint", NumBuffersToPreallocate, "uint", MaxDataLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ErrorSourceId 
 * @returns {NTSTATUS} 
 */
export WheaRemoveErrorSourceDeviceDriver(ErrorSourceId) {
    result := DllCall("ntoskrnl.exe\WheaRemoveErrorSourceDeviceDriver", "uint", ErrorSourceId, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ErrorSourceId 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @param {Integer} ErrorData 
 * @param {Integer} ErrorDataLength 
 * @param {Pointer<Guid>} SectionTypeGuid 
 * @param {WHEA_ERROR_SEVERITY} ErrorSeverity 
 * @param {PSTR} DeviceFriendlyName 
 * @returns {NTSTATUS} 
 */
export WheaReportHwErrorDeviceDriver(ErrorSourceId, DeviceObject, ErrorData, ErrorDataLength, SectionTypeGuid, ErrorSeverity, DeviceFriendlyName) {
    DeviceFriendlyName := DeviceFriendlyName is String ? StrPtr(DeviceFriendlyName) : DeviceFriendlyName

    result := DllCall("ntoskrnl.exe\WheaReportHwErrorDeviceDriver", "uint", ErrorSourceId, DEVICE_OBJECT.Ptr, DeviceObject, "ptr", ErrorData, "uint", ErrorDataLength, Guid.Ptr, SectionTypeGuid, WHEA_ERROR_SEVERITY, ErrorSeverity, "ptr", DeviceFriendlyName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ErrorSourceId 
 * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
 * @returns {Pointer<Void>} 
 */
export WheaCreateHwErrorReportDeviceDriver(ErrorSourceId, DeviceObject) {
    result := DllCall("ntoskrnl.exe\WheaCreateHwErrorReportDeviceDriver", "uint", ErrorSourceId, DEVICE_OBJECT.Ptr, DeviceObject, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ErrorHandle 
 * @param {Integer} SectionDataLength 
 * @param {Pointer<WHEA_DRIVER_BUFFER_SET>} BufferSet 
 * @returns {NTSTATUS} 
 */
export WheaAddHwErrorReportSectionDeviceDriver(ErrorHandle, SectionDataLength, BufferSet) {
    ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaAddHwErrorReportSectionDeviceDriver", ErrorHandleMarshal, ErrorHandle, "uint", SectionDataLength, WHEA_DRIVER_BUFFER_SET.Ptr, BufferSet, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ErrorHandle 
 * @returns {NTSTATUS} 
 */
export WheaHwErrorReportAbandonDeviceDriver(ErrorHandle) {
    ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaHwErrorReportAbandonDeviceDriver", ErrorHandleMarshal, ErrorHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ErrorHandle 
 * @returns {NTSTATUS} 
 */
export WheaHwErrorReportSubmitDeviceDriver(ErrorHandle) {
    ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaHwErrorReportSubmitDeviceDriver", ErrorHandleMarshal, ErrorHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} ErrorHandle 
 * @param {WHEA_ERROR_SEVERITY} ErrorSeverity 
 * @returns {NTSTATUS} 
 */
export WheaHwErrorReportSetSeverityDeviceDriver(ErrorHandle, ErrorSeverity) {
    ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaHwErrorReportSetSeverityDeviceDriver", ErrorHandleMarshal, ErrorHandle, WHEA_ERROR_SEVERITY, ErrorSeverity, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<WHEA_DRIVER_BUFFER_SET>} BufferSet 
 * @param {Integer} NameLength 
 * @param {Integer} Name 
 * @returns {NTSTATUS} 
 */
export WheaHwErrorReportSetSectionNameDeviceDriver(BufferSet, NameLength, Name) {
    result := DllCall("ntoskrnl.exe\WheaHwErrorReportSetSectionNameDeviceDriver", WHEA_DRIVER_BUFFER_SET.Ptr, BufferSet, "uint", NameLength, "ptr", Name, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<WHEA_ERROR_PACKET_V2>} ErrorPacket 
 * @returns {NTSTATUS} 
 */
export WheaReportHwError(ErrorPacket) {
    result := DllCall("ntoskrnl.exe\WheaReportHwError", WHEA_ERROR_PACKET_V2.Ptr, ErrorPacket, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export WheaAddErrorSource(ErrorSource, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaAddErrorSource", WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<WHEA_ERROR_RECORD_HEADER>} Header 
 * @returns {NTSTATUS} 
 */
export WheaInitializeRecordHeader(Header) {
    result := DllCall("ntoskrnl.exe\WheaInitializeRecordHeader", WHEA_ERROR_RECORD_HEADER.Ptr, Header, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {WHEA_ERROR_SOURCE_TYPE} SourceType 
 * @param {Pointer<WHEA_ERROR_SOURCE_CONFIGURATION>} Configuration 
 * @returns {NTSTATUS} 
 */
export WheaConfigureErrorSource(SourceType, Configuration) {
    result := DllCall("ntoskrnl.exe\WheaConfigureErrorSource", WHEA_ERROR_SOURCE_TYPE, SourceType, WHEA_ERROR_SOURCE_CONFIGURATION.Ptr, Configuration, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {WHEA_ERROR_SOURCE_TYPE} SourceType 
 * @returns {NTSTATUS} 
 */
export WheaUnconfigureErrorSource(SourceType) {
    result := DllCall("ntoskrnl.exe\WheaUnconfigureErrorSource", WHEA_ERROR_SOURCE_TYPE, SourceType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} ErrorSourceId 
 * @returns {String} Nothing - always returns an empty string
 */
export WheaRemoveErrorSource(ErrorSourceId) {
    DllCall("ntoskrnl.exe\WheaRemoveErrorSource", "uint", ErrorSourceId)
}

/**
 * 
 * @param {Pointer<WHEA_EVENT_LOG_ENTRY>} Entry 
 * @returns {String} Nothing - always returns an empty string
 */
export WheaLogInternalEvent(Entry) {
    DllCall("ntoskrnl.exe\WheaLogInternalEvent", WHEA_EVENT_LOG_ENTRY.Ptr, Entry)
}

/**
 * 
 * @param {Integer} ErrorSourceId 
 * @returns {WHEA_ERROR_SOURCE_STATE} 
 */
export WheaErrorSourceGetState(ErrorSourceId) {
    result := DllCall("ntoskrnl.exe\WheaErrorSourceGetState", "uint", ErrorSourceId, WHEA_ERROR_SOURCE_STATE)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export WheaIsCriticalState() {
    result := DllCall("ntoskrnl.exe\WheaIsCriticalState", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER>} Handler 
 * @param {Pointer<Void>} _Context 
 * @returns {BOOLEAN} 
 */
export WheaHighIrqlLogSelEventHandlerRegister(Handler, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaHighIrqlLogSelEventHandlerRegister", "ptr", Handler, _ContextMarshal, _Context, BOOLEAN)
    return result
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export WheaHighIrqlLogSelEventHandlerUnregister() {
    DllCall("ntoskrnl.exe\WheaHighIrqlLogSelEventHandlerUnregister")
}

/**
 * 
 * @param {Pointer<PFN_IN_USE_PAGE_OFFLINE_NOTIFY>} Callback 
 * @param {Pointer<Void>} _Context 
 * @returns {NTSTATUS} 
 */
export WheaRegisterInUsePageOfflineNotification(Callback, _Context) {
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("ntoskrnl.exe\WheaRegisterInUsePageOfflineNotification", "ptr", Callback, _ContextMarshal, _Context, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PFN_IN_USE_PAGE_OFFLINE_NOTIFY>} Callback 
 * @returns {NTSTATUS} 
 */
export WheaUnregisterInUsePageOfflineNotification(Callback) {
    result := DllCall("ntoskrnl.exe\WheaUnregisterInUsePageOfflineNotification", "ptr", Callback, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export WheaGetNotifyAllOfflinesPolicy() {
    result := DllCall("ntoskrnl.exe\WheaGetNotifyAllOfflinesPolicy", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PHVL_WHEA_ERROR_NOTIFICATION>} Callback 
 * @returns {NTSTATUS} 
 */
export HvlRegisterWheaErrorNotification(Callback) {
    result := DllCall("ntoskrnl.exe\HvlRegisterWheaErrorNotification", "ptr", Callback, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<PHVL_WHEA_ERROR_NOTIFICATION>} Callback 
 * @returns {NTSTATUS} 
 */
export HvlUnregisterWheaErrorNotification(Callback) {
    result := DllCall("ntoskrnl.exe\HvlUnregisterWheaErrorNotification", "ptr", Callback, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} _Size 
 * @returns {Pointer<Void>} 
 */
export PshedAllocateMemory(_Size) {
    result := DllCall("PSHED.dll\PshedAllocateMemory", "uint", _Size, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} _Address 
 * @returns {String} Nothing - always returns an empty string
 */
export PshedFreeMemory(_Address) {
    _AddressMarshal := _Address is VarRef ? "ptr" : "ptr"

    DllCall("PSHED.dll\PshedFreeMemory", _AddressMarshal, _Address)
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export PshedIsSystemWheaEnabled() {
    result := DllCall("PSHED.dll\PshedIsSystemWheaEnabled", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<WHEA_PSHED_PLUGIN_REGISTRATION_PACKET_V2>} Packet 
 * @returns {NTSTATUS} 
 */
export PshedRegisterPlugin(Packet) {
    result := DllCall("PSHED.dll\PshedRegisterPlugin", WHEA_PSHED_PLUGIN_REGISTRATION_PACKET_V2.Ptr, Packet, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} PluginHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export PshedUnregisterPlugin(PluginHandle) {
    PluginHandleMarshal := PluginHandle is VarRef ? "ptr" : "ptr"

    DllCall("PSHED.dll\PshedUnregisterPlugin", PluginHandleMarshal, PluginHandle)
}

/**
 * 
 * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
 * @param {Pointer<PKSYNCHRONIZE_ROUTINE>} SynchronizeRoutine 
 * @param {Pointer<Void>} SynchronizeContext 
 * @returns {BOOLEAN} 
 */
export PshedSynchronizeExecution(ErrorSource, SynchronizeRoutine, SynchronizeContext) {
    SynchronizeContextMarshal := SynchronizeContext is VarRef ? "ptr" : "ptr"

    result := DllCall("PSHED.dll\PshedSynchronizeExecution", WHEA_ERROR_SOURCE_DESCRIPTOR.Ptr, ErrorSource, "ptr", SynchronizeRoutine, SynchronizeContextMarshal, SynchronizeContext, BOOLEAN)
    return result
}

;@endregion Functions
