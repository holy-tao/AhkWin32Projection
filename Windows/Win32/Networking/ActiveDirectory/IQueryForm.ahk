#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by a query form extension object to allow the form object to add forms and pages to the system-supplied directory service query dialog box.
 * @remarks
 * A query form extension object must be registered in the Windows registry to be available to the query handler. This is accomplished by adding the following registry key.
 * 
 * 
 * <pre><b>HKEY_CLASSES_ROOT</b>
 *    <b>CLSID</b>
 *       <i>&lt;query handler CLSID&gt;</i>
 *          <b>Forms</b>
 *             <i>&lt;name of query form extension&gt;</i></pre>
 * 
 * 
 * The <i>&lt;query handler CLSID&gt;</i> key is the class identifier of the form handler. The <i>&lt;name of query form extension&gt;</i> key is the unique name of the query form extension. This name must be unique within the <b>Forms</b> key. It is suggested that the string form of the class identifier of the query form extension be used for the name.
 * 
 * The following list lists the registry entries under the above key.
 * 
 * <table>
 * <tr>
 * <th>Registry Entry</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><b>CLSID</b></td>
 * <td>
 * A string value that contains the class identifier of the object that implements <b>IQueryForm</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td><b>Flags</b></td>
 * <td>
 * A numeric value that contains a set of flags that define the behavior of the form. This can be zero or a combination of one or more of the following values.
 * 
 * 
 * 
 * <dl>
 * <dt><a id="QUERYFORM_CHANGESFORMLIST"></a><a id="queryform_changesformlist"></a><b>QUERYFORM_CHANGESFORMLIST</b></dt>
 * <dd>
 * The form should be visible in the normal form list.
 * 
 * </dd>
 * <dt><a id="QUERYFORM_CHANGESOPTFORMLIST"></a><a id="queryform_changesoptformlist"></a><b>QUERYFORM_CHANGESOPTFORMLIST</b></dt>
 * <dd>
 * The form should be visible in the optional form list.
 * 
 * </dd>
 * </dl>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nn-cmnquery-iqueryform
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IQueryForm extends IUnknown {
    /**
     * The interface identifier for IQueryForm
     * @type {Guid}
     */
    static IID := Guid("{8cfcee30-39bd-11d0-b8d1-00a024ab2dbb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryForm interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        AddForms   : IntPtr
        AddPages   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryForm.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the query form extension object.
     * @param {HKEY} hkForm Contains a registry key that identifies where the query form object was obtained. This parameter may be <b>NULL</b>.
     * @returns {HRESULT} This method returns <b>S_OK</b> to enable the form object within the query dialog, or a failure code, such as <b>E_FAIL</b>, to prevent the form from being added to the query dialog.
     * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nf-cmnquery-iqueryform-initialize
     */
    Initialize(hkForm) {
        result := ComCall(3, this, HKEY, hkForm, "HRESULT")
        return result
    }

    /**
     * Called to allow a query form extension object to add forms to the query dialog box.
     * @param {Pointer<LPCQADDFORMSPROC>} pAddFormsProc Pointer to a callback function of the form <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqaddformsproc">CQAddFormsProc</a>. The query form extension  calls this function with the supplied <i>lParam</i> one time for each form to be added.
     * @param {LPARAM} _lParam Contains a 32-bit value that is defined by the query handler. This value must be passed as the <i>lParam</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqaddformsproc">CQAddFormsProc</a> call.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard <b>HRESULT</b> failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nf-cmnquery-iqueryform-addforms
     */
    AddForms(pAddFormsProc, _lParam) {
        result := ComCall(4, this, "ptr", pAddFormsProc, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * Called to allow a query form object to add pages to an existing form.
     * @param {Pointer<LPCQADDPAGESPROC>} pAddPagesProc Pointer to a callback function of the form <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqaddpagesproc">CQAddPagesProc</a>. The query form extension  calls this function with the supplied <i>lParam</i> one time for each page to be added to a form.
     * @param {LPARAM} _lParam Contains a 32-bit value that is defined by the query handler. This value must be passed as the <i>lParam</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqaddpagesproc">CQAddPagesProc</a> call.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard <b>HRESULT</b> failure code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nf-cmnquery-iqueryform-addpages
     */
    AddPages(pAddPagesProc, _lParam) {
        result := ComCall(5, this, "ptr", pAddPagesProc, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueryForm.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.AddForms := CallbackCreate(GetMethod(implObj, "AddForms"), flags, 3)
        this.vtbl.AddPages := CallbackCreate(GetMethod(implObj, "AddPages"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.AddForms)
        CallbackFree(this.vtbl.AddPages)
    }
}
