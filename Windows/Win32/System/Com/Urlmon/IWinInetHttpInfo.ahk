#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWinInetInfo.ahk" { IWinInetInfo }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWinInetHttpInfo extends IWinInetInfo {
    /**
     * The interface identifier for IWinInetHttpInfo
     * @type {Guid}
     */
    static IID := Guid("{79eac9d8-bafa-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinInetHttpInfo interfaces
    */
    struct Vtbl extends IWinInetInfo.Vtbl {
        QueryInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinInetHttpInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    QueryInfo(dwOption, pBuffer, pcbBuf, pdwFlags, pdwReserved) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufMarshal := pcbBuf is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwOption, pBufferMarshal, pBuffer, pcbBufMarshal, pcbBuf, pdwFlagsMarshal, pdwFlags, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinInetHttpInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryInfo := CallbackCreate(GetMethod(implObj, "QueryInfo"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryInfo)
    }
}
