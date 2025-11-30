#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_TRUST_ATTRIBUTES extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_NON_TRANSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_UPLEVEL_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_FILTER_SIDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_FOREST_TRANSITIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_CROSS_ORGANIZATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_WITHIN_FOREST => 32
}
