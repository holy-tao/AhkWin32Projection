#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SETUP_DI_REGISTRY_PROPERTY {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_DEVICEDESC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_HARDWAREID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_COMPATIBLEIDS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_UNUSED0 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_SERVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_UNUSED1 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_UNUSED2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_CLASS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_CLASSGUID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_DRIVER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_CONFIGFLAGS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_MFG => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_FRIENDLYNAME => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_LOCATION_INFORMATION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_PHYSICAL_DEVICE_OBJECT_NAME => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_CAPABILITIES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_UI_NUMBER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_UPPERFILTERS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_LOWERFILTERS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_BUSTYPEGUID => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_LEGACYBUSTYPE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_BUSNUMBER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_ENUMERATOR_NAME => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_SECURITY => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_SECURITY_SDS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_DEVTYPE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_EXCLUSIVE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_CHARACTERISTICS => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_ADDRESS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_UI_NUMBER_DESC_FORMAT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_DEVICE_POWER_DATA => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_REMOVAL_POLICY => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_REMOVAL_POLICY_HW_DEFAULT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_REMOVAL_POLICY_OVERRIDE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_INSTALL_STATE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_LOCATION_PATHS => 35

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_BASE_CONTAINERID => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SPDRP_MAXIMUM_PROPERTY => 37
}
