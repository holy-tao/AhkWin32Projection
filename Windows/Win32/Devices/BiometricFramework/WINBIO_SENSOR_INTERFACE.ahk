#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_ADAPTER_INTERFACE_VERSION.ahk" { WINBIO_ADAPTER_INTERFACE_VERSION }

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
    Attach : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_detach_fn">SensorAdapterDetach</a> function.
     */
    Detach : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_clear_context_fn">SensorAdapterClearContext</a> function.
     */
    ClearContext : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_status_fn">SensorAdapterQueryStatus</a> function.
     */
    QueryStatus : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_reset_fn">SensorAdapterReset</a> function.
     */
    Reset : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_mode_fn">SensorAdapterSetMode</a> function.
     */
    SetMode : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_indicator_status_fn">SensorAdapterSetIndicatorStatus</a> function.
     */
    SetIndicatorStatus : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_get_indicator_status_fn">SensorAdapterGetIndicatorStatus</a> function.
     */
    GetIndicatorStatus : IntPtr

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_start_capture_fn">SensorAdapterStartCapture</a> function.
     */
    StartCapture : IntPtr

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_finish_capture_fn">SensorAdapterFinishCapture</a> function.
     */
    FinishCapture : IntPtr

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_export_sensor_data_fn">SensorAdapterExportSensorData</a> function.
     */
    ExportSensorData : IntPtr

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_cancel_fn">SensorAdapterCancel</a> function.
     */
    Cancel : IntPtr

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> function.
     */
    PushDataToEngine : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_fn">SensorAdapterControlUnit</a> function.
     */
    ControlUnit : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_privileged_fn">SensorAdapterControlUnitPrivileged</a>   function.
     */
    ControlUnitPrivileged : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_notify_power_change_fn">SensorAdapterNotifyPowerChange</a> function.  This member is supported starting in Windows 8.
     */
    NotifyPowerChange : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_pipeline_init_fn">SensorAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     */
    PipelineInit : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_pipeline_cleanup_fn">SensorAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     */
    PipelineCleanup : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_activate_fn">SensorAdapterActivate</a> function. This member is supported starting in Windows 10.
     */
    Activate : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_deactivate_fn">SensorAdapterDeactivate</a> function. This member is supported starting in Windows 10.
     */
    Deactivate : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_extended_info_fn">SensorAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     */
    QueryExtendedInfo : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_calibration_formats_fn">SensorAdapterQueryCalibrationFormats</a> function. This member is supported starting in Windows 10.
     */
    QueryCalibrationFormats : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_calibration_format_fn">SensorAdapterSetCalibrationFormat</a> function. This member is supported starting in Windows 10.
     */
    SetCalibrationFormat : IntPtr

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_accept_calibration_data_fn">SensorAdapterAcceptCalibrationData</a> function. This member is supported starting in Windows 10.
     */
    AcceptCalibrationData : IntPtr

    AsyncImportRawBuffer : IntPtr

    AsyncImportSecureBuffer : IntPtr

    QueryPrivateSensorType : IntPtr

    ConnectSecure : IntPtr

    StartCaptureEx : IntPtr

    StartNotifyWake : IntPtr

    FinishNotifyWake : IntPtr

}
