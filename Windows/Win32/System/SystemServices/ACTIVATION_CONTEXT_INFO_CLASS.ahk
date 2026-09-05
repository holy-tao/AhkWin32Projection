#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ACTIVATION_CONTEXT_INFO_CLASS extends Win32Enum {

    /**
     * Native name: ActivationContextBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 1

    /**
     * Native name: ActivationContextDetailedInformation
     * @type {Integer (Int32)}
     */
    static DetailedInformation => 2

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
     * Native name: ActivationContextManifestResourceName
     * @type {Integer (Int32)}
     */
    static ManifestResourceName => 7

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
