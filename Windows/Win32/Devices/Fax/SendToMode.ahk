#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the way a file will be faxed from within an application. With Windows Vista there is only one possible value.
 * @remarks
 * 
 * This enumeration is used primarily as a parameter for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fxsutility/nf-fxsutility-sendtofaxrecipient">SendToFaxRecipient</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fxsutility/ne-fxsutility-sendtomode
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class SendToMode{

    /**
     * The file is faxed as it is. The user cannot add typed material preceding it or following it.
     * @type {Integer (Int32)}
     */
    static SEND_TO_FAX_RECIPIENT_ATTACHMENT => 0
}
