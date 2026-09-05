#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIA_LANDMARKTYPE_ID extends Win32Enum {

    /**
     * Native name: UIA_CustomLandmarkTypeId
     * @type {Integer (Int32)}
     */
    static CustomLandmarkTypeId => 80000

    /**
     * Native name: UIA_FormLandmarkTypeId
     * @type {Integer (Int32)}
     */
    static FormLandmarkTypeId => 80001

    /**
     * Native name: UIA_MainLandmarkTypeId
     * @type {Integer (Int32)}
     */
    static MainLandmarkTypeId => 80002

    /**
     * Native name: UIA_NavigationLandmarkTypeId
     * @type {Integer (Int32)}
     */
    static NavigationLandmarkTypeId => 80003

    /**
     * Native name: UIA_SearchLandmarkTypeId
     * @type {Integer (Int32)}
     */
    static SearchLandmarkTypeId => 80004
}
