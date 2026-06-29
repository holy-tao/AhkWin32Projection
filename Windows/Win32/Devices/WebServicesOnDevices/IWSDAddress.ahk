#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the individual components of a transport address.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDAddress extends IUnknown {
    /**
     * The interface identifier for IWSDAddress
     * @type {Guid}
     */
    static IID := Guid("{b9574c6c-12a6-4f74-93a1-3318ff605759}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDAddress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Serialize   : IntPtr
        Deserialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Assembles the component parts of the address into a string.
     * @param {PWSTR} pszBuffer Buffer to receive the assembled address.
     * @param {Integer} cchLength Length of <i>pszBuffer</i>, in bytes.
     * @param {BOOL} fSafe If <b>TRUE</b>, the resulting string will be network safe. For example, if you used <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdtransportaddress">IWSDTransportAddress</a> to build an IPv6 address, the serialized string will not contain the IPv6 scope identifier. However, if <i>fSafe</i> is <b>FALSE</b>,  then the resulting string will contain the IPv6 scope identifier. For all other <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> derived objects, there is no specific meaning for this parameter (other than ensuring that the method generate portable addresses).
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
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
     * <i>pszBuffer</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not be completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdaddress-serialize
     */
    Serialize(pszBuffer, cchLength, fSafe) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(3, this, "ptr", pszBuffer, "uint", cchLength, BOOL, fSafe, "HRESULT")
        return result
    }

    /**
     * Parses the address, validates its component parts and saves them in the object.
     * @param {PWSTR} pszBuffer Address to save in the object.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
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
     * <i>pszBuffer</i> is <b>NULL</b>, its length in characters exceeds WSD_MAX_TEXT_LENGTH (8192), or it does not contain an address in a valid format.
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
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdaddress-deserialize
     */
    Deserialize(pszBuffer) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(4, this, "ptr", pszBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 4)
        this.vtbl.Deserialize := CallbackCreate(GetMethod(implObj, "Deserialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Serialize)
        CallbackFree(this.vtbl.Deserialize)
    }
}
