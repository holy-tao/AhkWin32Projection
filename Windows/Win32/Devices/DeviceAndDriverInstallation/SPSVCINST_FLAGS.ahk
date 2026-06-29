#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SPSVCINST_FLAGS {
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
    static SPSVCINST_TAGTOFRONT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_ASSOCSERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_DELETEEVENTLOGENTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_DISPLAYNAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_STARTTYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_ERRORCONTROL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_LOADORDERGROUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_DEPENDENCIES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_DESCRIPTION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_STOPSERVICE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_CLOBBER_SECURITY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_STARTSERVICE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_REQUIREDPRIVILEGES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_TRIGGERS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_SERVICESIDTYPE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_DELAYEDAUTOSTART => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_UNIQUE_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_FAILUREACTIONS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SPSVCINST_NOCLOBBER_BOOTFLAGS => 262144
}
