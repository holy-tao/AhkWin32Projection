#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\ISequentialStream.ahk" { ISequentialStream }

/**
 * A write-only stream interface into which an application writes print job data.
 * @remarks
 * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjobstream-close">Close</a> method must be called before this interface is released.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nn-xpsprint-ixpsprintjobstream
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct IXpsPrintJobStream extends ISequentialStream {
    /**
     * The interface identifier for IXpsPrintJobStream
     * @type {Guid}
     */
    static IID := Guid("{7a77dc5f-45d6-4dff-9307-d8cb846347ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsPrintJobStream interfaces
    */
    struct Vtbl extends ISequentialStream.Vtbl {
        Close : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsPrintJobStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Closes the stream and indicates to the print job that the entire document has been written to the print queue by the application.
     * @remarks
     * After <b>Close</b> has been called, all subsequent attempts to write data to the stream will fail.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-ixpsprintjobstream-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsPrintJobStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Close)
    }
}
