#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Provides the text of a prompt and information about when and where that prompt is to be displayed when using the CryptProtectData and CryptUnprotectData functions.
 * @see https://learn.microsoft.com/windows/win32/api/dpapi/ns-dpapi-cryptprotect_promptstruct
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPTPROTECT_PROMPTSTRUCT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

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
     */
    dwPromptFlags : UInt32

    /**
     * Window handle to the parent window.
     */
    hwndApp : HWND

    /**
     * A string containing the text of a prompt to be displayed.
     */
    szPrompt : PWSTR

}
