#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_CREDENTIAL_KEY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InvalidCredKey => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeprecatedIUMCredKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static DomainUserCredKey => 2

    /**
     * @type {Integer (Int32)}
     */
    static LocalUserCredKey => 3

    /**
     * @type {Integer (Int32)}
     */
    static ExternallySuppliedCredKey => 4
}
