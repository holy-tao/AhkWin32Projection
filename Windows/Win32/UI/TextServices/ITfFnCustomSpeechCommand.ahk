#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnCustomSpeechCommand extends ITfFunction {
    /**
     * The interface identifier for ITfFnCustomSpeechCommand
     * @type {Guid}
     */
    static IID := Guid("{fca6c349-a12f-43a3-8dd6-5a5a4282577b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnCustomSpeechCommand interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        SetSpeechCommandProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnCustomSpeechCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pspcmdProvider 
     * @returns {HRESULT} 
     */
    SetSpeechCommandProvider(pspcmdProvider) {
        result := ComCall(4, this, "ptr", pspcmdProvider, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnCustomSpeechCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSpeechCommandProvider := CallbackCreate(GetMethod(implObj, "SetSpeechCommandProvider"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSpeechCommandProvider)
    }
}
