#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DOMAIN_CONFIGURATION_ARCH extends Win32Enum {

    /**
     * Native name: DomainConfigurationArm64
     * @type {Integer (Int32)}
     */
    static Arm64 => 0

    /**
     * Native name: DomainConfigurationX64
     * @type {Integer (Int32)}
     */
    static ConfigurationX64 => 1

    /**
     * Native name: DomainConfigurationInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 2
}
