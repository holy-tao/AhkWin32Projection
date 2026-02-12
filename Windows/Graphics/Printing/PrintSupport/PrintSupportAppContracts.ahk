#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportAppContracts extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JobBackgroundSession => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SettingsUI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Extension => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JobUI => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VirtualPrinterBackgroundSession => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EnterpriseManagementUI => 32
}
