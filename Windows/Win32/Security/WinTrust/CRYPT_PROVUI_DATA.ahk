#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Provides user interface (UI) data for a provider. This structure is used by the CRYPT_PROVUI_FUNCS structure.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_provui_data
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVUI_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Error code, if applicable.
     * @type {Integer}
     */
    dwFinalError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>Yes</b> button text. If this parameter is <b>NULL</b>, then "&amp;Yes" is used.
     * @type {PWSTR}
     */
    pYesButtonText{
        get {
            if(!this.HasProp("__pYesButtonText"))
                this.__pYesButtonText := PWSTR(this.ptr + 8)
            return this.__pYesButtonText
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>No</b> button text. If this parameter is <b>NULL</b>, then "&amp;No"  is used.
     * @type {PWSTR}
     */
    pNoButtonText{
        get {
            if(!this.HasProp("__pNoButtonText"))
                this.__pNoButtonText := PWSTR(this.ptr + 16)
            return this.__pNoButtonText
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>More Info</b> button text. If this parameter is <b>NULL</b>, then "&amp;More Info" is used.
     * @type {PWSTR}
     */
    pMoreInfoButtonText{
        get {
            if(!this.HasProp("__pMoreInfoButtonText"))
                this.__pMoreInfoButtonText := PWSTR(this.ptr + 24)
            return this.__pMoreInfoButtonText
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>Advanced</b>  button  text.
     * @type {PWSTR}
     */
    pAdvancedLinkText{
        get {
            if(!this.HasProp("__pAdvancedLinkText"))
                this.__pAdvancedLinkText := PWSTR(this.ptr + 32)
            return this.__pAdvancedLinkText
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when the trust is valid and a time stamp is used. If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1"" signed on %2 and distributed by:" is used.
     * @type {PWSTR}
     */
    pCopyActionText{
        get {
            if(!this.HasProp("__pCopyActionText"))
                this.__pCopyActionText := PWSTR(this.ptr + 40)
            return this.__pCopyActionText
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when the trust is valid but a time stamp is not used. If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1"" signed on an unknown date/time and distributed by:" is used.
     * @type {PWSTR}
     */
    pCopyActionTextNoTS{
        get {
            if(!this.HasProp("__pCopyActionTextNoTS"))
                this.__pCopyActionTextNoTS := PWSTR(this.ptr + 48)
            return this.__pCopyActionTextNoTS
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when a signature is not provided.  If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1""?" is used.
     * @type {PWSTR}
     */
    pCopyActionTextNotSigned{
        get {
            if(!this.HasProp("__pCopyActionTextNotSigned"))
                this.__pCopyActionTextNotSigned := PWSTR(this.ptr + 56)
            return this.__pCopyActionTextNotSigned
        }
    }
}
