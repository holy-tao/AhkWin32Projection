#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPSinkInfo)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_ipsinkinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_IPSinkInfo extends IUnknown {
    /**
     * The interface identifier for IBDA_IPSinkInfo
     * @type {Guid}
     */
    static IID := Guid("{a750108f-492e-4d51-95f7-649b23ff7ad7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_IPSinkInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_MulticastList      : IntPtr
        get_AdapterIPAddress   : IntPtr
        get_AdapterDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_IPSinkInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    AdapterIPAddress {
        get => this.get_AdapterIPAddress()
    }

    /**
     * @type {BSTR} 
     */
    AdapterDescription {
        get => this.get_AdapterDescription()
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @remarks
     * The method allocates the memory for the array. The caller must free the memory by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pulcbAddresses Receives the number of bytes in the returned array.
     * @returns {Pointer<Integer>} Pointer to variable that receives an array of bytes, of size *<i>pulcbAddresses</i>. Each IP address is 6 consecutive bytes.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkinfo-get_multicastlist
     */
    get_MulticastList(pulcbAddresses) {
        pulcbAddressesMarshal := pulcbAddresses is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcbAddressesMarshal, pulcbAddresses, "ptr*", &ppbAddressList := 0, "HRESULT")
        return ppbAddressList
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @remarks
     * The caller must free the returned string, using the <b>SysFreeString</b> method.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the IP address. The returned string has the form <c>N.N.N.N</code>; for example, <code>3.0.0.0</c>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkinfo-get_adapteripaddress
     */
    get_AdapterIPAddress() {
        pbstrBuffer := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrBuffer, "HRESULT")
        return pbstrBuffer
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @remarks
     * The caller must free the returned string, using the <b>SysFreeString</b> method.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the description.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkinfo-get_adapterdescription
     */
    get_AdapterDescription() {
        pbstrBuffer := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrBuffer, "HRESULT")
        return pbstrBuffer
    }

    Query(iid) {
        if (IBDA_IPSinkInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MulticastList := CallbackCreate(GetMethod(implObj, "get_MulticastList"), flags, 3)
        this.vtbl.get_AdapterIPAddress := CallbackCreate(GetMethod(implObj, "get_AdapterIPAddress"), flags, 2)
        this.vtbl.get_AdapterDescription := CallbackCreate(GetMethod(implObj, "get_AdapterDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MulticastList)
        CallbackFree(this.vtbl.get_AdapterIPAddress)
        CallbackFree(this.vtbl.get_AdapterDescription)
    }
}
