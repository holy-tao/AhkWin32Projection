#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class PrintSchemaConstrainedSetting extends Win32Enum {

    /**
     * Native name: PrintSchemaConstrainedSetting_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: PrintSchemaConstrainedSetting_PrintTicket
     * @type {Integer (Int32)}
     */
    static PrintTicket => 1

    /**
     * Native name: PrintSchemaConstrainedSetting_Admin
     * @type {Integer (Int32)}
     */
    static Admin => 2

    /**
     * Native name: PrintSchemaConstrainedSetting_Device
     * @type {Integer (Int32)}
     */
    static Device => 3
}
