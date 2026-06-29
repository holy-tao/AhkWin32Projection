#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Displays a dialog box that allows users to select one or more principals from a list.
 * @remarks
 * Implement this interface when you need a custom dialog box that allows users to choose principals.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazobjectpicker
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzObjectPicker extends IDispatch {
    /**
     * The interface identifier for IAzObjectPicker
     * @type {Guid}
     */
    static IID := Guid("{63130a48-699a-42d8-bf01-c62ac3fb79f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzObjectPicker interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetPrincipals : IntPtr
        get_Name      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzObjectPicker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Displays a dialog box from which users can choose one or more principals, and then returns the chosen list of principals and their corresponding security identifiers (SIDs).
     * @param {HWND} hParentWnd A handle to the parent window of the dialog box.
     * @param {BSTR} bstrTitle The display title of the dialog box.
     * @param {Pointer<VARIANT>} pvSidTypes A pointer to an array of elements of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that specify the types of the SIDs that correspond to the principals chosen by the user.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_I4</b> value that specifies an element of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration.
     * @param {Pointer<VARIANT>} pvNames A pointer to an array of display names of the principals chosen by the user. 
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a display name.
     * @param {Pointer<VARIANT>} pvSids A pointer to an array of string representations of the SIDs that correspond to the principals chosen by the user.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a string representation of a SID.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazobjectpicker-getprincipals
     */
    GetPrincipals(hParentWnd, bstrTitle, pvSidTypes, pvNames, pvSids) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(7, this, HWND, hParentWnd, BSTR, bstrTitle, VARIANT.Ptr, pvSidTypes, VARIANT.Ptr, pvNames, VARIANT.Ptr, pvSids, "HRESULT")
        return result
    }

    /**
     * Gets the name of the IAzObjectPicker object.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazobjectpicker-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IAzObjectPicker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrincipals := CallbackCreate(GetMethod(implObj, "GetPrincipals"), flags, 6)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrincipals)
        CallbackFree(this.vtbl.get_Name)
    }
}
