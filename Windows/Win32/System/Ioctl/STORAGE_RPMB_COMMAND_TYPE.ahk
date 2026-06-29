#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_RPMB_COMMAND_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbProgramAuthKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbQueryWriteCounter => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedWrite => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedRead => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbReadResultRequest => 5

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedDeviceConfigWrite => 6

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedDeviceConfigRead => 7
}
