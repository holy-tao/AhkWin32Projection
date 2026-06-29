#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWinInetInfo extends IUnknown {
    /**
     * The interface identifier for IWinInetInfo
     * @type {Guid}
     */
    static IID := Guid("{79eac9d6-bafa-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinInetInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryOption : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinInetInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @returns {HRESULT} 
     */
    QueryOption(dwOption, pBuffer, pcbBuf) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufMarshal := pcbBuf is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwOption, pBufferMarshal, pBuffer, pcbBufMarshal, pcbBuf, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinInetInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryOption := CallbackCreate(GetMethod(implObj, "QueryOption"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryOption)
    }
}
