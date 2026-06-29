#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITForwardInformation.ahk" { ITForwardInformation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITForwardInformation2 interface exposes methods that provide additional methods for the control of forwarding information. See ITForwardInformation for the basic forwarding control methods.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itforwardinformation2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITForwardInformation2 extends ITForwardInformation {
    /**
     * The interface identifier for ITForwardInformation2
     * @type {Guid}
     */
    static IID := Guid("{5229b4ed-b260-4382-8e1a-5df3a8a4ccc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITForwardInformation2 interfaces
    */
    struct Vtbl extends ITForwardInformation.Vtbl {
        SetForwardType2                       : IntPtr
        GetForwardType2                       : IntPtr
        get_ForwardTypeDestinationAddressType : IntPtr
        get_ForwardTypeCallerAddressType      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITForwardInformation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetForwardType2 method sets the current forwarding mode, specified by caller address.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward type</a> to be set.
     * @param {BSTR} pDestAddress Pointer to the <b>BSTR</b> representation of the destination address.
     * @param {Integer} DestAddressType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of destination.
     * @param {BSTR} pCallerAddress Pointer to the <b>BSTR</b> representation of the caller address.
     * @param {Integer} CallerAddressType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of caller.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ForwardType</i>, <i>DestAddressType</i>, or <i>CallerAddressType</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
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
     * The <i>pDestAddress</i> or <i>pCallerAddress</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-setforwardtype2
     */
    SetForwardType2(ForwardType, pDestAddress, DestAddressType, pCallerAddress, CallerAddressType) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(14, this, "int", ForwardType, BSTR, pDestAddress, "int", DestAddressType, BSTR, pCallerAddress, "int", CallerAddressType, "HRESULT")
        return result
    }

    /**
     * The GetForwardType2 method gets the current forwarding mode, specified by caller address.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward type</a> to be retrieved.
     * @param {Pointer<BSTR>} ppDestinationAddress Pointer to the <b>BSTR</b> representation of the destination address.
     * @param {Pointer<Integer>} pDestAddressType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of the destination.
     * @param {Pointer<BSTR>} ppCallerAddress Pointer to the <b>BSTR</b> representation of the caller address.
     * @param {Pointer<Integer>} pCallerAddressType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of the caller.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ForwardType</i>, <i>pDestAddressType</i>, or <i>pCallerAddressType</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
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
     * The <i>ppDestinationAddress</i>, <i>pDestAddressType</i>, <i>pCallerAddressType</i>, or <i>ppCallerAddress</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-getforwardtype2
     */
    GetForwardType2(ForwardType, ppDestinationAddress, pDestAddressType, ppCallerAddress, pCallerAddressType) {
        pDestAddressTypeMarshal := pDestAddressType is VarRef ? "int*" : "ptr"
        pCallerAddressTypeMarshal := pCallerAddressType is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "int", ForwardType, BSTR.Ptr, ppDestinationAddress, pDestAddressTypeMarshal, pDestAddressType, BSTR.Ptr, ppCallerAddress, pCallerAddressTypeMarshal, pCallerAddressType, "HRESULT")
        return result
    }

    /**
     * The get_ForwardTypeDestinationAddressType method gets the destination address type for a given forwarding type.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward type</a> to be retrieved.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of the destination.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-get_forwardtypedestinationaddresstype
     */
    get_ForwardTypeDestinationAddressType(ForwardType) {
        result := ComCall(16, this, "int", ForwardType, "int*", &pDestAddressType := 0, "HRESULT")
        return pDestAddressType
    }

    /**
     * The get_ForwardTypeCallerAddressType method gets the caller address type for a given forwarding type.
     * @param {Integer} Forwardtype <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward type</a> to be retrieved.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of the caller.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation2-get_forwardtypecalleraddresstype
     */
    get_ForwardTypeCallerAddressType(Forwardtype) {
        result := ComCall(17, this, "int", Forwardtype, "int*", &pCallerAddressType := 0, "HRESULT")
        return pCallerAddressType
    }

    Query(iid) {
        if (ITForwardInformation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetForwardType2 := CallbackCreate(GetMethod(implObj, "SetForwardType2"), flags, 6)
        this.vtbl.GetForwardType2 := CallbackCreate(GetMethod(implObj, "GetForwardType2"), flags, 6)
        this.vtbl.get_ForwardTypeDestinationAddressType := CallbackCreate(GetMethod(implObj, "get_ForwardTypeDestinationAddressType"), flags, 3)
        this.vtbl.get_ForwardTypeCallerAddressType := CallbackCreate(GetMethod(implObj, "get_ForwardTypeCallerAddressType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetForwardType2)
        CallbackFree(this.vtbl.GetForwardType2)
        CallbackFree(this.vtbl.get_ForwardTypeDestinationAddressType)
        CallbackFree(this.vtbl.get_ForwardTypeCallerAddressType)
    }
}
