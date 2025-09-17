#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides user interface (UI) data for a provider. This structure is used by the CRYPT_PROVUI_FUNCS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provui_data
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
     * @type {Pointer<Char>}
     */
    pYesButtonText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>No</b> button text. If this parameter is <b>NULL</b>, then "&amp;No"  is used.
     * @type {Pointer<Char>}
     */
    pNoButtonText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>More Info</b> button text. If this parameter is <b>NULL</b>, then "&amp;More Info" is used.
     * @type {Pointer<Char>}
     */
    pMoreInfoButtonText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>Advanced</b>  button  text.
     * @type {Pointer<Char>}
     */
    pAdvancedLinkText {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when the trust is valid and a time stamp is used. If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1"" signed on %2 and distributed by:" is used.
     * @type {Pointer<Char>}
     */
    pCopyActionText {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when the trust is valid but a time stamp is not used. If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1"" signed on an unknown date/time and distributed by:" is used.
     * @type {Pointer<Char>}
     */
    pCopyActionTextNoTS {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when a signature is not provided.  If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1""?" is used.
     * @type {Pointer<Char>}
     */
    pCopyActionTextNotSigned {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
