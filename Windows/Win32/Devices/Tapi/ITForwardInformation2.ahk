#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITForwardInformation.ahk

/**
 * The ITForwardInformation2 interface exposes methods that provide additional methods for the control of forwarding information. See ITForwardInformation for the basic forwarding control methods.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itforwardinformation2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITForwardInformation2 extends ITForwardInformation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITForwardInformation2
     * @type {Guid}
     */
    static IID => Guid("{5229b4ed-b260-4382-8e1a-5df3a8a4ccc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetForwardType2", "GetForwardType2", "get_ForwardTypeDestinationAddressType", "get_ForwardTypeCallerAddressType"]

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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation2-setforwardtype2
     */
    SetForwardType2(ForwardType, pDestAddress, DestAddressType, pCallerAddress, CallerAddressType) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(14, this, "int", ForwardType, "ptr", pDestAddress, "int", DestAddressType, "ptr", pCallerAddress, "int", CallerAddressType, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation2-getforwardtype2
     */
    GetForwardType2(ForwardType, ppDestinationAddress, pDestAddressType, ppCallerAddress, pCallerAddressType) {
        pDestAddressTypeMarshal := pDestAddressType is VarRef ? "int*" : "ptr"
        pCallerAddressTypeMarshal := pCallerAddressType is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "int", ForwardType, "ptr", ppDestinationAddress, pDestAddressTypeMarshal, pDestAddressType, "ptr", ppCallerAddress, pCallerAddressTypeMarshal, pCallerAddressType, "HRESULT")
        return result
    }

    /**
     * The get_ForwardTypeDestinationAddressType method gets the destination address type for a given forwarding type.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward type</a> to be retrieved.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of the destination.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation2-get_forwardtypedestinationaddresstype
     */
    get_ForwardTypeDestinationAddressType(ForwardType) {
        result := ComCall(16, this, "int", ForwardType, "int*", &pDestAddressType := 0, "HRESULT")
        return pDestAddressType
    }

    /**
     * The get_ForwardTypeCallerAddressType method gets the caller address type for a given forwarding type.
     * @param {Integer} Forwardtype <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward type</a> to be retrieved.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">Address type</a> of the caller.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation2-get_forwardtypecalleraddresstype
     */
    get_ForwardTypeCallerAddressType(Forwardtype) {
        result := ComCall(17, this, "int", Forwardtype, "int*", &pCallerAddressType := 0, "HRESULT")
        return pCallerAddressType
    }
}
