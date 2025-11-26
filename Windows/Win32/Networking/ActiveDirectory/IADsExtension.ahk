#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IADsExtension interface forms the basis of the ADSI application extension model.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsextension
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsExtension
     * @type {Guid}
     */
    static IID => Guid("{3d35553c-d2b0-11d1-b17b-0000f87593a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Operate", "PrivateGetIDsOfNames", "PrivateInvoke"]

    /**
     * Interprets the control code and input parameters according to the specifications of the provider.
     * @param {Integer} dwCode A value of the ADSI extension control code. ADSI defines the following code value.
     * @param {VARIANT} varData1 Provider-supplied data the extension object will operate on. The value depends upon the control code value and is presently undefined.
     * @param {VARIANT} varData2 Provider-supplied data the extension object will operate on. The value depends upon the control code value and is presently undefined.
     * @param {VARIANT} varData3 Provider-supplied data the extension object will operate on. The value depends upon the control code value and is presently undefined.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsextension-operate
     */
    Operate(dwCode, varData1, varData2, varData3) {
        result := ComCall(3, this, "uint", dwCode, "ptr", varData1, "ptr", varData2, "ptr", varData3, "HRESULT")
        return result
    }

    /**
     * The IADsExtension::PrivateGetIDsOfNames method is called by the aggregator, ADSI, after ADSI determines that the extension is used to support a dual or dispatch interface. The method can use the type data to get DISPID using IDispatch::GetIDsOfNames.
     * @param {Pointer<Guid>} riid Reserved for future use. It must be IID_NULL.
     * @param {Pointer<Pointer<Integer>>} rgszNames Passed-in array of names to be mapped.
     * @param {Integer} cNames Count of the names to be mapped.
     * @param {Integer} lcid The locale context in which to interpret the names.
     * @returns {Integer} Caller-allocated array, each element of which contains an identifier that corresponds to one of the names passed in the <i>rgszNames</i> array. The first element represents the member name. The subsequent elements represent each of the member's parameters.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsextension-privategetidsofnames
     */
    PrivateGetIDsOfNames(riid, rgszNames, cNames, lcid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, "int*", &rgDispid := 0, "HRESULT")
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
     * For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsextension-privateinvoke
     */
    PrivateInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", dispidMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pvarResult, "ptr", pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
