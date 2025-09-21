#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_ADAPTER_INTERFACE_VERSION.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_FRAMEWORK_INTERFACE extends Win32Struct
{
    static sizeof => 376

    static packingSize => 8

    /**
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
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    AdapterId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN>}
     */
    SetUnitStatus {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_ATTACH_FN>}
     */
    VsmStorageAttach {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_DETACH_FN>}
     */
    VsmStorageDetach {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_CLEAR_CONTEXT_FN>}
     */
    VsmStorageClearContext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_CREATE_DATABASE_FN>}
     */
    VsmStorageCreateDatabase {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_OPEN_DATABASE_FN>}
     */
    VsmStorageOpenDatabase {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_CLOSE_DATABASE_FN>}
     */
    VsmStorageCloseDatabase {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_DELETE_RECORD_FN>}
     */
    VsmStorageDeleteRecord {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN>}
     */
    VsmStorageNotifyPowerChange {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_PIPELINE_INIT_FN>}
     */
    VsmStoragePipelineInit {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_PIPELINE_CLEANUP_FN>}
     */
    VsmStoragePipelineCleanup {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_ACTIVATE_FN>}
     */
    VsmStorageActivate {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_DEACTIVATE_FN>}
     */
    VsmStorageDeactivate {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN>}
     */
    VsmStorageQueryExtendedInfo {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN>}
     */
    VsmStorageCacheClear {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN>}
     */
    VsmStorageCacheImportBegin {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN>}
     */
    VsmStorageCacheImportNext {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN>}
     */
    VsmStorageCacheImportEnd {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN>}
     */
    VsmStorageCacheExportBegin {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN>}
     */
    VsmStorageCacheExportNext {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN>}
     */
    VsmStorageCacheExportEnd {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_ATTACH_FN>}
     */
    VsmSensorAttach {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_DETACH_FN>}
     */
    VsmSensorDetach {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_CLEAR_CONTEXT_FN>}
     */
    VsmSensorClearContext {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN>}
     */
    VsmSensorPushDataToEngine {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN>}
     */
    VsmSensorNotifyPowerChange {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_PIPELINE_INIT_FN>}
     */
    VsmSensorPipelineInit {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_PIPELINE_CLEANUP_FN>}
     */
    VsmSensorPipelineCleanup {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_ACTIVATE_FN>}
     */
    VsmSensorActivate {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_DEACTIVATE_FN>}
     */
    VsmSensorDeactivate {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN>}
     */
    VsmSensorAsyncImportRawBuffer {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN>}
     */
    VsmSensorAsyncImportSecureBuffer {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN>}
     */
    Reserved1 {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN>}
     */
    Reserved2 {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN>}
     */
    Reserved3 {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_RESERVED_1_FN>}
     */
    Reserved4 {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<PIBIO_STORAGE_RESERVED_2_FN>}
     */
    Reserved5 {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN>}
     */
    AllocateMemory {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_FREE_MEMORY_FN>}
     */
    FreeMemory {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_GET_PROPERTY_FN>}
     */
    GetProperty {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN>}
     */
    LockAndValidateSecureBuffer {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN>}
     */
    ReleaseSecureBuffer {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN>}
     */
    QueryAuthorizedEnrollments {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Pointer<PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN>}
     */
    DecryptSample {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }
}
