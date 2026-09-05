#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class PrintSchemaSelectionType extends Win32Enum {

    /**
     * Native name: PrintSchemaSelectionType_PickOne
     * @type {Integer (Int32)}
     */
    static PickOne => 0

    /**
     * Native name: PrintSchemaSelectionType_PickMany
     * @type {Integer (Int32)}
     */
    static PickMany => 1
}
