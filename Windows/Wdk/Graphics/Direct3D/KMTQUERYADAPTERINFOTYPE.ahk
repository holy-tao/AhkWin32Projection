#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class KMTQUERYADAPTERINFOTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_UMDRIVERPRIVATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_UMDRIVERNAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_UMOPENGLINFO => 2

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_GETSEGMENTSIZE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERGUID => 4

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_FLIPQUEUEINFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERADDRESS => 6

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_SETWORKINGSETINFO => 7

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERREGISTRYINFO => 8

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_CURRENTDISPLAYMODE => 9

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MODELIST => 10

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_CHECKDRIVERUPDATESTATUS => 11

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_VIRTUALADDRESSINFO => 12

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DRIVERVERSION => 13

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERTYPE => 15

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_OUTPUTDUPLCONTEXTSCOUNT => 16

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_1_2_CAPS => 17

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_UMD_DRIVER_VERSION => 18

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DIRECTFLIP_SUPPORT => 19

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MULTIPLANEOVERLAY_SUPPORT => 20

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DLIST_DRIVER_NAME => 21

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_1_3_CAPS => 22

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MULTIPLANEOVERLAY_HUD_SUPPORT => 23

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_2_0_CAPS => 24

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_NODEMETADATA => 25

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_CPDRIVERNAME => 26

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_XBOX => 27

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_INDEPENDENTFLIP_SUPPORT => 28

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MIRACASTCOMPANIONDRIVERNAME => 29

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_PHYSICALADAPTERCOUNT => 30

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_PHYSICALADAPTERDEVICEIDS => 31

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DRIVERCAPS_EXT => 32

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERY_MIRACAST_DRIVER_TYPE => 33

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERY_GPUMMU_CAPS => 34

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERY_MULTIPLANEOVERLAY_DECODE_SUPPORT => 35

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERY_HW_PROTECTION_TEARDOWN_COUNT => 36

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERY_ISBADDRIVERFORHWPROTECTIONDISABLED => 37

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MULTIPLANEOVERLAY_SECONDARY_SUPPORT => 38

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_INDEPENDENTFLIP_SECONDARY_SUPPORT => 39

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_PANELFITTER_SUPPORT => 40

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_PHYSICALADAPTERPNPKEY => 41

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_GETSEGMENTGROUPSIZE => 42

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MPO3DDI_SUPPORT => 43

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_HWDRM_SUPPORT => 44

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MPOKERNELCAPS_SUPPORT => 45

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_MULTIPLANEOVERLAY_STRETCH_SUPPORT => 46

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_GET_DEVICE_VIDPN_OWNERSHIP_INFO => 47

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERYREGISTRY => 48

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_KMD_DRIVER_VERSION => 49

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_BLOCKLIST_KERNEL => 50

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_BLOCKLIST_RUNTIME => 51

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERGUID_RENDER => 52

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERADDRESS_RENDER => 53

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERREGISTRYINFO_RENDER => 54

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_CHECKDRIVERUPDATESTATUS_RENDER => 55

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DRIVERVERSION_RENDER => 56

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERTYPE_RENDER => 57

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_1_2_CAPS_RENDER => 58

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_1_3_CAPS_RENDER => 59

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_QUERY_ADAPTER_UNIQUE_GUID => 60

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_NODEPERFDATA => 61

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERPERFDATA => 62

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_ADAPTERPERFDATA_CAPS => 63

    /**
     * @type {Integer (Int32)}
     */
    static KMTQUITYPE_GPUVERSION => 64

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DRIVER_DESCRIPTION => 65

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DRIVER_DESCRIPTION_RENDER => 66

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_SCANOUT_CAPS => 67

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DISPLAY_UMDRIVERNAME => 71

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_PARAVIRTUALIZATION_RENDER => 68

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_SERVICENAME => 69

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_2_7_CAPS => 70

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_TRACKEDWORKLOAD_SUPPORT => 72

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_HYBRID_DLIST_DLL_SUPPORT => 73

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_DISPLAY_CAPS => 74

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_2_9_CAPS => 75

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_CROSSADAPTERRESOURCE_SUPPORT => 76

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_3_0_CAPS => 77

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WSAUMDIMAGENAME => 78

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_VGPUINTERFACEID => 79

    /**
     * @type {Integer (Int32)}
     */
    static KMTQAITYPE_WDDM_3_1_CAPS => 80
}
