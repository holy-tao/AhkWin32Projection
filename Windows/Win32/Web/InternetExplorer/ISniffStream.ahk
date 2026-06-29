#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ISniffStream extends IUnknown {
    /**
     * The interface identifier for ISniffStream
     * @type {Guid}
     */
    static IID := Guid("{4ef17940-30e0-11d0-b724-00aa006c1a01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISniffStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init : IntPtr
        Peek : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISniffStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    Init(pStream) {
        result := ComCall(3, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} nBytes 
     * @param {Pointer<Integer>} pnBytesRead 
     * @returns {HRESULT} 
     */
    Peek(pBuffer, nBytes, pnBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pnBytesReadMarshal := pnBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pBufferMarshal, pBuffer, "uint", nBytes, pnBytesReadMarshal, pnBytesRead, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISniffStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 2)
        this.vtbl.Peek := CallbackCreate(GetMethod(implObj, "Peek"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.Peek)
    }
}
