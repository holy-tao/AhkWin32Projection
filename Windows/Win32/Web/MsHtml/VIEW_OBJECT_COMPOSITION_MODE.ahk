#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class VIEW_OBJECT_COMPOSITION_MODE extends Win32Enum {

    /**
     * Native name: VIEW_OBJECT_COMPOSITION_MODE_LEGACY
     * @type {Integer (Int32)}
     */
    static LEGACY => 0

    /**
     * Native name: VIEW_OBJECT_COMPOSITION_MODE_SURFACEPRESENTER
     * @type {Integer (Int32)}
     */
    static SURFACEPRESENTER => 1

    /**
     * Native name: VIEW_OBJECT_COMPOSITION_MODE_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
