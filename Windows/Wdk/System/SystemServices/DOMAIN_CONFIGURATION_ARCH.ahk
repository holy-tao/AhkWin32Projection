#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DOMAIN_CONFIGURATION_ARCH {
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
    static DomainConfigurationArm64 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DomainConfigurationX64 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DomainConfigurationInvalid => 2
}
