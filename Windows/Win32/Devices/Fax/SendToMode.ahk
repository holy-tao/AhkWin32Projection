#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the way a file will be faxed from within an application. With Windows Vista there is only one possible value.
 * @remarks
 * This enumeration is used primarily as a parameter for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fxsutility/nf-fxsutility-sendtofaxrecipient">SendToFaxRecipient</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/fxsutility/ne-fxsutility-sendtomode
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct SendToMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The file is faxed as it is. The user cannot add typed material preceding it or following it.
     * @type {Integer (Int32)}
     */
    static SEND_TO_FAX_RECIPIENT_ATTACHMENT => 0
}
