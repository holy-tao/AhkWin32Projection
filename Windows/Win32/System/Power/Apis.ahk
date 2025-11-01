#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HPOWERNOTIFY.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class Power {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_ACPI1C2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_ACPI1C3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_ACPI1TSTATES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_CST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_CSD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PCT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PSS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_XPSS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PPC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PSD => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PTC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_TSS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_TPC => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_TSD => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PCCH => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PCCP => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_OSC => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_PDC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_CPC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_FIRMWARE_LPI => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_PERFORMANCE_IMPLEMENTATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_PERFORMANCE_IMPLEMENTATION_PSTATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_PERFORMANCE_IMPLEMENTATION_PCCV1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_PERFORMANCE_IMPLEMENTATION_CPPC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_PERFORMANCE_IMPLEMENTATION_PEP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_IDLE_IMPLEMENTATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_IDLE_IMPLEMENTATION_CSTATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_IDLE_IMPLEMENTATION_PEP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_IDLE_IMPLEMENTATION_MICROPEP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PPM_IDLE_IMPLEMENTATION_LPISTATES => 4

    /**
     * @type {String}
     */
    static PPM_PERFSTATE_CHANGE_GUID => "{a5b32ddd-7f39-4abc-b892-900e43b59ebb}"

    /**
     * @type {String}
     */
    static PPM_PERFSTATE_DOMAIN_CHANGE_GUID => "{995e6b7f-d653-497a-b978-36a30c29bf01}"

    /**
     * @type {String}
     */
    static PPM_IDLESTATE_CHANGE_GUID => "{4838fe4f-f71c-4e51-9ecc-8430a7ac4c6c}"

    /**
     * @type {String}
     */
    static PPM_PERFSTATES_DATA_GUID => "{5708cc20-7d40-4bf4-b4aa-2b01338d0126}"

    /**
     * @type {String}
     */
    static PPM_IDLESTATES_DATA_GUID => "{ba138e10-e250-4ad7-8616-cf1a7ad410e7}"

    /**
     * @type {String}
     */
    static PPM_IDLE_ACCOUNTING_GUID => "{e2a26f78-ae07-4ee0-a30f-ce54f55a94cd}"

    /**
     * @type {String}
     */
    static PPM_IDLE_ACCOUNTING_EX_GUID => "{d67abd39-81f8-4a5e-8152-72e31ec912ee}"

    /**
     * @type {String}
     */
    static PPM_THERMALCONSTRAINT_GUID => "{a852c2c8-1a4c-423b-8c2c-f30d82931a88}"

    /**
     * @type {String}
     */
    static PPM_PERFMON_PERFSTATE_GUID => "{7fd18652-0cfe-40d2-b0a1-0b066a87759e}"

    /**
     * @type {String}
     */
    static PPM_THERMAL_POLICY_CHANGE_GUID => "{48f377b8-6880-4c7b-8bdc-380176c6654d}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_BATTERY => "{72631e54-78a4-11d0-bcf7-00aa00b7b32a}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_APPLICATIONLAUNCH_BUTTON => "{629758ee-986e-4d9e-8e47-de27f8ab054d}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_SYS_BUTTON => "{4afa3d53-74a7-11d0-be5e-00a0c9062857}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_LID => "{4afa3d52-74a7-11d0-be5e-00a0c9062857}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_THERMAL_ZONE => "{4afa3d51-74a7-11d0-be5e-00a0c9062857}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_FAN => "{05ecd13d-81da-4a2a-8a4c-524f23dd4dc9}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_PROCESSOR => "{97fadb10-4e33-40ae-359c-8bef029dbdd0}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_MEMORY => "{3fd0f03d-92e0-45fb-b75c-5ed8ffb01021}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_ACPI_TIME => "{97f99bf6-4497-4f18-bb22-4b9fb2fbef9c}"

    /**
     * @type {String}
     */
    static GUID_DEVICE_MESSAGE_INDICATOR => "{cd48a365-fa94-4ce2-a232-a1b764e5d8b4}"

    /**
     * @type {String}
     */
    static GUID_CLASS_INPUT => "{4d1e55b2-f16f-11cf-88cb-001111000030}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_THERMAL_COOLING => "{dbe4373d-3c81-40cb-ace4-e0e5d05f0c9f}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_THERMAL_MANAGER => "{927ec093-69a4-4bc0-bd02-711664714463}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_POWER_LIMIT => "{8f366301-091e-4056-b92f-958b27625fce}"

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_UNKNOWN_CAPACITY => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_CAPACITY => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_SYSTEM_BATTERY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_CAPACITY_RELATIVE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_IS_SHORT_TERM => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_SEALED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_SET_CHARGE_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_SET_DISCHARGE_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_SET_CHARGINGSOURCE_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_SET_CHARGER_ID_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_UNKNOWN_TIME => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_UNKNOWN_CURRENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_CURRENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_USB_CHARGER_STATUS_FN_DEFAULT_USB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_USB_CHARGER_STATUS_UCM_PD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_UNKNOWN_VOLTAGE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_UNKNOWN_RATE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_RATE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_VOLTAGE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_POWER_ON_LINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_DISCHARGING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_CHARGING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_CRITICAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_BATTERY_STRING_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BATTERY_QUERY_TAG => 2703424

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BATTERY_QUERY_INFORMATION => 2703428

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BATTERY_SET_INFORMATION => 2719816

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BATTERY_QUERY_STATUS => 2703436

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BATTERY_CHARGING_SOURCE_CHANGE => 2703440

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_TAG_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ACTIVE_COOLING_LEVELS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVE_COOLING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PASSIVE_COOLING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TZ_ACTIVATION_REASON_THERMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TZ_ACTIVATION_REASON_CURRENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static THERMAL_POLICY_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THERMAL_POLICY_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_THERMAL_QUERY_INFORMATION => 2703488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_THERMAL_SET_COOLING_POLICY => 2719876

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_RUN_ACTIVE_COOLING_METHOD => 2719880

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_THERMAL_SET_PASSIVE_LIMIT => 2719884

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_THERMAL_READ_TEMPERATURE => 2703504

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_THERMAL_READ_POLICY => 2703508

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_QUERY_LID => 2703552

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NOTIFY_SWITCH_EVENT => 2703616

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_SYS_BUTTON_CAPS => 2703680

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_SYS_BUTTON_EVENT => 2703684

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_POWER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_SLEEP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_LID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_WAKE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_LID_STATE_MASK => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_LID_OPEN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_LID_CLOSED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_LID_INITIAL => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SYS_BUTTON_LID_CHANGED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_PROCESSOR_OBJ_INFO => 2703744

    /**
     * @type {Integer (UInt32)}
     */
    static THERMAL_COOLING_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THERMAL_DEVICE_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_LIMIT_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SET_SYS_MESSAGE_INDICATOR => 2720192

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SET_WAKE_ALARM_VALUE => 2720256

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SET_WAKE_ALARM_POLICY => 2720260

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_WAKE_ALARM_VALUE => 2736648

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_WAKE_ALARM_POLICY => 2736652

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_TIME_ADJUST_DAYLIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_TIME_IN_DAYLIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_TIME_ZONE_UNKNOWN => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ACPI_GET_REAL_TIME => 2703888

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ACPI_SET_REAL_TIME => 2720276

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_WAKE_ALARM_SYSTEM_POWERSTATE => 2703896

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_ACPI_TIME_AND_ALARM_CAPABILITIES => 2703900

    /**
     * @type {String}
     */
    static BATTERY_STATUS_WMI_GUID => "{fc4670d1-ebbf-416e-87ce-374a4ebc111a}"

    /**
     * @type {String}
     */
    static BATTERY_RUNTIME_WMI_GUID => "{535a3767-1ac2-49bc-a077-3f7a02e40aec}"

    /**
     * @type {String}
     */
    static BATTERY_TEMPERATURE_WMI_GUID => "{1a52a14d-adce-4a44-9a3e-c8d8f15ff2c2}"

    /**
     * @type {String}
     */
    static BATTERY_FULL_CHARGED_CAPACITY_WMI_GUID => "{40b40565-96f7-4435-8694-97e0e4395905}"

    /**
     * @type {String}
     */
    static BATTERY_CYCLE_COUNT_WMI_GUID => "{ef98db24-0014-4c25-a50b-c724ae5cd371}"

    /**
     * @type {String}
     */
    static BATTERY_STATIC_DATA_WMI_GUID => "{05e1e463-e4e2-4ea9-80cb-9bd4b3ca0655}"

    /**
     * @type {String}
     */
    static BATTERY_STATUS_CHANGE_WMI_GUID => "{cddfa0c3-7c5b-4e43-a034-059fa5b84364}"

    /**
     * @type {String}
     */
    static BATTERY_TAG_CHANGE_WMI_GUID => "{5e1f6e19-8786-4d23-94fc-9e746bd5d888}"

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_MINIPORT_UPDATE_DATA_VER_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_MINIPORT_UPDATE_DATA_VER_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_CLASS_MAJOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_CLASS_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_CLASS_MINOR_VERSION_1 => 1

    /**
     * @type {String}
     */
    static GUID_DEVICE_ENERGY_METER => "{45bd8344-7ed6-49cf-a440-c276c933b053}"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_EMI_GET_VERSION => 2244608

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_EMI_GET_METADATA_SIZE => 2244612

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_EMI_GET_METADATA => 2244616

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_EMI_GET_MEASUREMENT => 2244620

    /**
     * @type {Integer (UInt32)}
     */
    static EMI_NAME_MAX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EMI_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMI_VERSION_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECTIVE_POWER_MODE_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECTIVE_POWER_MODE_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EnableSysTrayBatteryMeter => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EnableMultiBatteryDisplay => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EnablePasswordLogon => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EnableWakeOnRing => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EnableVideoDimDisplay => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ATTRIBUTE_HIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ATTRIBUTE_SHOW_AOAC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_HARDWAREID => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_AND_OPERATION => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_FILTER_DEVICES_PRESENT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_FILTER_HARDWARE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_FILTER_WAKEENABLED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_FILTER_WAKEPROGRAMMABLE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_FILTER_ON_NAME => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_SET_WAKEENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEPOWER_CLEAR_WAKEENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static THERMAL_EVENT_VERSION => 1
;@endregion Constants

;@region Methods
    /**
     * Sets or retrieves power information.
     * @param {Integer} InformationLevel The information level requested. This value indicates the specific power information to be set or 
     *       retrieved. This parameter must be one of the following 
     *       <b>POWER_INFORMATION_LEVEL</b> enumeration type values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AdministratorPowerPolicy"></a><a id="administratorpowerpolicy"></a><a id="ADMINISTRATORPOWERPOLICY"></a><dl>
     * <dt><b>AdministratorPowerPolicy</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This information level is not supported.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LastSleepTime"></a><a id="lastsleeptime"></a><a id="LASTSLEEPTIME"></a><dl>
     * <dt><b>LastSleepTime</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpInBuffer</i> parameter must be <b>NULL</b>; otherwise, the 
     *         function returns <b>ERROR_INVALID_PARAMETER</b>.
     *         
     * 
     * The <i>lpOutputBuffer</i> buffer receives a <b>ULONGLONG</b> that 
     *          specifies the interrupt-time count, in 100-nanosecond units, at the last system sleep time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LastWakeTime"></a><a id="lastwaketime"></a><a id="LASTWAKETIME"></a><dl>
     * <dt><b>LastWakeTime</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpInBuffer</i> parameter must be <b>NULL</b>; otherwise, the 
     *         function returns <b>ERROR_INVALID_PARAMETER</b>.
     *         
     * 
     * The <i>lpOutputBuffer</i> buffer receives a <b>ULONGLONG</b> that 
     *          specifies the interrupt-time count, in 100-nanosecond units, at the last system wake time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ProcessorInformation"></a><a id="processorinformation"></a><a id="PROCESSORINFORMATION"></a><dl>
     * <dt><b>ProcessorInformation</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpInBuffer</i> parameter must be <b>NULL</b>; otherwise the 
     *         function returns <b>ERROR_INVALID_PARAMETER</b>.
     *         
     * 
     * The <i>lpOutputBuffer</i> buffer receives one 
     *          <a href="https://docs.microsoft.com/windows/desktop/Power/processor-power-information-str">PROCESSOR_POWER_INFORMATION</a> 
     *          structure for each processor that is installed on the system. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsysteminfo">GetSystemInfo</a> function to retrieve the number of processors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ProcessorPowerPolicyAc"></a><a id="processorpowerpolicyac"></a><a id="PROCESSORPOWERPOLICYAC"></a><dl>
     * <dt><b>ProcessorPowerPolicyAc</b></dt>
     * <dt>18</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This information level is not supported.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ProcessorPowerPolicyCurrent"></a><a id="processorpowerpolicycurrent"></a><a id="PROCESSORPOWERPOLICYCURRENT"></a><dl>
     * <dt><b>ProcessorPowerPolicyCurrent</b></dt>
     * <dt>22</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This information level is not supported.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ProcessorPowerPolicyDc"></a><a id="processorpowerpolicydc"></a><a id="PROCESSORPOWERPOLICYDC"></a><dl>
     * <dt><b>ProcessorPowerPolicyDc</b></dt>
     * <dt>19</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This information level is not supported.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SystemBatteryState"></a><a id="systembatterystate"></a><a id="SYSTEMBATTERYSTATE"></a><dl>
     * <dt><b>SystemBatteryState</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpInBuffer</i> parameter must be <b>NULL</b>; otherwise, the 
     *         function returns <b>ERROR_INVALID_PARAMETER</b>.
     *         
     * 
     * The <i>lpOutputBuffer</i> buffer receives a 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_battery_state">SYSTEM_BATTERY_STATE</a> structure containing 
     *          information about the current system battery.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SystemExecutionState"></a><a id="systemexecutionstate"></a><a id="SYSTEMEXECUTIONSTATE"></a><dl>
     * <dt><b>SystemExecutionState</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpInBuffer</i> parameter must be <b>NULL</b>; otherwise the 
     *         function returns <b>ERROR_INVALID_PARAMETER</b>.
     *         
     * 
     * The <i>lpOutputBuffer</i> buffer receives a <b>ULONG</b> value
     * @param {Pointer} InputBuffer A pointer to an optional input buffer. The data type of this buffer depends on the information level 
     *       requested in the <i>InformationLevel</i> parameter.
     * @param {Integer} InputBufferLength The size of the input buffer, in bytes.
     * @param {Pointer} OutputBuffer A pointer to an optional output buffer. The data type of this buffer depends on the information level 
     *       requested in the <i>InformationLevel</i> parameter. If the buffer is too small to contain the 
     *       information, the function returns STATUS_BUFFER_TOO_SMALL.
     * @param {Integer} OutputBufferLength The size of the output buffer, in bytes. Depending on the information level requested, this may be a 
     *       variably sized buffer.
     * @returns {NTSTATUS} If the function succeeds, the return value is <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one the following status codes.
     * 
     * <table>
     * <tr>
     * <th>Status</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_BUFFER_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is of insufficient size to contain the data to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller had insufficient access rights to perform the requested action.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//powerbase/nf-powerbase-callntpowerinformation
     * @since windows5.1.2600
     */
    static CallNtPowerInformation(InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        result := DllCall("POWRPROF.dll\CallNtPowerInformation", "int", InformationLevel, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

    /**
     * Retrieves information about the system power capabilities.
     * @param {Pointer<SYSTEM_POWER_CAPABILITIES>} lpspc A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_capabilities">SYSTEM_POWER_CAPABILITIES</a> structure that receives the information.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powerbase/nf-powerbase-getpwrcapabilities
     * @since windows5.1.2600
     */
    static GetPwrCapabilities(lpspc) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\GetPwrCapabilities", "ptr", lpspc, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines the computer role for the specified platform.
     * @param {Integer} Version 
     * @returns {Integer} The return value is one of the values from the 
     *       specified version of the <a href="/windows/desktop/api/winnt/ne-winnt-power_platform_role">POWER_PLATFORM_ROLE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//powerbase/nf-powerbase-powerdetermineplatformroleex
     * @since windows8.0
     */
    static PowerDeterminePlatformRoleEx(Version) {
        result := DllCall("POWRPROF.dll\PowerDeterminePlatformRoleEx", "uint", Version, "int")
        return result
    }

    /**
     * Registers to receive notification when the system is suspended or resumed.
     * @param {Integer} Flags This parameter must be <b>DEVICE_NOTIFY_CALLBACK</b>.
     * @param {HANDLE} Recipient This parameter is a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/powrprof/ns-powrprof-device_notify_subscribe_parameters">DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS</a> structure. In this case, the callback function is <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nc-powrprof-device_notify_callback_routine">DeviceNotifyCallbackRoutine</a>. When the <b>Callback</b> function executes, the  <i>Type</i> parameter is set indicating the type of event that occurred. Possible values include <b>PBT_APMSUSPEND</b>, <b>PBT_APMRESUMESUSPEND</b>, and <b>PBT_APMRESUMEAUTOMATIC</b> - see  <a href="https://docs.microsoft.com/windows/desktop/Power/power-management-events">Power Management Events</a> for more info. The <i>Setting</i> parameter is not used with suspend/resume notifications.
     * @param {Pointer<Pointer<Void>>} RegistrationHandle A handle to the registration. Use this handle to unregister for notifications.
     * @returns {Integer} Returns ERROR_SUCCESS (zero) if the call was successful, and a nonzero value if the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powerbase/nf-powerbase-powerregistersuspendresumenotification
     * @since windows8.0
     */
    static PowerRegisterSuspendResumeNotification(Flags, Recipient, RegistrationHandle) {
        Recipient := Recipient is Win32Handle ? NumGet(Recipient, "ptr") : Recipient

        result := DllCall("POWRPROF.dll\PowerRegisterSuspendResumeNotification", "uint", Flags, "ptr", Recipient, "ptr*", RegistrationHandle, "uint")
        return result
    }

    /**
     * Cancels a registration to receive notification when the system is suspended or resumed.
     * @param {HPOWERNOTIFY} RegistrationHandle A handle to a registration obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/powerbase/nf-powerbase-powerregistersuspendresumenotification">PowerRegisterSuspendResumeNotification</a> function.
     * @returns {Integer} Returns ERROR_SUCCESS (zero) if the call was successful, and a nonzero value if the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powerbase/nf-powerbase-powerunregistersuspendresumenotification
     * @since windows8.0
     */
    static PowerUnregisterSuspendResumeNotification(RegistrationHandle) {
        RegistrationHandle := RegistrationHandle is Win32Handle ? NumGet(RegistrationHandle, "ptr") : RegistrationHandle

        result := DllCall("POWRPROF.dll\PowerUnregisterSuspendResumeNotification", "ptr", RegistrationHandle, "uint")
        return result
    }

    /**
     * Retrieves the AC power value for the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer<Integer>} Type A pointer to a variable that receives the type of data for the value. The 
     *      possible values are listed in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. 
     *      This parameter can be <b>NULL</b> and the type of data is not returned.
     * @param {Pointer} Buffer A pointer to a buffer that receives the data value. If this parameter is <b>NULL</b>, 
     *      the <i>BufferSize</i> 
     *      parameter receives the required buffer size.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the 
     *      <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the 
     *      requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     *       <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to 
     *       by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powerreadacvalue
     * @since windows6.0.6000
     */
    static PowerReadACValue(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadACValue", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", Type, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the DC power value for the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer<Integer>} Type A pointer to a variable that receives the type of data for the value. The 
     *      possible values are listed in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. 
     *      This parameter can be <b>NULL</b> and the type of data is not returned.
     * @param {Pointer} Buffer A pointer to a variable that receives the data value. If this parameter is <b>NULL</b>, 
     *      the <i>BufferSize</i> 
     *      parameter receives the required buffer size.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the 
     *      <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the 
     *      requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     *       <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to 
     *       by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powerreaddcvalue
     * @since windows6.0.6000
     */
    static PowerReadDCValue(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadDCValue", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", Type, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Sets the AC value index of the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} AcValueIndex The AC value index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powerwriteacvalueindex
     * @since windows6.0.6000
     */
    static PowerWriteACValueIndex(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcValueIndex) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteACValueIndex", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", AcValueIndex, "uint")
        return result
    }

    /**
     * Sets the DC index of the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} DcValueIndex The DC value index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     * 	      the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powerwritedcvalueindex
     * @since windows6.0.6000
     */
    static PowerWriteDCValueIndex(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcValueIndex) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteDCValueIndex", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", DcValueIndex, "uint")
        return result
    }

    /**
     * Retrieves the active power scheme and returns a GUID that identifies the scheme.
     * @param {HKEY} UserRootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Pointer<Guid>>} ActivePolicyGuid A pointer that receives a pointer to a <b>GUID</b> structure. 
     *       Use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free this memory.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powergetactivescheme
     * @since windows6.0.6000
     */
    static PowerGetActiveScheme(UserRootPowerKey, ActivePolicyGuid) {
        UserRootPowerKey := UserRootPowerKey is Win32Handle ? NumGet(UserRootPowerKey, "ptr") : UserRootPowerKey

        result := DllCall("POWRPROF.dll\PowerGetActiveScheme", "ptr", UserRootPowerKey, "ptr*", ActivePolicyGuid, "uint")
        return result
    }

    /**
     * Sets the active power scheme for the current user.
     * @param {HKEY} UserRootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powersetactivescheme
     * @since windows6.0.6000
     */
    static PowerSetActiveScheme(UserRootPowerKey, SchemeGuid) {
        UserRootPowerKey := UserRootPowerKey is Win32Handle ? NumGet(UserRootPowerKey, "ptr") : UserRootPowerKey

        result := DllCall("POWRPROF.dll\PowerSetActiveScheme", "ptr", UserRootPowerKey, "ptr", SchemeGuid, "uint")
        return result
    }

    /**
     * Registers to receive notification when a power setting changes.
     * @param {Pointer<Guid>} SettingGuid A GUID that represents the power setting.
     * @param {Integer} Flags 
     * @param {HANDLE} Recipient A handle to the recipient of the notifications.
     * @param {Pointer<Pointer<Void>>} RegistrationHandle A handle to the registration. Use this handle to unregister for notifications.
     * @returns {Integer} Returns ERROR_SUCCESS (zero) if the call was successful, and a nonzero value if the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powersettingregisternotification
     * @since windows6.1
     */
    static PowerSettingRegisterNotification(SettingGuid, Flags, Recipient, RegistrationHandle) {
        Recipient := Recipient is Win32Handle ? NumGet(Recipient, "ptr") : Recipient

        result := DllCall("POWRPROF.dll\PowerSettingRegisterNotification", "ptr", SettingGuid, "uint", Flags, "ptr", Recipient, "ptr*", RegistrationHandle, "uint")
        return result
    }

    /**
     * Cancels a registration to receive notification when a power setting changes.
     * @param {HPOWERNOTIFY} RegistrationHandle A handle to a registration obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/powersetting/nf-powersetting-powersettingregisternotification">PowerSettingRegisterNotification</a> function.
     * @returns {Integer} Returns ERROR_SUCCESS (zero) if the call was successful, and a nonzero value if the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powersettingunregisternotification
     * @since windows6.1
     */
    static PowerSettingUnregisterNotification(RegistrationHandle) {
        RegistrationHandle := RegistrationHandle is Win32Handle ? NumGet(RegistrationHandle, "ptr") : RegistrationHandle

        result := DllCall("POWRPROF.dll\PowerSettingUnregisterNotification", "ptr", RegistrationHandle, "uint")
        return result
    }

    /**
     * Registers a callback to receive effective power mode change notifications.
     * @param {Integer} Version Supplies the maximum effective power mode version the caller understands. If the effective power mode comes from a later version, it is reduced to a compatible version that is then passed to the callback. 
     * 
     * The following values can be passed in: 
     * - EFFECTIVE_POWER_MODE_V1 is available starting with Windows 10, version 1809 and tracks the performance power slider and battery saver states. 
     * - EFFECTIVE_POWER_MODE_V2 is available starting with Windows 10, version 1903 and tracks the performance power slider, battery saver, game mode and windows mixed reality power states.
     * @param {Pointer<EFFECTIVE_POWER_MODE_CALLBACK>} Callback A pointer to the callback to call when the effective power mode changes. This will also be called once upon registration to supply the current mode. If multiple callbacks are registered using this API, those callbacks can be called concurrently.
     * @param {Pointer<Void>} Context Caller-specified opaque context.
     * @param {Pointer<Pointer<Void>>} RegistrationHandle A handle to the registration. Use this handle to unregister for notifications.
     * @returns {HRESULT} Returns S_OK (zero) if the call was successful, and a nonzero value if the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powerregisterforeffectivepowermodenotifications
     * @since windows10.0.17763
     */
    static PowerRegisterForEffectivePowerModeNotifications(Version, Callback, Context, RegistrationHandle) {
        result := DllCall("POWRPROF.dll\PowerRegisterForEffectivePowerModeNotifications", "uint", Version, "ptr", Callback, "ptr", Context, "ptr*", RegistrationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters from effective power mode change notifications. This function is intended to be called from cleanup code and will wait for all callbacks to complete before unregistering.
     * @param {Pointer<Void>} RegistrationHandle The handle corresponding to a single power mode registration. This handle should have been saved by the caller after the call to <a href="../powersetting/nf-powersetting-powerregisterforeffectivepowermodenotifications.md">PowerRegisterForEffectivePowerModeNotifications</a> and passed in here.
     * @returns {HRESULT} Returns S_OK (zero) if the call was successful, and a nonzero value if the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powersetting/nf-powersetting-powerunregisterfromeffectivepowermodenotifications
     * @since windows10.0.17763
     */
    static PowerUnregisterFromEffectivePowerModeNotifications(RegistrationHandle) {
        result := DllCall("POWRPROF.dll\PowerUnregisterFromEffectivePowerModeNotifications", "ptr", RegistrationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the disk spindown range.
     * @param {Pointer<Integer>} puiMax The maximum disk spindown time, in seconds.
     * @param {Pointer<Integer>} puiMin The minimum disk spindown time, in seconds.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-getpwrdiskspindownrange
     * @since windows5.1.2600
     */
    static GetPwrDiskSpindownRange(puiMax, puiMin) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\GetPwrDiskSpindownRange", "uint*", puiMax, "uint*", puiMin, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all power schemes.
     * @param {Pointer<PWRSCHEMESENUMPROC>} lpfn A pointer to a callback function to be called for each power scheme enumerated. For more information, see Remarks.
     * @param {LPARAM} lParam A user-defined value to be passed to the callback function.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-enumpwrschemes
     * @since windows5.1.2600
     */
    static EnumPwrSchemes(lpfn, lParam) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\EnumPwrSchemes", "ptr", lpfn, "ptr", lParam, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current global power policy settings.
     * @param {Pointer<GLOBAL_POWER_POLICY>} pGlobalPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_power_policy">GLOBAL_POWER_POLICY</a> structure that receives the information.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-readglobalpwrpolicy
     * @since windows5.1.2600
     */
    static ReadGlobalPwrPolicy(pGlobalPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\ReadGlobalPwrPolicy", "ptr", pGlobalPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the power policy settings that are unique to the specified power scheme.
     * @param {Integer} uiID The index of the power scheme to be read.
     * @param {Pointer<POWER_POLICY>} pPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-power_policy">POWER_POLICY</a> structure that receives the power policy settings.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-readpwrscheme
     * @since windows5.1.2600
     */
    static ReadPwrScheme(uiID, pPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\ReadPwrScheme", "uint", uiID, "ptr", pPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes policy settings that are unique to the specified power scheme.
     * @param {Pointer<Integer>} puiID The index of the power scheme to be written. If a power scheme with the same index already exists, it is replaced. Otherwise, a new power scheme is created.
     * @param {PWSTR} lpszSchemeName The name of the power scheme.
     * @param {PWSTR} lpszDescription The description of the power scheme.
     * @param {Pointer<POWER_POLICY>} lpScheme A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-power_policy">POWER_POLICY</a> structure that contains the power policy settings to be written.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-writepwrscheme
     * @since windows5.1.2600
     */
    static WritePwrScheme(puiID, lpszSchemeName, lpszDescription, lpScheme) {
        lpszSchemeName := lpszSchemeName is String ? StrPtr(lpszSchemeName) : lpszSchemeName
        lpszDescription := lpszDescription is String ? StrPtr(lpszDescription) : lpszDescription

        A_LastError := 0

        result := DllCall("POWRPROF.dll\WritePwrScheme", "uint*", puiID, "ptr", lpszSchemeName, "ptr", lpszDescription, "ptr", lpScheme, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes global power policy settings.
     * @param {Pointer<GLOBAL_POWER_POLICY>} pGlobalPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_power_policy">GLOBAL_POWER_POLICY</a> structure that contains the power policy settings to be written.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-writeglobalpwrpolicy
     * @since windows5.1.2600
     */
    static WriteGlobalPwrPolicy(pGlobalPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\WriteGlobalPwrPolicy", "ptr", pGlobalPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified power scheme.
     * @param {Integer} uiID The index of the power scheme to be deleted.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-deletepwrscheme
     * @since windows5.1.2600
     */
    static DeletePwrScheme(uiID) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\DeletePwrScheme", "uint", uiID, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the index of the active power scheme.
     * @param {Pointer<Integer>} puiID A pointer to a variable that receives the index of the active power scheme.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-getactivepwrscheme
     * @since windows5.1.2600
     */
    static GetActivePwrScheme(puiID) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\GetActivePwrScheme", "uint*", puiID, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the active power scheme.
     * @param {Integer} uiID The index of the power scheme to be activated.
     * @param {Pointer<GLOBAL_POWER_POLICY>} pGlobalPowerPolicy A pointer to an optional 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_power_policy">GLOBAL_POWER_POLICY</a> structure, which provides global power policy settings to be merged with the power scheme when it becomes active.
     * @param {Pointer<POWER_POLICY>} pPowerPolicy A pointer to an optional 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-power_policy">POWER_POLICY</a> structure, which provides power policy settings to be merged with the power scheme when it becomes active.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-setactivepwrscheme
     * @since windows5.1.2600
     */
    static SetActivePwrScheme(uiID, pGlobalPowerPolicy, pPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\SetActivePwrScheme", "uint", uiID, "ptr", pGlobalPowerPolicy, "ptr", pPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the computer supports the sleep states.
     * @returns {BOOLEAN} If the computer supports the sleep states (S1, S2, and S3), the function returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-ispwrsuspendallowed
     * @since windows5.1.2600
     */
    static IsPwrSuspendAllowed() {
        result := DllCall("POWRPROF.dll\IsPwrSuspendAllowed", "char")
        return result
    }

    /**
     * Determines whether the computer supports hibernation.
     * @returns {BOOLEAN} If the computer supports hibernation (power state S4) and the file Hiberfil.sys is present on the system, the function returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-ispwrhibernateallowed
     * @since windows5.1.2600
     */
    static IsPwrHibernateAllowed() {
        result := DllCall("POWRPROF.dll\IsPwrHibernateAllowed", "char")
        return result
    }

    /**
     * Determines whether the computer supports the soft off power state.
     * @returns {BOOLEAN} If the computer supports soft off (power state S5), the function returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-ispwrshutdownallowed
     * @since windows5.1.2600
     */
    static IsPwrShutdownAllowed() {
        result := DllCall("POWRPROF.dll\IsPwrShutdownAllowed", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ADMINISTRATOR_POWER_POLICY>} papp 
     * @returns {BOOLEAN} 
     */
    static IsAdminOverrideActive(papp) {
        result := DllCall("POWRPROF.dll\IsAdminOverrideActive", "ptr", papp, "char")
        return result
    }

    /**
     * Suspends the system by shutting power down. Depending on the Hibernate parameter, the system either enters a suspend (sleep) state or hibernation (S4).
     * @param {BOOLEAN} bHibernate If this parameter is <b>TRUE</b>, the system hibernates. If the parameter is 
     *       <b>FALSE</b>, the system is suspended.
     * @param {BOOLEAN} bForce This parameter has no effect.
     * @param {BOOLEAN} bWakeupEventsDisabled If this parameter is <b>TRUE</b>, the system disables all wake events. If the parameter 
     *       is <b>FALSE</b>, any system wake events remain enabled.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-setsuspendstate
     * @since windows5.1.2600
     */
    static SetSuspendState(bHibernate, bForce, bWakeupEventsDisabled) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\SetSuspendState", "char", bHibernate, "char", bForce, "char", bWakeupEventsDisabled, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current system power policy settings.
     * @param {Pointer<GLOBAL_POWER_POLICY>} pGlobalPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_power_policy">GLOBAL_POWER_POLICY</a> structure that receives the current global power policy settings.
     * @param {Pointer<POWER_POLICY>} pPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-power_policy">POWER_POLICY</a> structure that receives the power policy settings that are unique to the active power scheme.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-getcurrentpowerpolicies
     * @since windows5.1.2600
     */
    static GetCurrentPowerPolicies(pGlobalPowerPolicy, pPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\GetCurrentPowerPolicies", "ptr", pGlobalPowerPolicy, "ptr", pPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the current user has sufficient privilege to write a power scheme.
     * @returns {BOOLEAN} If the current user has sufficient privilege to write a power scheme, the function returns <b>TRUE</b>.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current user does not have sufficient privilege to write a power scheme.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-canuserwritepwrscheme
     * @since windows5.1.2600
     */
    static CanUserWritePwrScheme() {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\CanUserWritePwrScheme", "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the processor power policy settings for the specified power scheme.
     * @param {Integer} uiID The index of the power scheme to be read.
     * @param {Pointer<MACHINE_PROCESSOR_POWER_POLICY>} pMachineProcessorPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-machine_processor_power_policy">MACHINE_PROCESSOR_POWER_POLICY</a> structure that receives the processor power policy settings.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-readprocessorpwrscheme
     * @since windows5.1.2600
     */
    static ReadProcessorPwrScheme(uiID, pMachineProcessorPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\ReadProcessorPwrScheme", "uint", uiID, "ptr", pMachineProcessorPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes processor power policy settings for the specified power scheme.
     * @param {Integer} uiID The index of the power scheme to be written.
     * @param {Pointer<MACHINE_PROCESSOR_POWER_POLICY>} pMachineProcessorPowerPolicy A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-machine_processor_power_policy">MACHINE_PROCESSOR_POWER_POLICY</a> structure that contains the power policy settings to be written.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-writeprocessorpwrscheme
     * @since windows5.1.2600
     */
    static WriteProcessorPwrScheme(uiID, pMachineProcessorPowerPolicy) {
        A_LastError := 0

        result := DllCall("POWRPROF.dll\WriteProcessorPwrScheme", "uint", uiID, "ptr", pMachineProcessorPowerPolicy, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<GLOBAL_POWER_POLICY>} pGlobalPowerPolicy 
     * @param {Pointer<POWER_POLICY>} pPowerPolicy 
     * @returns {BOOLEAN} 
     */
    static ValidatePowerPolicies(pGlobalPowerPolicy, pPowerPolicy) {
        result := DllCall("POWRPROF.dll\ValidatePowerPolicies", "ptr", pGlobalPowerPolicy, "ptr", pPowerPolicy, "char")
        return result
    }

    /**
     * Queries whether the specified power setting represents a range of possible values.
     * @param {Pointer<Guid>} SubKeyGuid The identifier of the subkey to search.
     * @param {Pointer<Guid>} SettingGuid The identifier of the power setting to query.
     * @returns {BOOLEAN} TRUE if the registry key specified by <i>SubKeyGuid</i> represents a single power setting. 
     * 
     * If the registry key specified by <i>SubKeyGuid</i>  represents a range, this function returns FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerissettingrangedefined
     * @since windows6.1
     */
    static PowerIsSettingRangeDefined(SubKeyGuid, SettingGuid) {
        result := DllCall("POWRPROF.dll\PowerIsSettingRangeDefined", "ptr", SubKeyGuid, "ptr", SettingGuid, "char")
        return result
    }

    /**
     * Queries for a group policy override for specified power settings and specifies the requested access for the setting.
     * @param {Integer} AccessFlags The type of access to check for group policy overrides.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_AC_POWER_SETTING_INDEX"></a><a id="access_ac_power_setting_index"></a><dl>
     * <dt><b>ACCESS_AC_POWER_SETTING_INDEX</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for overrides on AC power settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_DC_POWER_SETTING_INDEX"></a><a id="access_dc_power_setting_index"></a><dl>
     * <dt><b>ACCESS_DC_POWER_SETTING_INDEX</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for overrides on DC power settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_SCHEME"></a><a id="access_scheme"></a><dl>
     * <dt><b>ACCESS_SCHEME</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for restrictions on specific power schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_ACTIVE_SCHEME"></a><a id="access_active_scheme"></a><dl>
     * <dt><b>ACCESS_ACTIVE_SCHEME</b></dt>
     * <dt>19 (0x13)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for restrictions on active power schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_CREATE_SCHEME"></a><a id="access_create_scheme"></a><dl>
     * <dt><b>ACCESS_CREATE_SCHEME</b></dt>
     * <dt>20 (0x14)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for restrictions on creating or restoring power schemes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} PowerGuid The identifier of the power setting.
     * @param {Integer} AccessType The type of security access for the setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified power setting is not currently overridden by a group policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * <dt>1260 (0x4EC)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This program is blocked by group policy. For more information, contact your system administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSTALL_REMOTE_DISALLOWED</b></dt>
     * <dt>1640 (0x668)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only Administrators can remotely access power settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powersettingaccesscheckex
     * @since windows6.1
     */
    static PowerSettingAccessCheckEx(AccessFlags, PowerGuid, AccessType) {
        result := DllCall("POWRPROF.dll\PowerSettingAccessCheckEx", "int", AccessFlags, "ptr", PowerGuid, "uint", AccessType, "uint")
        return result
    }

    /**
     * Queries for a group policy override for specified power settings.
     * @param {Integer} AccessFlags The type of access to check for group policy overrides.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_AC_POWER_SETTING_INDEX"></a><a id="access_ac_power_setting_index"></a><dl>
     * <dt><b>ACCESS_AC_POWER_SETTING_INDEX</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for overrides on AC power settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_DC_POWER_SETTING_INDEX"></a><a id="access_dc_power_setting_index"></a><dl>
     * <dt><b>ACCESS_DC_POWER_SETTING_INDEX</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for overrides on DC power settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_SCHEME"></a><a id="access_scheme"></a><dl>
     * <dt><b>ACCESS_SCHEME</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for restrictions on specific power schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_ACTIVE_SCHEME"></a><a id="access_active_scheme"></a><dl>
     * <dt><b>ACCESS_ACTIVE_SCHEME</b></dt>
     * <dt>19 (0x13)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for restrictions on active power schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_CREATE_SCHEME"></a><a id="access_create_scheme"></a><dl>
     * <dt><b>ACCESS_CREATE_SCHEME</b></dt>
     * <dt>20 (0x14)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for restrictions on creating or restoring power schemes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} PowerGuid The identifier of the power setting.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified power setting is not currently overridden by a group policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * <dt>1260 (0x4EC)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This program is blocked by group policy. For more information, contact your system administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSTALL_REMOTE_DISALLOWED</b></dt>
     * <dt>1640 (0x668)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only Administrators can remotely access power settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powersettingaccesscheck
     * @since windows6.0.6000
     */
    static PowerSettingAccessCheck(AccessFlags, PowerGuid) {
        result := DllCall("POWRPROF.dll\PowerSettingAccessCheck", "int", AccessFlags, "ptr", PowerGuid, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} PowerModeGuid 
     * @returns {Integer} 
     */
    static PowerGetUserConfiguredACPowerMode(PowerModeGuid) {
        result := DllCall("POWRPROF.dll\PowerGetUserConfiguredACPowerMode", "ptr", PowerModeGuid, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} PowerModeGuid 
     * @returns {Integer} 
     */
    static PowerGetUserConfiguredDCPowerMode(PowerModeGuid) {
        result := DllCall("POWRPROF.dll\PowerGetUserConfiguredDCPowerMode", "ptr", PowerModeGuid, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} PowerModeGuid 
     * @returns {Integer} 
     */
    static PowerSetUserConfiguredACPowerMode(PowerModeGuid) {
        result := DllCall("POWRPROF.dll\PowerSetUserConfiguredACPowerMode", "ptr", PowerModeGuid, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} PowerModeGuid 
     * @returns {Integer} 
     */
    static PowerSetUserConfiguredDCPowerMode(PowerModeGuid) {
        result := DllCall("POWRPROF.dll\PowerSetUserConfiguredDCPowerMode", "ptr", PowerModeGuid, "uint")
        return result
    }

    /**
     * Retrieves the AC index of the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer<Integer>} AcValueIndex A pointer to a variable that receives the AC value index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadacvalueindex
     * @since windows6.0.6000
     */
    static PowerReadACValueIndex(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcValueIndex) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadACValueIndex", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", AcValueIndex, "uint")
        return result
    }

    /**
     * Retrieves the DC value index of the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid The identifier of the subgroup of power settings. Use <b>NO_SUBGROUP_GUID</b> to refer to the 
     *       default power scheme.
     * 
     * 
     * These values are the subgroup values included with Windows.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NO_SUBGROUP_GUID"></a><a id="no_subgroup_guid"></a><dl>
     * <dt><b>NO_SUBGROUP_GUID</b></dt>
     * <dt>fea3413e-7e05-4911-9a71-700331f1c294</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup are part of the default power scheme.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_DISK_SUBGROUP"></a><a id="guid_disk_subgroup"></a><dl>
     * <dt><b>GUID_DISK_SUBGROUP</b></dt>
     * <dt>0012ee47-9041-4b5d-9b77-535fba8b1442</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control power management configuration of the system's hard disk drives.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SYSTEM_BUTTON_SUBGROUP"></a><a id="guid_system_button_subgroup"></a><dl>
     * <dt><b>GUID_SYSTEM_BUTTON_SUBGROUP</b></dt>
     * <dt>4f971e89-eebd-4455-a8de-9e59040e7347</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of the system power buttons.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_PROCESSOR_SETTINGS_SUBGROUP"></a><a id="guid_processor_settings_subgroup"></a><dl>
     * <dt><b>GUID_PROCESSOR_SETTINGS_SUBGROUP</b></dt>
     * <dt>54533251-82be-4824-96c1-47b60b740d00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of processor power management features.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_VIDEO_SUBGROUP"></a><a id="guid_video_subgroup"></a><dl>
     * <dt><b>GUID_VIDEO_SUBGROUP</b></dt>
     * <dt>7516b95f-f776-4464-8c53-06167f40cc99</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of the video power management features.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_BATTERY_SUBGROUP"></a><a id="guid_battery_subgroup"></a><dl>
     * <dt><b>GUID_BATTERY_SUBGROUP</b></dt>
     * <dt>e73a048d-bf27-4f12-9731-8b2076e8891f</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control battery alarm trip points and actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SLEEP_SUBGROUP"></a><a id="guid_sleep_subgroup"></a><dl>
     * <dt><b>GUID_SLEEP_SUBGROUP</b></dt>
     * <dt>238C9FA8-0AAD-41ED-83F4-97BE242C8F20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control system sleep settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_PCIEXPRESS_SETTINGS_SUBGROUP"></a><a id="guid_pciexpress_settings_subgroup"></a><dl>
     * <dt><b>GUID_PCIEXPRESS_SETTINGS_SUBGROUP</b></dt>
     * <dt>501a4d13-42af-4429-9fd1-a8218c268e20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control PCI Express settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer<Integer>} DcValueIndex A pointer to a variable that receives the DC value index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreaddcvalueindex
     * @since windows6.0.6000
     */
    static PowerReadDCValueIndex(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcValueIndex) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadDCValueIndex", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", DcValueIndex, "uint")
        return result
    }

    /**
     * Retrieves the friendly name for the specified power setting, subgroup, or scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid The subgroup of power settings. Use <b>NO_SUBGROUP_GUID</b> to refer to the 
     *       default power scheme.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NO_SUBGROUP_GUID"></a><a id="no_subgroup_guid"></a><dl>
     * <dt><b>NO_SUBGROUP_GUID</b></dt>
     * <dt>fea3413e-7e05-4911-9a71-700331f1c294</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup are part of the default power scheme.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_DISK_SUBGROUP"></a><a id="guid_disk_subgroup"></a><dl>
     * <dt><b>GUID_DISK_SUBGROUP</b></dt>
     * <dt>0012ee47-9041-4b5d-9b77-535fba8b1442</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control power management configuration of the system's hard disk drives.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SYSTEM_BUTTON_SUBGROUP"></a><a id="guid_system_button_subgroup"></a><dl>
     * <dt><b>GUID_SYSTEM_BUTTON_SUBGROUP</b></dt>
     * <dt>4f971e89-eebd-4455-a8de-9e59040e7347</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of the system power buttons.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_PROCESSOR_SETTINGS_SUBGROUP"></a><a id="guid_processor_settings_subgroup"></a><dl>
     * <dt><b>GUID_PROCESSOR_SETTINGS_SUBGROUP</b></dt>
     * <dt>54533251-82be-4824-96c1-47b60b740d00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of processor power management features.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_VIDEO_SUBGROUP"></a><a id="guid_video_subgroup"></a><dl>
     * <dt><b>GUID_VIDEO_SUBGROUP</b></dt>
     * <dt>7516b95f-f776-4464-8c53-06167f40cc99</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of the video power management features.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_BATTERY_SUBGROUP"></a><a id="guid_battery_subgroup"></a><dl>
     * <dt><b>GUID_BATTERY_SUBGROUP</b></dt>
     * <dt>e73a048d-bf27-4f12-9731-8b2076e8891f</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control battery alarm trip points and actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SLEEP_SUBGROUP"></a><a id="guid_sleep_subgroup"></a><dl>
     * <dt><b>GUID_SLEEP_SUBGROUP</b></dt>
     * <dt>238C9FA8-0AAD-41ED-83F4-97BE242C8F20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control system sleep settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_PCIEXPRESS_SETTINGS_SUBGROUP"></a><a id="guid_pciexpress_settings_subgroup"></a><dl>
     * <dt><b>GUID_PCIEXPRESS_SETTINGS_SUBGROUP</b></dt>
     * <dt>501a4d13-42af-4429-9fd1-a8218c268e20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control PCI Express settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Pointer} Buffer A pointer to a buffer that receives the friendly name. If this parameter is <b>NULL</b>, 
     *      the <i>BufferSize</i> 
     *      parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the 
     *      <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the 
     *      requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *         the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     *         <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed 
     *         to by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadfriendlyname
     * @since windows6.0.6000
     */
    static PowerReadFriendlyName(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadFriendlyName", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the description for the specified power setting, subgroup, or scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Pointer} Buffer A pointer to a buffer that receives the description. If this parameter is <b>NULL</b>, 
     *      the <i>BufferSize</i> 
     *      parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the 
     *      <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the 
     *      requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     * 	      the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     * 	      the function returns 
     * 	      <b>ERROR_SUCCESS</b> and the <b>DWORD</b> pointed 
     *        to by the <i>BufferSize</i> parameter is filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreaddescription
     * @since windows6.0.6000
     */
    static PowerReadDescription(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadDescription", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the value for a possible value of a power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to 
     *      <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer<Integer>} Type A pointer to a variable that receives the type of data for the value. The 
     *      possible values are listed in <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. 
     *      This parameter can be <b>NULL</b> and the type of data is not returned.
     * @param {Integer} PossibleSettingIndex The zero-based index of the possible setting.
     * @param {Pointer} Buffer A pointer to a buffer that receives the value. If this parameter is <b>NULL</b>, the <i>BufferSize</i> parameter receives the required buffer size.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the  <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     *        
     * <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadpossiblevalue
     * @since windows6.0.6000
     */
    static PowerReadPossibleValue(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, PossibleSettingIndex, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadPossibleValue", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", Type, "uint", PossibleSettingIndex, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the friendly name for one of the possible choices of a power setting value.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} PossibleSettingIndex The zero-based index for the possible setting.
     * @param {Pointer} Buffer A pointer to a buffer that receives the friendly name. If this parameter is <b>NULL</b>, the <i>BufferSize</i> 
     * parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the 
     * <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the requested data, the function returns <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     * 	      
     * <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadpossiblefriendlyname
     * @since windows6.0.6000
     */
    static PowerReadPossibleFriendlyName(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadPossibleFriendlyName", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", PossibleSettingIndex, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the description for one of the possible choices of a power setting value.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Integer} PossibleSettingIndex The zero-based index for the possible setting.
     * @param {Pointer} Buffer A pointer to a buffer that receives the description. If this parameter is <b>NULL</b>, the <i>BufferSize</i>  parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     *        
     * <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadpossibledescription
     * @since windows6.0.6000
     */
    static PowerReadPossibleDescription(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadPossibleDescription", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", PossibleSettingIndex, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the minimum value for the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Pointer<Integer>} ValueMinimum A pointer to a variable that receives the minimum value for the specified power 
     *       setting.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     * 	     the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadvaluemin
     * @since windows6.0.6000
     */
    static PowerReadValueMin(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMinimum) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadValueMin", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", ValueMinimum, "uint")
        return result
    }

    /**
     * Retrieves the maximum value for the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Pointer<Integer>} ValueMaximum A pointer to a variable that receives the maximum for the specified power 
     *       setting.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *      the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadvaluemax
     * @since windows6.0.6000
     */
    static PowerReadValueMax(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMaximum) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadValueMax", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", ValueMaximum, "uint")
        return result
    }

    /**
     * Retrieves the increment for valid values between the power settings minimum and maximum.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Pointer<Integer>} ValueIncrement A pointer to a variable that receives the increment for the specified power setting.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *      the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadvalueincrement
     * @since windows6.0.6000
     */
    static PowerReadValueIncrement(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueIncrement) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadValueIncrement", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", ValueIncrement, "uint")
        return result
    }

    /**
     * Reads the string used to describe the units of a power setting that supports a range of values.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Pointer} Buffer A pointer to a buffer that receives the string. If this parameter is <b>NULL</b>, the <i>BufferSize</i> parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     * 		      
     * <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadvalueunitsspecifier
     * @since windows6.0.6000
     */
    static PowerReadValueUnitsSpecifier(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadValueUnitsSpecifier", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves the default AC index of the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemePersonalityGuid The identifier for the scheme personality for this power setting. A power setting can have different default 
     *       values depending on the power scheme personality.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier for the single power setting.
     * @param {Pointer<Integer>} AcDefaultIndex A pointer to a variable that receives the default AC index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *        the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadacdefaultindex
     * @since windows6.0.6000
     */
    static PowerReadACDefaultIndex(RootPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcDefaultIndex) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadACDefaultIndex", "ptr", RootPowerKey, "ptr", SchemePersonalityGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", AcDefaultIndex, "uint")
        return result
    }

    /**
     * Retrieves the default DC index of the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemePersonalityGuid The identifier of the scheme personality for this power setting. A power setting can have different default 
     *      values depending on the power scheme personality.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer<Integer>} DcDefaultIndex A pointer to a variable that receives the default DC index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *      the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreaddcdefaultindex
     * @since windows6.0.6000
     */
    static PowerReadDCDefaultIndex(RootPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcDefaultIndex) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadDCDefaultIndex", "ptr", RootPowerKey, "ptr", SchemePersonalityGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint*", DcDefaultIndex, "uint")
        return result
    }

    /**
     * Retrieves the icon resource for the specified power setting, subgroup, or scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer} Buffer A pointer to a buffer that receives the icon resource. If this parameter is <b>NULL</b>, 
     *      the <i>BufferSize</i> 
     *      parameter receives the required buffer size.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that contains the size of the buffer pointed to by the 
     *      <i>Buffer</i> parameter. 
     * 
     * If the <i>Buffer</i> parameter is <b>NULL</b>, the function returns ERROR_SUCCESS and the variable receives the required buffer size. 
     * 
     * If the specified buffer size is not large enough to hold the 
     *      requested data, the function returns  <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *        the call failed. If the buffer size specified by the <i>BufferSize</i> parameter is too small, 
     *        <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed 
     *        to by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadiconresourcespecifier
     * @since windows6.0.6000
     */
    static PowerReadIconResourceSpecifier(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerReadIconResourceSpecifier", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * Returns the current attribute of the specified power setting.
     * @param {Pointer<Guid>} SubGroupGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @returns {Integer} Returns the current power setting attributes of the specified power setting. The attribute is a combination 
     *      of the attributes of the power setting and the attributes of its subgroup.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>POWER_ATTRIBUTE_HIDE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hide this power setting.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreadsettingattributes
     * @since windows6.0.6000
     */
    static PowerReadSettingAttributes(SubGroupGuid, PowerSettingGuid) {
        result := DllCall("POWRPROF.dll\PowerReadSettingAttributes", "ptr", SubGroupGuid, "ptr", PowerSettingGuid, "uint")
        return result
    }

    /**
     * Sets the friendly name for the specified power setting, subgroup, or scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer} Buffer The friendly name, in wide (Unicode) characters.
     * @param {Integer} BufferSize The size of the friendly name specified by the <i>Buffer</i> parameter, including the terminating <b>NULL</b> character.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritefriendlyname
     * @since windows6.0.6000
     */
    static PowerWriteFriendlyName(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteFriendlyName", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the description for the specified power setting, subgroup, or scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer} Buffer The description, in wide (Unicode) characters.
     * @param {Integer} BufferSize The size of the buffer pointed to by the <i>Buffer</i> parameter.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *        the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritedescription
     * @since windows6.0.6000
     */
    static PowerWriteDescription(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteDescription", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the value for a possible value of a power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} Type The type of data for the value. The possible values are listed in 
     *       <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     * @param {Integer} PossibleSettingIndex The zero-based index for the possible setting.
     * @param {Pointer} Buffer The value for the possible setting.
     * @param {Integer} BufferSize The size of the buffer pointed to by the <i>Buffer</i> parameter.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *      the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritepossiblevalue
     * @since windows6.0.6000
     */
    static PowerWritePossibleValue(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, PossibleSettingIndex, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWritePossibleValue", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", Type, "uint", PossibleSettingIndex, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the friendly name for the specified possible setting of a power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} PossibleSettingIndex The zero-based index for the possible setting.
     * @param {Pointer} Buffer The friendly name, in wide (Unicode) characters.
     * @param {Integer} BufferSize The size of the buffer pointed to by the <i>Buffer</i> parameter.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritepossiblefriendlyname
     * @since windows6.0.6000
     */
    static PowerWritePossibleFriendlyName(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWritePossibleFriendlyName", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", PossibleSettingIndex, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the description for one of the possible choices of a power setting value.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being used.
     * @param {Integer} PossibleSettingIndex The zero-based index for the possible setting.
     * @param {Pointer} Buffer The description, in wide (Unicode) characters.
     * @param {Integer} BufferSize The size of the buffer pointed to by the <i>Buffer</i> parameter.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritepossibledescription
     * @since windows6.0.6000
     */
    static PowerWritePossibleDescription(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWritePossibleDescription", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", PossibleSettingIndex, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the minimum value for the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} ValueMinimum The minimum value to be set.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *        the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritevaluemin
     * @since windows6.0.6000
     */
    static PowerWriteValueMin(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMinimum) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteValueMin", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", ValueMinimum, "uint")
        return result
    }

    /**
     * Sets the maximum value for the specified power setting.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} ValueMaximum The maximum value to be set.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritevaluemax
     * @since windows6.0.6000
     */
    static PowerWriteValueMax(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMaximum) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteValueMax", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", ValueMaximum, "uint")
        return result
    }

    /**
     * Sets the increment for valid values between the power settings minimum and maximum.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} ValueIncrement The increment to be set.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     * 	     the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritevalueincrement
     * @since windows6.0.6000
     */
    static PowerWriteValueIncrement(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueIncrement) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteValueIncrement", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", ValueIncrement, "uint")
        return result
    }

    /**
     * Writes the string used to describe the units of a power setting that supports a range of values.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer} Buffer The units specifier, in wide (Unicode) characters.
     * @param {Integer} BufferSize The size of the buffer pointed to by the <i>Buffer</i> parameter.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritevalueunitsspecifier
     * @since windows6.0.6000
     */
    static PowerWriteValueUnitsSpecifier(RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteValueUnitsSpecifier", "ptr", RootPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the default AC index of the specified power setting.
     * @param {HKEY} RootSystemPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemePersonalityGuid The identifier of the scheme personality for this power setting. A power setting can have different default 
     *      values depending on the power scheme personality.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} DefaultAcIndex The default AC index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwriteacdefaultindex
     * @since windows6.0.6000
     */
    static PowerWriteACDefaultIndex(RootSystemPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DefaultAcIndex) {
        RootSystemPowerKey := RootSystemPowerKey is Win32Handle ? NumGet(RootSystemPowerKey, "ptr") : RootSystemPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteACDefaultIndex", "ptr", RootSystemPowerKey, "ptr", SchemePersonalityGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", DefaultAcIndex, "uint")
        return result
    }

    /**
     * Sets the default DC index of the specified power setting.
     * @param {HKEY} RootSystemPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemePersonalityGuid The identifier of the scheme personality for this power setting. A power setting can have different default 
     * 	     values depending on the power scheme personality.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} DefaultDcIndex The default DC index.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritedcdefaultindex
     * @since windows6.0.6000
     */
    static PowerWriteDCDefaultIndex(RootSystemPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DefaultDcIndex) {
        RootSystemPowerKey := RootSystemPowerKey is Win32Handle ? NumGet(RootSystemPowerKey, "ptr") : RootSystemPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteDCDefaultIndex", "ptr", RootSystemPowerKey, "ptr", SchemePersonalityGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", DefaultDcIndex, "uint")
        return result
    }

    /**
     * Sets the icon resource for the specified power setting, subgroup, or scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Pointer} Buffer The icon resource.
     * @param {Integer} BufferSize The size of the buffer pointed to by the <i>Buffer</i> parameter.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwriteiconresourcespecifier
     * @since windows6.0.6000
     */
    static PowerWriteIconResourceSpecifier(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerWriteIconResourceSpecifier", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Sets the power attributes of a power key.
     * @param {Pointer<Guid>} SubGroupGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting.
     * @param {Integer} Attributes The attributes to be associated with the specified power setting.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POWER_ATTRIBUTE_HIDE"></a><a id="power_attribute_hide"></a><dl>
     * <dt><b>POWER_ATTRIBUTE_HIDE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hide this power setting.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *      the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerwritesettingattributes
     * @since windows6.0.6000
     */
    static PowerWriteSettingAttributes(SubGroupGuid, PowerSettingGuid, Attributes) {
        result := DllCall("POWRPROF.dll\PowerWriteSettingAttributes", "ptr", SubGroupGuid, "ptr", PowerSettingGuid, "uint", Attributes, "uint")
        return result
    }

    /**
     * Duplicates an existing power scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SourceSchemeGuid The identifier of the power scheme that is to be duplicated.
     * @param {Pointer<Pointer<Guid>>} DestinationSchemeGuid The address of a pointer to a <b>GUID</b>. If the pointer contains 
     *       <b>NULL</b>, the function allocates memory for a new 
     *       <b>GUID</b> and puts the address of this memory in the pointer. The caller can free this 
     *       memory using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_SUCCESS</b></b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The power scheme was successfully duplicated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_INVALID_PARAMETER</b></b></dt>
     * <dt>87 (0x57)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_ALREADY_EXISTS</b></b></dt>
     * <dt>183 (0xB7)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestinationSchemeGuid</i> parameter refers to an existing power scheme. 
     *         <a href="/windows/desktop/api/powrprof/nf-powrprof-powerdeletescheme">PowerDeleteScheme</a> can be used to delete this 
     *         scheme.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerduplicatescheme
     * @since windows6.0.6000
     */
    static PowerDuplicateScheme(RootPowerKey, SourceSchemeGuid, DestinationSchemeGuid) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerDuplicateScheme", "ptr", RootPowerKey, "ptr", SourceSchemeGuid, "ptr*", DestinationSchemeGuid, "uint")
        return result
    }

    /**
     * Imports a power scheme from a file.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {PWSTR} ImportFileNamePath The path to a power scheme backup file created by <b>PowerCfg.Exe /Export</b>.
     * @param {Pointer<Pointer<Guid>>} DestinationSchemeGuid A pointer to a pointer to a <b>GUID</b>. If the pointer contains 
     *       <b>NULL</b>, the function allocates memory for a new 
     *       <b>GUID</b> and puts the address of this memory in the pointer. The caller can free this 
     *       memory using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerimportpowerscheme
     * @since windows6.0.6000
     */
    static PowerImportPowerScheme(RootPowerKey, ImportFileNamePath, DestinationSchemeGuid) {
        ImportFileNamePath := ImportFileNamePath is String ? StrPtr(ImportFileNamePath) : ImportFileNamePath
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerImportPowerScheme", "ptr", RootPowerKey, "ptr", ImportFileNamePath, "ptr*", DestinationSchemeGuid, "uint")
        return result
    }

    /**
     * Deletes the specified power scheme from the database.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerdeletescheme
     * @since windows6.0.6000
     */
    static PowerDeleteScheme(RootPowerKey, SchemeGuid) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerDeleteScheme", "ptr", RootPowerKey, "ptr", SchemeGuid, "uint")
        return result
    }

    /**
     * Deletes the specified power setting.
     * @param {Pointer<Guid>} PowerSettingSubKeyGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting to be deleted.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     * 	     the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerremovepowersetting
     * @since windows6.0.6000
     */
    static PowerRemovePowerSetting(PowerSettingSubKeyGuid, PowerSettingGuid) {
        result := DllCall("POWRPROF.dll\PowerRemovePowerSetting", "ptr", PowerSettingSubKeyGuid, "ptr", PowerSettingGuid, "uint")
        return result
    }

    /**
     * Creates a setting value for a specified power setting.
     * @param {HKEY} RootSystemPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being created.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powercreatesetting
     * @since windows6.0.6000
     */
    static PowerCreateSetting(RootSystemPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid) {
        RootSystemPowerKey := RootSystemPowerKey is Win32Handle ? NumGet(RootSystemPowerKey, "ptr") : RootSystemPowerKey

        result := DllCall("POWRPROF.dll\PowerCreateSetting", "ptr", RootSystemPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint")
        return result
    }

    /**
     * Creates a possible setting value for a specified power setting.
     * @param {HKEY} RootSystemPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid 
     * @param {Pointer<Guid>} PowerSettingGuid The identifier of the power setting that is being created.
     * @param {Integer} PossibleSettingIndex The zero-based index for the possible setting being created.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powercreatepossiblesetting
     * @since windows6.0.6000
     */
    static PowerCreatePossibleSetting(RootSystemPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex) {
        RootSystemPowerKey := RootSystemPowerKey is Win32Handle ? NumGet(RootSystemPowerKey, "ptr") : RootSystemPowerKey

        result := DllCall("POWRPROF.dll\PowerCreatePossibleSetting", "ptr", RootSystemPowerKey, "ptr", SubGroupOfPowerSettingsGuid, "ptr", PowerSettingGuid, "uint", PossibleSettingIndex, "uint")
        return result
    }

    /**
     * Enumerates the specified elements in a power scheme.
     * @param {HKEY} RootPowerKey This parameter is reserved for future use and must be set to <b>NULL</b>.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme. If this parameter is <b>NULL</b>, 
     *       an enumeration of the power policies is returned.
     * @param {Pointer<Guid>} SubGroupOfPowerSettingsGuid The subgroup of power settings.  If this parameter is <b>NULL</b>, an 
     *       enumeration of settings under the <b>PolicyGuid</b> key is returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NO_SUBGROUP_GUID"></a><a id="no_subgroup_guid"></a><dl>
     * <dt><b>NO_SUBGROUP_GUID</b></dt>
     * <dt>fea3413e-7e05-4911-9a71-700331f1c294</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup will be part of the default power scheme.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_DISK_SUBGROUP"></a><a id="guid_disk_subgroup"></a><dl>
     * <dt><b>GUID_DISK_SUBGROUP</b></dt>
     * <dt>0012ee47-9041-4b5d-9b77-535fba8b1442</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control power management configuration of the system's hard disk drives.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SYSTEM_BUTTON_SUBGROUP"></a><a id="guid_system_button_subgroup"></a><dl>
     * <dt><b>GUID_SYSTEM_BUTTON_SUBGROUP</b></dt>
     * <dt>4f971e89-eebd-4455-a8de-9e59040e7347</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of the system power buttons.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_PROCESSOR_SETTINGS_SUBGROUP"></a><a id="guid_processor_settings_subgroup"></a><dl>
     * <dt><b>GUID_PROCESSOR_SETTINGS_SUBGROUP</b></dt>
     * <dt>54533251-82be-4824-96c1-47b60b740d00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of processor power management features.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_VIDEO_SUBGROUP"></a><a id="guid_video_subgroup"></a><dl>
     * <dt><b>GUID_VIDEO_SUBGROUP</b></dt>
     * <dt>7516b95f-f776-4464-8c53-06167f40cc99</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control configuration of the video power management features.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_BATTERY_SUBGROUP"></a><a id="guid_battery_subgroup"></a><dl>
     * <dt><b>GUID_BATTERY_SUBGROUP</b></dt>
     * <dt>e73a048d-bf27-4f12-9731-8b2076e8891f</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control battery alarm trip points and actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SLEEP_SUBGROUP"></a><a id="guid_sleep_subgroup"></a><dl>
     * <dt><b>GUID_SLEEP_SUBGROUP</b></dt>
     * <dt>238C9FA8-0AAD-41ED-83F4-97BE242C8F20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control system sleep settings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_PCIEXPRESS_SETTINGS_SUBGROUP"></a><a id="guid_pciexpress_settings_subgroup"></a><dl>
     * <dt><b>GUID_PCIEXPRESS_SETTINGS_SUBGROUP</b></dt>
     * <dt>501a4d13-42af-4429-9fd1-a8218c268e20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Settings in this subgroup control PCI Express settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} AccessFlags A set of flags that specifies what will be enumerated
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_SCHEME"></a><a id="access_scheme"></a><dl>
     * <dt><b>ACCESS_SCHEME</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate power schemes. The <i>SchemeGuid</i> and 
     *         <i>SubgroupOfPowerSettingsGuid</i> parameters will be ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_SUBGROUP"></a><a id="access_subgroup"></a><dl>
     * <dt><b>ACCESS_SUBGROUP</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate subgroups under <i>SchemeGuid</i>. The 
     *         <i>SubgroupOfPowerSettingsGuid</i> parameter will be ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACCESS_INDIVIDUAL_SETTING"></a><a id="access_individual_setting"></a><dl>
     * <dt><b>ACCESS_INDIVIDUAL_SETTING</b></dt>
     * <dt>18</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate individual power settings under 
     *         <i>SchemeGuid</i>&#92;<i>SubgroupOfPowerSettingsGuid</i>. To enumerate power 
     *         settings directly under the <i>SchemeGuid</i> key, use 
     *         <b>NO_SUBGROUP_GUID</b> as the <i>SubgroupOfPowerSettingsGuid</i> 
     *         parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Index The zero-based index of the scheme, subgroup, or setting that is being enumerated.
     * @param {Pointer} Buffer A pointer to a variable to receive the elements. If this parameter is <b>NULL</b>, the function retrieves the size of the buffer required.
     * @param {Pointer<Integer>} BufferSize A pointer to a variable that on input contains the size of the buffer pointed to by 
     *       the <i>Buffer</i> parameter. If the  <i>Buffer</i> parameter is 
     *       <b>NULL</b> or if the <i>BufferSize</i> is not large enough, the function 
     *       will return <b>ERROR_MORE_DATA</b> and the variable receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed. If the buffer size passed in the <i>BufferSize</i> parameter is too small, 
     *       or if the <i>Buffer</i> parameter is <b>NULL</b>, 
     *       <b>ERROR_MORE_DATA</b> will be returned and the <b>DWORD</b> pointed to 
     *       by the <i>BufferSize</i> parameter will be filled in with the required buffer size.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerenumerate
     * @since windows6.0.6000
     */
    static PowerEnumerate(RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, AccessFlags, Index, Buffer, BufferSize) {
        RootPowerKey := RootPowerKey is Win32Handle ? NumGet(RootPowerKey, "ptr") : RootPowerKey

        result := DllCall("POWRPROF.dll\PowerEnumerate", "ptr", RootPowerKey, "ptr", SchemeGuid, "ptr", SubGroupOfPowerSettingsGuid, "int", AccessFlags, "uint", Index, "ptr", Buffer, "uint*", BufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HKEY>} phUserPowerKey 
     * @param {Integer} Access 
     * @param {BOOL} OpenExisting 
     * @returns {Integer} 
     */
    static PowerOpenUserPowerKey(phUserPowerKey, Access, OpenExisting) {
        result := DllCall("POWRPROF.dll\PowerOpenUserPowerKey", "ptr", phUserPowerKey, "uint", Access, "int", OpenExisting, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HKEY>} phSystemPowerKey 
     * @param {Integer} Access 
     * @param {BOOL} OpenExisting 
     * @returns {Integer} 
     */
    static PowerOpenSystemPowerKey(phSystemPowerKey, Access, OpenExisting) {
        result := DllCall("POWRPROF.dll\PowerOpenSystemPowerKey", "ptr", phSystemPowerKey, "uint", Access, "int", OpenExisting, "uint")
        return result
    }

    /**
     * Determines if the current user has access to the data for the specified power scheme so that it could be restored if necessary.
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powercanrestoreindividualdefaultpowerscheme
     * @since windows6.0.6000
     */
    static PowerCanRestoreIndividualDefaultPowerScheme(SchemeGuid) {
        result := DllCall("POWRPROF.dll\PowerCanRestoreIndividualDefaultPowerScheme", "ptr", SchemeGuid, "uint")
        return result
    }

    /**
     * Replaces a specific power scheme for the current user with one from the default user (stored in HKEY_USERS\.Default).
     * @param {Pointer<Guid>} SchemeGuid The identifier of the power scheme.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     * 	     the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerrestoreindividualdefaultpowerscheme
     * @since windows6.0.6000
     */
    static PowerRestoreIndividualDefaultPowerScheme(SchemeGuid) {
        result := DllCall("POWRPROF.dll\PowerRestoreIndividualDefaultPowerScheme", "ptr", SchemeGuid, "uint")
        return result
    }

    /**
     * Replaces the power schemes for the system with default power schemes. All current power schemes and settings are deleted and replaced with the default system power schemes.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerrestoredefaultpowerschemes
     * @since windows6.0.6000
     */
    static PowerRestoreDefaultPowerSchemes() {
        result := DllCall("POWRPROF.dll\PowerRestoreDefaultPowerSchemes", "uint")
        return result
    }

    /**
     * Replaces the default power schemes with the current user's power schemes.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreplacedefaultpowerschemes
     * @since windows6.0.6000
     */
    static PowerReplaceDefaultPowerSchemes() {
        result := DllCall("POWRPROF.dll\PowerReplaceDefaultPowerSchemes", "uint")
        return result
    }

    /**
     * Determines the computer role for Windows 7, Windows Server 2008 R2, Windows Vista or Windows Server 2008.
     * @returns {Integer} The return value is one of the values from the 
     *       <a href="/windows/desktop/api/winnt/ne-winnt-power_platform_role">POWER_PLATFORM_ROLE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerdetermineplatformrole
     * @since windows6.0.6000
     */
    static PowerDeterminePlatformRole() {
        result := DllCall("POWRPROF.dll\PowerDeterminePlatformRole", "int")
        return result
    }

    /**
     * Enumerates devices on the system that meet the specified criteria.
     * @param {Integer} QueryIndex The index of the requested device. For initial calls, this value should be zero.
     * @param {Integer} QueryInterpretationFlags The criteria applied to the search results.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_HARDWAREID"></a><a id="devicepower_hardwareid"></a><dl>
     * <dt><b>DEVICEPOWER_HARDWAREID</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return a hardware ID string rather than friendly device name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_FILTER_DEVICES_PRESENT"></a><a id="devicepower_filter_devices_present"></a><dl>
     * <dt><b>DEVICEPOWER_FILTER_DEVICES_PRESENT</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore devices not currently present in the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_AND_OPERATION"></a><a id="devicepower_and_operation"></a><dl>
     * <dt><b>DEVICEPOWER_AND_OPERATION</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Perform an AND operation on <i>QueryFlags</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_FILTER_WAKEENABLED"></a><a id="devicepower_filter_wakeenabled"></a><dl>
     * <dt><b>DEVICEPOWER_FILTER_WAKEENABLED</b></dt>
     * <dt>0x08000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check whether the device is currently enabled to wake the system from a sleep state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_FILTER_ON_NAME"></a><a id="devicepower_filter_on_name"></a><dl>
     * <dt><b>DEVICEPOWER_FILTER_ON_NAME</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Find a device whose name matches the string passed in <i>pReturnBuffer</i> and check 
     *         its capabilities against <i>QueryFlags</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} QueryFlags The query criteria.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_D0_SUPPORTED"></a><a id="pdcap_d0_supported"></a><dl>
     * <dt><b>PDCAP_D0_SUPPORTED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system power state D0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_D1_SUPPORTED"></a><a id="pdcap_d1_supported"></a><dl>
     * <dt><b>PDCAP_D1_SUPPORTED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system power state D1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_D2_SUPPORTED"></a><a id="pdcap_d2_supported"></a><dl>
     * <dt><b>PDCAP_D2_SUPPORTED</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system power state D2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_D3_SUPPORTED"></a><a id="pdcap_d3_supported"></a><dl>
     * <dt><b>PDCAP_D3_SUPPORTED</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system power state D3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_S0_SUPPORTED"></a><a id="pdcap_s0_supported"></a><dl>
     * <dt><b>PDCAP_S0_SUPPORTED</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system sleep state S0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_S1_SUPPORTED"></a><a id="pdcap_s1_supported"></a><dl>
     * <dt><b>PDCAP_S1_SUPPORTED</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system sleep state S1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_S2_SUPPORTED"></a><a id="pdcap_s2_supported"></a><dl>
     * <dt><b>PDCAP_S2_SUPPORTED</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system sleep state S2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_S3_SUPPORTED"></a><a id="pdcap_s3_supported"></a><dl>
     * <dt><b>PDCAP_S3_SUPPORTED</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system sleep state S3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_S4_SUPPORTED"></a><a id="pdcap_s4_supported"></a><dl>
     * <dt><b>PDCAP_S4_SUPPORTED</b></dt>
     * <dt>0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system sleep state S4.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_S5_SUPPORTED"></a><a id="pdcap_s5_supported"></a><dl>
     * <dt><b>PDCAP_S5_SUPPORTED</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports system sleep state S5.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_D0_SUPPORTED"></a><a id="pdcap_wake_from_d0_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_D0_SUPPORTED</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system power state D0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_D1_SUPPORTED"></a><a id="pdcap_wake_from_d1_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_D1_SUPPORTED</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system power state D1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_D2_SUPPORTED"></a><a id="pdcap_wake_from_d2_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_D2_SUPPORTED</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system power state D2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_D3_SUPPORTED"></a><a id="pdcap_wake_from_d3_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_D3_SUPPORTED</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system power state D3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_S0_SUPPORTED"></a><a id="pdcap_wake_from_s0_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_S0_SUPPORTED</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system sleep state S0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_S1_SUPPORTED"></a><a id="pdcap_wake_from_s1_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_S1_SUPPORTED</b></dt>
     * <dt>0x00200000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system sleep state S1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_S2_SUPPORTED"></a><a id="pdcap_wake_from_s2_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_S2_SUPPORTED</b></dt>
     * <dt>0x00400000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system sleep state S2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WAKE_FROM_S3_SUPPORTED"></a><a id="pdcap_wake_from_s3_supported"></a><dl>
     * <dt><b>PDCAP_WAKE_FROM_S3_SUPPORTED</b></dt>
     * <dt>0x00800000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports waking from system sleep state S3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDCAP_WARM_EJECT_SUPPORTED"></a><a id="pdcap_warm_eject_supported"></a><dl>
     * <dt><b>PDCAP_WARM_EJECT_SUPPORTED</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports warm eject.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pReturnBuffer Pointer to a buffer that receives the requested information.
     * @param {Pointer<Integer>} pBufferSize The size, in bytes, of the return buffer.
     *       
     * 
     * <div class="alert"><b>Note</b>  If <i>pReturnBuffer</i> is <b>NULL</b>, 
     *        <i>pBufferSize</i> will be filled with the size needed to return the data.</div>
     * <div> </div>
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-devicepowerenumdevices
     * @since windows6.0.6000
     */
    static DevicePowerEnumDevices(QueryIndex, QueryInterpretationFlags, QueryFlags, pReturnBuffer, pBufferSize) {
        result := DllCall("POWRPROF.dll\DevicePowerEnumDevices", "uint", QueryIndex, "uint", QueryInterpretationFlags, "uint", QueryFlags, "ptr", pReturnBuffer, "uint*", pBufferSize, "char")
        return result
    }

    /**
     * Modifies the specified data on the specified device.
     * @param {PWSTR} DeviceDescription The name or hardware identifier string of the device to be modified.
     * @param {Integer} SetFlags The properties of the device that are to be modified.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_SET_WAKEENABLED"></a><a id="devicepower_set_wakeenabled"></a><dl>
     * <dt><b>DEVICEPOWER_SET_WAKEENABLED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the specified device to wake the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICEPOWER_CLEAR_WAKEENABLED"></a><a id="devicepower_clear_wakeenabled"></a><dl>
     * <dt><b>DEVICEPOWER_CLEAR_WAKEENABLED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stops the specified device from being able to wake the system.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} SetData Reserved, must be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * 	      <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-devicepowersetdevicestate
     * @since windows6.0.6000
     */
    static DevicePowerSetDeviceState(DeviceDescription, SetFlags, SetData) {
        DeviceDescription := DeviceDescription is String ? StrPtr(DeviceDescription) : DeviceDescription

        A_LastError := 0

        result := DllCall("POWRPROF.dll\DevicePowerSetDeviceState", "ptr", DeviceDescription, "uint", SetFlags, "ptr", SetData, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a device list by querying all the devices.
     * @param {Integer} DebugMask Reserved; must be 0.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-devicepoweropen
     * @since windows6.0.6000
     */
    static DevicePowerOpen(DebugMask) {
        result := DllCall("POWRPROF.dll\DevicePowerOpen", "uint", DebugMask, "char")
        return result
    }

    /**
     * Frees all nodes in the device list and destroys the device list.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 
     *        zero.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-devicepowerclose
     * @since windows6.0.6000
     */
    static DevicePowerClose() {
        result := DllCall("POWRPROF.dll\DevicePowerClose", "char")
        return result
    }

    /**
     * Notifies the operating system of thermal events.
     * @param {Pointer<THERMAL_EVENT>} Event The thermal event structure, <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-thermal_event">THERMAL_EVENT</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (zero) if the call was successful, and a nonzero value if 
     *       the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//powrprof/nf-powrprof-powerreportthermalevent
     * @since windows8.1
     */
    static PowerReportThermalEvent(Event) {
        result := DllCall("POWRPROF.dll\PowerReportThermalEvent", "ptr", Event, "uint")
        return result
    }

    /**
     * Registers the application to receive power setting notifications for the specific power setting event.
     * @param {HANDLE} hRecipient Handle indicating where the power setting notifications are to be sent. For interactive applications, the 
     *      <i>Flags</i> parameter should be zero, and the <i>hRecipient</i> parameter 
     *      should be a window handle. For services, the <i>Flags</i> parameter should be one, and the 
     *      <i>hRecipient</i> parameter should be a <b>SERVICE_STATUS_HANDLE</b> 
     *      as returned from 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a>.
     * @param {Pointer<Guid>} PowerSettingGuid The <b>GUID</b> of the power setting for which notifications are to be sent. For more information see <a href="https://docs.microsoft.com/windows/desktop/Power/registering-for-power-events">Registering for Power 
     *       Events</a>.
     * @param {Integer} Flags <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_NOTIFY_WINDOW_HANDLE"></a><a id="device_notify_window_handle"></a><dl>
     * <dt><b>DEVICE_NOTIFY_WINDOW_HANDLE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifications are sent using <a href="https://docs.microsoft.com/windows/desktop/Power/wm-powerbroadcast">WM_POWERBROADCAST</a> 
     *        messages with a <i>wParam</i> parameter of 
     *        <a href="https://docs.microsoft.com/windows/desktop/Power/pbt-powersettingchange">PBT_POWERSETTINGCHANGE</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DEVICE_NOTIFY_SERVICE_HANDLE"></a><a id="device_notify_service_handle"></a><dl>
     * <dt><b>DEVICE_NOTIFY_SERVICE_HANDLE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifications are sent to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> callback 
     *        function with a <i>dwControl</i> parameter of 
     *        <b>SERVICE_CONTROL_POWEREVENT</b> and a <i>dwEventType</i> of 
     *        <a href="https://docs.microsoft.com/windows/desktop/Power/pbt-powersettingchange">PBT_POWERSETTINGCHANGE</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HPOWERNOTIFY} Returns a notification handle for unregistering for power notifications. If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registerpowersettingnotification
     * @since windows6.0.6000
     */
    static RegisterPowerSettingNotification(hRecipient, PowerSettingGuid, Flags) {
        hRecipient := hRecipient is Win32Handle ? NumGet(hRecipient, "ptr") : hRecipient

        A_LastError := 0

        result := DllCall("USER32.dll\RegisterPowerSettingNotification", "ptr", hRecipient, "ptr", PowerSettingGuid, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return HPOWERNOTIFY({Value: result}, True)
    }

    /**
     * Unregisters the power setting notification.
     * @param {HPOWERNOTIFY} Handle The handle returned from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerpowersettingnotification">RegisterPowerSettingNotification</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-unregisterpowersettingnotification
     * @since windows6.0.6000
     */
    static UnregisterPowerSettingNotification(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        A_LastError := 0

        result := DllCall("USER32.dll\UnregisterPowerSettingNotification", "ptr", Handle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers to receive notification when the system is suspended or resumed. Similar to PowerRegisterSuspendResumeNotification, but operates in user mode and can take a window handle.
     * @param {HANDLE} hRecipient This parameter contains parameters for subscribing to a power notification or a window handle representing the subscribing process. 
     * 
     * If <i>Flags</i> is <b>DEVICE_NOTIFY_CALLBACK</b>, <i>hRecipient</i> is interpreted as a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/powrprof/ns-powrprof-device_notify_subscribe_parameters">DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS</a> structure. In this case, the callback function is <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nc-powrprof-device_notify_callback_routine">DeviceNotifyCallbackRoutine</a>. When the <b>Callback</b> function executes, the  <i>Type</i> parameter is set indicating the type of event that occurred. Possible values include <b>PBT_APMSUSPEND</b>, <b>PBT_APMRESUMESUSPEND</b>, and <b>PBT_APMRESUMEAUTOMATIC</b> - see  <a href="https://docs.microsoft.com/windows/desktop/Power/power-management-events">Power Management Events</a> for more info. The <i>Setting</i> parameter is not used with suspend/resume notifications.
     * 
     * If <i>Flags</i> is <b>DEVICE_NOTIFY_WINDOW_HANDLE</b>, <i>hRecipient</i> is a handle to the window to deliver events to.
     * @param {Integer} Flags This parameter can be <b>DEVICE_NOTIFY_WINDOW_HANDLE</b> or <b>DEVICE_NOTIFY_CALLBACK</b>.
     * @returns {HPOWERNOTIFY} A handle to the registration. Use this handle to unregister for notifications.
     * 
     * If the function fails, the return value is NULL. To get extended error information call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registersuspendresumenotification
     * @since windows8.0
     */
    static RegisterSuspendResumeNotification(hRecipient, Flags) {
        hRecipient := hRecipient is Win32Handle ? NumGet(hRecipient, "ptr") : hRecipient

        A_LastError := 0

        result := DllCall("USER32.dll\RegisterSuspendResumeNotification", "ptr", hRecipient, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return HPOWERNOTIFY({Value: result}, True)
    }

    /**
     * Cancels a registration to receive notification when the system is suspended or resumed. Similar to PowerUnregisterSuspendResumeNotification but operates in user mode.
     * @param {HPOWERNOTIFY} Handle A handle to a registration obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registersuspendresumenotification">RegisterSuspendResumeNotification</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-unregistersuspendresumenotification
     * @since windows8.0
     */
    static UnregisterSuspendResumeNotification(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        A_LastError := 0

        result := DllCall("USER32.dll\UnregisterSuspendResumeNotification", "ptr", Handle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Has no effect and returns STATUS_NOT_SUPPORTED. This function is provided only for compatibility with earlier versions of Windows.Windows Server 2008 and Windows Vista:  Has no effect and always returns success.
     * @param {Integer} latency The latency requirement for the time is takes to wake the computer. This parameter can be one of the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LT_LOWEST_LATENCY"></a><a id="lt_lowest_latency"></a><dl>
     * <dt><b>LT_LOWEST_LATENCY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PowerSystemSleeping1 state (equivalent to ACPI state S0 and APM state Working).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LT_DONT_CARE"></a><a id="lt_dont_care"></a><dl>
     * <dt><b>LT_DONT_CARE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any latency (default).
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} The return value is nonzero.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-requestwakeuplatency
     * @since windows5.1.2600
     */
    static RequestWakeupLatency(latency) {
        result := DllCall("KERNEL32.dll\RequestWakeupLatency", "int", latency, "int")
        return result
    }

    /**
     * Determines the current state of the computer.
     * @returns {BOOL} If the system was restored to the working state automatically and the user is not active, the function returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-issystemresumeautomatic
     * @since windows5.1.2600
     */
    static IsSystemResumeAutomatic() {
        result := DllCall("KERNEL32.dll\IsSystemResumeAutomatic", "int")
        return result
    }

    /**
     * Enables an application to inform the system that it is in use, thereby preventing the system from entering sleep or turning off the display while the application is running.
     * @param {Integer} esFlags 
     * @returns {Integer} If the function succeeds, the return value is the previous thread execution state.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setthreadexecutionstate
     * @since windows5.1.2600
     */
    static SetThreadExecutionState(esFlags) {
        result := DllCall("KERNEL32.dll\SetThreadExecutionState", "uint", esFlags, "uint")
        return result
    }

    /**
     * Creates a new power request object.
     * @param {Pointer<REASON_CONTEXT>} Context Points to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-reason_context">REASON_CONTEXT</a> structure that contains information about the power request.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the power request object.
     * 
     * If the function fails, the return value is INVALID_HANDLE_VALUE. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-powercreaterequest
     * @since windows6.1
     */
    static PowerCreateRequest(Context) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PowerCreateRequest", "ptr", Context, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Increments the count of power requests of the specified type for a power request object.
     * @param {HANDLE} PowerRequest A handle to a power request object.
     * @param {Integer} RequestType 
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, it returns zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-powersetrequest
     * @since windows6.1
     */
    static PowerSetRequest(PowerRequest, RequestType) {
        PowerRequest := PowerRequest is Win32Handle ? NumGet(PowerRequest, "ptr") : PowerRequest

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PowerSetRequest", "ptr", PowerRequest, "int", RequestType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements the count of power requests of the specified type for a power request object.
     * @param {HANDLE} PowerRequest A handle to a power request object.
     * @param {Integer} RequestType 
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-powerclearrequest
     * @since windows6.1
     */
    static PowerClearRequest(PowerRequest, RequestType) {
        PowerRequest := PowerRequest is Win32Handle ? NumGet(PowerRequest, "ptr") : PowerRequest

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PowerClearRequest", "ptr", PowerRequest, "int", RequestType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current power state of the specified device.
     * @param {HANDLE} hDevice A handle to an object on the device, such as a file or socket, or a handle to the device itself.
     * @param {Pointer<BOOL>} pfOn A pointer to the variable that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/system-power-states">power state</a>. This value is <b>TRUE</b> if the device is in the working state. Otherwise, it is <b>FALSE</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getdevicepowerstate
     * @since windows5.1.2600
     */
    static GetDevicePowerState(hDevice, pfOn) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("KERNEL32.dll\GetDevicePowerState", "ptr", hDevice, "ptr", pfOn, "int")
        return result
    }

    /**
     * Suspends the system by shutting power down. Depending on the ForceFlag parameter, the function either suspends operation immediately or requests permission from all applications and device drivers before doing so.
     * @param {BOOL} fSuspend If this parameter is <b>TRUE</b>, the system is suspended. If the parameter is 
     *       <b>FALSE</b>, the system hibernates.
     * @param {BOOL} fForce This parameter has no effect.
     * @returns {BOOL} If power has been suspended and subsequently restored, the return value is nonzero.
     * 
     * If the system was not suspended, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setsystempowerstate
     * @since windows5.1.2600
     */
    static SetSystemPowerState(fSuspend, fForce) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetSystemPowerState", "int", fSuspend, "int", fForce, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the power status of the system. The status indicates whether the system is running on AC or DC power, whether the battery is currently charging, how much battery life remains, and if battery saver is on or off.
     * @param {Pointer<SYSTEM_POWER_STATUS>} lpSystemPowerStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a> structure that receives status information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getsystempowerstatus
     * @since windows5.1.2600
     */
    static GetSystemPowerStatus(lpSystemPowerStatus) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemPowerStatus", "ptr", lpSystemPowerStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
