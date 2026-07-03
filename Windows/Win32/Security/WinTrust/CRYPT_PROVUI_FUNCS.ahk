#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_PROVUI_DATA.ahk" { CRYPT_PROVUI_DATA }

/**
 * Provides information about the user interface (UI) functions of a provider. This structure is used by the CRYPT_PROVIDER_FUNCTIONS structure.
 * @remarks
 * The prototype for PFN_PROVUI_CALL is defined as:
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provui_funcs
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVUI_FUNCS {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provui_data">CRYPT_PROVUI_DATA</a> structure.
     */
    psUIData : CRYPT_PROVUI_DATA.Ptr

    /**
     * A pointer to the  function called when the <b>More Info</b> button is clicked.
     */
    pfnOnMoreInfoClick : IntPtr

    /**
     * A pointer to the  default function called when the <b>More Info</b> button is clicked.
     */
    pfnOnMoreInfoClickDefault : IntPtr

    /**
     * A pointer to the  function called when the <b>Advanced</b> button is clicked.
     */
    pfnOnAdvancedClick : IntPtr

    /**
     * A pointer to the  default function called when the <b>Advanced</b> button is clicked.
     */
    pfnOnAdvancedClickDefault : IntPtr

}
