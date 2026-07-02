#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIBIO_STORAGE_PIPELINE_CLEANUP_FN.ahk" { PIBIO_STORAGE_PIPELINE_CLEANUP_FN }
#Import ".\PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN.ahk" { PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN }
#Import ".\PIBIO_STORAGE_DELETE_RECORD_FN.ahk" { PIBIO_STORAGE_DELETE_RECORD_FN }
#Import ".\PIBIO_STORAGE_OPEN_DATABASE_FN.ahk" { PIBIO_STORAGE_OPEN_DATABASE_FN }
#Import ".\PIBIO_STORAGE_CONTROL_UNIT_FN.ahk" { PIBIO_STORAGE_CONTROL_UNIT_FN }
#Import ".\PIBIO_STORAGE_GET_RECORD_COUNT_FN.ahk" { PIBIO_STORAGE_GET_RECORD_COUNT_FN }
#Import ".\WINBIO_ADAPTER_INTERFACE_VERSION.ahk" { WINBIO_ADAPTER_INTERFACE_VERSION }
#Import ".\PIBIO_STORAGE_NEXT_RECORD_FN.ahk" { PIBIO_STORAGE_NEXT_RECORD_FN }
#Import ".\PIBIO_STORAGE_CLEAR_CONTEXT_FN.ahk" { PIBIO_STORAGE_CLEAR_CONTEXT_FN }
#Import ".\PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN.ahk" { PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN }
#Import ".\PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN.ahk" { PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN }
#Import ".\PIBIO_STORAGE_ADD_RECORD_FN.ahk" { PIBIO_STORAGE_ADD_RECORD_FN }
#Import ".\PIBIO_STORAGE_QUERY_BY_SUBJECT_FN.ahk" { PIBIO_STORAGE_QUERY_BY_SUBJECT_FN }
#Import ".\PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN.ahk" { PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PIBIO_STORAGE_DETACH_FN.ahk" { PIBIO_STORAGE_DETACH_FN }
#Import ".\PIBIO_STORAGE_RESERVED_1_FN.ahk" { PIBIO_STORAGE_RESERVED_1_FN }
#Import ".\PIBIO_STORAGE_ERASE_DATABASE_FN.ahk" { PIBIO_STORAGE_ERASE_DATABASE_FN }
#Import ".\PIBIO_STORAGE_GET_CURRENT_RECORD_FN.ahk" { PIBIO_STORAGE_GET_CURRENT_RECORD_FN }
#Import ".\PIBIO_STORAGE_FIRST_RECORD_FN.ahk" { PIBIO_STORAGE_FIRST_RECORD_FN }
#Import ".\PIBIO_STORAGE_GET_DATA_FORMAT_FN.ahk" { PIBIO_STORAGE_GET_DATA_FORMAT_FN }
#Import ".\PIBIO_STORAGE_PIPELINE_INIT_FN.ahk" { PIBIO_STORAGE_PIPELINE_INIT_FN }
#Import ".\PIBIO_STORAGE_GET_DATABASE_SIZE_FN.ahk" { PIBIO_STORAGE_GET_DATABASE_SIZE_FN }
#Import ".\PIBIO_STORAGE_QUERY_BY_CONTENT_FN.ahk" { PIBIO_STORAGE_QUERY_BY_CONTENT_FN }
#Import ".\PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN.ahk" { PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN }
#Import ".\PIBIO_STORAGE_DEACTIVATE_FN.ahk" { PIBIO_STORAGE_DEACTIVATE_FN }
#Import ".\PIBIO_STORAGE_CLOSE_DATABASE_FN.ahk" { PIBIO_STORAGE_CLOSE_DATABASE_FN }
#Import ".\PIBIO_STORAGE_CREATE_DATABASE_FN.ahk" { PIBIO_STORAGE_CREATE_DATABASE_FN }
#Import ".\PIBIO_STORAGE_RESERVED_2_FN.ahk" { PIBIO_STORAGE_RESERVED_2_FN }
#Import ".\PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN.ahk" { PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN }
#Import ".\PIBIO_STORAGE_ATTACH_FN.ahk" { PIBIO_STORAGE_ATTACH_FN }
#Import ".\PIBIO_STORAGE_ACTIVATE_FN.ahk" { PIBIO_STORAGE_ACTIVATE_FN }

/**
 * Contains pointers to your custom storage adapter functions.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_STORAGE_INTERFACE {
    #StructPack 8

    /**
     * Version number of this structure.
     * 
     * <b>Windows 10:  </b>The version number must be <b>WINBIO_STORAGE_INTERFACE_VERSION_3</b>.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012 and Windows 8:  </b>The version number must be <b>WINBIO_STORAGE_INTERFACE_VERSION_2</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>The version number must be <b>WINBIO_STORAGE_INTERFACE_VERSION_1</b>.
     */
    Version : WINBIO_ADAPTER_INTERFACE_VERSION

    /**
     * The type of adapter. This must be <b>WINBIO_ADAPTER_TYPE_STORAGE</b>.
     */
    Type : UInt32

    /**
     * The size, in bytes, of this structure. Set this value to the size of the <b>WINBIO_STORAGE_INTERFACE</b> structure.
     */
    Size : IntPtr

    /**
     * A GUID that uniquely identifies the storage adapter. You must generate this value.
     */
    AdapterId : Guid

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_attach_fn">StorageAdapterAttach</a> function.
     */
    Attach : PIBIO_STORAGE_ATTACH_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_detach_fn">StorageAdapterDetach</a> function.
     */
    Detach : PIBIO_STORAGE_DETACH_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_clear_context_fn">StorageAdapterClearContext</a> function.
     */
    ClearContext : PIBIO_STORAGE_CLEAR_CONTEXT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_create_database_fn">StorageAdapterCreateDatabase</a> function.
     */
    CreateDatabase : PIBIO_STORAGE_CREATE_DATABASE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_erase_database_fn">StorageAdapterEraseDatabase</a> function.
     */
    EraseDatabase : PIBIO_STORAGE_ERASE_DATABASE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_open_database_fn">StorageAdapterOpenDatabase</a> function.
     */
    OpenDatabase : PIBIO_STORAGE_OPEN_DATABASE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_close_database_fn">StorageAdapterCloseDatabase</a> function.
     */
    CloseDatabase : PIBIO_STORAGE_CLOSE_DATABASE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_data_format_fn">StorageAdapterGetDataFormat</a> function.
     */
    GetDataFormat : PIBIO_STORAGE_GET_DATA_FORMAT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_database_size_fn">StorageAdapterGetDatabaseSize</a> function.
     */
    GetDatabaseSize : PIBIO_STORAGE_GET_DATABASE_SIZE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_add_record_fn">StorageAdapterAddRecord</a> function.
     */
    AddRecord : PIBIO_STORAGE_ADD_RECORD_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_delete_record_fn">StorageAdapterDeleteRecord</a> function.
     */
    DeleteRecord : PIBIO_STORAGE_DELETE_RECORD_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_subject_fn">StorageAdapterQueryBySubject</a> function.
     */
    QueryBySubject : PIBIO_STORAGE_QUERY_BY_SUBJECT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_content_fn">StorageAdapterQueryByContent</a> function.
     */
    QueryByContent : PIBIO_STORAGE_QUERY_BY_CONTENT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_record_count_fn">StorageAdapterGetRecordCount</a> function.
     */
    GetRecordCount : PIBIO_STORAGE_GET_RECORD_COUNT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_first_record_fn">StorageAdapterFirstRecord</a> function.
     */
    FirstRecord : PIBIO_STORAGE_FIRST_RECORD_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_next_record_fn">StorageAdapterNextRecord</a> function.
     */
    NextRecord : PIBIO_STORAGE_NEXT_RECORD_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_current_record_fn">StorageAdapterGetCurrentRecord</a> function.
     */
    GetCurrentRecord : PIBIO_STORAGE_GET_CURRENT_RECORD_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_control_unit_fn">StorageAdapterControlUnit</a> function.
     */
    ControlUnit : PIBIO_STORAGE_CONTROL_UNIT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_control_unit_privileged_fn">StorageAdapterControlUnitPrivileged</a> function.
     */
    ControlUnitPrivileged : PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_notify_power_change_fn">StorageAdapterNotifyPowerChange</a> function. This member is supported starting in Windows 8.
     */
    NotifyPowerChange : PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_pipeline_init_fn">StorageAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     */
    PipelineInit : PIBIO_STORAGE_PIPELINE_INIT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_pipeline_cleanup_fn">StorageAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     */
    PipelineCleanup : PIBIO_STORAGE_PIPELINE_CLEANUP_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_activate_fn">StorageAdapterActivate</a> function. This member is supported starting in Windows 10.
     */
    Activate : PIBIO_STORAGE_ACTIVATE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_deactivate_fn">StorageAdapterDeactivate</a> function. This member is supported starting in Windows 10.
     */
    Deactivate : PIBIO_STORAGE_DEACTIVATE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_extended_info_fn">StorageAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     */
    QueryExtendedInfo : PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN

    NotifyDatabaseChange : PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN

    Reserved1 : PIBIO_STORAGE_RESERVED_1_FN

    Reserved2 : PIBIO_STORAGE_RESERVED_2_FN

    UpdateRecordBegin : PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN

    UpdateRecordCommit : PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN

}
