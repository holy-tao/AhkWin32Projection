#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuneRequestInfo.ahk" { ITuneRequestInfo }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ITuneRequestInfoEx extends ITuneRequestInfo {
    /**
     * The interface identifier for ITuneRequestInfoEx
     * @type {Guid}
     */
    static IID := Guid("{ee957c52-b0d0-4e78-8dd1-b87a08bfd893}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITuneRequestInfoEx interfaces
    */
    struct Vtbl extends ITuneRequestInfo.Vtbl {
        CreateComponentListEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITuneRequestInfoEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ITuneRequest} CurrentRequest 
     * @returns {IUnknown} 
     */
    CreateComponentListEx(CurrentRequest) {
        result := ComCall(10, this, "ptr", CurrentRequest, "ptr*", &ppCurPMT := 0, "HRESULT")
        return IUnknown(ppCurPMT)
    }

    Query(iid) {
        if (ITuneRequestInfoEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateComponentListEx := CallbackCreate(GetMethod(implObj, "CreateComponentListEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateComponentListEx)
    }
}
