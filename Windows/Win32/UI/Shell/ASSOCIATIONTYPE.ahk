#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of association for an application. Used by methods of the IApplicationAssociationRegistration interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-associationtype
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ASSOCIATIONTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a file name extension, such as <c>.htm</code> or <code>.mp3</c>.
     * @type {Integer (Int32)}
     */
    static AT_FILEEXTENSION => 0

    /**
     * Indicates a protocol, such as <c>http</code> or <code>mailto</c>.
     * @type {Integer (Int32)}
     */
    static AT_URLPROTOCOL => 1

    /**
     * Indicates the owner of the startmenu client for a mail or Internet hyperlink. As of Windows 7, this value is used only for the MAPI sendmail client.
     * @type {Integer (Int32)}
     */
    static AT_STARTMENUCLIENT => 2

    /**
     * Indicates the MIME type, such as <c>audio/mp3</c>.
     * @type {Integer (Int32)}
     */
    static AT_MIMETYPE => 3
}
