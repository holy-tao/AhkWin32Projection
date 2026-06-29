#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID_PRIVATE := 100

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID := 1000

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID_SEARCHCOMPLETE := 1000

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID_ASYNCTHREADEXIT := 1001

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID_SEARCHSTART := 1002

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID_IPADDRESSCHANGE := 1003

/**
 * @type {Integer (UInt32)}
 */
export global FD_EVENTID_QUERYREFRESH := 1004

/**
 * @type {Guid}
 */
export global SID_PnpProvider := Guid("{8101368e-cabb-4426-acff-96c410812000}")

/**
 * @type {Guid}
 */
export global SID_UPnPActivator := Guid("{0d0d66eb-cf74-4164-b52f-08344672dd46}")

/**
 * @type {Guid}
 */
export global SID_EnumInterface := Guid("{40eab0b9-4d7f-4b53-a334-1581dd9041f4}")

/**
 * @type {Guid}
 */
export global SID_PNPXPropertyStore := Guid("{a86530b1-542f-439f-b71c-b0756b13677a}")

/**
 * @type {Guid}
 */
export global SID_PNPXAssociation := Guid("{cee8ccc9-4f6b-4469-a235-5a22869eef03}")

/**
 * @type {Guid}
 */
export global SID_PNPXServiceCollection := Guid("{439e80ee-a217-4712-9fa6-deabd9c2a727}")

/**
 * @type {Guid}
 */
export global SID_FDPairingHandler := Guid("{383b69fa-5486-49da-91f5-d63c24c8e9d0}")

/**
 * @type {Guid}
 */
export global SID_EnumDeviceFunction := Guid("{13e0e9e2-c3fa-4e3c-906e-64502fa4dc95}")

/**
 * @type {Guid}
 */
export global SID_UnpairProvider := Guid("{89a502fc-857b-4698-a0b7-027192002f9e}")

/**
 * @type {Guid}
 */
export global SID_DeviceDisplayStatusManager := Guid("{f59aa553-8309-46ca-9736-1ac3c62d6031}")

/**
 * @type {Guid}
 */
export global SID_FunctionDiscoveryProviderRefresh := Guid("{2b4cbdc9-31c4-40d4-a62d-772aa174ed52}")

/**
 * @type {Guid}
 */
export global SID_UninstallDeviceFunction := Guid("{c920566e-5671-4496-8025-bf0b89bd44cd}")

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FunctionInstance := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FunctionInstance.fmtid),
    Guid.Ptr, Guid("{08c0c253-a154-4746-9005-82de5317148b}"),
    UInt32, 16)
PKEY_FunctionInstance.pid := 1

/**
 * @type {Guid}
 */
export global FMTID_FD := Guid("{904b03a2-471d-423c-a584-f3483238a146}")

/**
 * @type {Integer (UInt32)}
 */
export global FD_Visibility_Default := 0

/**
 * @type {Integer (UInt32)}
 */
export global FD_Visibility_Hidden := 1

/**
 * @type {Guid}
 */
export global FMTID_Device := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")

/**
 * @type {Guid}
 */
export global FMTID_DeviceInterface := Guid("{53808008-07bb-4661-bc3c-b5953e708560}")

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Address := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Address.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Address.pid := 51

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_DiscoveryMethod := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_DiscoveryMethod.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_DiscoveryMethod.pid := 52

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsEncrypted := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsEncrypted.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsEncrypted.pid := 53

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsAuthenticated := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsAuthenticated.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsAuthenticated.pid := 54

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsConnected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsConnected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsConnected.pid := 55

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsPaired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsPaired.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsPaired.pid := 56

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Icon.pid := 57

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Version := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Version.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Version.pid := 65

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Last_Seen := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Last_Seen.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Last_Seen.pid := 66

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Last_Connected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Last_Connected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Last_Connected.pid := 67

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsShowInDisconnectedState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsShowInDisconnectedState.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsShowInDisconnectedState.pid := 68

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsLocalMachine := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsLocalMachine.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsLocalMachine.pid := 70

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_MetadataPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_MetadataPath.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_MetadataPath.pid := 71

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsMetadataSearchInProgress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsMetadataSearchInProgress.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsMetadataSearchInProgress.pid := 72

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_MetadataChecksum := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_MetadataChecksum.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_MetadataChecksum.pid := 73

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsNotInterestingForDisplay := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsNotInterestingForDisplay.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsNotInterestingForDisplay.pid := 74

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect.pid := 76

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer.pid := 77

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_BaselineExperienceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_BaselineExperienceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_BaselineExperienceId.pid := 78

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable.pid := 79

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_AssociationArray := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_AssociationArray.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_AssociationArray.pid := 80

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_DeviceDescription1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_DeviceDescription1.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_DeviceDescription1.pid := 81

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_DeviceDescription2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_DeviceDescription2.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_DeviceDescription2.pid := 82

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsNotWorkingProperly := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsNotWorkingProperly.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsNotWorkingProperly.pid := 83

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsSharedDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsSharedDevice.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsSharedDevice.pid := 84

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsNetworkDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsNetworkDevice.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsNetworkDevice.pid := 85

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_IsDefaultDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_IsDefaultDevice.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_IsDefaultDevice.pid := 86

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_MetadataCabinet := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_MetadataCabinet.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_MetadataCabinet.pid := 87

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_RequiresPairingElevation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_RequiresPairingElevation.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_RequiresPairingElevation.pid := 88

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_ExperienceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_ExperienceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_ExperienceId.pid := 89

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Category := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Category.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Category.pid := 90

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Category_Desc_Singular := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Category_Desc_Singular.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Category_Desc_Singular.pid := 91

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Category_Desc_Plural := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Category_Desc_Plural.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Category_Desc_Plural.pid := 92

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Category_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Category_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_Category_Icon.pid := 93

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_CategoryGroup_Desc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_CategoryGroup_Desc.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_CategoryGroup_Desc.pid := 94

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_CategoryGroup_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_CategoryGroup_Icon.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_CategoryGroup_Icon.pid := 95

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_PrimaryCategory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_PrimaryCategory.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_PrimaryCategory.pid := 97

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_UnpairUninstall := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_UnpairUninstall.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_UnpairUninstall.pid := 98

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_RequiresUninstallElevation := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_RequiresUninstallElevation.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_RequiresUninstallElevation.pid := 99

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_DeviceFunctionSubRank := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_DeviceFunctionSubRank.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_DeviceFunctionSubRank.pid := 100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected.pid := 101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_FriendlyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_FriendlyName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_DeviceDisplay_FriendlyName.pid := 12288

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_Manufacturer.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_DeviceDisplay_Manufacturer.pid := 8192

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_ModelName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_ModelName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_DeviceDisplay_ModelName.pid := 8194

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_ModelNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_ModelNumber.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_DeviceDisplay_ModelNumber.pid := 8195

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceDisplay_InstallInProgress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceDisplay_InstallInProgress.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
PKEY_DeviceDisplay_InstallInProgress.pid := 9

/**
 * @type {Guid}
 */
export global FMTID_Pairing := Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Pairing_ListItemText := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Pairing_ListItemText.fmtid),
    Guid.Ptr, Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}"),
    UInt32, 16)
PKEY_Pairing_ListItemText.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Pairing_ListItemDescription := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Pairing_ListItemDescription.fmtid),
    Guid.Ptr, Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}"),
    UInt32, 16)
PKEY_Pairing_ListItemDescription.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Pairing_ListItemIcon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Pairing_ListItemIcon.fmtid),
    Guid.Ptr, Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}"),
    UInt32, 16)
PKEY_Pairing_ListItemIcon.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Pairing_ListItemDefault := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Pairing_ListItemDefault.fmtid),
    Guid.Ptr, Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}"),
    UInt32, 16)
PKEY_Pairing_ListItemDefault.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Pairing_IsWifiOnlyDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Pairing_IsWifiOnlyDevice.fmtid),
    Guid.Ptr, Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}"),
    UInt32, 16)
PKEY_Pairing_IsWifiOnlyDevice.pid := 16

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH := "Bluetooth"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH_LE := "Bluetooth Low Energy"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_NETBIOS := "NetBIOS"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_AD_PRINTER := "Published Printer"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_PNP := "PnP"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_UPNP := "UPnP"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_WSD := "WSD"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_WUSB := "WUSB"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_WFD := "WiFiDirect"

/**
 * @type {String}
 */
export global DEVICEDISPLAY_DISCOVERYMETHOD_ASP_INFRA := "AspInfra"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_BIOSVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_BIOSVersion.fmtid),
    Guid.Ptr, Guid("{eaee7f1d-6a33-44d1-9441-5f46def23198}"),
    UInt32, 16)
PKEY_Device_BIOSVersion.pid := 9

/**
 * @type {Guid}
 */
export global FMTID_WSD := Guid("{92506491-ff95-4724-a05a-5b81885a7c92}")

/**
 * @type {Guid}
 */
export global FMTID_PNPX := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_GlobalIdentity := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_GlobalIdentity.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_GlobalIdentity.pid := 4096

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Types := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Types.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_Types.pid := 4097

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Scopes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Scopes.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_Scopes.pid := 4098

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_XAddrs := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_XAddrs.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_XAddrs.pid := 4099

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_MetadataVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_MetadataVersion.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_MetadataVersion.pid := 4100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ID.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ID.pid := 4101

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_RemoteAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_RemoteAddress.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_RemoteAddress.pid := 4102

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_RootProxy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_RootProxy.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_RootProxy.pid := 4103

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ManufacturerUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ManufacturerUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ManufacturerUrl.pid := 8193

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ModelUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ModelUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ModelUrl.pid := 8196

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Upc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Upc.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_Upc.pid := 8197

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_PresentationUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_PresentationUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_PresentationUrl.pid := 8198

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_FirmwareVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_FirmwareVersion.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_FirmwareVersion.pid := 12289

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_SerialNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_SerialNumber.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_SerialNumber.pid := 12290

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_DeviceCategory := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_DeviceCategory.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_DeviceCategory.pid := 12292

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_SecureChannel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_SecureChannel.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_SecureChannel.pid := 28673

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_CompactSignature := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_CompactSignature.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_CompactSignature.pid := 28674

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_DeviceCertHash := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_DeviceCertHash.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_DeviceCertHash.pid := 28675

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_COMPUTER := "Computers"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_INPUTDEVICE := "Input"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_PRINTER := "Printers"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_SCANNER := "Scanners"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_FAX := "FAX"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_MFP := "MFP"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_CAMERA := "Cameras"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_STORAGE := "Storage"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_NETWORK_INFRASTRUCTURE := "NetworkInfrastructure"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_DISPLAYS := "Displays"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_MULTIMEDIA_DEVICE := "MediaDevices"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_GAMING_DEVICE := "Gaming"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_TELEPHONE := "Phones"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_HOME_AUTOMATION_SYSTEM := "HomeAutomation"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_HOME_SECURITY_SYSTEM := "HomeSecurity"

/**
 * @type {String}
 */
export global PNPX_DEVICECATEGORY_OTHER := "Other"

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_DeviceCategory_Desc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_DeviceCategory_Desc.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_DeviceCategory_Desc.pid := 12293

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Category_Desc_NonPlural := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Category_Desc_NonPlural.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_Category_Desc_NonPlural.pid := 12304

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_PhysicalAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_PhysicalAddress.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_PhysicalAddress.pid := 12294

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_NetworkInterfaceLuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_NetworkInterfaceLuid.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_NetworkInterfaceLuid.pid := 12295

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_NetworkInterfaceGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_NetworkInterfaceGuid.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_NetworkInterfaceGuid.pid := 12296

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_IpAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_IpAddress.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_IpAddress.pid := 12297

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ServiceAddress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ServiceAddress.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ServiceAddress.pid := 16384

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ServiceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ServiceId.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ServiceId.pid := 16385

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ServiceTypes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ServiceTypes.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ServiceTypes.pid := 16386

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ServiceControlUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ServiceControlUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ServiceControlUrl.pid := 16388

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ServiceDescUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ServiceDescUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ServiceDescUrl.pid := 16389

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ServiceEventSubUrl := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ServiceEventSubUrl.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ServiceEventSubUrl.pid := 16390

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_DomainName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_DomainName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_DomainName.pid := 20480

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_ShareName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_ShareName.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_ShareName.pid := 20482

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SSDP_AltLocationInfo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SSDP_AltLocationInfo.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_SSDP_AltLocationInfo.pid := 24576

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SSDP_DevLifeTime := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SSDP_DevLifeTime.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_SSDP_DevLifeTime.pid := 24577

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SSDP_NetworkInterface := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SSDP_NetworkInterface.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_SSDP_NetworkInterface.pid := 24578

/**
 * @type {Guid}
 */
export global FMTID_PNPXDynamicProperty := Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}")

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Installable := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Installable.fmtid),
    Guid.Ptr, Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}"),
    UInt32, 16)
PKEY_PNPX_Installable.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Associated := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Associated.fmtid),
    Guid.Ptr, Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}"),
    UInt32, 16)
PKEY_PNPX_Associated.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_CompatibleTypes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_CompatibleTypes.fmtid),
    Guid.Ptr, Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}"),
    UInt32, 16)
PKEY_PNPX_CompatibleTypes.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_InstallState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_InstallState.fmtid),
    Guid.Ptr, Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}"),
    UInt32, 16)
PKEY_PNPX_InstallState.pid := 4

/**
 * @type {Integer (UInt32)}
 */
export global PNPX_INSTALLSTATE_NOTINSTALLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PNPX_INSTALLSTATE_INSTALLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNPX_INSTALLSTATE_INSTALLING := 2

/**
 * @type {Integer (UInt32)}
 */
export global PNPX_INSTALLSTATE_FAILED := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_Removable := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_Removable.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_Removable.pid := 28672

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PNPX_IPBusEnumerated := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PNPX_IPBusEnumerated.fmtid),
    Guid.Ptr, Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"),
    UInt32, 16)
PKEY_PNPX_IPBusEnumerated.pid := 28688

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_Scope := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_Scope.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_Scope.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_Type := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_Type.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_Type.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_DisplayType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_DisplayType.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_DisplayType.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_Usage := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_Usage.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_Usage.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_LocalName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_LocalName.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_LocalName.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_RemoteName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_RemoteName.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_RemoteName.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_Comment := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_Comment.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_Comment.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WNET_Provider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WNET_Provider.fmtid),
    Guid.Ptr, Guid("{debda43a-37b3-4383-91e7-4498da2995ab}"),
    UInt32, 16)
PKEY_WNET_Provider.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_Version := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_Version.fmtid),
    Guid.Ptr, Guid("{88190b80-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_Version.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_RequestType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_RequestType.fmtid),
    Guid.Ptr, Guid("{88190b81-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_RequestType.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_AuthType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_AuthType.fmtid),
    Guid.Ptr, Guid("{88190b82-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_AuthType.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_EncryptType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_EncryptType.fmtid),
    Guid.Ptr, Guid("{88190b83-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_EncryptType.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_ConnType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_ConnType.fmtid),
    Guid.Ptr, Guid("{88190b84-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_ConnType.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_ConfigMethods := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_ConfigMethods.fmtid),
    Guid.Ptr, Guid("{88190b85-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_ConfigMethods.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_RfBand := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_RfBand.fmtid),
    Guid.Ptr, Guid("{88190b87-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_RfBand.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_AssocState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_AssocState.fmtid),
    Guid.Ptr, Guid("{88190b88-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_AssocState.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_ConfigError := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_ConfigError.fmtid),
    Guid.Ptr, Guid("{88190b89-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_ConfigError.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_ConfigState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_ConfigState.fmtid),
    Guid.Ptr, Guid("{88190b89-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_ConfigState.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_DevicePasswordId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_DevicePasswordId.fmtid),
    Guid.Ptr, Guid("{88190b89-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_DevicePasswordId.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_OSVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_OSVersion.fmtid),
    Guid.Ptr, Guid("{88190b89-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_OSVersion.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_VendorExtension := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_VendorExtension.fmtid),
    Guid.Ptr, Guid("{88190b8a-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_VendorExtension.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_WCN_RegistrarType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_WCN_RegistrarType.fmtid),
    Guid.Ptr, Guid("{88190b8b-4684-11da-a26a-0002b3988e81}"),
    UInt32, 16)
PKEY_WCN_RegistrarType.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Devinst := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Devinst.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Devinst.pid := 4097

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_DisplayAttribute := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_DisplayAttribute.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_DisplayAttribute.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_DriverDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_DriverDate.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_DriverDate.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_DriverProvider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_DriverProvider.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_DriverProvider.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_DriverVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_DriverVersion.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_DriverVersion.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Function := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Function.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Function.pid := 4099

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Icon.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Icon.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Image := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Image.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Image.pid := 4098

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Manufacturer.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Manufacturer.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Model := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Model.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Model.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Name := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Name.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Name.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_SerialNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_SerialNumber.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_SerialNumber.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_ShellAttributes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_ShellAttributes.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_ShellAttributes.pid := 4100

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Hardware_Status := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Hardware_Status.fmtid),
    Guid.Ptr, Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}"),
    UInt32, 16)
PKEY_Hardware_Status.pid := 4096

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_NAME.fmtid),
    Guid.Ptr, Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}"),
    UInt32, 16)
PKEY_NAME.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DeviceDesc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DeviceDesc.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_DeviceDesc.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_HardwareIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_HardwareIds.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_HardwareIds.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_CompatibleIds := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_CompatibleIds.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_CompatibleIds.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Service := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Service.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Service.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Class := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Class.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Class.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ClassGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ClassGuid.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_ClassGuid.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Driver := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Driver.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Driver.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ConfigFlags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ConfigFlags.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_ConfigFlags.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Manufacturer := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Manufacturer.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Manufacturer.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_FriendlyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_FriendlyName.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_FriendlyName.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_LocationInfo := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_LocationInfo.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_LocationInfo.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_PDOName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_PDOName.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_PDOName.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Capabilities := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Capabilities.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Capabilities.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_UINumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_UINumber.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_UINumber.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_UpperFilters := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_UpperFilters.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_UpperFilters.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_LowerFilters := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_LowerFilters.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_LowerFilters.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_BusTypeGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_BusTypeGuid.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_BusTypeGuid.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_LegacyBusType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_LegacyBusType.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_LegacyBusType.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_BusNumber := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_BusNumber.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_BusNumber.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_EnumeratorName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_EnumeratorName.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_EnumeratorName.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Security := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Security.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Security.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_SecuritySDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_SecuritySDS.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_SecuritySDS.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DevType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DevType.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_DevType.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Exclusive := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Exclusive.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Exclusive.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Characteristics := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Characteristics.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Characteristics.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Address := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Address.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_Address.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_UINumberDescFormat := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_UINumberDescFormat.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_UINumberDescFormat.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_PowerData := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_PowerData.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_PowerData.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_RemovalPolicy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_RemovalPolicy.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_RemovalPolicy.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_RemovalPolicyDefault := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_RemovalPolicyDefault.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_RemovalPolicyDefault.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_RemovalPolicyOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_RemovalPolicyOverride.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_RemovalPolicyOverride.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_InstallState := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_InstallState.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_InstallState.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_LocationPaths := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_LocationPaths.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_LocationPaths.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_BaseContainerId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_BaseContainerId.fmtid),
    Guid.Ptr, Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}"),
    UInt32, 16)
PKEY_Device_BaseContainerId.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DevNodeStatus := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DevNodeStatus.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_DevNodeStatus.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ProblemCode := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ProblemCode.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_ProblemCode.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_EjectionRelations := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_EjectionRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_EjectionRelations.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_RemovalRelations := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_RemovalRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_RemovalRelations.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_PowerRelations := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_PowerRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_PowerRelations.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_BusRelations := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_BusRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_BusRelations.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Parent := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Parent.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_Parent.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Children := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Children.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_Children.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Siblings := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Siblings.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_Siblings.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_TransportRelations := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_TransportRelations.fmtid),
    Guid.Ptr, Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}"),
    UInt32, 16)
PKEY_Device_TransportRelations.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Reported := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Reported.fmtid),
    Guid.Ptr, Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}"),
    UInt32, 16)
PKEY_Device_Reported.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Legacy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Legacy.fmtid),
    Guid.Ptr, Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}"),
    UInt32, 16)
PKEY_Device_Legacy.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_InstanceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_InstanceId.fmtid),
    Guid.Ptr, Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}"),
    UInt32, 16)
PKEY_Device_InstanceId.pid := 256

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ContainerId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ContainerId.fmtid),
    Guid.Ptr, Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}"),
    UInt32, 16)
PKEY_Device_ContainerId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ModelId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ModelId.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Device_ModelId.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_FriendlyNameAttributes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_FriendlyNameAttributes.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Device_FriendlyNameAttributes.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ManufacturerAttributes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ManufacturerAttributes.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Device_ManufacturerAttributes.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_PresenceNotForDevice := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_PresenceNotForDevice.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Device_PresenceNotForDevice.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_SignalStrength := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_SignalStrength.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Device_SignalStrength.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_IsAssociateableByUserAction := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_IsAssociateableByUserAction.fmtid),
    Guid.Ptr, Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}"),
    UInt32, 16)
PKEY_Device_IsAssociateableByUserAction.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Numa_Proximity_Domain := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Numa_Proximity_Domain.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Numa_Proximity_Domain.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DHP_Rebalance_Policy := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DHP_Rebalance_Policy.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Device_DHP_Rebalance_Policy.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_Numa_Node := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_Numa_Node.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Device_Numa_Node.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_BusReportedDeviceDesc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_BusReportedDeviceDesc.fmtid),
    Guid.Ptr, Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}"),
    UInt32, 16)
PKEY_Device_BusReportedDeviceDesc.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_InstallInProgress := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_InstallInProgress.fmtid),
    Guid.Ptr, Guid("{83da6326-97a6-4088-9453-a1923f573b29}"),
    UInt32, 16)
PKEY_Device_InstallInProgress.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverDate := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverDate.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverDate.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverVersion := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverVersion.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverVersion.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverDesc := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverDesc.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverDesc.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverInfPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverInfPath.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverInfPath.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverInfSection := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverInfSection.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverInfSection.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverInfSectionExt := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverInfSectionExt.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverInfSectionExt.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_MatchingDeviceId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_MatchingDeviceId.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_MatchingDeviceId.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverProvider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverProvider.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverProvider.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverPropPageProvider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverPropPageProvider.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverPropPageProvider.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverCoInstallers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverCoInstallers.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverCoInstallers.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ResourcePickerTags := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ResourcePickerTags.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_ResourcePickerTags.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_ResourcePickerExceptions := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_ResourcePickerExceptions.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_ResourcePickerExceptions.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverRank := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverRank.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverRank.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_DriverLogoLevel := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_DriverLogoLevel.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_DriverLogoLevel.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_NoConnectSound := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_NoConnectSound.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_NoConnectSound.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_GenericDriverInstalled := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_GenericDriverInstalled.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_GenericDriverInstalled.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_AdditionalSoftwareRequested := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_AdditionalSoftwareRequested.fmtid),
    Guid.Ptr, Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}"),
    UInt32, 16)
PKEY_Device_AdditionalSoftwareRequested.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_SafeRemovalRequired := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_SafeRemovalRequired.fmtid),
    Guid.Ptr, Guid("{afd97640-86a3-4210-b67c-289c41aabe55}"),
    UInt32, 16)
PKEY_Device_SafeRemovalRequired.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_Device_SafeRemovalRequiredOverride := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_Device_SafeRemovalRequiredOverride.fmtid),
    Guid.Ptr, Guid("{afd97640-86a3-4210-b67c-289c41aabe55}"),
    UInt32, 16)
PKEY_Device_SafeRemovalRequiredOverride.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DrvPkg_Model := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DrvPkg_Model.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
PKEY_DrvPkg_Model.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DrvPkg_VendorWebSite := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DrvPkg_VendorWebSite.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
PKEY_DrvPkg_VendorWebSite.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DrvPkg_DetailedDescription := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DrvPkg_DetailedDescription.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
PKEY_DrvPkg_DetailedDescription.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DrvPkg_DocumentationLink := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DrvPkg_DocumentationLink.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
PKEY_DrvPkg_DocumentationLink.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DrvPkg_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DrvPkg_Icon.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
PKEY_DrvPkg_Icon.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DrvPkg_BrandingIcon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DrvPkg_BrandingIcon.fmtid),
    Guid.Ptr, Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}"),
    UInt32, 16)
PKEY_DrvPkg_BrandingIcon.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_UpperFilters := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_UpperFilters.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_UpperFilters.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_LowerFilters := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_LowerFilters.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_LowerFilters.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_Security := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_Security.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_Security.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_SecuritySDS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_SecuritySDS.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_SecuritySDS.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_DevType := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_DevType.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_DevType.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_Exclusive := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_Exclusive.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_Exclusive.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_Characteristics := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_Characteristics.fmtid),
    Guid.Ptr, Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}"),
    UInt32, 16)
PKEY_DeviceClass_Characteristics.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_Name := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_Name.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_Name.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_ClassName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_ClassName.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_ClassName.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_Icon := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_Icon.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_Icon.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_ClassInstaller := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_ClassInstaller.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_ClassInstaller.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_PropPageProvider := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_PropPageProvider.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_PropPageProvider.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_NoInstallClass := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_NoInstallClass.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_NoInstallClass.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_NoDisplayClass := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_NoDisplayClass.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_NoDisplayClass.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_SilentInstall := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_SilentInstall.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_SilentInstall.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_NoUseClass := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_NoUseClass.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_NoUseClass.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_DefaultService := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_DefaultService.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_DefaultService.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_IconPath := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_IconPath.fmtid),
    Guid.Ptr, Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}"),
    UInt32, 16)
PKEY_DeviceClass_IconPath.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceClass_ClassCoInstallers := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceClass_ClassCoInstallers.fmtid),
    Guid.Ptr, Guid("{713d1703-a2e2-49f5-9214-56472ef3da5c}"),
    UInt32, 16)
PKEY_DeviceClass_ClassCoInstallers.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_FriendlyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_FriendlyName.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_DeviceInterface_FriendlyName.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_Enabled := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_Enabled.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_DeviceInterface_Enabled.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterface_ClassGuid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterface_ClassGuid.fmtid),
    Guid.Ptr, Guid("{026e516e-b814-414b-83cd-856d6fef4822}"),
    UInt32, 16)
PKEY_DeviceInterface_ClassGuid.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_DeviceInterfaceClass_DefaultInterface := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_DeviceInterfaceClass_DefaultInterface.fmtid),
    Guid.Ptr, Guid("{14c83a99-0b3f-44b7-be4c-a178d3990564}"),
    UInt32, 16)
PKEY_DeviceInterfaceClass_DefaultInterface.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global FD_LONGHORN := 1

/**
 * @type {String}
 */
export global FD_SUBKEY := "SOFTWARE\Microsoft\Function Discovery\"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_PNP := "Provider\Microsoft.Base.PnP"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_REGISTRY := "Provider\Microsoft.Base.Registry"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_SSDP := "Provider\Microsoft.Networking.SSDP"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_WSDISCOVERY := "Provider\Microsoft.Networking.WSD"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_NETBIOS := "Provider\Microsoft.Networking.Netbios"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_WCN := "Provider\Microsoft.Networking.WCN"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_PUBLICATION := "Provider\Microsoft.Base.Publication"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_PNPXASSOCIATION := "Provider\Microsoft.PnPX.Association"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_BT := "Provider\Microsoft.Devices.Bluetooth"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_WUSB := "Provider\Microsoft.Devices.WirelessUSB"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_DEVICEDISPLAYOBJECTS := "Provider\Microsoft.Base.DeviceDisplayObjects"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_DEVQUERYOBJECTS := "Provider\Microsoft.Base.DevQueryObjects"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_NETWORKDEVICES := "Layered\Microsoft.Networking.Devices"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_DEVICES := "Layered\Microsoft.Base.Devices"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_DEVICEFUNCTIONENUMERATORS := "Layered\Microsoft.Devices.FunctionEnumerators"

/**
 * @type {String}
 */
export global FCTN_CATEGORY_DEVICEPAIRING := "Layered\Microsoft.Base.DevicePairing"

/**
 * @type {String}
 */
export global FCTN_SUBCAT_DEVICES_WSDPRINTERS := "WSDPrinters"

/**
 * @type {String}
 */
export global FCTN_SUBCAT_NETWORKDEVICES_SSDP := "SSDP"

/**
 * @type {String}
 */
export global FCTN_SUBCAT_NETWORKDEVICES_WSD := "WSD"

/**
 * @type {String}
 */
export global FCTN_SUBCAT_REG_PUBLICATION := "Publication"

/**
 * @type {String}
 */
export global FCTN_SUBCAT_REG_DIRECTED := "Directed"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_FDCONSTRAINTNAME_LENGTH := 100

/**
 * @type {Integer (UInt32)}
 */
export global MAX_FDCONSTRAINTVALUE_LENGTH := 1000

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_PROVIDERINSTANCEID := "ProviderInstanceID"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_SUBCATEGORY := "Subcategory"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_RECURSESUBCATEGORY := "RecurseSubcategory"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_VISIBILITY := "Visibility"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_COMCLSCONTEXT := "COMClsContext"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_ROUTINGSCOPE := "RoutingScope"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_TRUE := "TRUE"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_FALSE := "FALSE"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_RECURSESUBCATEGORY_TRUE := "TRUE"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_VISIBILITY_DEFAULT := "0"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_VISIBILITY_ALL := "1"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_COMCLSCONTEXT_INPROC_SERVER := "1"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_COMCLSCONTEXT_LOCAL_SERVER := "4"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_PAIRED := "Paired"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_UNPAIRED := "UnPaired"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_ALL := "All"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_ROUTINGSCOPE_ALL := "All"

/**
 * @type {String}
 */
export global FD_CONSTRAINTVALUE_ROUTINGSCOPE_DIRECT := "Direct"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_PAIRING_STATE := "PairingState"

/**
 * @type {String}
 */
export global FD_QUERYCONSTRAINT_INQUIRY_TIMEOUT := "InquiryModeTimeout"

/**
 * @type {String}
 */
export global PROVIDERPNP_QUERYCONSTRAINT_INTERFACECLASS := "InterfaceClass"

/**
 * @type {String}
 */
export global PROVIDERPNP_QUERYCONSTRAINT_NOTPRESENT := "NotPresent"

/**
 * @type {String}
 */
export global PROVIDERPNP_QUERYCONSTRAINT_NOTIFICATIONSONLY := "NotifyOnly"

/**
 * @type {String}
 */
export global PNP_CONSTRAINTVALUE_NOTPRESENT := "TRUE"

/**
 * @type {String}
 */
export global PNP_CONSTRAINTVALUE_NOTIFICATIONSONLY := "TRUE"

/**
 * @type {String}
 */
export global PROVIDERSSDP_QUERYCONSTRAINT_TYPE := "Type"

/**
 * @type {String}
 */
export global PROVIDERSSDP_QUERYCONSTRAINT_CUSTOMXMLPROPERTY := "CustomXmlProperty"

/**
 * @type {String}
 */
export global SSDP_CONSTRAINTVALUE_TYPE_ALL := "ssdp:all"

/**
 * @type {String}
 */
export global SSDP_CONSTRAINTVALUE_TYPE_ROOT := "upnp:rootdevice"

/**
 * @type {String}
 */
export global SSDP_CONSTRAINTVALUE_TYPE_DEVICE_PREFIX := "urn:schemas-upnp-org:device:"

/**
 * @type {String}
 */
export global SSDP_CONSTRAINTVALUE_TYPE_SVC_PREFIX := "urn:schemas-upnp-org:service:"

/**
 * @type {String}
 */
export global PROVIDERWSD_QUERYCONSTRAINT_DIRECTEDADDRESS := "RemoteAddress"

/**
 * @type {String}
 */
export global PROVIDERWSD_QUERYCONSTRAINT_TYPE := "Type"

/**
 * @type {String}
 */
export global PROVIDERWSD_QUERYCONSTRAINT_SCOPE := "Scope"

/**
 * @type {String}
 */
export global PROVIDERWSD_QUERYCONSTRAINT_SECURITY_REQUIREMENTS := "SecurityRequirements"

/**
 * @type {String}
 */
export global PROVIDERWSD_QUERYCONSTRAINT_SSL_CERT_FOR_CLIENT_AUTH := "SSLClientAuthCert"

/**
 * @type {String}
 */
export global PROVIDERWSD_QUERYCONSTRAINT_SSL_CERTHASH_FOR_SERVER_AUTH := "SSLServerAuthCertHash"

/**
 * @type {String}
 */
export global WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL := "1"

/**
 * @type {String}
 */
export global WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL_AND_COMPACTSIGNATURE := "2"

/**
 * @type {String}
 */
export global WSD_CONSTRAINTVALUE_NO_TRUST_VERIFICATION := "3"

/**
 * @type {String}
 */
export global PROVIDERWNET_QUERYCONSTRAINT_TYPE := "Type"

/**
 * @type {String}
 */
export global PROVIDERWNET_QUERYCONSTRAINT_PROPERTIES := "Properties"

/**
 * @type {String}
 */
export global PROVIDERWNET_QUERYCONSTRAINT_RESOURCETYPE := "ResourceType"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_TYPE_ALL := "All"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_TYPE_SERVER := "Server"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_TYPE_DOMAIN := "Domain"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_PROPERTIES_ALL := "All"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_PROPERTIES_LIMITED := "Limited"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_RESOURCETYPE_DISK := "Disk"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_RESOURCETYPE_PRINTER := "Printer"

/**
 * @type {String}
 */
export global WNET_CONSTRAINTVALUE_RESOURCETYPE_DISKORPRINTER := "DiskOrPrinter"

/**
 * @type {String}
 */
export global ONLINE_PROVIDER_DEVICES_QUERYCONSTRAINT_OWNERNAME := "OwnerName"

/**
 * @type {String}
 */
export global PROVIDERDDO_QUERYCONSTRAINT_DEVICEFUNCTIONDISPLAYOBJECTS := "DeviceFunctionDisplayObjects"

/**
 * @type {String}
 */
export global PROVIDERDDO_QUERYCONSTRAINT_ONLYCONNECTEDDEVICES := "OnlyConnectedDevices"

/**
 * @type {String}
 */
export global PROVIDERDDO_QUERYCONSTRAINT_DEVICEINTERFACES := "DeviceInterfaces"

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_NOCONNECTION := -1882193919

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_HWFAILURE := -1882193918

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_AUTHFAILURE := -1882193917

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_CONNECTTIMEOUT := -1882193916

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_TOOMANYCONNECTIONS := -1882193915

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_AUTHNOTALLOWED := -1882193914

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_IPBUSDISABLED := -1882193913

/**
 * @type {Integer (Int32)}
 */
export global E_FDPAIRING_NOPROFILES := -1882193912
;@endregion Constants
