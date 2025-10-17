#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_ADAPTER_INTERFACE_VERSION.ahk

/**
 * Contains pointers to your custom engine adapter functions.
 * @see https://docs.microsoft.com/windows/win32/api//winbio_adapter/ns-winbio_adapter-winbio_engine_interface
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ENGINE_INTERFACE extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * Version number of this structure.
     * 
     * <b>Windows 10:  </b>The version number must be <b>WINBIO_ENGINE_INTERFACE_VERSION_3</b> or <b>WINBIO_ENGINE_INTERFACE_VERSION_4</b>. For more information on implementing <b>WINBIO_ENGINE_INTERFACE_VERSION_4</b>, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/sensor-requirements-for-secure-biometrics">Sensor requirements for secure biometrics</a>.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012 and Windows 8:  </b>The version number must be <b>WINBIO_ENGINE_INTERFACE_VERSION_2</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>The version number must be <b>WINBIO_ENGINE_INTERFACE_VERSION_1</b>.
     * @type {WINBIO_ADAPTER_INTERFACE_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := WINBIO_ADAPTER_INTERFACE_VERSION(0, this)
            return this.__Version
        }
    }

    /**
     * The type of adapter. This must be <b>WINBIO_ADAPTER_TYPE_ENGINE</b>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of this structure. Set this value to the size of the <b>WINBIO_ENGINE_INTERFACE</b> structure.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A GUID that uniquely identifies the engine adapter. You must generate this value.
     * @type {Pointer<Guid>}
     */
    AdapterId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_attach_fn">EngineAdapterAttach</a> function.
     * @type {Pointer<PIBIO_ENGINE_ATTACH_FN>}
     */
    Attach {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_detach_fn">EngineAdapterDetach</a> function.
     * @type {Pointer<PIBIO_ENGINE_DETACH_FN>}
     */
    Detach {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a> function.
     * @type {Pointer<PIBIO_ENGINE_CLEAR_CONTEXT_FN>}
     */
    ClearContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_preferred_format_fn">EngineAdapterQueryPreferredFormat</a> function.
     * @type {Pointer<PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN>}
     */
    QueryPreferredFormat {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_index_vector_size_fn">EngineAdapterQueryIndexVectorSize</a> function.
     * @type {Pointer<PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN>}
     */
    QueryIndexVectorSize {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_hash_algorithms_fn">EngineAdapterQueryHashAlgorithms</a> function.
     * @type {Pointer<PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN>}
     */
    QueryHashAlgorithms {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn">EngineAdapterSetHashAlgorithm</a> function.
     * @type {Pointer<PIBIO_ENGINE_SET_HASH_ALGORITHM_FN>}
     */
    SetHashAlgorithm {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_sample_hint_fn">EngineAdapterQuerySampleHint</a> function.
     * @type {Pointer<PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN>}
     */
    QuerySampleHint {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a> function.
     * @type {Pointer<PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN>}
     */
    AcceptSampleData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_export_engine_data_fn">EngineAdapterExportEngineData</a> function.
     * @type {Pointer<PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN>}
     */
    ExportEngineData {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_verify_feature_set_fn">EngineAdapterVerifyFeatureSet</a> function.
     * @type {Pointer<PIBIO_ENGINE_VERIFY_FEATURE_SET_FN>}
     */
    VerifyFeatureSet {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_fn">EngineAdapterIdentifyFeatureSet</a> function.
     * @type {Pointer<PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN>}
     */
    IdentifyFeatureSet {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_enrollment_fn">EngineAdapterCreateEnrollment</a> function.
     * @type {Pointer<PIBIO_ENGINE_CREATE_ENROLLMENT_FN>}
     */
    CreateEnrollment {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_update_enrollment_fn">EngineAdapterUpdateEnrollment</a> function.
     * @type {Pointer<PIBIO_ENGINE_UPDATE_ENROLLMENT_FN>}
     */
    UpdateEnrollment {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_status_fn">EngineAdapterGetEnrollmentStatus</a> function.
     * @type {Pointer<PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN>}
     */
    GetEnrollmentStatus {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_hash_fn">EngineAdapterGetEnrollmentHash</a> function.
     * @type {Pointer<PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN>}
     */
    GetEnrollmentHash {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_check_for_duplicate_fn">EngineAdapterCheckForDuplicate</a> function.
     * @type {Pointer<PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN>}
     */
    CheckForDuplicate {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_commit_enrollment_fn">EngineAdapterCommitEnrollment</a> function.
     * @type {Pointer<PIBIO_ENGINE_COMMIT_ENROLLMENT_FN>}
     */
    CommitEnrollment {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_discard_enrollment_fn">EngineAdapterDiscardEnrollment</a> function.
     * @type {Pointer<PIBIO_ENGINE_DISCARD_ENROLLMENT_FN>}
     */
    DiscardEnrollment {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_control_unit_fn">EngineAdapterControlUnit</a> function.
     * @type {Pointer<PIBIO_ENGINE_CONTROL_UNIT_FN>}
     */
    ControlUnit {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_control_unit_privileged_fn">EngineAdapterControlUnitPrivileged</a> function.
     * @type {Pointer<PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN>}
     */
    ControlUnitPrivileged {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_notify_power_change_fn">EngineAdapterNotifyPowerChange</a> function. This member is supported starting in Windows 8.
     * @type {Pointer<PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN>}
     */
    NotifyPowerChange {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * This field is reserved and should be set to <b>NULL</b>.
     * @type {Pointer<PIBIO_ENGINE_RESERVED_1_FN>}
     */
    Reserved_1 {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_pipeline_init_fn">EngineAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_PIPELINE_INIT_FN>}
     */
    PipelineInit {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_pipeline_cleanup_fn">EngineAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_PIPELINE_CLEANUP_FN>}
     */
    PipelineCleanup {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_activate_fn">EngineAdapterActivate</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_ACTIVATE_FN>}
     */
    Activate {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_deactivate_fn">EngineAdapterDeactivate</a> function.  This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_DEACTIVATE_FN>}
     */
    Deactivate {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_extended_info_fn">EngineAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN>}
     */
    QueryExtendedInfo {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_all_fn">EngineAdapterIdentifyAll</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_IDENTIFY_ALL_FN>}
     */
    IdentifyAll {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_selector_fn">EngineAdapterSetEnrollmentSelector</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN>}
     */
    SetEnrollmentSelector {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_parameters_fn">EngineAdapterSetEnrollmentParameters</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN>}
     */
    SetEnrollmentParameters {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_extended_enrollment_status_fn">EngineAdapterQueryExtendedEnrollmentStatus</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN>}
     */
    QueryExtendedEnrollmentStatus {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_refresh_cache_fn">EngineAdapterRefreshCache</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_REFRESH_CACHE_FN>}
     */
    RefreshCache {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_select_calibration_format_fn">EngineAdapterSelectCalibrationFormat</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN>}
     */
    SelectCalibrationFormat {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_calibration_data_fn">EngineAdapterQueryCalibrationData</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN>}
     */
    QueryCalibrationData {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_account_policy_fn">EngineAdapterSetAccountPolicy</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN>}
     */
    SetAccountPolicy {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn">EngineAdapterCreateKey</a> function. This member is supported starting in Windows 10, version 1607.
     * @type {Pointer<PIBIO_ENGINE_CREATE_KEY_FN>}
     */
    CreateKey {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_secure_fn">EngineAdapterIdentifyFeatureSetSecure</a> function. This member is supported starting in Windows 10, version 1607.
     * @type {Pointer<PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN>}
     */
    IdentifyFeatureSetSecure {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * 
     * @type {Pointer<PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN>}
     */
    AcceptPrivateSensorTypeInfo {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * 
     * @type {Pointer<PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN>}
     */
    CreateEnrollmentAuthenticated {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * 
     * @type {Pointer<PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN>}
     */
    IdentifyFeatureSetAuthenticated {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }
}
