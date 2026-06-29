#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKsPin.ahk" { IKsPin }
#Import ".\IKsObject.ahk" { IKsObject }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsQualityForwarder extends IKsObject {
    /**
     * The interface identifier for IKsQualityForwarder
     * @type {Guid}
     */
    static IID := Guid("{97ebaacb-95bd-11d0-a3ea-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsQualityForwarder interfaces
    */
    struct Vtbl extends IKsObject.Vtbl {
        KsFlushClient : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsQualityForwarder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IKsPin} Pin 
     * @returns {String} Nothing - always returns an empty string
     */
    KsFlushClient(Pin) {
        ComCall(4, this, "ptr", Pin)
    }

    Query(iid) {
        if (IKsQualityForwarder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsFlushClient := CallbackCreate(GetMethod(implObj, "KsFlushClient"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsFlushClient)
    }
}
