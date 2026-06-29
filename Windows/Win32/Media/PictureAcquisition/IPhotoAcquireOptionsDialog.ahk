#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPhotoAcquireOptionsDialog interface is used to display an options dialog box in which the user can select photo acquisition settings such as file name formats, as well as whether or not to rotate images, to prompt for a tag name, or to erase photos from the camera after importing.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquireoptionsdialog
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoAcquireOptionsDialog extends IUnknown {
    /**
     * The interface identifier for IPhotoAcquireOptionsDialog
     * @type {Guid}
     */
    static IID := Guid("{00f2b3ee-bf64-47ee-89f4-4dedd79643f2}")

    /**
     * The class identifier for PhotoAcquireOptionsDialog
     * @type {Guid}
     */
    static CLSID := Guid("{00f210a1-62f0-438b-9f7e-9618d72a1831}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoAcquireOptionsDialog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        Create     : IntPtr
        Destroy    : IntPtr
        DoModal    : IntPtr
        SaveData   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoAcquireOptionsDialog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the options dialog box and reads any saved options from the registry.
     * @remarks
     * <c>Initialize</c> must be called prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-create">Create</a> or <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-domodal">DoModal</a>. Failure to do so will cause <b>Create</b> or <b>DoModal</b> to fail.
     * 
     * If <c>Initialize</c> is called while the options dialog box is already displayed, an error will be returned.
     * @param {PWSTR} pszRegistryRoot (optional) Pointer to a null-terminated string containing the registry root of a custom location to read the acquisition settings from. If this parameter is set to <b>NULL</b>, the default location will be used.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-initialize
     */
    Initialize(pszRegistryRoot) {
        pszRegistryRoot := pszRegistryRoot is String ? StrPtr(pszRegistryRoot) : pszRegistryRoot

        result := ComCall(3, this, "ptr", pszRegistryRoot, "HRESULT")
        return result
    }

    /**
     * The Create method creates and displays a modeless instance of the photo options dialog box, hosted within a parent window.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-initialize">Initialize</a> method should be called prior to the <c>Create</c> method.
     * 
     * The parent window indicated by <i>hWndParent</i> provides <b>OK</b> and <b>Cancel</b> buttons to the new dialog box instance.
     * @param {HWND} hWndParent Handle to the parent window.
     * @returns {HWND} Specifies the created dialog box.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-create
     */
    Create(hWndParent) {
        phWndDialog := HWND()
        result := ComCall(4, this, HWND, hWndParent, HWND.Ptr, phWndDialog, "HRESULT")
        return phWndDialog
    }

    /**
     * The Destroy method closes and destroys the modeless dialog box created with the Create method.
     * @remarks
     * If you destroy the parent window, the child window will automatically be destroyed.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-destroy
     */
    Destroy() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The DoModal method creates and displays the options dialog box as a modal dialog box.
     * @remarks
     * The modal dialog displayed by <b>DoModal</b> will have <b>OK</b> and <b>Cancel</b> buttons, whereas the <b>OK</b> and <b>Cancel</b> buttons of the modeless dialog displayed by <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-create">Create</a> must be provided by the parent window.
     * @param {HWND} hWndParent Handle to the dialog's parent window.
     * @param {Pointer<Pointer>} ppnReturnCode Specifies the code returned when the window is closed.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-domodal
     */
    DoModal(hWndParent, ppnReturnCode) {
        ppnReturnCodeMarshal := ppnReturnCode is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, HWND, hWndParent, ppnReturnCodeMarshal, ppnReturnCode, "HRESULT")
        return result
    }

    /**
     * The SaveData method saves acquisition settings from the options dialog box to the registry so that a subsequent instance of the dialog can be initialized with the same settings.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-savedata
     */
    SaveData() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPhotoAcquireOptionsDialog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 3)
        this.vtbl.Destroy := CallbackCreate(GetMethod(implObj, "Destroy"), flags, 1)
        this.vtbl.DoModal := CallbackCreate(GetMethod(implObj, "DoModal"), flags, 3)
        this.vtbl.SaveData := CallbackCreate(GetMethod(implObj, "SaveData"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Destroy)
        CallbackFree(this.vtbl.DoModal)
        CallbackFree(this.vtbl.SaveData)
    }
}
