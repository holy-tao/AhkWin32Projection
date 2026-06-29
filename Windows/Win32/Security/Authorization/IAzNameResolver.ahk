#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Translates security identifiers (SIDs) into principal display names.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iaznameresolver
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzNameResolver extends IDispatch {
    /**
     * The interface identifier for IAzNameResolver
     * @type {Guid}
     */
    static IID := Guid("{504d0f15-73e2-43df-a870-a64f40714f53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzNameResolver interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        NameFromSid   : IntPtr
        NamesFromSids : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzNameResolver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the display name that corresponds to the specified security identifier (SID).
     * @param {BSTR} bstrSid The string representation of the SID to translate.
     * @param {Pointer<Integer>} pSidType An element of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that specifies the type of SID being translated.
     * @param {Pointer<BSTR>} pbstrName A pointer to the display name of the principal that corresponds to the SID specified by the <i>bstrSid</i> parameter.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. In particular, if the method cannot find the display name of the principal, it returns <b>CO_E_NOMATCHINGNAMEFOUND</b>. For a list of other common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaznameresolver-namefromsid
     */
    NameFromSid(bstrSid, pSidType, pbstrName) {
        bstrSid := bstrSid is String ? BSTR.Alloc(bstrSid).Value : bstrSid

        pSidTypeMarshal := pSidType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, BSTR, bstrSid, pSidTypeMarshal, pSidType, BSTR.Ptr, pbstrName, "HRESULT")
        return result
    }

    /**
     * Gets the display names that correspond to the specified security identifiers (SIDs).
     * @param {VARIANT} vSids An array of string representations of the SIDs to translate.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a string representation of a SID.
     * @param {Pointer<VARIANT>} pvSidTypes A pointer to an array of elements of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration that specify the types of SIDs being translated.
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_I4</b> value that specifies an element of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumeration.
     * @param {Pointer<VARIANT>} pvNames A pointer to an array of strings that contain the display names of the principals that correspond to the SIDs specified by the <i>vSids</i> parameter. 
     * 
     * This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a display name. If a name could not be found for one or more of the SIDs, the corresponding array element contains an empty string.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. If the method cannot find the display names of any of the principals, it returns <b>CO_E_NOMATCHINGNAMEFOUND</b>. For a list of other common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iaznameresolver-namesfromsids
     */
    NamesFromSids(vSids, pvSidTypes, pvNames) {
        result := ComCall(8, this, VARIANT, vSids, VARIANT.Ptr, pvSidTypes, VARIANT.Ptr, pvNames, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAzNameResolver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NameFromSid := CallbackCreate(GetMethod(implObj, "NameFromSid"), flags, 4)
        this.vtbl.NamesFromSids := CallbackCreate(GetMethod(implObj, "NamesFromSids"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NameFromSid)
        CallbackFree(this.vtbl.NamesFromSids)
    }
}
