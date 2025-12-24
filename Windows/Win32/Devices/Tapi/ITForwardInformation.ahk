#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITForwardInformation interface provides methods for setup and implementation of call forwarding.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itforwardinformation
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITForwardInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITForwardInformation
     * @type {Guid}
     */
    static IID => Guid("{449f659e-88a3-11d1-bb5d-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_NumRingsNoAnswer", "get_NumRingsNoAnswer", "SetForwardType", "get_ForwardTypeDestination", "get_ForwardTypeCaller", "GetForwardType", "Clear"]

    /**
     * @type {Integer} 
     */
    NumRingsNoAnswer {
        get => this.get_NumRingsNoAnswer()
        set => this.put_NumRingsNoAnswer(value)
    }

    /**
     * The put_NumRingsNoAnswer method sets the number of rings after which a no answer condition is assumed.
     * @param {Integer} lNumRings Number of rings.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-put_numringsnoanswer
     */
    put_NumRingsNoAnswer(lNumRings) {
        result := ComCall(7, this, "int", lNumRings, "HRESULT")
        return result
    }

    /**
     * The get_NumRingsNoAnswer method retrieves the number of rings after which a no answer condition is assumed.
     * @returns {Integer} Pointer to number of rings.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-get_numringsnoanswer
     */
    get_NumRingsNoAnswer() {
        result := ComCall(8, this, "int*", &plNumRings := 0, "HRESULT")
        return plNumRings
    }

    /**
     * The SetForwardType method sets the forwarding mode and destination by caller address.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @param {BSTR} pDestAddress Pointer to <b>BSTR</b> representation of destination address for forwarding.
     * @param {BSTR} pCallerAddress Pointer to <b>BSTR</b> representation of caller address.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDestAddress</i> or <i>pCallerAddress</i> parameter is not a valid pointer.
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
     * The <i>ForwardType</i> parameter is not valid.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-setforwardtype
     */
    SetForwardType(ForwardType, pDestAddress, pCallerAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(9, this, "int", ForwardType, "ptr", pDestAddress, "ptr", pCallerAddress, "HRESULT")
        return result
    }

    /**
     * The get_ForwardTypeDestination method gets the destination for a forwarding mode.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of destination address.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-get_forwardtypedestination
     */
    get_ForwardTypeDestination(ForwardType) {
        ppDestAddress := BSTR()
        result := ComCall(10, this, "int", ForwardType, "ptr", ppDestAddress, "HRESULT")
        return ppDestAddress
    }

    /**
     * The get_ForwardTypeCaller method gets the type of caller for a given forwarding mode.
     * @param {Integer} Forwardtype <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of caller address.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-get_forwardtypecaller
     */
    get_ForwardTypeCaller(Forwardtype) {
        ppCallerAddress := BSTR()
        result := ComCall(11, this, "int", Forwardtype, "ptr", ppCallerAddress, "HRESULT")
        return ppCallerAddress
    }

    /**
     * The GetForwardType method gets the forwarding mode.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @param {Pointer<BSTR>} ppDestinationAddress Pointer to <b>BSTR</b> representation of destination address.
     * @param {Pointer<BSTR>} ppCallerAddress Pointer to <b>BSTR</b> representation of the call originator's address.
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
     * The <i>ppDestAddress</i> or <i>ppCallerAddress</i> parameter is not a valid pointer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-getforwardtype
     */
    GetForwardType(ForwardType, ppDestinationAddress, ppCallerAddress) {
        result := ComCall(12, this, "int", ForwardType, "ptr", ppDestinationAddress, "ptr", ppCallerAddress, "HRESULT")
        return result
    }

    /**
     * The Clear method clears all forwarding information in this object.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itforwardinformation-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
