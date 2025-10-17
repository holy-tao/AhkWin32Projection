#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
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
     * @type {String}
     */
    static SID_PnpProvider => "{8101368e-cabb-4426-acff-96c410812000}"

    /**
     * @type {String}
     */
    static SID_UPnPActivator => "{0d0d66eb-cf74-4164-b52f-08344672dd46}"

    /**
     * @type {String}
     */
    static SID_EnumInterface => "{40eab0b9-4d7f-4b53-a334-1581dd9041f4}"

    /**
     * @type {String}
     */
    static SID_PNPXPropertyStore => "{a86530b1-542f-439f-b71c-b0756b13677a}"

    /**
     * @type {String}
     */
    static SID_PNPXAssociation => "{cee8ccc9-4f6b-4469-a235-5a22869eef03}"

    /**
     * @type {String}
     */
    static SID_PNPXServiceCollection => "{439e80ee-a217-4712-9fa6-deabd9c2a727}"

    /**
     * @type {String}
     */
    static SID_FDPairingHandler => "{383b69fa-5486-49da-91f5-d63c24c8e9d0}"

    /**
     * @type {String}
     */
    static SID_EnumDeviceFunction => "{13e0e9e2-c3fa-4e3c-906e-64502fa4dc95}"

    /**
     * @type {String}
     */
    static SID_UnpairProvider => "{89a502fc-857b-4698-a0b7-027192002f9e}"

    /**
     * @type {String}
     */
    static SID_DeviceDisplayStatusManager => "{f59aa553-8309-46ca-9736-1ac3c62d6031}"

    /**
     * @type {String}
     */
    static SID_FunctionDiscoveryProviderRefresh => "{2b4cbdc9-31c4-40d4-a62d-772aa174ed52}"

    /**
     * @type {String}
     */
    static SID_UninstallDeviceFunction => "{c920566e-5671-4496-8025-bf0b89bd44cd}"

    /**
     * @type {String}
     */
    static FMTID_FD => "{904b03a2-471d-423c-a584-f3483238a146}"

    /**
     * @type {Integer (UInt32)}
     */
    static FD_Visibility_Default => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FD_Visibility_Hidden => 1

    /**
     * @type {String}
     */
    static FMTID_Device => "{78c34fc8-104a-4aca-9ea4-524d52996e57}"

    /**
     * @type {String}
     */
    static FMTID_DeviceInterface => "{53808008-07bb-4661-bc3c-b5953e708560}"

    /**
     * @type {String}
     */
    static FMTID_Pairing => "{8807cae6-7db6-4f10-8ee4-435eaa1392bc}"

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
     * @type {String}
     */
    static FMTID_WSD => "{92506491-ff95-4724-a05a-5b81885a7c92}"

    /**
     * @type {String}
     */
    static FMTID_PNPX => "{656a3bb3-ecc0-43fd-8477-4ae0404a96cd}"

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
     * @type {String}
     */
    static FMTID_PNPXDynamicProperty => "{4fc5077e-b686-44be-93e3-86cafe368ccd}"

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
