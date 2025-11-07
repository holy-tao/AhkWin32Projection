#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the user interface (UI) functions of a provider. This structure is used by the CRYPT_PROVIDER_FUNCTIONS structure.
 * @remarks
 * 
 * The prototype for PFN_PROVUI_CALL is defined as:
 * 
 * 
 * ```cpp
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_provui_funcs
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVUI_FUNCS extends Win32Struct
{
    static sizeof => 48

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
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provui_data">CRYPT_PROVUI_DATA</a> structure.
     * @type {Pointer<CRYPT_PROVUI_DATA>}
     */
    psUIData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the  function called when the <b>More Info</b> button is clicked.
     * @type {Pointer<PFN_PROVUI_CALL>}
     */
    pfnOnMoreInfoClick {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the  default function called when the <b>More Info</b> button is clicked.
     * @type {Pointer<PFN_PROVUI_CALL>}
     */
    pfnOnMoreInfoClickDefault {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the  function called when the <b>Advanced</b> button is clicked.
     * @type {Pointer<PFN_PROVUI_CALL>}
     */
    pfnOnAdvancedClick {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the  default function called when the <b>Advanced</b> button is clicked.
     * @type {Pointer<PFN_PROVUI_CALL>}
     */
    pfnOnAdvancedClickDefault {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
