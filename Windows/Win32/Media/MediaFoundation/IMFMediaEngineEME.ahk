#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaKeys.ahk" { IMFMediaKeys }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by the media engine to add encrypted media extensions methods.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineeme
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineEME extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineEME
     * @type {Guid}
     */
    static IID := Guid("{50dc93e4-ba4f-4275-ae66-83e836e57469}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineEME interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Keys     : IntPtr
        SetMediaKeys : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineEME.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IMFMediaKeys} 
     */
    Keys {
        get => this.get_Keys()
    }

    /**
     * Gets the media keys object associated with the media engine or null if there is not a media keys object.
     * @returns {IMFMediaKeys} The media keys object associated with the media engine or <b>null</b> if there is not a media keys object.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineeme-get_keys
     */
    get_Keys() {
        result := ComCall(3, this, "ptr*", &keys := 0, "HRESULT")
        return IMFMediaKeys(keys)
    }

    /**
     * Sets the media keys object to use with the media engine.
     * @param {IMFMediaKeys} keys The media keys.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineeme-setmediakeys
     */
    SetMediaKeys(keys) {
        result := ComCall(4, this, "ptr", keys, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineEME.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Keys := CallbackCreate(GetMethod(implObj, "get_Keys"), flags, 2)
        this.vtbl.SetMediaKeys := CallbackCreate(GetMethod(implObj, "SetMediaKeys"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Keys)
        CallbackFree(this.vtbl.SetMediaKeys)
    }
}
