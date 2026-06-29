#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEAPProviderConfig.ahk" { IEAPProviderConfig }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct IEAPProviderConfig2 extends IEAPProviderConfig {
    /**
     * The interface identifier for IEAPProviderConfig2
     * @type {Guid}
     */
    static IID := Guid("{d565917a-85c4-4466-856e-671c3742ea9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEAPProviderConfig2 interfaces
    */
    struct Vtbl extends IEAPProviderConfig.Vtbl {
        ServerInvokeConfigUI2 : IntPtr
        GetGlobalConfig       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEAPProviderConfig2.Vtbl()
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
     * @returns {HRESULT} 
     */
    ServerInvokeConfigUI2(dwEapTypeId, uConnectionParam, _hWnd, pConfigDataIn, dwSizeOfConfigDataIn, ppConfigDataOut, pdwSizeOfConfigDataOut) {
        pConfigDataInMarshal := pConfigDataIn is VarRef ? "char*" : "ptr"
        ppConfigDataOutMarshal := ppConfigDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConfigDataOutMarshal := pdwSizeOfConfigDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwEapTypeId, "ptr", uConnectionParam, HWND, _hWnd, pConfigDataInMarshal, pConfigDataIn, "uint", dwSizeOfConfigDataIn, ppConfigDataOutMarshal, ppConfigDataOut, pdwSizeOfConfigDataOutMarshal, pdwSizeOfConfigDataOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEapTypeId 
     * @param {Pointer<Pointer<Integer>>} ppConfigDataOut 
     * @param {Pointer<Integer>} pdwSizeOfConfigDataOut 
     * @returns {HRESULT} 
     */
    GetGlobalConfig(dwEapTypeId, ppConfigDataOut, pdwSizeOfConfigDataOut) {
        ppConfigDataOutMarshal := ppConfigDataOut is VarRef ? "ptr*" : "ptr"
        pdwSizeOfConfigDataOutMarshal := pdwSizeOfConfigDataOut is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", dwEapTypeId, ppConfigDataOutMarshal, ppConfigDataOut, pdwSizeOfConfigDataOutMarshal, pdwSizeOfConfigDataOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEAPProviderConfig2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ServerInvokeConfigUI2 := CallbackCreate(GetMethod(implObj, "ServerInvokeConfigUI2"), flags, 8)
        this.vtbl.GetGlobalConfig := CallbackCreate(GetMethod(implObj, "GetGlobalConfig"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ServerInvokeConfigUI2)
        CallbackFree(this.vtbl.GetGlobalConfig)
    }
}
