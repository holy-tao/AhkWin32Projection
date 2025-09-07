#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the text of a prompt and information about when and where that prompt is to be displayed when using the CryptProtectData and CryptUnprotectData functions.
 * @see https://learn.microsoft.com/windows/win32/api/dpapi/ns-dpapi-cryptprotect_promptstruct
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPTPROTECT_PROMPTSTRUCT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>DWORD</b> flags that indicate when prompts to the user are to be displayed. Current <b>dwPromptFlags</b> values are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTPROTECT_PROMPT_ON_PROTECT"></a><a id="cryptprotect_prompt_on_protect"></a><dl>
     * <dt><b>CRYPTPROTECT_PROMPT_ON_PROTECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is used to provide the prompt for the protect phase.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTPROTECT_PROMPT_ON_UNPROTECT"></a><a id="cryptprotect_prompt_on_unprotect"></a><dl>
     * <dt><b>CRYPTPROTECT_PROMPT_ON_UNPROTECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag can be combined with CRYPTPROTECT_PROMPT_ON_PROTECT to enforce the UI (user interface) policy of the caller. When <a href="https://docs.microsoft.com/windows/desktop/api/dpapi/nf-dpapi-cryptunprotectdata">CryptUnprotectData</a> is called, the <b>dwPromptFlags</b> specified in the <a href="https://docs.microsoft.com/windows/desktop/api/dpapi/nf-dpapi-cryptprotectdata">CryptProtectData</a> call are enforced.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwPromptFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Window handle to the parent window.
     * @type {Pointer<Ptr>}
     */
    hwndApp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A string containing the text of a prompt to be displayed.
     * @type {Pointer<Ptr>}
     */
    szPrompt {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
