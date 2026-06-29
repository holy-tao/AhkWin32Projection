#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a callback to the media engine to notify key request data.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineneedkeynotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineNeedKeyNotify extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineNeedKeyNotify
     * @type {Guid}
     */
    static IID := Guid("{46a30204-a696-4b18-8804-246b8f031bb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineNeedKeyNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NeedKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineNeedKeyNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the application that a key or keys are needed along with any initialization data.
     * @param {Integer} initData The initialization data.
     * @param {Integer} cb The count in bytes of <i>initData</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineneedkeynotify-needkey
     */
    NeedKey(initData, cb) {
        ComCall(3, this, "ptr", initData, "uint", cb)
    }

    Query(iid) {
        if (IMFMediaEngineNeedKeyNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NeedKey := CallbackCreate(GetMethod(implObj, "NeedKey"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NeedKey)
    }
}
