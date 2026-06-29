#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintWriteStream extends IUnknown {
    /**
     * The interface identifier for IPrintWriteStream
     * @type {Guid}
     */
    static IID := Guid("{65bb7f1b-371e-4571-8ac7-912f510c1a38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintWriteStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WriteBytes : IntPtr
        Close      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintWriteStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pvBuffer 
     * @param {Integer} cbBuffer 
     * @returns {Integer} 
     */
    WriteBytes(pvBuffer, cbBuffer) {
        result := ComCall(3, this, "ptr", pvBuffer, "uint", cbBuffer, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Close() {
        ComCall(4, this)
    }

    Query(iid) {
        if (IPrintWriteStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WriteBytes := CallbackCreate(GetMethod(implObj, "WriteBytes"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WriteBytes)
        CallbackFree(this.vtbl.Close)
    }
}
