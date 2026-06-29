#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enables users to specify which DEVMODE to use as the source of default values when a print ticket does not specify all possible settings.
 * @remarks
 * If user defaults are not available when using kUserDefaultDevmode, queue defaults will be used.
 * @see https://learn.microsoft.com/windows/win32/api/prntvpt/ne-prntvpt-edefaultdevmodetype
 * @namespace Windows.Win32.Graphics.Printing.PrintTicket
 */
export default struct EDefaultDevmodeType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
