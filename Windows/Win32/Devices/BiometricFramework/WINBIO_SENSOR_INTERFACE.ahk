#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN.ahk" { PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN }
#Import ".\PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN.ahk" { PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN }
#Import ".\PIBIO_SENSOR_QUERY_STATUS_FN.ahk" { PIBIO_SENSOR_QUERY_STATUS_FN }
#Import ".\PIBIO_SENSOR_START_CAPTURE_FN.ahk" { PIBIO_SENSOR_START_CAPTURE_FN }
#Import ".\PIBIO_SENSOR_START_CAPTURE_EX_FN.ahk" { PIBIO_SENSOR_START_CAPTURE_EX_FN }
#Import ".\PIBIO_SENSOR_CANCEL_FN.ahk" { PIBIO_SENSOR_CANCEL_FN }
#Import ".\PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN.ahk" { PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_ADAPTER_INTERFACE_VERSION.ahk" { WINBIO_ADAPTER_INTERFACE_VERSION }
#Import ".\PIBIO_SENSOR_RESET_FN.ahk" { PIBIO_SENSOR_RESET_FN }
#Import ".\PIBIO_SENSOR_CONNECT_SECURE_FN.ahk" { PIBIO_SENSOR_CONNECT_SECURE_FN }
#Import ".\PIBIO_SENSOR_GET_INDICATOR_STATUS_FN.ahk" { PIBIO_SENSOR_GET_INDICATOR_STATUS_FN }
#Import ".\PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN.ahk" { PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN }
#Import ".\PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN.ahk" { PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN }
#Import ".\PIBIO_SENSOR_DEACTIVATE_FN.ahk" { PIBIO_SENSOR_DEACTIVATE_FN }
#Import ".\PIBIO_SENSOR_SET_MODE_FN.ahk" { PIBIO_SENSOR_SET_MODE_FN }
#Import ".\PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN.ahk" { PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN }
#Import ".\PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN.ahk" { PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN }
#Import ".\PIBIO_SENSOR_START_NOTIFY_WAKE_FN.ahk" { PIBIO_SENSOR_START_NOTIFY_WAKE_FN }
#Import ".\PIBIO_SENSOR_DETACH_FN.ahk" { PIBIO_SENSOR_DETACH_FN }
#Import ".\PIBIO_SENSOR_PIPELINE_INIT_FN.ahk" { PIBIO_SENSOR_PIPELINE_INIT_FN }
#Import ".\PIBIO_SENSOR_SET_INDICATOR_STATUS_FN.ahk" { PIBIO_SENSOR_SET_INDICATOR_STATUS_FN }
#Import ".\PIBIO_SENSOR_ATTACH_FN.ahk" { PIBIO_SENSOR_ATTACH_FN }
#Import ".\PIBIO_SENSOR_PIPELINE_CLEANUP_FN.ahk" { PIBIO_SENSOR_PIPELINE_CLEANUP_FN }
#Import ".\PIBIO_SENSOR_FINISH_CAPTURE_FN.ahk" { PIBIO_SENSOR_FINISH_CAPTURE_FN }
#Import ".\PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN.ahk" { PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN }
#Import ".\PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN.ahk" { PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN }
#Import ".\PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN.ahk" { PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN }
#Import ".\PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN.ahk" { PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN }
#Import ".\PIBIO_SENSOR_CONTROL_UNIT_FN.ahk" { PIBIO_SENSOR_CONTROL_UNIT_FN }
#Import ".\PIBIO_SENSOR_ACTIVATE_FN.ahk" { PIBIO_SENSOR_ACTIVATE_FN }
#Import ".\PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN.ahk" { PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN }
#Import ".\PIBIO_SENSOR_CLEAR_CONTEXT_FN.ahk" { PIBIO_SENSOR_CLEAR_CONTEXT_FN }

/**
 * Contains pointers to your custom sensor adapter functions.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_sensor_interface
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SENSOR_INTERFACE {
    #StructPack 8

    /**
     * Version number of this structure.
     * 
     * <b>Windows 10:  </b>The version number must be <b>WINBIO_SENSOR_INTERFACE_VERSION_3</b>.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012 and Windows 8:  </b>The version number must be <b>WINBIO_SENSOR_INTERFACE_VERSION_2</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>The version number must be <b>WINBIO_SENSOR_INTERFACE_VERSION_1</b>.
     */
    Version : WINBIO_ADAPTER_INTERFACE_VERSION

    /**
     * The type of adapter. This must be <b>WINBIO_ADAPTER_TYPE_SENSOR</b>.
     */
    Type : UInt32

    /**
     * The size, in bytes, of this structure. Set this value to the size of the <b>WINBIO_SENSOR_INTERFACE</b> structure.
     */
    Size : IntPtr

    /**
     * A GUID that uniquely identifies the sensor adapter. You must generate this value.
     */
    AdapterId : Guid

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_attach_fn">SensorAdapterAttach</a> function.
     */
    Attach : PIBIO_SENSOR_ATTACH_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_detach_fn">SensorAdapterDetach</a> function.
     */
    Detach : PIBIO_SENSOR_DETACH_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_clear_context_fn">SensorAdapterClearContext</a> function.
     */
    ClearContext : PIBIO_SENSOR_CLEAR_CONTEXT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_status_fn">SensorAdapterQueryStatus</a> function.
     */
    QueryStatus : PIBIO_SENSOR_QUERY_STATUS_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_reset_fn">SensorAdapterReset</a> function.
     */
    Reset : PIBIO_SENSOR_RESET_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_mode_fn">SensorAdapterSetMode</a> function.
     */
    SetMode : PIBIO_SENSOR_SET_MODE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_indicator_status_fn">SensorAdapterSetIndicatorStatus</a> function.
     */
    SetIndicatorStatus : PIBIO_SENSOR_SET_INDICATOR_STATUS_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_get_indicator_status_fn">SensorAdapterGetIndicatorStatus</a> function.
     */
    GetIndicatorStatus : PIBIO_SENSOR_GET_INDICATOR_STATUS_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_start_capture_fn">SensorAdapterStartCapture</a> function.
     */
    StartCapture : PIBIO_SENSOR_START_CAPTURE_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_finish_capture_fn">SensorAdapterFinishCapture</a> function.
     */
    FinishCapture : PIBIO_SENSOR_FINISH_CAPTURE_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_export_sensor_data_fn">SensorAdapterExportSensorData</a> function.
     */
    ExportSensorData : PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_cancel_fn">SensorAdapterCancel</a> function.
     */
    Cancel : PIBIO_SENSOR_CANCEL_FN

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> function.
     */
    PushDataToEngine : PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_fn">SensorAdapterControlUnit</a> function.
     */
    ControlUnit : PIBIO_SENSOR_CONTROL_UNIT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_privileged_fn">SensorAdapterControlUnitPrivileged</a>   function.
     */
    ControlUnitPrivileged : PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_notify_power_change_fn">SensorAdapterNotifyPowerChange</a> function.  This member is supported starting in Windows 8.
     */
    NotifyPowerChange : PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_pipeline_init_fn">SensorAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     */
    PipelineInit : PIBIO_SENSOR_PIPELINE_INIT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_pipeline_cleanup_fn">SensorAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     */
    PipelineCleanup : PIBIO_SENSOR_PIPELINE_CLEANUP_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_activate_fn">SensorAdapterActivate</a> function. This member is supported starting in Windows 10.
     */
    Activate : PIBIO_SENSOR_ACTIVATE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_deactivate_fn">SensorAdapterDeactivate</a> function. This member is supported starting in Windows 10.
     */
    Deactivate : PIBIO_SENSOR_DEACTIVATE_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_extended_info_fn">SensorAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     */
    QueryExtendedInfo : PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_calibration_formats_fn">SensorAdapterQueryCalibrationFormats</a> function. This member is supported starting in Windows 10.
     */
    QueryCalibrationFormats : PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_calibration_format_fn">SensorAdapterSetCalibrationFormat</a> function. This member is supported starting in Windows 10.
     */
    SetCalibrationFormat : PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_accept_calibration_data_fn">SensorAdapterAcceptCalibrationData</a> function. This member is supported starting in Windows 10.
     */
    AcceptCalibrationData : PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN

    AsyncImportRawBuffer : PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN

    AsyncImportSecureBuffer : PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN

    QueryPrivateSensorType : PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN

    ConnectSecure : PIBIO_SENSOR_CONNECT_SECURE_FN

    StartCaptureEx : PIBIO_SENSOR_START_CAPTURE_EX_FN

    StartNotifyWake : PIBIO_SENSOR_START_NOTIFY_WAKE_FN

    FinishNotifyWake : PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN

}
