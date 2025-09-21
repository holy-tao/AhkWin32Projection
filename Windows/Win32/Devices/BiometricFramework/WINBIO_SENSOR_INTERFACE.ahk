#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_ADAPTER_INTERFACE_VERSION.ahk

/**
 * Contains pointers to your custom sensor adapter functions.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_sensor_interface
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_SENSOR_INTERFACE extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * Version number of this structure.
     * 
     * <b>Windows 10:  </b>The version number must be <b>WINBIO_SENSOR_INTERFACE_VERSION_3</b>.
     * 
     * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012 and Windows 8:  </b>The version number must be <b>WINBIO_SENSOR_INTERFACE_VERSION_2</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows 7:  </b>The version number must be <b>WINBIO_SENSOR_INTERFACE_VERSION_1</b>.
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
     * The type of adapter. This must be <b>WINBIO_ADAPTER_TYPE_SENSOR</b>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of this structure. Set this value to the size of the <b>WINBIO_SENSOR_INTERFACE</b> structure.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A GUID that uniquely identifies the sensor adapter. You must generate this value.
     * @type {Pointer<Guid>}
     */
    AdapterId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_attach_fn">SensorAdapterAttach</a> function.
     * @type {Pointer<PIBIO_SENSOR_ATTACH_FN>}
     */
    Attach {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_detach_fn">SensorAdapterDetach</a> function.
     * @type {Pointer<PIBIO_SENSOR_DETACH_FN>}
     */
    Detach {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_clear_context_fn">SensorAdapterClearContext</a> function.
     * @type {Pointer<PIBIO_SENSOR_CLEAR_CONTEXT_FN>}
     */
    ClearContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_status_fn">SensorAdapterQueryStatus</a> function.
     * @type {Pointer<PIBIO_SENSOR_QUERY_STATUS_FN>}
     */
    QueryStatus {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_reset_fn">SensorAdapterReset</a> function.
     * @type {Pointer<PIBIO_SENSOR_RESET_FN>}
     */
    Reset {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_mode_fn">SensorAdapterSetMode</a> function.
     * @type {Pointer<PIBIO_SENSOR_SET_MODE_FN>}
     */
    SetMode {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_indicator_status_fn">SensorAdapterSetIndicatorStatus</a> function.
     * @type {Pointer<PIBIO_SENSOR_SET_INDICATOR_STATUS_FN>}
     */
    SetIndicatorStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_get_indicator_status_fn">SensorAdapterGetIndicatorStatus</a> function.
     * @type {Pointer<PIBIO_SENSOR_GET_INDICATOR_STATUS_FN>}
     */
    GetIndicatorStatus {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_start_capture_fn">SensorAdapterStartCapture</a> function.
     * @type {Pointer<PIBIO_SENSOR_START_CAPTURE_FN>}
     */
    StartCapture {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_finish_capture_fn">SensorAdapterFinishCapture</a> function.
     * @type {Pointer<PIBIO_SENSOR_FINISH_CAPTURE_FN>}
     */
    FinishCapture {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_export_sensor_data_fn">SensorAdapterExportSensorData</a> function.
     * @type {Pointer<PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN>}
     */
    ExportSensorData {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_cancel_fn">SensorAdapterCancel</a> function.
     * @type {Pointer<PIBIO_SENSOR_CANCEL_FN>}
     */
    Cancel {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to your implementation of the   <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> function.
     * @type {Pointer<PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN>}
     */
    PushDataToEngine {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_fn">SensorAdapterControlUnit</a> function.
     * @type {Pointer<PIBIO_SENSOR_CONTROL_UNIT_FN>}
     */
    ControlUnit {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_privileged_fn">SensorAdapterControlUnitPrivileged</a>   function.
     * @type {Pointer<PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN>}
     */
    ControlUnitPrivileged {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_notify_power_change_fn">SensorAdapterNotifyPowerChange</a> function.  This member is supported starting in Windows 8.
     * @type {Pointer<PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN>}
     */
    NotifyPowerChange {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_pipeline_init_fn">SensorAdapterPipelineInit</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_PIPELINE_INIT_FN>}
     */
    PipelineInit {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_pipeline_cleanup_fn">SensorAdapterPipelineCleanup</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_PIPELINE_CLEANUP_FN>}
     */
    PipelineCleanup {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_activate_fn">SensorAdapterActivate</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_ACTIVATE_FN>}
     */
    Activate {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_deactivate_fn">SensorAdapterDeactivate</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_DEACTIVATE_FN>}
     */
    Deactivate {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_extended_info_fn">SensorAdapterQueryExtendedInfo</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN>}
     */
    QueryExtendedInfo {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_calibration_formats_fn">SensorAdapterQueryCalibrationFormats</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN>}
     */
    QueryCalibrationFormats {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_calibration_format_fn">SensorAdapterSetCalibrationFormat</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN>}
     */
    SetCalibrationFormat {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * A pointer to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_accept_calibration_data_fn">SensorAdapterAcceptCalibrationData</a> function. This member is supported starting in Windows 10.
     * @type {Pointer<PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN>}
     */
    AcceptCalibrationData {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN>}
     */
    AsyncImportRawBuffer {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN>}
     */
    AsyncImportSecureBuffer {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN>}
     */
    QueryPrivateSensorType {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_CONNECT_SECURE_FN>}
     */
    ConnectSecure {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_START_CAPTURE_EX_FN>}
     */
    StartCaptureEx {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_START_NOTIFY_WAKE_FN>}
     */
    StartNotifyWake {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * 
     * @type {Pointer<PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN>}
     */
    FinishNotifyWake {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }
}
