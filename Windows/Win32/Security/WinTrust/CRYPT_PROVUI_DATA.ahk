#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides user interface (UI) data for a provider. This structure is used by the CRYPT_PROVUI_FUNCS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provui_data
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVUI_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * Error code, if applicable.
     */
    dwFinalError : UInt32

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>Yes</b> button text. If this parameter is <b>NULL</b>, then "&amp;Yes" is used.
     */
    pYesButtonText : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>No</b> button text. If this parameter is <b>NULL</b>, then "&amp;No"  is used.
     */
    pNoButtonText : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>More Info</b> button text. If this parameter is <b>NULL</b>, then "&amp;More Info" is used.
     */
    pMoreInfoButtonText : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated string for the <b>Advanced</b>  button  text.
     */
    pAdvancedLinkText : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when the trust is valid and a time stamp is used. If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1"" signed on %2 and distributed by:" is used.
     */
    pCopyActionText : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when the trust is valid but a time stamp is not used. If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1"" signed on an unknown date/time and distributed by:" is used.
     */
    pCopyActionTextNoTS : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated string for the text used when a signature is not provided.  If this parameter is <b>NULL</b>, then "Do you want to install and run ""%1""?" is used.
     */
    pCopyActionTextNotSigned : PWSTR

}
