#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionProtocolInfo extends IUnknown {
    /**
     * The interface identifier for IPMExtensionProtocolInfo
     * @type {Guid}
     */
    static IID := Guid("{1e3fa036-51eb-4453-baff-b8d8e4b46c8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionProtocolInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Protocol       : IntPtr
        get_InvocationInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionProtocolInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * 
     * @param {Pointer<BSTR>} pProtocol 
     * @returns {HRESULT} 
     */
    get_Protocol(pProtocol) {
        result := ComCall(3, this, BSTR.Ptr, pProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(4, this, BSTR.Ptr, pImageUrn, BSTR.Ptr, pParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMExtensionProtocolInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Protocol := CallbackCreate(GetMethod(implObj, "get_Protocol"), flags, 2)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Protocol)
        CallbackFree(this.vtbl.get_InvocationInfo)
    }
}
