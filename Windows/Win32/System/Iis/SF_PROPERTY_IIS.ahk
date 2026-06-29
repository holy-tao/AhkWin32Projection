#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct SF_PROPERTY_IIS {
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
    static SF_PROPERTY_SSL_CTXT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SF_PROPERTY_INSTANCE_NUM_ID => 1
}
