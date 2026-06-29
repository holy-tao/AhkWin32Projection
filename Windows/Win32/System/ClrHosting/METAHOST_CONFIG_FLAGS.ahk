#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct METAHOST_CONFIG_FLAGS {
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
    static METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_UNSET => 0

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_FALSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_MASK => 3
}
