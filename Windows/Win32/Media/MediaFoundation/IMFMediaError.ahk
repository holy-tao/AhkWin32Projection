#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_MEDIA_ENGINE_ERR.ahk" { MF_MEDIA_ENGINE_ERR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the current error status for the Media Engine.
 * @remarks
 * The <b>IMFMediaError</b> interface corresponds to the <b>MediaError</b> object in HTML5.
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-geterror">IMFMediaEngine::GetError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaerror
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaError extends IUnknown {
    /**
     * The interface identifier for IMFMediaError
     * @type {Guid}
     */
    static IID := Guid("{fc0e10d2-ab2a-4501-a951-06bb1075184c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetErrorCode         : IntPtr
        GetExtendedErrorCode : IntPtr
        SetErrorCode         : IntPtr
        SetExtendedErrorCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the error code.
     * @returns {Integer} Returns a value from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_err">MF_MEDIA_ENGINE_ERR</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaerror-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(3, this, UInt16)
        return result
    }

    /**
     * Gets the extended error code.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that gives additional information about the last error.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaerror-getextendederrorcode
     */
    GetExtendedErrorCode() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the error code.
     * @param {MF_MEDIA_ENGINE_ERR} _error The error code, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_err">MF_MEDIA_ENGINE_ERR</a> value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaerror-seterrorcode
     */
    SetErrorCode(_error) {
        result := ComCall(5, this, MF_MEDIA_ENGINE_ERR, _error, "HRESULT")
        return result
    }

    /**
     * Sets the extended error code.
     * @param {HRESULT} _error An <b>HRESULT</b> value that gives additional information about the last error.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaerror-setextendederrorcode
     */
    SetExtendedErrorCode(_error) {
        result := ComCall(6, this, "int", _error, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetErrorCode := CallbackCreate(GetMethod(implObj, "GetErrorCode"), flags, 1)
        this.vtbl.GetExtendedErrorCode := CallbackCreate(GetMethod(implObj, "GetExtendedErrorCode"), flags, 1)
        this.vtbl.SetErrorCode := CallbackCreate(GetMethod(implObj, "SetErrorCode"), flags, 2)
        this.vtbl.SetExtendedErrorCode := CallbackCreate(GetMethod(implObj, "SetExtendedErrorCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetErrorCode)
        CallbackFree(this.vtbl.GetExtendedErrorCode)
        CallbackFree(this.vtbl.SetErrorCode)
        CallbackFree(this.vtbl.SetExtendedErrorCode)
    }
}
