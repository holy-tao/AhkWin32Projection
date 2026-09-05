#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_TOPOLOGY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_NODE_TYPES
     * @type {Integer (Int32)}
     */
    static NODE_TYPES => 0

    /**
     * Native name: KSPROPERTY_BDA_PIN_TYPES
     * @type {Integer (Int32)}
     */
    static PIN_TYPES => 1

    /**
     * Native name: KSPROPERTY_BDA_TEMPLATE_CONNECTIONS
     * @type {Integer (Int32)}
     */
    static TEMPLATE_CONNECTIONS => 2

    /**
     * Native name: KSPROPERTY_BDA_NODE_METHODS
     * @type {Integer (Int32)}
     */
    static NODE_METHODS => 3

    /**
     * Native name: KSPROPERTY_BDA_NODE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static NODE_PROPERTIES => 4

    /**
     * Native name: KSPROPERTY_BDA_NODE_EVENTS
     * @type {Integer (Int32)}
     */
    static NODE_EVENTS => 5

    /**
     * Native name: KSPROPERTY_BDA_CONTROLLING_PIN_ID
     * @type {Integer (Int32)}
     */
    static CONTROLLING_PIN_ID => 6

    /**
     * Native name: KSPROPERTY_BDA_NODE_DESCRIPTORS
     * @type {Integer (Int32)}
     */
    static NODE_DESCRIPTORS => 7
}
