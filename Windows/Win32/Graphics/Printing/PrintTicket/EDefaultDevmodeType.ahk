#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enables users to specify which DEVMODE to use as the source of default values when a print ticket does not specify all possible settings.
 * @remarks
 * 
 * If user defaults are not available when using kUserDefaultDevmode, queue defaults will be used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//prntvpt/ne-prntvpt-edefaultdevmodetype
 * @namespace Windows.Win32.Graphics.Printing.PrintTicket
 * @version v4.0.30319
 */
class EDefaultDevmodeType{

    /**
     * The user's default preferences.
     * @type {Integer (Int32)}
     */
    static kUserDefaultDevmode => 0

    /**
     * The print queue's default preferences.
     * @type {Integer (Int32)}
     */
    static kPrinterDefaultDevmode => 1
}
