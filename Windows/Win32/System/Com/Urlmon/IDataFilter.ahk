#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IDataFilter extends IUnknown {
    /**
     * The interface identifier for IDataFilter
     * @type {Guid}
     */
    static IID := Guid("{69d14c80-c18e-11d0-a9ce-006097942311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoEncode         : IntPtr
        DoDecode         : IntPtr
        SetEncodingLevel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} lInBufferSize 
     * @param {Pointer<Integer>} pbInBuffer 
     * @param {Integer} lOutBufferSize 
     * @param {Pointer<Integer>} pbOutBuffer 
     * @param {Integer} lInBytesAvailable 
     * @param {Pointer<Integer>} plInBytesRead 
     * @param {Pointer<Integer>} plOutBytesWritten 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    DoEncode(dwFlags, lInBufferSize, pbInBuffer, lOutBufferSize, pbOutBuffer, lInBytesAvailable, plInBytesRead, plOutBytesWritten, dwReserved) {
        pbInBufferMarshal := pbInBuffer is VarRef ? "char*" : "ptr"
        pbOutBufferMarshal := pbOutBuffer is VarRef ? "char*" : "ptr"
        plInBytesReadMarshal := plInBytesRead is VarRef ? "int*" : "ptr"
        plOutBytesWrittenMarshal := plOutBytesWritten is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "int", lInBufferSize, pbInBufferMarshal, pbInBuffer, "int", lOutBufferSize, pbOutBufferMarshal, pbOutBuffer, "int", lInBytesAvailable, plInBytesReadMarshal, plInBytesRead, plOutBytesWrittenMarshal, plOutBytesWritten, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} lInBufferSize 
     * @param {Pointer<Integer>} pbInBuffer 
     * @param {Integer} lOutBufferSize 
     * @param {Pointer<Integer>} pbOutBuffer 
     * @param {Integer} lInBytesAvailable 
     * @param {Pointer<Integer>} plInBytesRead 
     * @param {Pointer<Integer>} plOutBytesWritten 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    DoDecode(dwFlags, lInBufferSize, pbInBuffer, lOutBufferSize, pbOutBuffer, lInBytesAvailable, plInBytesRead, plOutBytesWritten, dwReserved) {
        pbInBufferMarshal := pbInBuffer is VarRef ? "char*" : "ptr"
        pbOutBufferMarshal := pbOutBuffer is VarRef ? "char*" : "ptr"
        plInBytesReadMarshal := plInBytesRead is VarRef ? "int*" : "ptr"
        plOutBytesWrittenMarshal := plOutBytesWritten is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", dwFlags, "int", lInBufferSize, pbInBufferMarshal, pbInBuffer, "int", lOutBufferSize, pbOutBufferMarshal, pbOutBuffer, "int", lInBytesAvailable, plInBytesReadMarshal, plInBytesRead, plOutBytesWrittenMarshal, plOutBytesWritten, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEncLevel 
     * @returns {HRESULT} 
     */
    SetEncodingLevel(dwEncLevel) {
        result := ComCall(5, this, "uint", dwEncLevel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoEncode := CallbackCreate(GetMethod(implObj, "DoEncode"), flags, 10)
        this.vtbl.DoDecode := CallbackCreate(GetMethod(implObj, "DoDecode"), flags, 10)
        this.vtbl.SetEncodingLevel := CallbackCreate(GetMethod(implObj, "SetEncodingLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoEncode)
        CallbackFree(this.vtbl.DoDecode)
        CallbackFree(this.vtbl.SetEncodingLevel)
    }
}
