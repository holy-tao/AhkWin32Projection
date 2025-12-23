#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintSchemaSelectionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaSelectionType_PickOne => 0

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaSelectionType_PickMany => 1
}
