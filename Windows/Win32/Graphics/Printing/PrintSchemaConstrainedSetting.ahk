#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintSchemaConstrainedSetting extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_PrintTicket => 1

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_Admin => 2

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaConstrainedSetting_Device => 3
}
