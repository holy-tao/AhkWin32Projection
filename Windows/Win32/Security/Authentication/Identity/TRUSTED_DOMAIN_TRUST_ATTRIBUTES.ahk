#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class TRUSTED_DOMAIN_TRUST_ATTRIBUTES extends Win32Enum {

    /**
     * Native name: TRUST_ATTRIBUTE_NON_TRANSITIVE
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_NON_TRANSITIVE => 1

    /**
     * Native name: TRUST_ATTRIBUTE_UPLEVEL_ONLY
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_UPLEVEL_ONLY => 2

    /**
     * Native name: TRUST_ATTRIBUTE_FILTER_SIDS
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_FILTER_SIDS => 4

    /**
     * Native name: TRUST_ATTRIBUTE_FOREST_TRANSITIVE
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_FOREST_TRANSITIVE => 8

    /**
     * Native name: TRUST_ATTRIBUTE_CROSS_ORGANIZATION
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_CROSS_ORGANIZATION => 16

    /**
     * Native name: TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_TREAT_AS_EXTERNAL => 64

    /**
     * Native name: TRUST_ATTRIBUTE_WITHIN_FOREST
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_WITHIN_FOREST => 32
}
