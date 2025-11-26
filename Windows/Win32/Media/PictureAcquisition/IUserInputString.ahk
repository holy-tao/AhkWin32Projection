#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUserInputString interface represents the object created when asking the user for a string�for example, when obtaining the name of a tag.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iuserinputstring
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IUserInputString extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserInputString
     * @type {Guid}
     */
    static IID => Guid("{00f243a1-205b-45ba-ae26-abbc53aa7a6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubmitButtonText", "GetPrompt", "GetStringId", "GetStringType", "GetTooltipText", "GetMaxLength", "GetDefault", "GetMruCount", "GetMruEntryAt", "GetImage"]

    /**
     * The GetSubmitButtonText method retrieves the text for the submit button.
     * @returns {BSTR} Pointer to a string containing the submit button text.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getsubmitbuttontext
     */
    GetSubmitButtonText() {
        pbstrSubmitButtonText := BSTR()
        result := ComCall(3, this, "ptr", pbstrSubmitButtonText, "HRESULT")
        return pbstrSubmitButtonText
    }

    /**
     * The GetPrompt method retrieves the title of a prompt if the prompt is a modal dialog box.
     * @returns {BSTR} Pointer to a string containing the title of the prompt.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getprompt
     */
    GetPrompt() {
        pbstrPromptTitle := BSTR()
        result := ComCall(4, this, "ptr", pbstrPromptTitle, "HRESULT")
        return pbstrPromptTitle
    }

    /**
     * The GetStringId method retrieves the unlocalized canonical name for the requested string. For example, when requesting a tag name, the canonical name might be &quot;TagName&quot;.
     * @returns {BSTR} Pointer to a string containing the string identifier (ID).
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getstringid
     */
    GetStringId() {
        pbstrStringId := BSTR()
        result := ComCall(5, this, "ptr", pbstrStringId, "HRESULT")
        return pbstrStringId
    }

    /**
     * The GetStringType method retrieves a value indicating the type of string to obtain from the user.
     * @returns {Integer} Pointer to an integer value containing the string type.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>USER_INPUT_DEFAULT</b></td>
     * <td>Specifies that any string is allowed.</td>
     * </tr>
     * <tr>
     * <td><b>USER_INPUT_PATH_ELEMENT</b></td>
     * <td>Specifies that the string will not accept characters that are illegal in file or directory names (such as * or /).</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getstringtype
     */
    GetStringType() {
        result := ComCall(6, this, "int*", &pnStringType := 0, "HRESULT")
        return pnStringType
    }

    /**
     * The GetTooltipText method retrieves the tooltip text displayed for a control.
     * @returns {BSTR} Pointer to a string containing the tooltip text.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-gettooltiptext
     */
    GetTooltipText() {
        pbstrTooltipText := BSTR()
        result := ComCall(7, this, "ptr", pbstrTooltipText, "HRESULT")
        return pbstrTooltipText
    }

    /**
     * The GetMaxLength method retrieves the maximum string length the user interface (UI) should allow.
     * @returns {Integer} Pointer to the size of the maximum string length in characters.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(8, this, "uint*", &pcchMaxLength := 0, "HRESULT")
        return pcchMaxLength
    }

    /**
     * The GetDefault method retrieves the default string used to initialize an edit control (or equivalent).
     * @returns {BSTR} Pointer to a string containing the default value used to initialize the edit control.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getdefault
     */
    GetDefault() {
        pbstrDefault := BSTR()
        result := ComCall(9, this, "ptr", pbstrDefault, "HRESULT")
        return pbstrDefault
    }

    /**
     * The GetMruCount method retrieves the number of items in the list of most recently used items.
     * @returns {Integer} Pointer to an integer value containing the number of items in the list of most recently used items.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getmrucount
     */
    GetMruCount() {
        result := ComCall(10, this, "uint*", &pnMruCount := 0, "HRESULT")
        return pnMruCount
    }

    /**
     * The GetMruEntryAt method retrieves the entry at the given index in the most recently used list.
     * @param {Integer} nIndex Integer containing the index at which to retrieve the entry.
     * @returns {BSTR} Pointer to a string containing the most recently used entry.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getmruentryat
     */
    GetMruEntryAt(nIndex) {
        pbstrMruEntry := BSTR()
        result := ComCall(11, this, "uint", nIndex, "ptr", pbstrMruEntry, "HRESULT")
        return pbstrMruEntry
    }

    /**
     * The GetImage method retrieves the default image used to initialize an edit control.
     * @param {Integer} nSize Integer containing the size of the image.
     * @param {Pointer<HBITMAP>} phBitmap Pointer to the handle that specifies the image bitmap.
     * @param {Pointer<HICON>} phIcon Pointer to the handle that specifies the image icon.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> pointer was passed where a non-<b>NULL</b> pointer is expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iuserinputstring-getimage
     */
    GetImage(nSize, phBitmap, phIcon) {
        result := ComCall(12, this, "uint", nSize, "ptr", phBitmap, "ptr", phIcon, "HRESULT")
        return result
    }
}
