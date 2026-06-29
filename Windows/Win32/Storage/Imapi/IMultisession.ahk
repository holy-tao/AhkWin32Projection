#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IDiscRecorder2.ahk" { IDiscRecorder2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Base interface containing properties common to derived multisession interfaces.
 * @remarks
 * If more than one multi-session interface exist, the application can let <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> choose a compatible multi-session interface to use  or the application can specify the multi-session interface to use by setting the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">put_InUse</a> property to VARIANT_TRUE.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-imultisession
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMultisession extends IDispatch {
    /**
     * The interface identifier for IMultisession
     * @type {Guid}
     */
    static IID := Guid("{27354150-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultisession interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IsSupportedOnCurrentMediaState : IntPtr
        put_InUse                          : IntPtr
        get_InUse                          : IntPtr
        get_ImportRecorder                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultisession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSupportedOnCurrentMediaState {
        get => this.get_IsSupportedOnCurrentMediaState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    InUse {
        get => this.get_InUse()
        set => this.put_InUse(value)
    }

    /**
     * @type {IDiscRecorder2} 
     */
    ImportRecorder {
        get => this.get_ImportRecorder()
    }

    /**
     * Determines if the multi-session type can write to the current optical media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the multi-session interface can write to the current optical media in its current state. Otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-get_issupportedoncurrentmediastate
     */
    get_IsSupportedOnCurrentMediaState() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if this multi-session interface is the one you should use on the current media. (Put)
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE if this multi-session interface is the one you should use to write to the current media. Otherwise, VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-put_inuse
     */
    put_InUse(value) {
        result := ComCall(8, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines if this multi-session interface is the one you should use on the current media. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if this multi-session interface is the one you should use to write to the  current media. Otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-get_inuse
     */
    get_InUse() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the disc recorder to use to import one or more previous sessions.
     * @remarks
     * The import recorder reads session content from the optical media and provides it to <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a>.
     * @returns {IDiscRecorder2} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the device that contains one or more session images to import.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-get_importrecorder
     */
    get_ImportRecorder() {
        result := ComCall(10, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2(value)
    }

    Query(iid) {
        if (IMultisession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsSupportedOnCurrentMediaState := CallbackCreate(GetMethod(implObj, "get_IsSupportedOnCurrentMediaState"), flags, 2)
        this.vtbl.put_InUse := CallbackCreate(GetMethod(implObj, "put_InUse"), flags, 2)
        this.vtbl.get_InUse := CallbackCreate(GetMethod(implObj, "get_InUse"), flags, 2)
        this.vtbl.get_ImportRecorder := CallbackCreate(GetMethod(implObj, "get_ImportRecorder"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsSupportedOnCurrentMediaState)
        CallbackFree(this.vtbl.put_InUse)
        CallbackFree(this.vtbl.get_InUse)
        CallbackFree(this.vtbl.get_ImportRecorder)
    }
}
