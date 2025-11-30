#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class VIEW_OBJECT_COMPOSITION_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_OBJECT_COMPOSITION_MODE_LEGACY => 0

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_OBJECT_COMPOSITION_MODE_SURFACEPRESENTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_OBJECT_COMPOSITION_MODE_Max => 2147483647
}
