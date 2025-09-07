#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManEnumFlags{

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagNonXmlText => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagReturnObject => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagReturnEPR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagReturnObjectAndEPR => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagHierarchyDeep => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagHierarchyShallow => 32

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagHierarchyDeepBasePropsOnly => 64

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagAssociatedInstance => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagAssociationInstance => 128
}
