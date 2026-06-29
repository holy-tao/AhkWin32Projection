#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IPrinterExtensionAsyncOperation.ahk" { IPrinterExtensionAsyncOperation }
#Import ".\IPrinterQueueView.ahk" { IPrinterQueueView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterBidiSetRequestCallback.ahk" { IPrinterBidiSetRequestCallback }
#Import ".\IPrinterQueue.ahk" { IPrinterQueue }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterQueue2 extends IPrinterQueue {
    /**
     * The interface identifier for IPrinterQueue2
     * @type {Guid}
     */
    static IID := Guid("{8cd444e8-c9bb-49b3-8e38-e03209416131}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterQueue2 interfaces
    */
    struct Vtbl extends IPrinterQueue.Vtbl {
        SendBidiSetRequestAsync : IntPtr
        GetPrinterQueueView     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterQueue2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrBidiRequest 
     * @param {IPrinterBidiSetRequestCallback} pCallback 
     * @returns {IPrinterExtensionAsyncOperation} 
     */
    SendBidiSetRequestAsync(bstrBidiRequest, pCallback) {
        bstrBidiRequest := bstrBidiRequest is String ? BSTR.Alloc(bstrBidiRequest).Value : bstrBidiRequest

        result := ComCall(11, this, BSTR, bstrBidiRequest, "ptr", pCallback, "ptr*", &ppAsyncOperation := 0, "HRESULT")
        return IPrinterExtensionAsyncOperation(ppAsyncOperation)
    }

    /**
     * 
     * @param {Integer} ulViewOffset 
     * @param {Integer} ulViewSize 
     * @returns {IPrinterQueueView} 
     */
    GetPrinterQueueView(ulViewOffset, ulViewSize) {
        result := ComCall(12, this, "uint", ulViewOffset, "uint", ulViewSize, "ptr*", &ppJobView := 0, "HRESULT")
        return IPrinterQueueView(ppJobView)
    }

    Query(iid) {
        if (IPrinterQueue2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendBidiSetRequestAsync := CallbackCreate(GetMethod(implObj, "SendBidiSetRequestAsync"), flags, 4)
        this.vtbl.GetPrinterQueueView := CallbackCreate(GetMethod(implObj, "GetPrinterQueueView"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendBidiSetRequestAsync)
        CallbackFree(this.vtbl.GetPrinterQueueView)
    }
}
