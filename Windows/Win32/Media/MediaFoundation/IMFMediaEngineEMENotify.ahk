#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineEMENotify extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineEMENotify
     * @type {Guid}
     */
    static IID := Guid("{9e184d15-cdb7-4f86-b49e-566689f4a601}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineEMENotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Encrypted     : IntPtr
        WaitingForKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineEMENotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pbInitData 
     * @param {Integer} cb 
     * @param {BSTR} bstrInitDataType 
     * @returns {String} Nothing - always returns an empty string
     */
    Encrypted(pbInitData, cb, bstrInitDataType) {
        bstrInitDataType := bstrInitDataType is String ? BSTR.Alloc(bstrInitDataType).Value : bstrInitDataType

        ComCall(3, this, "ptr", pbInitData, "uint", cb, BSTR, bstrInitDataType)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    WaitingForKey() {
        ComCall(4, this)
    }

    Query(iid) {
        if (IMFMediaEngineEMENotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Encrypted := CallbackCreate(GetMethod(implObj, "Encrypted"), flags, 4)
        this.vtbl.WaitingForKey := CallbackCreate(GetMethod(implObj, "WaitingForKey"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Encrypted)
        CallbackFree(this.vtbl.WaitingForKey)
    }
}
