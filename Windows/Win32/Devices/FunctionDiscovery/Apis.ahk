#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class FunctionDiscovery {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID_PRIVATE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID_SEARCHCOMPLETE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID_ASYNCTHREADEXIT => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID_SEARCHSTART => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID_IPADDRESSCHANGE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static FD_EVENTID_QUERYREFRESH => 1004

    /**
     * @type {Guid}
     */
    static SID_PnpProvider => Guid("{8101368e-cabb-4426-acff-96c410812000}")

    /**
     * @type {Guid}
     */
    static SID_UPnPActivator => Guid("{0d0d66eb-cf74-4164-b52f-08344672dd46}")

    /**
     * @type {Guid}
     */
    static SID_EnumInterface => Guid("{40eab0b9-4d7f-4b53-a334-1581dd9041f4}")

    /**
     * @type {Guid}
     */
    static SID_PNPXPropertyStore => Guid("{a86530b1-542f-439f-b71c-b0756b13677a}")

    /**
     * @type {Guid}
     */
    static SID_PNPXAssociation => Guid("{cee8ccc9-4f6b-4469-a235-5a22869eef03}")

    /**
     * @type {Guid}
     */
    static SID_PNPXServiceCollection => Guid("{439e80ee-a217-4712-9fa6-deabd9c2a727}")

    /**
     * @type {Guid}
     */
    static SID_FDPairingHandler => Guid("{383b69fa-5486-49da-91f5-d63c24c8e9d0}")

    /**
     * @type {Guid}
     */
    static SID_EnumDeviceFunction => Guid("{13e0e9e2-c3fa-4e3c-906e-64502fa4dc95}")

    /**
     * @type {Guid}
     */
    static SID_UnpairProvider => Guid("{89a502fc-857b-4698-a0b7-027192002f9e}")

    /**
     * @type {Guid}
     */
    static SID_DeviceDisplayStatusManager => Guid("{f59aa553-8309-46ca-9736-1ac3c62d6031}")

    /**
     * @type {Guid}
     */
    static SID_FunctionDiscoveryProviderRefresh => Guid("{2b4cbdc9-31c4-40d4-a62d-772aa174ed52}")

    /**
     * @type {Guid}
     */
    static SID_UninstallDeviceFunction => Guid("{c920566e-5671-4496-8025-bf0b89bd44cd}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FunctionInstance {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{08c0c253-a154-4746-9005-82de5317148b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static FMTID_FD => Guid("{904b03a2-471d-423c-a584-f3483238a146}")

    /**
     * @type {Integer (UInt32)}
     */
    static FD_Visibility_Default => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FD_Visibility_Hidden => 1

    /**
     * @type {Guid}
     */
    static FMTID_Device => Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")

    /**
     * @type {Guid}
     */
    static FMTID_DeviceInterface => Guid("{53808008-07bb-4661-bc3c-b5953e708560}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Address {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 51
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_DiscoveryMethod {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 52
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsEncrypted {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 53
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsAuthenticated {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 54
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsConnected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 55
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsPaired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 56
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 57
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Version {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 65
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Last_Seen {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 66
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Last_Connected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 67
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsShowInDisconnectedState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 68
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsLocalMachine {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 70
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_MetadataPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 71
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsMetadataSearchInProgress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 72
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_MetadataChecksum {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 73
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsNotInterestingForDisplay {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 74
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 76
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 77
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_BaselineExperienceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 78
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 79
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_AssociationArray {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 80
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_DeviceDescription1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 81
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_DeviceDescription2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 82
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsNotWorkingProperly {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 83
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsSharedDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 84
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsNetworkDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 85
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_IsDefaultDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 86
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_MetadataCabinet {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 87
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_RequiresPairingElevation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 88
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_ExperienceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 89
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Category {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 90
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Category_Desc_Singular {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 91
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Category_Desc_Plural {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 92
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Category_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 93
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_CategoryGroup_Desc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 94
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_CategoryGroup_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 95
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_PrimaryCategory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 97
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_UnpairUninstall {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 98
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_RequiresUninstallElevation {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 99
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_DeviceFunctionSubRank {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_FriendlyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12288
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8192
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_ModelName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8194
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_ModelNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8195
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceDisplay_InstallInProgress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static FMTID_Pairing => Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Pairing_ListItemText {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Pairing_ListItemDescription {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Pairing_ListItemIcon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Pairing_ListItemDefault {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Pairing_IsWifiOnlyDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8807cae6-7db6-4f10-8ee4-435eaa1392bc}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH => "Bluetooth"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH_LE => "Bluetooth Low Energy"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_NETBIOS => "NetBIOS"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_AD_PRINTER => "Published Printer"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_PNP => "PnP"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_UPNP => "UPnP"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_WSD => "WSD"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_WUSB => "WUSB"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_WFD => "WiFiDirect"

    /**
     * @type {String}
     */
    static DEVICEDISPLAY_DISCOVERYMETHOD_ASP_INFRA => "AspInfra"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_BIOSVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{eaee7f1d-6a33-44d1-9441-5f46def23198}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static FMTID_WSD => Guid("{92506491-ff95-4724-a05a-5b81885a7c92}")

    /**
     * @type {Guid}
     */
    static FMTID_PNPX => Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_GlobalIdentity {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4096
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Types {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4097
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Scopes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4098
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_XAddrs {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4099
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_MetadataVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4101
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_RemoteAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4102
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_RootProxy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4103
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ManufacturerUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8193
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ModelUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8196
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Upc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8197
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_PresentationUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8198
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_FirmwareVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12289
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_SerialNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12290
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_DeviceCategory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12292
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_SecureChannel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28673
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_CompactSignature {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28674
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_DeviceCertHash {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28675
            return value
        }
    }

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_COMPUTER => "Computers"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_INPUTDEVICE => "Input"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_PRINTER => "Printers"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_SCANNER => "Scanners"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_FAX => "FAX"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_MFP => "MFP"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_CAMERA => "Cameras"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_STORAGE => "Storage"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_NETWORK_INFRASTRUCTURE => "NetworkInfrastructure"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_DISPLAYS => "Displays"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_MULTIMEDIA_DEVICE => "MediaDevices"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_GAMING_DEVICE => "Gaming"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_TELEPHONE => "Phones"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_HOME_AUTOMATION_SYSTEM => "HomeAutomation"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_HOME_SECURITY_SYSTEM => "HomeSecurity"

    /**
     * @type {String}
     */
    static PNPX_DEVICECATEGORY_OTHER => "Other"

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_DeviceCategory_Desc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12293
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Category_Desc_NonPlural {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12304
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_PhysicalAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12294
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_NetworkInterfaceLuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12295
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_NetworkInterfaceGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12296
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_IpAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12297
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ServiceAddress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16384
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ServiceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16385
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ServiceTypes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16386
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ServiceControlUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16388
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ServiceDescUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16389
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ServiceEventSubUrl {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16390
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_DomainName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20480
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_ShareName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20482
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SSDP_AltLocationInfo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24576
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SSDP_DevLifeTime {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24577
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SSDP_NetworkInterface {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24578
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static FMTID_PNPXDynamicProperty => Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Installable {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Associated {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_CompatibleTypes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_InstallState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4fc5077e-b686-44be-93e3-86cafe368ccd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PNPX_INSTALLSTATE_NOTINSTALLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PNPX_INSTALLSTATE_INSTALLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNPX_INSTALLSTATE_INSTALLING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PNPX_INSTALLSTATE_FAILED => 3

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_Removable {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28672
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PNPX_IPBusEnumerated {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28688
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_Scope {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_Type {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_DisplayType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_Usage {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_LocalName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_RemoteName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_Comment {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WNET_Provider {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{debda43a-37b3-4383-91e7-4498da2995ab}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_Version {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b80-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_RequestType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b81-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_AuthType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b82-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_EncryptType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b83-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_ConnType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b84-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_ConfigMethods {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b85-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_RfBand {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b87-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_AssocState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b88-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_ConfigError {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b89-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_ConfigState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b89-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_DevicePasswordId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b89-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_OSVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b89-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_VendorExtension {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b8a-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_RegistrarType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b8b-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Devinst {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4097
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_DisplayAttribute {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_DriverDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_DriverProvider {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_DriverVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Function {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4099
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Image {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4098
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Model {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Name {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_SerialNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_ShellAttributes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4100
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Hardware_Status {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{5eaf3ef2-e0ca-4598-bf06-71ed1d9dd953}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4096
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b725f130-47ef-101a-a5f1-02608c9eebac}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DeviceDesc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_HardwareIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_CompatibleIds {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Service {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Class {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ClassGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Driver {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ConfigFlags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Manufacturer {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_FriendlyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_LocationInfo {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_PDOName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Capabilities {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_UINumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_UpperFilters {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_LowerFilters {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_BusTypeGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_LegacyBusType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_BusNumber {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_EnumeratorName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Security {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_SecuritySDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DevType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Exclusive {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Characteristics {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Address {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_UINumberDescFormat {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_PowerData {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_RemovalPolicy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_RemovalPolicyDefault {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_RemovalPolicyOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_InstallState {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_LocationPaths {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_BaseContainerId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a45c254e-df1c-4efd-8020-67d146a850e0}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DevNodeStatus {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ProblemCode {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_EjectionRelations {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_RemovalRelations {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_PowerRelations {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_BusRelations {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Parent {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Children {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Siblings {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_TransportRelations {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4340a6c5-93fa-4706-972c-7b648008a5a7}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Reported {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Legacy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80497100-8c73-48b9-aad9-ce387e19c56e}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_InstanceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{78c34fc8-104a-4aca-9ea4-524d52996e57}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 256
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ContainerId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8c7ed206-3f8a-4827-b3ab-ae9e1faefc6c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ModelId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_FriendlyNameAttributes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ManufacturerAttributes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_PresenceNotForDevice {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_SignalStrength {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_IsAssociateableByUserAction {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{80d81ea6-7473-4b0c-8216-efc11a2c4c8b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Numa_Proximity_Domain {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DHP_Rebalance_Policy {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_Numa_Node {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_BusReportedDeviceDesc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{540b947e-8b40-45bc-a8a2-6a0b894cbda2}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_InstallInProgress {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{83da6326-97a6-4088-9453-a1923f573b29}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverDate {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverVersion {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverDesc {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverInfPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverInfSection {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverInfSectionExt {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_MatchingDeviceId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverProvider {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverPropPageProvider {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverCoInstallers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ResourcePickerTags {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_ResourcePickerExceptions {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverRank {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_DriverLogoLevel {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_NoConnectSound {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_GenericDriverInstalled {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_AdditionalSoftwareRequested {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{a8b865dd-2e3d-4094-ad97-e593a70c75d6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_SafeRemovalRequired {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afd97640-86a3-4210-b67c-289c41aabe55}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_Device_SafeRemovalRequiredOverride {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{afd97640-86a3-4210-b67c-289c41aabe55}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DrvPkg_Model {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DrvPkg_VendorWebSite {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DrvPkg_DetailedDescription {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DrvPkg_DocumentationLink {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DrvPkg_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DrvPkg_BrandingIcon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{cf73bb51-3abf-44a2-85e0-9a3dc7a12132}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_UpperFilters {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_LowerFilters {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_Security {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_SecuritySDS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_DevType {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_Exclusive {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_Characteristics {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4321918b-f69e-470d-a5de-4d88c75ad24b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_Name {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_ClassName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_Icon {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_ClassInstaller {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_PropPageProvider {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_NoInstallClass {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_NoDisplayClass {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_SilentInstall {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_NoUseClass {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_DefaultService {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_IconPath {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{259abffc-50a7-47ce-af08-68c9a7d73366}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceClass_ClassCoInstallers {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{713d1703-a2e2-49f5-9214-56472ef3da5c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_FriendlyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_Enabled {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterface_ClassGuid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{026e516e-b814-414b-83cd-856d6fef4822}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_DeviceInterfaceClass_DefaultInterface {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{14c83a99-0b3f-44b7-be4c-a178d3990564}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static FD_LONGHORN => 1

    /**
     * @type {String}
     */
    static FD_SUBKEY => "SOFTWARE\Microsoft\Function Discovery\"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_PNP => "Provider\Microsoft.Base.PnP"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_REGISTRY => "Provider\Microsoft.Base.Registry"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_SSDP => "Provider\Microsoft.Networking.SSDP"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_WSDISCOVERY => "Provider\Microsoft.Networking.WSD"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_NETBIOS => "Provider\Microsoft.Networking.Netbios"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_WCN => "Provider\Microsoft.Networking.WCN"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_PUBLICATION => "Provider\Microsoft.Base.Publication"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_PNPXASSOCIATION => "Provider\Microsoft.PnPX.Association"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_BT => "Provider\Microsoft.Devices.Bluetooth"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_WUSB => "Provider\Microsoft.Devices.WirelessUSB"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_DEVICEDISPLAYOBJECTS => "Provider\Microsoft.Base.DeviceDisplayObjects"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_DEVQUERYOBJECTS => "Provider\Microsoft.Base.DevQueryObjects"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_NETWORKDEVICES => "Layered\Microsoft.Networking.Devices"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_DEVICES => "Layered\Microsoft.Base.Devices"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_DEVICEFUNCTIONENUMERATORS => "Layered\Microsoft.Devices.FunctionEnumerators"

    /**
     * @type {String}
     */
    static FCTN_CATEGORY_DEVICEPAIRING => "Layered\Microsoft.Base.DevicePairing"

    /**
     * @type {String}
     */
    static FCTN_SUBCAT_DEVICES_WSDPRINTERS => "WSDPrinters"

    /**
     * @type {String}
     */
    static FCTN_SUBCAT_NETWORKDEVICES_SSDP => "SSDP"

    /**
     * @type {String}
     */
    static FCTN_SUBCAT_NETWORKDEVICES_WSD => "WSD"

    /**
     * @type {String}
     */
    static FCTN_SUBCAT_REG_PUBLICATION => "Publication"

    /**
     * @type {String}
     */
    static FCTN_SUBCAT_REG_DIRECTED => "Directed"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FDCONSTRAINTNAME_LENGTH => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FDCONSTRAINTVALUE_LENGTH => 1000

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_PROVIDERINSTANCEID => "ProviderInstanceID"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_SUBCATEGORY => "Subcategory"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_RECURSESUBCATEGORY => "RecurseSubcategory"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_VISIBILITY => "Visibility"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_COMCLSCONTEXT => "COMClsContext"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_ROUTINGSCOPE => "RoutingScope"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_TRUE => "TRUE"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_FALSE => "FALSE"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_RECURSESUBCATEGORY_TRUE => "TRUE"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_VISIBILITY_DEFAULT => "0"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_VISIBILITY_ALL => "1"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_COMCLSCONTEXT_INPROC_SERVER => "1"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_COMCLSCONTEXT_LOCAL_SERVER => "4"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_PAIRED => "Paired"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_UNPAIRED => "UnPaired"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_ALL => "All"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_ROUTINGSCOPE_ALL => "All"

    /**
     * @type {String}
     */
    static FD_CONSTRAINTVALUE_ROUTINGSCOPE_DIRECT => "Direct"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_PAIRING_STATE => "PairingState"

    /**
     * @type {String}
     */
    static FD_QUERYCONSTRAINT_INQUIRY_TIMEOUT => "InquiryModeTimeout"

    /**
     * @type {String}
     */
    static PROVIDERPNP_QUERYCONSTRAINT_INTERFACECLASS => "InterfaceClass"

    /**
     * @type {String}
     */
    static PROVIDERPNP_QUERYCONSTRAINT_NOTPRESENT => "NotPresent"

    /**
     * @type {String}
     */
    static PROVIDERPNP_QUERYCONSTRAINT_NOTIFICATIONSONLY => "NotifyOnly"

    /**
     * @type {String}
     */
    static PNP_CONSTRAINTVALUE_NOTPRESENT => "TRUE"

    /**
     * @type {String}
     */
    static PNP_CONSTRAINTVALUE_NOTIFICATIONSONLY => "TRUE"

    /**
     * @type {String}
     */
    static PROVIDERSSDP_QUERYCONSTRAINT_TYPE => "Type"

    /**
     * @type {String}
     */
    static PROVIDERSSDP_QUERYCONSTRAINT_CUSTOMXMLPROPERTY => "CustomXmlProperty"

    /**
     * @type {String}
     */
    static SSDP_CONSTRAINTVALUE_TYPE_ALL => "ssdp:all"

    /**
     * @type {String}
     */
    static SSDP_CONSTRAINTVALUE_TYPE_ROOT => "upnp:rootdevice"

    /**
     * @type {String}
     */
    static SSDP_CONSTRAINTVALUE_TYPE_DEVICE_PREFIX => "urn:schemas-upnp-org:device:"

    /**
     * @type {String}
     */
    static SSDP_CONSTRAINTVALUE_TYPE_SVC_PREFIX => "urn:schemas-upnp-org:service:"

    /**
     * @type {String}
     */
    static PROVIDERWSD_QUERYCONSTRAINT_DIRECTEDADDRESS => "RemoteAddress"

    /**
     * @type {String}
     */
    static PROVIDERWSD_QUERYCONSTRAINT_TYPE => "Type"

    /**
     * @type {String}
     */
    static PROVIDERWSD_QUERYCONSTRAINT_SCOPE => "Scope"

    /**
     * @type {String}
     */
    static PROVIDERWSD_QUERYCONSTRAINT_SECURITY_REQUIREMENTS => "SecurityRequirements"

    /**
     * @type {String}
     */
    static PROVIDERWSD_QUERYCONSTRAINT_SSL_CERT_FOR_CLIENT_AUTH => "SSLClientAuthCert"

    /**
     * @type {String}
     */
    static PROVIDERWSD_QUERYCONSTRAINT_SSL_CERTHASH_FOR_SERVER_AUTH => "SSLServerAuthCertHash"

    /**
     * @type {String}
     */
    static WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL => "1"

    /**
     * @type {String}
     */
    static WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL_AND_COMPACTSIGNATURE => "2"

    /**
     * @type {String}
     */
    static WSD_CONSTRAINTVALUE_NO_TRUST_VERIFICATION => "3"

    /**
     * @type {String}
     */
    static PROVIDERWNET_QUERYCONSTRAINT_TYPE => "Type"

    /**
     * @type {String}
     */
    static PROVIDERWNET_QUERYCONSTRAINT_PROPERTIES => "Properties"

    /**
     * @type {String}
     */
    static PROVIDERWNET_QUERYCONSTRAINT_RESOURCETYPE => "ResourceType"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_TYPE_ALL => "All"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_TYPE_SERVER => "Server"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_TYPE_DOMAIN => "Domain"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_PROPERTIES_ALL => "All"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_PROPERTIES_LIMITED => "Limited"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_RESOURCETYPE_DISK => "Disk"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_RESOURCETYPE_PRINTER => "Printer"

    /**
     * @type {String}
     */
    static WNET_CONSTRAINTVALUE_RESOURCETYPE_DISKORPRINTER => "DiskOrPrinter"

    /**
     * @type {String}
     */
    static ONLINE_PROVIDER_DEVICES_QUERYCONSTRAINT_OWNERNAME => "OwnerName"

    /**
     * @type {String}
     */
    static PROVIDERDDO_QUERYCONSTRAINT_DEVICEFUNCTIONDISPLAYOBJECTS => "DeviceFunctionDisplayObjects"

    /**
     * @type {String}
     */
    static PROVIDERDDO_QUERYCONSTRAINT_ONLYCONNECTEDDEVICES => "OnlyConnectedDevices"

    /**
     * @type {String}
     */
    static PROVIDERDDO_QUERYCONSTRAINT_DEVICEINTERFACES => "DeviceInterfaces"

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_NOCONNECTION => -1882193919

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_HWFAILURE => -1882193918

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_AUTHFAILURE => -1882193917

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_CONNECTTIMEOUT => -1882193916

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_TOOMANYCONNECTIONS => -1882193915

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_AUTHNOTALLOWED => -1882193914

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_IPBUSDISABLED => -1882193913

    /**
     * @type {Integer (Int32)}
     */
    static E_FDPAIRING_NOPROFILES => -1882193912
;@endregion Constants

;@region Methods
;@endregion Methods
}
