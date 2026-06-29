#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\DISPPARAMS.ahk" { DISPPARAMS }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsExtension interface forms the basis of the ADSI application extension model.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsextension
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsExtension extends IUnknown {
    /**
     * The interface identifier for IADsExtension
     * @type {Guid}
     */
    static IID := Guid("{3d35553c-d2b0-11d1-b17b-0000f87593a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsExtension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Operate              : IntPtr
        PrivateGetIDsOfNames : IntPtr
        PrivateInvoke        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Interprets the control code and input parameters according to the specifications of the provider.
     * @remarks
     * The aggregator will ignore the <b>E_FAIL</b> and <b>E_NOTIMPL</b> return values.
     * @param {Integer} dwCode A value of the ADSI extension control code. ADSI defines the following code value.
     * @param {VARIANT} varData1 Provider-supplied data the extension object will operate on. The value depends upon the control code value and is presently undefined.
     * @param {VARIANT} varData2 Provider-supplied data the extension object will operate on. The value depends upon the control code value and is presently undefined.
     * @param {VARIANT} varData3 Provider-supplied data the extension object will operate on. The value depends upon the control code value and is presently undefined.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsextension-operate
     */
    Operate(dwCode, varData1, varData2, varData3) {
        result := ComCall(3, this, "uint", dwCode, VARIANT, varData1, VARIANT, varData2, VARIANT, varData3, "HRESULT")
        return result
    }

    /**
     * The IADsExtension::PrivateGetIDsOfNames method is called by the aggregator, ADSI, after ADSI determines that the extension is used to support a dual or dispatch interface. The method can use the type data to get DISPID using IDispatch::GetIDsOfNames.
     * @remarks
     * All the parameters have the same meaning as the corresponding ones in the standard <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-getidsofnames">IDispatch::GetIDsOfNames</a>(). The extension component returns a unique identifier (<i>rgDispID</i>) for each method or property defined in the supported dual interfaces. The uniqueness is enforced within the extension component. The ADSI provider must ensure the uniqueness of the DISPIDs of all extension objects and the aggregator (ADSI) itself. The <i>rgDispID</i> parameter must be between 1 and 16777215 (2^24-1), or -1 (DISPID_UNKNOWN).
     * @param {Pointer<Guid>} riid Reserved for future use. It must be IID_NULL.
     * @param {Pointer<Pointer<Integer>>} rgszNames Passed-in array of names to be mapped.
     * @param {Integer} cNames Count of the names to be mapped.
     * @param {Integer} lcid The locale context in which to interpret the names.
     * @returns {Integer} Caller-allocated array, each element of which contains an identifier that corresponds to one of the names passed in the <i>rgszNames</i> array. The first element represents the member name. The subsequent elements represent each of the member's parameters.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsextension-privategetidsofnames
     */
    PrivateGetIDsOfNames(riid, rgszNames, cNames, lcid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, "int*", &rgDispid := 0, "HRESULT")
        return rgDispid
    }

    /**
     * The IADsExtension::PrivateInvoke method is normally called by ADSI after the IADsExtension::PrivateGetIDsOfNames method. This method can either have a custom implementation or it can delegate the operation to IDispatch::DispInvoke method.
     * @param {Integer} dispidMember Identifies the member. Use the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsextension-privategetidsofnames">IADsExtension::PrivateGetIDsOfNames</a> method to obtain the dispatch identifier.
     * @param {Pointer<Guid>} riid Reserved for future use. Must be IID_NULL.
     * @param {Integer} lcid The locale context in which to interpret arguments. The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsextension-privategetidsofnames">IADsExtension::PrivateGetIDsOfNames</a> function uses <i>lcid</i>. It is also passed to the <b>PrivateInvoke</b> method to allow the object to interpret the arguments that are specific to a locale.
     * @param {Integer} wFlags Flags that describe the context of the <b>PrivateInvoke</b> call, include.
     * @param {Pointer<DISPPARAMS>} pdispparams Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a> structure that receives an array of arguments, an array of argument DISPIDs for named arguments, and counts for the number of elements in the arrays.
     * @param {Pointer<VARIANT>} pvarResult Pointer to the location where the result is to be stored, or <b>NULL</b> if the caller expects no result. This argument is ignored if <b>DISPATCH_PROPERTYPUT</b> or <b>DISPATCH_PROPERTYPUTREF</b> is specified.
     * @param {Pointer<EXCEPINFO>} pexcepinfo Pointer to a structure that contains exception data. This structure should be filled in if <b>DISP_E_EXCEPTION</b> is returned. Can be <b>NULL</b>.
     * @param {Pointer<Integer>} puArgErr The index within the <b>rgvarg</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a> structure in <i>pdispparams</i> for the first argument that has an error. Arguments are stored in the <b>rgvarg</b> array in reverse order, so the first argument is the one with the highest index in the array. This parameter is returned only when the resulting return value is <b>DISP_E_TYPEMISMATCH</b> or <b>DISP_E_PARAMNOTFOUND</b>.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     * 
     * For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsextension-privateinvoke
     */
    PrivateInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", dispidMember, Guid.Ptr, riid, "uint", lcid, "ushort", wFlags, DISPPARAMS.Ptr, pdispparams, VARIANT.Ptr, pvarResult, EXCEPINFO.Ptr, pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Operate := CallbackCreate(GetMethod(implObj, "Operate"), flags, 5)
        this.vtbl.PrivateGetIDsOfNames := CallbackCreate(GetMethod(implObj, "PrivateGetIDsOfNames"), flags, 6)
        this.vtbl.PrivateInvoke := CallbackCreate(GetMethod(implObj, "PrivateInvoke"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Operate)
        CallbackFree(this.vtbl.PrivateGetIDsOfNames)
        CallbackFree(this.vtbl.PrivateInvoke)
    }
}
