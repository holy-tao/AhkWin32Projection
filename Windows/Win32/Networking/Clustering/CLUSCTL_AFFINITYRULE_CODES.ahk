#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSCTL_AFFINITYRULE_CODES extends Win32Enum {

    /**
     * Native name: CLUSCTL_AFFINITYRULE_GET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTIES => 150995033

    /**
     * Native name: CLUSCTL_AFFINITYRULE_GET_RO_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_COMMON_PROPERTIES => 150995029

    /**
     * Native name: CLUSCTL_AFFINITYRULE_SET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_COMMON_PROPERTIES => 155189342

    /**
     * Native name: CLUSCTL_AFFINITYRULE_GET_ID
     * @type {Integer (Int32)}
     */
    static GET_ID => 150995001

    /**
     * Native name: CLUSCTL_AFFINITYRULE_GET_GROUPNAMES
     * @type {Integer (Int32)}
     */
    static GET_GROUPNAMES => 151006577
}
