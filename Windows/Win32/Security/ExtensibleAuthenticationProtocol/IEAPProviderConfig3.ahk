#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEAPProviderConfig2.ahk" { IEAPProviderConfig2 }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct IEAPProviderConfig3 extends IEAPProviderConfig2 {
    /**
     * The interface identifier for IEAPProviderConfig3
     * @type {Guid}
     */
    static IID := Guid("{b78ecd12-68bb-4f86-9bf0-8438dd3be982}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEAPProviderConfig3 interfaces
    */
    struct Vtbl extends IEAPProviderConfig2.Vtbl {
        ServerInvokeCertificateConfigUI : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEAPProviderConfig3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer} uConnectionParam 
     * @param {HWND} _hWnd 
     * @param {Pointer<Integer>} pConfigDataIn 
     * @param {Integer} dwSizeOfConfigDataIn 
     * @param {Pointer<Pointer<Integer>>} ppConfigDataOut 
     * @param {Pointer<Integer>} pdwSizeOfConfigDataOut 
     * @param {Pointer} uReserved 
     * @returns {HRESULT} 
     */
    ServerInvokeCertificateConfigUI(dwEapTypeId, uConnectionParam, _hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut, uReserved) {
        pConfigDataInMarshal := pConfigDataIn is VarRef ? "char*" : "ptr"
        ppConfigDataOutMarshal := ppConfigDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConfigDataOutMarshal := pdwSizeOfConfigDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", dwEapTypeId, "ptr", uConnectionParam, HWND, _hWnd, pConfigDataInMarshal, pConfigDataIn, "uint", dwSizeOfConfigDataIn, ppConfigDataOutMarshal, ppConfigDataOut, pdwSizeOfConfigDataOutMarshal, pdwSizeOfConfigDataOut, "ptr", uReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEAPProviderConfig3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ServerInvokeCertificateConfigUI := CallbackCreate(GetMethod(implObj, "ServerInvokeCertificateConfigUI"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ServerInvokeCertificateConfigUI)
    }
}
