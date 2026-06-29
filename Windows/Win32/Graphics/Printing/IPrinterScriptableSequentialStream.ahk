#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterScriptableSequentialStream extends IDispatch {
    /**
     * The interface identifier for IPrinterScriptableSequentialStream
     * @type {Guid}
     */
    static IID := Guid("{2072838a-316f-467a-a949-27f68c44a854}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterScriptableSequentialStream interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Read  : IntPtr
        Write : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterScriptableSequentialStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cbRead 
     * @returns {IDispatch} 
     */
    Read(cbRead) {
        result := ComCall(7, this, "int", cbRead, "ptr*", &ppArray := 0, "HRESULT")
        return IDispatch(ppArray)
    }

    /**
     * 
     * @param {IDispatch} pArray 
     * @returns {Integer} 
     */
    Write(pArray) {
        result := ComCall(8, this, "ptr", pArray, "int*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    Query(iid) {
        if (IPrinterScriptableSequentialStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 3)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Write)
    }
}
