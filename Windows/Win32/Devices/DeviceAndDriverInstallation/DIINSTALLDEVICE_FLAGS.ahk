#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DIINSTALLDEVICE_FLAGS {
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
    static DIIDFLAG_SHOWSEARCHUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_NOFINISHINSTALLUI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_INSTALLNULLDRIVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_INSTALLCOPYINFDRIVERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_BITS => 15
}
