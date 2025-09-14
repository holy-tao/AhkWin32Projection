#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_ADAPTER_INTERFACE_VERSION.ahk

/**
 * Contains pointers to your custom storage adapter functions.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_STORAGE_INTERFACE extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * Version number of this structure.
     * 
     * <b>Windows 10:  </b>The version number must be <b>WINBIO_STORAGE_INTERFACE_VERSION_3</b>.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012 and Windows 8:  </b>The version number must be <b>WINBIO_STORAGE_INTERFACE_VERSION_2</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>The version number must be <b>WINBIO_STORAGE_INTERFACE_VERSION_1</b>.
     * @type {WINBIO_ADAPTER_INTERFACE_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := WINBIO_ADAPTER_INTERFACE_VERSION(this.ptr + 0)
            return this.__Version
        }
    }

    /**
     * The type of adapter. This must be <b>WINBIO_ADAPTER_TYPE_STORAGE</b>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of this structure. Set this value to the size of the <b>WINBIO_STORAGE_INTERFACE</b> structure.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A GUID that uniquely identifies the storage adapter. You must generate this value.
     * @type {Pointer<Guid>}
     */
    AdapterId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_attach_fn">StorageAdapterAttach</a> function.
     * @type {Pointer<PIBIO_STORAGE_ATTACH_FN>}
     */
    Attach {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_detach_fn">StorageAdapterDetach</a> function.
     * @type {Pointer<PIBIO_STORAGE_DETACH_FN>}
     */
    Detach {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_clear_context_fn">StorageAdapterClearContext</a> function.
     * @type {Pointer<PIBIO_STORAGE_CLEAR_CONTEXT_FN>}
     */
    ClearContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_create_database_fn">StorageAdapterCreateDatabase</a> function.
     * @type {Pointer<PIBIO_STORAGE_CREATE_DATABASE_FN>}
     */
    CreateDatabase {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_erase_database_fn">StorageAdapterEraseDatabase</a> function.
     * @type {Pointer<PIBIO_STORAGE_ERASE_DATABASE_FN>}
     */
    EraseDatabase {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_open_database_fn">StorageAdapterOpenDatabase</a> function.
     * @type {Pointer<PIBIO_STORAGE_OPEN_DATABASE_FN>}
     */
    OpenDatabase {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_close_database_fn">StorageAdapterCloseDatabase</a> function.
     * @type {Pointer<PIBIO_STORAGE_CLOSE_DATABASE_FN>}
     */
    CloseDatabase {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_data_format_fn">StorageAdapterGetDataFormat</a> function.
     * @type {Pointer<PIBIO_STORAGE_GET_DATA_FORMAT_FN>}
     */
    GetDataFormat {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_database_size_fn">StorageAdapterGetDatabaseSize</a> function.
     * @type {Pointer<PIBIO_STORAGE_GET_DATABASE_SIZE_FN>}
     */
    GetDatabaseSize {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_add_record_fn">StorageAdapterAddRecord</a> function.
     * @type {Pointer<PIBIO_STORAGE_ADD_RECORD_FN>}
     */
    AddRecord {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_delete_record_fn">StorageAdapterDeleteRecord</a> function.
     * @type {Pointer<PIBIO_STORAGE_DELETE_RECORD_FN>}
     */
    DeleteRecord {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_subject_fn">StorageAdapterQueryBySubject</a> function.
     * @type {Pointer<PIBIO_STORAGE_QUERY_BY_SUBJECT_FN>}
     */
    QueryBySubject {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_content_fn">StorageAdapterQueryByContent</a> function.
     * @type {Pointer<PIBIO_STORAGE_QUERY_BY_CONTENT_FN>}
     */
    QueryByContent {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_record_count_fn">StorageAdapterGetRecordCount</a> function.
     * @type {Pointer<PIBIO_STORAGE_GET_RECORD_COUNT_FN>}
     */
    GetRecordCount {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_first_record_fn">StorageAdapterFirstRecord</a> function.
     * @type {Pointer<PIBIO_STORAGE_FIRST_RECORD_FN>}
     */
    FirstRecord {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_next_record_fn">StorageAdapterNextRecord</a> function.
     * @type {Pointer<PIBIO_STORAGE_NEXT_RECORD_FN>}
     */
    NextRecord {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_current_record_fn">StorageAdapterGetCurrentRecord</a> function.
     * @type {Pointer<PIBIO_STORAGE_GET_CURRENT_RECORD_FN>}
     */
    GetCurrentRecord {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_control_unit_fn">StorageAdapterControlUnit</a> function.
     * @type {Pointer<PIBIO_STORAGE_CONTROL_UNIT_FN>}
     */
    ControlUnit {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_control_unit_privileged_fn">StorageAdapterControlUnitPrivileged</a> function.
     * @type {Pointer<PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN>}
     */
    ControlUnitPrivileged {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_notify_power_change_fn">StorageAdapterNotifyPowerChange</a> function. This member is supported starting in Windows 8.
     * @type {Pointer<PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN>}
     */
    NotifyPowerChange {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_pipeline_init_fn">StorageAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_STORAGE_PIPELINE_INIT_FN>}
     */
    PipelineInit {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_pipeline_cleanup_fn">StorageAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_STORAGE_PIPELINE_CLEANUP_FN>}
     */
    PipelineCleanup {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_activate_fn">StorageAdapterActivate</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_STORAGE_ACTIVATE_FN>}
     */
    Activate {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_deactivate_fn">StorageAdapterDeactivate</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_STORAGE_DEACTIVATE_FN>}
     */
    Deactivate {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_extended_info_fn">StorageAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN>}
     */
    QueryExtendedInfo {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * 
     * @type {Pointer<PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN>}
     */
    NotifyDatabaseChange {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * 
     * @type {Pointer<PIBIO_STORAGE_RESERVED_1_FN>}
     */
    Reserved1 {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * 
     * @type {Pointer<PIBIO_STORAGE_RESERVED_2_FN>}
     */
    Reserved2 {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * 
     * @type {Pointer<PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN>}
     */
    UpdateRecordBegin {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * 
     * @type {Pointer<PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN>}
     */
    UpdateRecordCommit {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }
}
