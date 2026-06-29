#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ACTIVATION_CONTEXT_INFO_CLASS {
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
    static ActivationContextBasicInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static ActivationContextDetailedInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static AssemblyDetailedInformationInActivationContext => 3

    /**
     * @type {Integer (Int32)}
     */
    static FileInformationInAssemblyOfAssemblyInActivationContext => 4

    /**
     * @type {Integer (Int32)}
     */
    static RunlevelInformationInActivationContext => 5

    /**
     * @type {Integer (Int32)}
     */
    static CompatibilityInformationInActivationContext => 6

    /**
     * @type {Integer (Int32)}
     */
    static ActivationContextManifestResourceName => 7

    /**
     * @type {Integer (Int32)}
     */
    static MaxActivationContextInfoClass => 8

    /**
     * @type {Integer (Int32)}
     */
    static AssemblyDetailedInformationInActivationContxt => 3

    /**
     * @type {Integer (Int32)}
     */
    static FileInformationInAssemblyOfAssemblyInActivationContxt => 4
}
