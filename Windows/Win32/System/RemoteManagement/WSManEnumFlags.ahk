#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
class WSManEnumFlags extends Win32Enum {

    /**
     * Native name: WSManFlagNonXmlText
     * @type {Integer (Int32)}
     */
    static FlagNonXmlText => 1

    /**
     * Native name: WSManFlagReturnObject
     * @type {Integer (Int32)}
     */
    static FlagReturnObject => 0

    /**
     * Native name: WSManFlagReturnEPR
     * @type {Integer (Int32)}
     */
    static FlagReturnEPR => 2

    /**
     * Native name: WSManFlagReturnObjectAndEPR
     * @type {Integer (Int32)}
     */
    static FlagReturnObjectAndEPR => 4

    /**
     * Native name: WSManFlagHierarchyDeep
     * @type {Integer (Int32)}
     */
    static FlagHierarchyDeep => 0

    /**
     * Native name: WSManFlagHierarchyShallow
     * @type {Integer (Int32)}
     */
    static FlagHierarchyShallow => 32

    /**
     * Native name: WSManFlagHierarchyDeepBasePropsOnly
     * @type {Integer (Int32)}
     */
    static FlagHierarchyDeepBasePropsOnly => 64

    /**
     * Native name: WSManFlagAssociatedInstance
     * @type {Integer (Int32)}
     */
    static FlagAssociatedInstance => 0

    /**
     * Native name: WSManFlagAssociationInstance
     * @type {Integer (Int32)}
     */
    static FlagAssociationInstance => 128
}
