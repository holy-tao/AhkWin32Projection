#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\USER_INPUT_STRING_TYPE.ahk" { USER_INPUT_STRING_TYPE }

/**
 * The IUserInputString interface represents the object created when asking the user for a string�for example, when obtaining the name of a tag.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iuserinputstring
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IUserInputString extends IUnknown {
    /**
     * The interface identifier for IUserInputString
     * @type {Guid}
     */
    static IID := Guid("{00f243a1-205b-45ba-ae26-abbc53aa7a6f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserInputString interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSubmitButtonText : IntPtr
        GetPrompt           : IntPtr
        GetStringId         : IntPtr
        GetStringType       : IntPtr
        GetTooltipText      : IntPtr
        GetMaxLength        : IntPtr
        GetDefault          : IntPtr
        GetMruCount         : IntPtr
        GetMruEntryAt       : IntPtr
        GetImage            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserInputString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSubmitButtonText method retrieves the text for the submit button.
     * @returns {BSTR} Pointer to a string containing the submit button text.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getsubmitbuttontext
     */
    GetSubmitButtonText() {
        pbstrSubmitButtonText := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrSubmitButtonText, "HRESULT")
        return pbstrSubmitButtonText
    }

    /**
     * The GetPrompt method retrieves the title of a prompt if the prompt is a modal dialog box.
     * @returns {BSTR} Pointer to a string containing the title of the prompt.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getprompt
     */
    GetPrompt() {
        pbstrPromptTitle := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrPromptTitle, "HRESULT")
        return pbstrPromptTitle
    }

    /**
     * The GetStringId method retrieves the unlocalized canonical name for the requested string. For example, when requesting a tag name, the canonical name might be &quot;TagName&quot;.
     * @returns {BSTR} Pointer to a string containing the string identifier (ID).
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getstringid
     */
    GetStringId() {
        pbstrStringId := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrStringId, "HRESULT")
        return pbstrStringId
    }

    /**
     * The GetStringType method retrieves a value indicating the type of string to obtain from the user.
     * @returns {USER_INPUT_STRING_TYPE} Pointer to an integer value containing the string type.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getstringtype
     */
    GetStringType() {
        result := ComCall(6, this, "int*", &pnStringType := 0, "HRESULT")
        return pnStringType
    }

    /**
     * The GetTooltipText method retrieves the tooltip text displayed for a control.
     * @returns {BSTR} Pointer to a string containing the tooltip text.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-gettooltiptext
     */
    GetTooltipText() {
        pbstrTooltipText := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrTooltipText, "HRESULT")
        return pbstrTooltipText
    }

    /**
     * The GetMaxLength method retrieves the maximum string length the user interface (UI) should allow.
     * @returns {Integer} Pointer to the size of the maximum string length in characters.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(8, this, "uint*", &pcchMaxLength := 0, "HRESULT")
        return pcchMaxLength
    }

    /**
     * The GetDefault method retrieves the default string used to initialize an edit control (or equivalent).
     * @returns {BSTR} Pointer to a string containing the default value used to initialize the edit control.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getdefault
     */
    GetDefault() {
        pbstrDefault := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDefault, "HRESULT")
        return pbstrDefault
    }

    /**
     * The GetMruCount method retrieves the number of items in the list of most recently used items.
     * @remarks
     * If an error occurs, <i>pnMruCount</i> will be set to 0.
     * @returns {Integer} Pointer to an integer value containing the number of items in the list of most recently used items.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getmrucount
     */
    GetMruCount() {
        result := ComCall(10, this, "uint*", &pnMruCount := 0, "HRESULT")
        return pnMruCount
    }

    /**
     * The GetMruEntryAt method retrieves the entry at the given index in the most recently used list.
     * @param {Integer} nIndex Integer containing the index at which to retrieve the entry.
     * @returns {BSTR} Pointer to a string containing the most recently used entry.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getmruentryat
     */
    GetMruEntryAt(nIndex) {
        pbstrMruEntry := BSTR.Owned()
        result := ComCall(11, this, "uint", nIndex, BSTR.Ptr, pbstrMruEntry, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iuserinputstring-getimage
     */
    GetImage(nSize, phBitmap, phIcon) {
        result := ComCall(12, this, "uint", nSize, HBITMAP.Ptr, phBitmap, HICON.Ptr, phIcon, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUserInputString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSubmitButtonText := CallbackCreate(GetMethod(implObj, "GetSubmitButtonText"), flags, 2)
        this.vtbl.GetPrompt := CallbackCreate(GetMethod(implObj, "GetPrompt"), flags, 2)
        this.vtbl.GetStringId := CallbackCreate(GetMethod(implObj, "GetStringId"), flags, 2)
        this.vtbl.GetStringType := CallbackCreate(GetMethod(implObj, "GetStringType"), flags, 2)
        this.vtbl.GetTooltipText := CallbackCreate(GetMethod(implObj, "GetTooltipText"), flags, 2)
        this.vtbl.GetMaxLength := CallbackCreate(GetMethod(implObj, "GetMaxLength"), flags, 2)
        this.vtbl.GetDefault := CallbackCreate(GetMethod(implObj, "GetDefault"), flags, 2)
        this.vtbl.GetMruCount := CallbackCreate(GetMethod(implObj, "GetMruCount"), flags, 2)
        this.vtbl.GetMruEntryAt := CallbackCreate(GetMethod(implObj, "GetMruEntryAt"), flags, 3)
        this.vtbl.GetImage := CallbackCreate(GetMethod(implObj, "GetImage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSubmitButtonText)
        CallbackFree(this.vtbl.GetPrompt)
        CallbackFree(this.vtbl.GetStringId)
        CallbackFree(this.vtbl.GetStringType)
        CallbackFree(this.vtbl.GetTooltipText)
        CallbackFree(this.vtbl.GetMaxLength)
        CallbackFree(this.vtbl.GetDefault)
        CallbackFree(this.vtbl.GetMruCount)
        CallbackFree(this.vtbl.GetMruEntryAt)
        CallbackFree(this.vtbl.GetImage)
    }
}
