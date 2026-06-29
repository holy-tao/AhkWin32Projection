#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterScriptableSequentialStream.ahk" { IPrinterScriptableSequentialStream }
#Import "..\..\System\Com\STREAM_SEEK.ahk" { STREAM_SEEK }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterScriptableStream extends IPrinterScriptableSequentialStream {
    /**
     * The interface identifier for IPrinterScriptableStream
     * @type {Guid}
     */
    static IID := Guid("{7edf9a92-4750-41a5-a17f-879a6f4f7dcb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterScriptableStream interfaces
    */
    struct Vtbl extends IPrinterScriptableSequentialStream.Vtbl {
        Commit  : IntPtr
        Seek    : IntPtr
        SetSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterScriptableStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lOffset 
     * @param {STREAM_SEEK} streamSeek 
     * @returns {Integer} 
     */
    Seek(lOffset, streamSeek) {
        result := ComCall(10, this, "int", lOffset, STREAM_SEEK, streamSeek, "int*", &plPosition := 0, "HRESULT")
        return plPosition
    }

    /**
     * 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    SetSize(lSize) {
        result := ComCall(11, this, "int", lSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrinterScriptableStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 4)
        this.vtbl.SetSize := CallbackCreate(GetMethod(implObj, "SetSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.Seek)
        CallbackFree(this.vtbl.SetSize)
    }
}
