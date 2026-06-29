#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.Devices.Properties
 */

;@region Constants

/**
 * @type {Integer (Byte)}
 */
export global DEVPROP_TRUE := 0xFF

/**
 * @type {Integer (Byte)}
 */
export global DEVPROP_FALSE := 0x00

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_Autoplay_Silent := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_Autoplay_Silent.fmtid),
    Guid.Ptr, Guid("{434dd28f-9e75-450a-9ab9-ff61e618bad0}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_Autoplay_Silent.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_NAME := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_NAME.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
DEVPKEY_NAME.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DeviceDesc := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DeviceDesc.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_DeviceDesc.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_HardwareIds := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_HardwareIds.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_HardwareIds.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_CompatibleIds := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_CompatibleIds.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_CompatibleIds.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Service := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Service.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Service.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Class := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Class.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Class.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ClassGuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ClassGuid.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_ClassGuid.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Driver := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Driver.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Driver.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ConfigFlags := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ConfigFlags.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_ConfigFlags.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Manufacturer := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Manufacturer.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Manufacturer.pid := 13

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FriendlyName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FriendlyName.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_FriendlyName.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_LocationInfo := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_LocationInfo.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_LocationInfo.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PDOName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PDOName.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_PDOName.pid := 16

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Capabilities := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Capabilities.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Capabilities.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_UINumber := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_UINumber.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_UINumber.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_UpperFilters := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_UpperFilters.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_UpperFilters.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_LowerFilters := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_LowerFilters.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_LowerFilters.pid := 20

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_BusTypeGuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_BusTypeGuid.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_BusTypeGuid.pid := 21

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_LegacyBusType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_LegacyBusType.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_LegacyBusType.pid := 22

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_BusNumber := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_BusNumber.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_BusNumber.pid := 23

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_EnumeratorName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_EnumeratorName.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_EnumeratorName.pid := 24

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Security := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Security.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Security.pid := 25

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SecuritySDS := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SecuritySDS.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_SecuritySDS.pid := 26

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DevType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DevType.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_DevType.pid := 27

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Exclusive := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Exclusive.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Exclusive.pid := 28

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Characteristics := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Characteristics.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Characteristics.pid := 29

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Address := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Address.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_Address.pid := 30

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_UINumberDescFormat := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_UINumberDescFormat.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_UINumberDescFormat.pid := 31

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PowerData := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PowerData.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_PowerData.pid := 32

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_RemovalPolicy := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_RemovalPolicy.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_RemovalPolicy.pid := 33

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_RemovalPolicyDefault := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_RemovalPolicyDefault.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_RemovalPolicyDefault.pid := 34

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_RemovalPolicyOverride := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_RemovalPolicyOverride.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_RemovalPolicyOverride.pid := 35

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_InstallState := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_InstallState.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_InstallState.pid := 36

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_LocationPaths := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_LocationPaths.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_LocationPaths.pid := 37

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_BaseContainerId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_BaseContainerId.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
DEVPKEY_Device_BaseContainerId.pid := 38

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_InstanceId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_InstanceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_Device_InstanceId.pid := 256

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DevNodeStatus := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DevNodeStatus.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_DevNodeStatus.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ProblemCode := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ProblemCode.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_ProblemCode.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_EjectionRelations := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_EjectionRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_EjectionRelations.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_RemovalRelations := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_RemovalRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_RemovalRelations.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PowerRelations := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PowerRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_PowerRelations.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_BusRelations := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_BusRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_BusRelations.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Parent := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Parent.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_Parent.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Children := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Children.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_Children.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Siblings := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Siblings.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_Siblings.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_TransportRelations := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_TransportRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_TransportRelations.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ProblemStatus := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ProblemStatus.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
DEVPKEY_Device_ProblemStatus.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Reported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Reported.fmtid),
    Guid.Ptr, Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}"),
    UInt32, 16)
DEVPKEY_Device_Reported.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Legacy := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Legacy.fmtid),
    Guid.Ptr, Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}"),
    UInt32, 16)
DEVPKEY_Device_Legacy.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ContainerId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ContainerId.fmtid),
    Guid.Ptr, Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}"),
    UInt32, 16)
DEVPKEY_Device_ContainerId.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_InLocalMachineContainer := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_InLocalMachineContainer.fmtid),
    Guid.Ptr, Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}"),
    UInt32, 16)
DEVPKEY_Device_InLocalMachineContainer.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ContainerModelName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ContainerModelName.fmtid),
    Guid.Ptr, Guid("{7d0300e4-4fb7-493d-8a95-656f00e6a271}"),
    UInt32, 16)
DEVPKEY_Device_ContainerModelName.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ContainerManufacturer := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ContainerManufacturer.fmtid),
    Guid.Ptr, Guid("{7d0300e4-4fb7-493d-8a95-656f00e6a271}"),
    UInt32, 16)
DEVPKEY_Device_ContainerManufacturer.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ContainerCategories := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ContainerCategories.fmtid),
    Guid.Ptr, Guid("{7d0300e4-4fb7-493d-8a95-656f00e6a271}"),
    UInt32, 16)
DEVPKEY_Device_ContainerCategories.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ContainerIcon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ContainerIcon.fmtid),
    Guid.Ptr, Guid("{7d0300e4-4fb7-493d-8a95-656f00e6a271}"),
    UInt32, 16)
DEVPKEY_Device_ContainerIcon.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Model := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Model.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_Device_Model.pid := 39

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ModelId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ModelId.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_ModelId.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FriendlyNameAttributes := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FriendlyNameAttributes.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_FriendlyNameAttributes.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ManufacturerAttributes := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ManufacturerAttributes.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_ManufacturerAttributes.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PresenceNotForDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PresenceNotForDevice.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_PresenceNotForDevice.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SignalStrength := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SignalStrength.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_SignalStrength.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_IsAssociateableByUserAction := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_IsAssociateableByUserAction.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_IsAssociateableByUserAction.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ShowInUninstallUI := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ShowInUninstallUI.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
DEVPKEY_Device_ShowInUninstallUI.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_CompanionApps := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_CompanionApps.fmtid),
    Guid.Ptr, Guid("{6a742654-d0b2-4420-a523-e068352ac1df}"),
    UInt32, 16)
DEVPKEY_Device_CompanionApps.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PrimaryCompanionApp := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PrimaryCompanionApp.fmtid),
    Guid.Ptr, Guid("{6a742654-d0b2-4420-a523-e068352ac1df}"),
    UInt32, 16)
DEVPKEY_Device_PrimaryCompanionApp.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Numa_Proximity_Domain := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Numa_Proximity_Domain.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_Numa_Proximity_Domain.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DHP_Rebalance_Policy := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DHP_Rebalance_Policy.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_DHP_Rebalance_Policy.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Numa_Node := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Numa_Node.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_Numa_Node.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_BusReportedDeviceDesc := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_BusReportedDeviceDesc.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_BusReportedDeviceDesc.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_IsPresent := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_IsPresent.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_IsPresent.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_HasProblem := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_HasProblem.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_HasProblem.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ConfigurationId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ConfigurationId.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_ConfigurationId.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ReportedDeviceIdsHash := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ReportedDeviceIdsHash.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_ReportedDeviceIdsHash.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PhysicalDeviceLocation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PhysicalDeviceLocation.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_PhysicalDeviceLocation.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_BiosDeviceName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_BiosDeviceName.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_BiosDeviceName.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverProblemDesc := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverProblemDesc.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_DriverProblemDesc.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DebuggerSafe := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DebuggerSafe.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_DebuggerSafe.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_PostInstallInProgress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_PostInstallInProgress.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_PostInstallInProgress.pid := 13

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_Stack := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_Stack.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_Stack.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ExtendedConfigurationIds := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ExtendedConfigurationIds.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_ExtendedConfigurationIds.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_IsRebootRequired := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_IsRebootRequired.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_IsRebootRequired.pid := 16

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FirmwareDate := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FirmwareDate.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_FirmwareDate.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FirmwareVersion := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FirmwareVersion.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_FirmwareVersion.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FirmwareRevision := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FirmwareRevision.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_FirmwareRevision.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DependencyProviders := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DependencyProviders.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_DependencyProviders.pid := 20

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DependencyDependents := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DependencyDependents.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_DependencyDependents.pid := 21

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SoftRestartSupported := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SoftRestartSupported.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_SoftRestartSupported.pid := 22

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ExtendedAddress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ExtendedAddress.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_ExtendedAddress.pid := 23

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_AssignedToGuest := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_AssignedToGuest.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_AssignedToGuest.pid := 24

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_CreatorProcessId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_CreatorProcessId.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_CreatorProcessId.pid := 25

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FirmwareVendor := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FirmwareVendor.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
DEVPKEY_Device_FirmwareVendor.pid := 26

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SessionId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SessionId.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
DEVPKEY_Device_SessionId.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_InstallDate := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_InstallDate.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
DEVPKEY_Device_InstallDate.pid := 100

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_FirstInstallDate := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_FirstInstallDate.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
DEVPKEY_Device_FirstInstallDate.pid := 101

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_LastArrivalDate := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_LastArrivalDate.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
DEVPKEY_Device_LastArrivalDate.pid := 102

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_LastRemovalDate := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_LastRemovalDate.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
DEVPKEY_Device_LastRemovalDate.pid := 103

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverDate := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverDate.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverDate.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverVersion := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverVersion.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverVersion.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverDesc := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverDesc.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverDesc.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverInfPath := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverInfPath.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverInfPath.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverInfSection := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverInfSection.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverInfSection.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverInfSectionExt := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverInfSectionExt.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverInfSectionExt.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_MatchingDeviceId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_MatchingDeviceId.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_MatchingDeviceId.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverProvider := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverProvider.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverProvider.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverPropPageProvider := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverPropPageProvider.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverPropPageProvider.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverCoInstallers := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverCoInstallers.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverCoInstallers.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ResourcePickerTags := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ResourcePickerTags.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_ResourcePickerTags.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ResourcePickerExceptions := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ResourcePickerExceptions.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_ResourcePickerExceptions.pid := 13

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverRank := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverRank.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverRank.pid := 14

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_DriverLogoLevel := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_DriverLogoLevel.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_DriverLogoLevel.pid := 15

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_NoConnectSound := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_NoConnectSound.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_NoConnectSound.pid := 17

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_GenericDriverInstalled := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_GenericDriverInstalled.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_GenericDriverInstalled.pid := 18

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_AdditionalSoftwareRequested := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_AdditionalSoftwareRequested.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
DEVPKEY_Device_AdditionalSoftwareRequested.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SafeRemovalRequired := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SafeRemovalRequired.fmtid),
    Guid.Ptr, Guid("{afd97640-86a3-4210-b67c-289c41aabe55}"),
    UInt32, 16)
DEVPKEY_Device_SafeRemovalRequired.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_SafeRemovalRequiredOverride := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_SafeRemovalRequiredOverride.fmtid),
    Guid.Ptr, Guid("{afd97640-86a3-4210-b67c-289c41aabe55}"),
    UInt32, 16)
DEVPKEY_Device_SafeRemovalRequiredOverride.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DrvPkg_Model := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DrvPkg_Model.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
DEVPKEY_DrvPkg_Model.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DrvPkg_VendorWebSite := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DrvPkg_VendorWebSite.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
DEVPKEY_DrvPkg_VendorWebSite.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DrvPkg_DetailedDescription := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DrvPkg_DetailedDescription.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
DEVPKEY_DrvPkg_DetailedDescription.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DrvPkg_DocumentationLink := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DrvPkg_DocumentationLink.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
DEVPKEY_DrvPkg_DocumentationLink.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DrvPkg_Icon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DrvPkg_Icon.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
DEVPKEY_DrvPkg_Icon.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DrvPkg_BrandingIcon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DrvPkg_BrandingIcon.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
DEVPKEY_DrvPkg_BrandingIcon.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_UpperFilters := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_UpperFilters.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_UpperFilters.pid := 19

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_LowerFilters := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_LowerFilters.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_LowerFilters.pid := 20

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_Security := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_Security.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_Security.pid := 25

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_SecuritySDS := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_SecuritySDS.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_SecuritySDS.pid := 26

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_DevType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_DevType.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_DevType.pid := 27

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_Exclusive := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_Exclusive.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_Exclusive.pid := 28

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_Characteristics := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_Characteristics.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
DEVPKEY_DeviceClass_Characteristics.pid := 29

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_Name := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_Name.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_Name.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_ClassName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_ClassName.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_ClassName.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_Icon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_Icon.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_Icon.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_ClassInstaller := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_ClassInstaller.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_ClassInstaller.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_PropPageProvider := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_PropPageProvider.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_PropPageProvider.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_NoInstallClass := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_NoInstallClass.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_NoInstallClass.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_NoDisplayClass := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_NoDisplayClass.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_NoDisplayClass.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_SilentInstall := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_SilentInstall.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_SilentInstall.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_NoUseClass := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_NoUseClass.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_NoUseClass.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_DefaultService := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_DefaultService.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_DefaultService.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_IconPath := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_IconPath.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
DEVPKEY_DeviceClass_IconPath.pid := 12

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_DHPRebalanceOptOut := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_DHPRebalanceOptOut.fmtid),
    Guid.Ptr, Guid("{d14d3ef3-66cf-4ba2-9d38-0ddb37ab4701}"),
    UInt32, 16)
DEVPKEY_DeviceClass_DHPRebalanceOptOut.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceClass_ClassCoInstallers := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceClass_ClassCoInstallers.fmtid),
    Guid.Ptr, Guid("{713d1703-a2e2-49f5-9214-56472ef3da5c}"),
    UInt32, 16)
DEVPKEY_DeviceClass_ClassCoInstallers.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_FriendlyName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_FriendlyName.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_FriendlyName.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_Enabled := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_Enabled.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_Enabled.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_ClassGuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_ClassGuid.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_ClassGuid.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_ReferenceString := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_ReferenceString.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_ReferenceString.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_Restricted := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_Restricted.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_Restricted.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_SchematicName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_SchematicName.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_SchematicName.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterfaceClass_DefaultInterface := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterfaceClass_DefaultInterface.fmtid),
    Guid.Ptr, Guid("{14c83a99-0b3f-44b7-be4c-a178d3990564}"),
    UInt32, 16)
DEVPKEY_DeviceInterfaceClass_DefaultInterface.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterfaceClass_Name := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterfaceClass_Name.fmtid),
    Guid.Ptr, Guid("{14c83a99-0b3f-44b7-be4c-a178d3990564}"),
    UInt32, 16)
DEVPKEY_DeviceInterfaceClass_Name.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Address := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Address.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Address.pid := 51

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_DiscoveryMethod := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_DiscoveryMethod.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_DiscoveryMethod.pid := 52

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsEncrypted := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsEncrypted.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsEncrypted.pid := 53

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsAuthenticated := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsAuthenticated.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsAuthenticated.pid := 54

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsConnected := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsConnected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsConnected.pid := 55

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsPaired := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsPaired.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsPaired.pid := 56

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Icon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Icon.pid := 57

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Version := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Version.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Version.pid := 65

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Last_Seen := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Last_Seen.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Last_Seen.pid := 66

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Last_Connected := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Last_Connected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Last_Connected.pid := 67

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsShowInDisconnectedState := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsShowInDisconnectedState.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsShowInDisconnectedState.pid := 68

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsLocalMachine := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsLocalMachine.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsLocalMachine.pid := 70

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_MetadataPath := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_MetadataPath.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_MetadataPath.pid := 71

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsMetadataSearchInProgress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsMetadataSearchInProgress.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsMetadataSearchInProgress.pid := 72

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_MetadataChecksum := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_MetadataChecksum.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_MetadataChecksum.pid := 73

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsNotInterestingForDisplay := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsNotInterestingForDisplay.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsNotInterestingForDisplay.pid := 74

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect.pid := 76

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer.pid := 77

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_BaselineExperienceId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_BaselineExperienceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_BaselineExperienceId.pid := 78

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable.pid := 79

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_AssociationArray := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_AssociationArray.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_AssociationArray.pid := 80

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_DeviceDescription1 := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_DeviceDescription1.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_DeviceDescription1.pid := 81

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_DeviceDescription2 := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_DeviceDescription2.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_DeviceDescription2.pid := 82

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_HasProblem := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_HasProblem.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_HasProblem.pid := 83

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsSharedDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsSharedDevice.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsSharedDevice.pid := 84

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsNetworkDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsNetworkDevice.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsNetworkDevice.pid := 85

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsDefaultDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsDefaultDevice.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsDefaultDevice.pid := 86

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_MetadataCabinet := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_MetadataCabinet.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_MetadataCabinet.pid := 87

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_RequiresPairingElevation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_RequiresPairingElevation.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_RequiresPairingElevation.pid := 88

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_ExperienceId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_ExperienceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_ExperienceId.pid := 89

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Category := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Category.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Category.pid := 90

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Category_Desc_Singular := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Category_Desc_Singular.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Category_Desc_Singular.pid := 91

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Category_Desc_Plural := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Category_Desc_Plural.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Category_Desc_Plural.pid := 92

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Category_Icon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Category_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Category_Icon.pid := 93

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_CategoryGroup_Desc := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_CategoryGroup_Desc.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_CategoryGroup_Desc.pid := 94

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_CategoryGroup_Icon := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_CategoryGroup_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_CategoryGroup_Icon.pid := 95

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_PrimaryCategory := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_PrimaryCategory.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_PrimaryCategory.pid := 97

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_UnpairUninstall := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_UnpairUninstall.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_UnpairUninstall.pid := 98

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_RequiresUninstallElevation := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_RequiresUninstallElevation.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_RequiresUninstallElevation.pid := 99

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_DeviceFunctionSubRank := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_DeviceFunctionSubRank.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_DeviceFunctionSubRank.pid := 100

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected.pid := 101

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_ConfigFlags := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_ConfigFlags.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_ConfigFlags.pid := 105

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames.pid := 106

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames.pid := 107

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_IsRebootRequired := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_IsRebootRequired.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_IsRebootRequired.pid := 108

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_FriendlyName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_FriendlyName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_FriendlyName.pid := 12288

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_Manufacturer := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_Manufacturer.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_Manufacturer.pid := 8192

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_ModelName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_ModelName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_ModelName.pid := 8194

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_ModelNumber := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_ModelNumber.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_ModelNumber.pid := 8195

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceContainer_InstallInProgress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceContainer_InstallInProgress.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
DEVPKEY_DeviceContainer_InstallInProgress.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DevQuery_ObjectType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DevQuery_ObjectType.fmtid),
    Guid.Ptr, Guid("{13673f42-a3d6-49f6-b4da-ae46e0c5237c}"),
    UInt32, 16)
DEVPKEY_DevQuery_ObjectType.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DEVPROP_TYPE := 25

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DEVPROP_TYPEMOD := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DEVPROP_MASK_TYPE := 4095

/**
 * @type {Integer (UInt32)}
 */
export global DEVPROP_MASK_TYPEMOD := 61440

/**
 * @type {Integer (UInt32)}
 */
export global DEVPROPID_FIRST_USABLE := 2
;@endregion Constants
