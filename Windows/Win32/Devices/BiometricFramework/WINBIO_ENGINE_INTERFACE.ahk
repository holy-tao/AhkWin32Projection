#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN.ahk" { PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN }
#Import ".\PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN.ahk" { PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN }
#Import ".\PIBIO_ENGINE_ACTIVATE_FN.ahk" { PIBIO_ENGINE_ACTIVATE_FN }
#Import ".\PIBIO_ENGINE_ATTACH_FN.ahk" { PIBIO_ENGINE_ATTACH_FN }
#Import ".\PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN.ahk" { PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN }
#Import ".\PIBIO_ENGINE_CLEAR_CONTEXT_FN.ahk" { PIBIO_ENGINE_CLEAR_CONTEXT_FN }
#Import ".\PIBIO_ENGINE_COMMIT_ENROLLMENT_FN.ahk" { PIBIO_ENGINE_COMMIT_ENROLLMENT_FN }
#Import ".\PIBIO_ENGINE_CONTROL_UNIT_FN.ahk" { PIBIO_ENGINE_CONTROL_UNIT_FN }
#Import ".\PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN.ahk" { PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN }
#Import ".\PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN.ahk" { PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN }
#Import ".\PIBIO_ENGINE_CREATE_ENROLLMENT_FN.ahk" { PIBIO_ENGINE_CREATE_ENROLLMENT_FN }
#Import ".\PIBIO_ENGINE_CREATE_KEY_FN.ahk" { PIBIO_ENGINE_CREATE_KEY_FN }
#Import ".\PIBIO_ENGINE_DEACTIVATE_FN.ahk" { PIBIO_ENGINE_DEACTIVATE_FN }
#Import ".\PIBIO_ENGINE_DETACH_FN.ahk" { PIBIO_ENGINE_DETACH_FN }
#Import ".\PIBIO_ENGINE_DISCARD_ENROLLMENT_FN.ahk" { PIBIO_ENGINE_DISCARD_ENROLLMENT_FN }
#Import ".\PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN.ahk" { PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN }
#Import ".\PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN.ahk" { PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN }
#Import ".\PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN.ahk" { PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN }
#Import ".\PIBIO_ENGINE_IDENTIFY_ALL_FN.ahk" { PIBIO_ENGINE_IDENTIFY_ALL_FN }
#Import ".\PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN.ahk" { PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN }
#Import ".\PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN.ahk" { PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN }
#Import ".\PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN.ahk" { PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN }
#Import ".\PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN.ahk" { PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN }
#Import ".\PIBIO_ENGINE_PIPELINE_CLEANUP_FN.ahk" { PIBIO_ENGINE_PIPELINE_CLEANUP_FN }
#Import ".\PIBIO_ENGINE_PIPELINE_INIT_FN.ahk" { PIBIO_ENGINE_PIPELINE_INIT_FN }
#Import ".\PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN.ahk" { PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN }
#Import ".\PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN.ahk" { PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN }
#Import ".\PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN.ahk" { PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN }
#Import ".\PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN.ahk" { PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN }
#Import ".\PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN.ahk" { PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN }
#Import ".\PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN.ahk" { PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN }
#Import ".\PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN.ahk" { PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN }
#Import ".\PIBIO_ENGINE_REFRESH_CACHE_FN.ahk" { PIBIO_ENGINE_REFRESH_CACHE_FN }
#Import ".\PIBIO_ENGINE_RESERVED_1_FN.ahk" { PIBIO_ENGINE_RESERVED_1_FN }
#Import ".\PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN.ahk" { PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN }
#Import ".\PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN.ahk" { PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN }
#Import ".\PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN.ahk" { PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN }
#Import ".\PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN.ahk" { PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN }
#Import ".\PIBIO_ENGINE_SET_HASH_ALGORITHM_FN.ahk" { PIBIO_ENGINE_SET_HASH_ALGORITHM_FN }
#Import ".\PIBIO_ENGINE_UPDATE_ENROLLMENT_FN.ahk" { PIBIO_ENGINE_UPDATE_ENROLLMENT_FN }
#Import ".\PIBIO_ENGINE_VERIFY_FEATURE_SET_FN.ahk" { PIBIO_ENGINE_VERIFY_FEATURE_SET_FN }
#Import ".\WINBIO_ADAPTER_INTERFACE_VERSION.ahk" { WINBIO_ADAPTER_INTERFACE_VERSION }

/**
 * Contains pointers to your custom engine adapter functions.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_engine_interface
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_ENGINE_INTERFACE {
    #StructPack 8

    /**
     * Version number of this structure.
     * 
     * <b>Windows 10:  </b>The version number must be <b>WINBIO_ENGINE_INTERFACE_VERSION_3</b> or <b>WINBIO_ENGINE_INTERFACE_VERSION_4</b>. For more information on implementing <b>WINBIO_ENGINE_INTERFACE_VERSION_4</b>, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/sensor-requirements-for-secure-biometrics">Sensor requirements for secure biometrics</a>.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012 and Windows 8:  </b>The version number must be <b>WINBIO_ENGINE_INTERFACE_VERSION_2</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>The version number must be <b>WINBIO_ENGINE_INTERFACE_VERSION_1</b>.
     */
    Version : WINBIO_ADAPTER_INTERFACE_VERSION

    /**
     * The type of adapter. This must be <b>WINBIO_ADAPTER_TYPE_ENGINE</b>.
     */
    Type : UInt32

    /**
     * The size, in bytes, of this structure. Set this value to the size of the <b>WINBIO_ENGINE_INTERFACE</b> structure.
     */
    Size : IntPtr

    /**
     * A GUID that uniquely identifies the engine adapter. You must generate this value.
     */
    AdapterId : Guid

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_attach_fn">EngineAdapterAttach</a> function.
     */
    Attach : PIBIO_ENGINE_ATTACH_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_detach_fn">EngineAdapterDetach</a> function.
     */
    Detach : PIBIO_ENGINE_DETACH_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a> function.
     */
    ClearContext : PIBIO_ENGINE_CLEAR_CONTEXT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_preferred_format_fn">EngineAdapterQueryPreferredFormat</a> function.
     */
    QueryPreferredFormat : PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_index_vector_size_fn">EngineAdapterQueryIndexVectorSize</a> function.
     */
    QueryIndexVectorSize : PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_hash_algorithms_fn">EngineAdapterQueryHashAlgorithms</a> function.
     */
    QueryHashAlgorithms : PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn">EngineAdapterSetHashAlgorithm</a> function.
     */
    SetHashAlgorithm : PIBIO_ENGINE_SET_HASH_ALGORITHM_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_sample_hint_fn">EngineAdapterQuerySampleHint</a> function.
     */
    QuerySampleHint : PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a> function.
     */
    AcceptSampleData : PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_export_engine_data_fn">EngineAdapterExportEngineData</a> function.
     */
    ExportEngineData : PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_verify_feature_set_fn">EngineAdapterVerifyFeatureSet</a> function.
     */
    VerifyFeatureSet : PIBIO_ENGINE_VERIFY_FEATURE_SET_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_fn">EngineAdapterIdentifyFeatureSet</a> function.
     */
    IdentifyFeatureSet : PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_enrollment_fn">EngineAdapterCreateEnrollment</a> function.
     */
    CreateEnrollment : PIBIO_ENGINE_CREATE_ENROLLMENT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_update_enrollment_fn">EngineAdapterUpdateEnrollment</a> function.
     */
    UpdateEnrollment : PIBIO_ENGINE_UPDATE_ENROLLMENT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_status_fn">EngineAdapterGetEnrollmentStatus</a> function.
     */
    GetEnrollmentStatus : PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_hash_fn">EngineAdapterGetEnrollmentHash</a> function.
     */
    GetEnrollmentHash : PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_check_for_duplicate_fn">EngineAdapterCheckForDuplicate</a> function.
     */
    CheckForDuplicate : PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_commit_enrollment_fn">EngineAdapterCommitEnrollment</a> function.
     */
    CommitEnrollment : PIBIO_ENGINE_COMMIT_ENROLLMENT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_discard_enrollment_fn">EngineAdapterDiscardEnrollment</a> function.
     */
    DiscardEnrollment : PIBIO_ENGINE_DISCARD_ENROLLMENT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_control_unit_fn">EngineAdapterControlUnit</a> function.
     */
    ControlUnit : PIBIO_ENGINE_CONTROL_UNIT_FN

    /**
     * A pointer to your implementation of the  <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_control_unit_privileged_fn">EngineAdapterControlUnitPrivileged</a> function.
     */
    ControlUnitPrivileged : PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_notify_power_change_fn">EngineAdapterNotifyPowerChange</a> function. This member is supported starting in Windows 8.
     */
    NotifyPowerChange : PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN

    /**
     * This field is reserved and should be set to <b>NULL</b>.
     */
    Reserved_1 : PIBIO_ENGINE_RESERVED_1_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_pipeline_init_fn">EngineAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     */
    PipelineInit : PIBIO_ENGINE_PIPELINE_INIT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_pipeline_cleanup_fn">EngineAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     */
    PipelineCleanup : PIBIO_ENGINE_PIPELINE_CLEANUP_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_activate_fn">EngineAdapterActivate</a> function. This member is supported starting in Windows 10.
     */
    Activate : PIBIO_ENGINE_ACTIVATE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_deactivate_fn">EngineAdapterDeactivate</a> function.  This member is supported starting in Windows 10.
     */
    Deactivate : PIBIO_ENGINE_DEACTIVATE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_extended_info_fn">EngineAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     */
    QueryExtendedInfo : PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_all_fn">EngineAdapterIdentifyAll</a> function. This member is supported starting in Windows 10.
     */
    IdentifyAll : PIBIO_ENGINE_IDENTIFY_ALL_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_selector_fn">EngineAdapterSetEnrollmentSelector</a> function. This member is supported starting in Windows 10.
     */
    SetEnrollmentSelector : PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_parameters_fn">EngineAdapterSetEnrollmentParameters</a> function. This member is supported starting in Windows 10.
     */
    SetEnrollmentParameters : PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_extended_enrollment_status_fn">EngineAdapterQueryExtendedEnrollmentStatus</a> function. This member is supported starting in Windows 10.
     */
    QueryExtendedEnrollmentStatus : PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_refresh_cache_fn">EngineAdapterRefreshCache</a> function. This member is supported starting in Windows 10.
     */
    RefreshCache : PIBIO_ENGINE_REFRESH_CACHE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_select_calibration_format_fn">EngineAdapterSelectCalibrationFormat</a> function. This member is supported starting in Windows 10.
     */
    SelectCalibrationFormat : PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_calibration_data_fn">EngineAdapterQueryCalibrationData</a> function. This member is supported starting in Windows 10.
     */
    QueryCalibrationData : PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_account_policy_fn">EngineAdapterSetAccountPolicy</a> function. This member is supported starting in Windows 10.
     */
    SetAccountPolicy : PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn">EngineAdapterCreateKey</a> function. This member is supported starting in Windows 10, version 1607.
     */
    CreateKey : PIBIO_ENGINE_CREATE_KEY_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_secure_fn">EngineAdapterIdentifyFeatureSetSecure</a> function. This member is supported starting in Windows 10, version 1607.
     */
    IdentifyFeatureSetSecure : PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN

    AcceptPrivateSensorTypeInfo : PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN

    CreateEnrollmentAuthenticated : PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN

    IdentifyFeatureSetAuthenticated : PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN

}
