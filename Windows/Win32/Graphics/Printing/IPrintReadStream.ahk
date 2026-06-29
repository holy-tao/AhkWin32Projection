#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintReadStream extends IUnknown {
    /**
     * The interface identifier for IPrintReadStream
     * @type {Guid}
     */
    static IID := Guid("{4d47a67c-66cc-4430-850e-daf466fe5bc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintReadStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Seek      : IntPtr
        ReadBytes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintReadStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @returns {Integer} 
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(3, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * 
     * @param {Integer} pvBuffer 
     * @param {Integer} cbRequested 
     * @param {Pointer<Integer>} pcbRead 
     * @param {Pointer<BOOL>} pbEndOfFile 
     * @returns {HRESULT} 
     */
    ReadBytes(pvBuffer, cbRequested, pcbRead, pbEndOfFile) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"
        pbEndOfFileMarshal := pbEndOfFile is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pvBuffer, "uint", cbRequested, pcbReadMarshal, pcbRead, pbEndOfFileMarshal, pbEndOfFile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintReadStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 4)
        this.vtbl.ReadBytes := CallbackCreate(GetMethod(implObj, "ReadBytes"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Seek)
        CallbackFree(this.vtbl.ReadBytes)
    }
}
