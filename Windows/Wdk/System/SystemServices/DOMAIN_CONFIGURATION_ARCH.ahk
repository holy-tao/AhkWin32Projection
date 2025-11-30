#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DOMAIN_CONFIGURATION_ARCH extends Win32Enum{

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
