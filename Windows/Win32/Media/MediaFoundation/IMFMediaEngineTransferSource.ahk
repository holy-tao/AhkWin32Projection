#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaEngine.ahk" { IMFMediaEngine }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineTransferSource extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineTransferSource
     * @type {Guid}
     */
    static IID := Guid("{24230452-fe54-40cc-94f3-fcc394c340d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineTransferSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TransferSourceToMediaEngine : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineTransferSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMFMediaEngine} destination 
     * @returns {HRESULT} 
     */
    TransferSourceToMediaEngine(destination) {
        result := ComCall(3, this, "ptr", destination, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineTransferSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TransferSourceToMediaEngine := CallbackCreate(GetMethod(implObj, "TransferSourceToMediaEngine"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TransferSourceToMediaEngine)
    }
}
