#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPSinkControl)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_ipsinkcontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_IPSinkControl extends IUnknown {
    /**
     * The interface identifier for IBDA_IPSinkControl
     * @type {Guid}
     */
    static IID := Guid("{3f4dc8e2-4050-11d3-8f4b-00c04f7971e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_IPSinkControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMulticastList    : IntPtr
        GetAdapterIPAddress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_IPSinkControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @remarks
     * <b>IBDA_IPSinkControl</b> is no longer being supported for Ring 3 clients. Use the <b>BDA_IPSinkInfo</b> interface instead.
     * @param {Pointer<Integer>} pulcbSize Receives the length of the buffer, in bytes.
     * @param {Pointer<Pointer<Integer>>} pbBuffer Pointer to a byte array containing the multicast list.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkcontrol-getmulticastlist
     */
    GetMulticastList(pulcbSize, pbBuffer) {
        pulcbSizeMarshal := pulcbSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pulcbSizeMarshal, pulcbSize, pbBufferMarshal, pbBuffer, "HRESULT")
        return result
    }

    /**
     * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems. It may be altered or unavailable in subsequent versions.
     * @remarks
     * <b>IBDA_IPSinkControl</b> is no longer being supported for Ring 3 clients. Use the <b>BDA_IPSinkInfo</b> interface instead.
     * @param {Pointer<Integer>} pulcbSize Receives the length of the buffer, in bytes.
     * @param {Pointer<Pointer<Integer>>} pbBuffer Pointer to a byte array containing the address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkcontrol-getadapteripaddress
     */
    GetAdapterIPAddress(pulcbSize, pbBuffer) {
        pulcbSizeMarshal := pulcbSize is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pulcbSizeMarshal, pulcbSize, pbBufferMarshal, pbBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_IPSinkControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMulticastList := CallbackCreate(GetMethod(implObj, "GetMulticastList"), flags, 3)
        this.vtbl.GetAdapterIPAddress := CallbackCreate(GetMethod(implObj, "GetAdapterIPAddress"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMulticastList)
        CallbackFree(this.vtbl.GetAdapterIPAddress)
    }
}
