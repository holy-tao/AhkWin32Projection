#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.System.Power
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_ACPI1C2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_ACPI1C3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_ACPI1TSTATES := 4

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_CST := 8

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_CSD := 16

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PCT := 32

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PSS := 64

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_XPSS := 128

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PPC := 256

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PSD := 512

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PTC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_TSS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_TPC := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_TSD := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PCCH := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PCCP := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_OSC := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_PDC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_CPC := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PPM_FIRMWARE_LPI := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PPM_PERFORMANCE_IMPLEMENTATION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PPM_PERFORMANCE_IMPLEMENTATION_PSTATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPM_PERFORMANCE_IMPLEMENTATION_PCCV1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPM_PERFORMANCE_IMPLEMENTATION_CPPC := 3

/**
 * @type {Integer (UInt32)}
 */
export global PPM_PERFORMANCE_IMPLEMENTATION_PEP := 4

/**
 * @type {Integer (UInt32)}
 */
export global PPM_IDLE_IMPLEMENTATION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PPM_IDLE_IMPLEMENTATION_CSTATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPM_IDLE_IMPLEMENTATION_PEP := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPM_IDLE_IMPLEMENTATION_MICROPEP := 3

/**
 * @type {Integer (UInt32)}
 */
export global PPM_IDLE_IMPLEMENTATION_LPISTATES := 4

/**
 * @type {Guid}
 */
export global PPM_PERFSTATE_CHANGE_GUID := Guid("{a5b32ddd-7f39-4abc-b892-900e43b59ebb}")

/**
 * @type {Guid}
 */
export global PPM_PERFSTATE_DOMAIN_CHANGE_GUID := Guid("{995e6b7f-d653-497a-b978-36a30c29bf01}")

/**
 * @type {Guid}
 */
export global PPM_IDLESTATE_CHANGE_GUID := Guid("{4838fe4f-f71c-4e51-9ecc-8430a7ac4c6c}")

/**
 * @type {Guid}
 */
export global PPM_PERFSTATES_DATA_GUID := Guid("{5708cc20-7d40-4bf4-b4aa-2b01338d0126}")

/**
 * @type {Guid}
 */
export global PPM_IDLESTATES_DATA_GUID := Guid("{ba138e10-e250-4ad7-8616-cf1a7ad410e7}")

/**
 * @type {Guid}
 */
export global PPM_IDLE_ACCOUNTING_GUID := Guid("{e2a26f78-ae07-4ee0-a30f-ce54f55a94cd}")

/**
 * @type {Guid}
 */
export global PPM_IDLE_ACCOUNTING_EX_GUID := Guid("{d67abd39-81f8-4a5e-8152-72e31ec912ee}")

/**
 * @type {Guid}
 */
export global PPM_THERMALCONSTRAINT_GUID := Guid("{a852c2c8-1a4c-423b-8c2c-f30d82931a88}")

/**
 * @type {Guid}
 */
export global PPM_PERFMON_PERFSTATE_GUID := Guid("{7fd18652-0cfe-40d2-b0a1-0b066a87759e}")

/**
 * @type {Guid}
 */
export global PPM_THERMAL_POLICY_CHANGE_GUID := Guid("{48f377b8-6880-4c7b-8bdc-380176c6654d}")

/**
 * @type {DEVPROPKEY}
 */
export global PROCESSOR_NUMBER_PKEY := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PROCESSOR_NUMBER_PKEY.fmtid),
    Guid.Ptr, Guid("{5724c81d-d5af-4c1f-a103-a06e28f204c6}"),
    UInt32, 16)
PROCESSOR_NUMBER_PKEY.pid := 1

/**
 * @type {Guid}
 */
export global GUID_DEVICE_BATTERY := Guid("{72631e54-78a4-11d0-bcf7-00aa00b7b32a}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_APPLICATIONLAUNCH_BUTTON := Guid("{629758ee-986e-4d9e-8e47-de27f8ab054d}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_SYS_BUTTON := Guid("{4afa3d53-74a7-11d0-be5e-00a0c9062857}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_LID := Guid("{4afa3d52-74a7-11d0-be5e-00a0c9062857}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_THERMAL_ZONE := Guid("{4afa3d51-74a7-11d0-be5e-00a0c9062857}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_FAN := Guid("{05ecd13d-81da-4a2a-8a4c-524f23dd4dc9}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_PROCESSOR := Guid("{97fadb10-4e33-40ae-359c-8bef029dbdd0}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_MEMORY := Guid("{3fd0f03d-92e0-45fb-b75c-5ed8ffb01021}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_ACPI_TIME := Guid("{97f99bf6-4497-4f18-bb22-4b9fb2fbef9c}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_MESSAGE_INDICATOR := Guid("{cd48a365-fa94-4ce2-a232-a1b764e5d8b4}")

/**
 * @type {Guid}
 */
export global GUID_DEVICE_POWER_ADAPTER := Guid("{f76c6c62-7dea-43cd-8689-d9a4af3d8557}")

/**
 * @type {Guid}
 */
export global GUID_CLASS_INPUT := Guid("{4d1e55b2-f16f-11cf-88cb-001111000030}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_THERMAL_COOLING := Guid("{dbe4373d-3c81-40cb-ace4-e0e5d05f0c9f}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_THERMAL_MANAGER := Guid("{927ec093-69a4-4bc0-bd02-711664714463}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_POWER_LIMIT := Guid("{8f366301-091e-4056-b92f-958b27625fce}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_TEMPERATURE_SENSOR := Guid("{2a6c8538-7895-4d56-8567-795d3844858a}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_CUSTOMIZED_IO := Guid("{2ed8544a-8eef-4033-b2a0-04aaa507cecb}")

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_UNKNOWN_CAPACITY := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global UNKNOWN_CAPACITY := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_SYSTEM_BATTERY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CAPACITY_RELATIVE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_IS_SHORT_TERM := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_SEALED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_SET_CHARGE_SUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_SET_DISCHARGE_SUPPORTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_SET_CHARGINGSOURCE_SUPPORTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_SET_CHARGER_ID_SUPPORTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_UNKNOWN_TIME := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_UNKNOWN_CURRENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global UNKNOWN_CURRENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_USB_CHARGER_STATUS_FN_DEFAULT_USB := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_USB_CHARGER_STATUS_UCM_PD := 2

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_UNKNOWN_VOLTAGE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_UNKNOWN_RATE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global UNKNOWN_RATE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global UNKNOWN_VOLTAGE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_POWER_ON_LINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_DISCHARGING := 2

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CHARGING := 4

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CRITICAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAX_BATTERY_STRING_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BATTERY_QUERY_TAG := 2703424

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BATTERY_QUERY_INFORMATION := 2703428

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BATTERY_SET_INFORMATION := 2719816

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BATTERY_QUERY_STATUS := 2703436

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BATTERY_CHARGING_SOURCE_CHANGE := 2703440

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_TAG_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_QUERY_CUSTOMIZED_IO_CAPABILITIES := 2704000

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_QUERY_CUSTOMIZED_INPUT_FROM_PLATFORM := 2704004

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SEND_CUSTOMIZED_OUTPUT_TO_PLATFORM := 2720392

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ACTIVE_COOLING_LEVELS := 10

/**
 * @type {Integer (UInt32)}
 */
export global ACTIVE_COOLING := 0

/**
 * @type {Integer (UInt32)}
 */
export global PASSIVE_COOLING := 1

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_WAIT_READ_TIMEOUT_IMMEDIATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_WAIT_READ_TIMEOUT_NONE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global TZ_ACTIVATION_REASON_THERMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global TZ_ACTIVATION_REASON_CURRENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_POLICY_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_POLICY_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_THERMAL_QUERY_INFORMATION := 2703488

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_THERMAL_SET_COOLING_POLICY := 2719876

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_RUN_ACTIVE_COOLING_METHOD := 2719880

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_THERMAL_SET_PASSIVE_LIMIT := 2719884

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_THERMAL_READ_TEMPERATURE := 2703504

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_THERMAL_READ_POLICY := 2703508

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_QUERY_LID := 2703552

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NOTIFY_SWITCH_EVENT := 2703616

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_SYS_BUTTON_CAPS := 2703680

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_SYS_BUTTON_EVENT := 2703684

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_POWER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_SLEEP := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_LID := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_WAKE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_LID_STATE_MASK := 196608

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_LID_OPEN := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_LID_CLOSED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_LID_INITIAL := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SYS_BUTTON_LID_CHANGED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_PROCESSOR_OBJ_INFO := 2703744

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_COOLING_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_DEVICE_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_LIMIT_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_SYS_MESSAGE_INDICATOR := 2720192

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_WAKE_ALARM_VALUE := 2720256

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_WAKE_ALARM_POLICY := 2720260

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_WAKE_ALARM_VALUE := 2736648

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_WAKE_ALARM_POLICY := 2736652

/**
 * @type {Integer (UInt32)}
 */
export global ACPI_TIME_ADJUST_DAYLIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACPI_TIME_IN_DAYLIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACPI_TIME_ZONE_UNKNOWN := 2047

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ACPI_GET_REAL_TIME := 2703888

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ACPI_SET_REAL_TIME := 2720276

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_WAKE_ALARM_SYSTEM_POWERSTATE := 2703896

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_ACPI_TIME_AND_ALARM_CAPABILITIES := 2703900

/**
 * @type {Guid}
 */
export global BATTERY_STATUS_WMI_GUID := Guid("{fc4670d1-ebbf-416e-87ce-374a4ebc111a}")

/**
 * @type {Guid}
 */
export global BATTERY_RUNTIME_WMI_GUID := Guid("{535a3767-1ac2-49bc-a077-3f7a02e40aec}")

/**
 * @type {Guid}
 */
export global BATTERY_TEMPERATURE_WMI_GUID := Guid("{1a52a14d-adce-4a44-9a3e-c8d8f15ff2c2}")

/**
 * @type {Guid}
 */
export global BATTERY_FULL_CHARGED_CAPACITY_WMI_GUID := Guid("{40b40565-96f7-4435-8694-97e0e4395905}")

/**
 * @type {Guid}
 */
export global BATTERY_CYCLE_COUNT_WMI_GUID := Guid("{ef98db24-0014-4c25-a50b-c724ae5cd371}")

/**
 * @type {Guid}
 */
export global BATTERY_STATIC_DATA_WMI_GUID := Guid("{05e1e463-e4e2-4ea9-80cb-9bd4b3ca0655}")

/**
 * @type {Guid}
 */
export global BATTERY_STATUS_CHANGE_WMI_GUID := Guid("{cddfa0c3-7c5b-4e43-a034-059fa5b84364}")

/**
 * @type {Guid}
 */
export global BATTERY_TAG_CHANGE_WMI_GUID := Guid("{5e1f6e19-8786-4d23-94fc-9e746bd5d888}")

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_NOTIFY_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_NOTIFY_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHARGE_REQUIREMENT_MAX_POWER_SOURCE_TYPES := 2

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_MINIPORT_UPDATE_DATA_VER_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_MINIPORT_UPDATE_DATA_VER_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CLASS_MAJOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CLASS_MINOR_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CLASS_MINOR_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BATTERY_CLASS_MINOR_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ADAPTER_CLASS_MAJOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADAPTER_CLASS_MINOR_VERSION := 0

/**
 * @type {Guid}
 */
export global GUID_DEVICE_ENERGY_METER := Guid("{45bd8344-7ed6-49cf-a440-c276c933b053}")

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_EMI_GET_VERSION := 2244608

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_EMI_GET_METADATA_SIZE := 2244612

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_EMI_GET_METADATA := 2244616

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_EMI_GET_MEASUREMENT := 2244620

/**
 * @type {Integer (UInt32)}
 */
export global EMI_NAME_MAX := 16

/**
 * @type {Integer (UInt32)}
 */
export global EMI_VERSION_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EMI_VERSION_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global EFFECTIVE_POWER_MODE_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EFFECTIVE_POWER_MODE_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global EnableSysTrayBatteryMeter := 1

/**
 * @type {Integer (UInt32)}
 */
export global EnableMultiBatteryDisplay := 2

/**
 * @type {Integer (UInt32)}
 */
export global EnablePasswordLogon := 4

/**
 * @type {Integer (UInt32)}
 */
export global EnableWakeOnRing := 8

/**
 * @type {Integer (UInt32)}
 */
export global EnableVideoDimDisplay := 16

/**
 * @type {Integer (UInt32)}
 */
export global POWER_ATTRIBUTE_HIDE := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_ATTRIBUTE_SHOW_AOAC := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_HARDWAREID := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_AND_OPERATION := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_FILTER_DEVICES_PRESENT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_FILTER_HARDWARE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_FILTER_WAKEENABLED := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_FILTER_WAKEPROGRAMMABLE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_FILTER_ON_NAME := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_SET_WAKEENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVICEPOWER_CLEAR_WAKEENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global THERMAL_EVENT_VERSION := 1
;@endregion Constants
