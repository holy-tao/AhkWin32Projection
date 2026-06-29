#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMPSubscriptionDownloadState.ahk" { WMPSubscriptionDownloadState }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPDownloadItem extends IDispatch {
    /**
     * The interface identifier for IWMPDownloadItem
     * @type {Guid}
     */
    static IID := Guid("{c9470e8e-3f6b-46a9-a0a9-452815c34297}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPDownloadItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_sourceURL     : IntPtr
        get_size          : IntPtr
        get_type          : IntPtr
        get_progress      : IntPtr
        get_downloadState : IntPtr
        pause             : IntPtr
        resume            : IntPtr
        cancel            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPDownloadItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    sourceURL {
        get => this.get_sourceURL()
    }

    /**
     */
    size {
        get => this.get_size()
    }

    /**
     */
    type {
        get => this.get_type()
    }

    /**
     */
    progress {
        get => this.get_progress()
    }

    /**
     */
    downloadState {
        get => this.get_downloadState()
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    get_sourceURL(pbstrURL) {
        result := ComCall(7, this, BSTR.Ptr, pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     */
    get_size(plSize) {
        plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plSizeMarshal, plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_type(pbstrType) {
        result := ComCall(9, this, BSTR.Ptr, pbstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plProgress 
     * @returns {HRESULT} 
     */
    get_progress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WMPSubscriptionDownloadState>} pwmpsdls 
     * @returns {HRESULT} 
     */
    get_downloadState(pwmpsdls) {
        pwmpsdlsMarshal := pwmpsdls is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pwmpsdlsMarshal, pwmpsdls, "HRESULT")
        return result
    }

    /**
     * The pause command pauses playing or recording.
     * @remarks
     * With the MCICDA, MCISEQ, and MCIPIONR drivers, the pause command works the same as the [stop](stop.md) command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/pause
     */
    pause() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The resume command continues playing or recording on a device that has been paused using the pause command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/resume
     */
    resume() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    cancel() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPDownloadItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_sourceURL := CallbackCreate(GetMethod(implObj, "get_sourceURL"), flags, 2)
        this.vtbl.get_size := CallbackCreate(GetMethod(implObj, "get_size"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_progress := CallbackCreate(GetMethod(implObj, "get_progress"), flags, 2)
        this.vtbl.get_downloadState := CallbackCreate(GetMethod(implObj, "get_downloadState"), flags, 2)
        this.vtbl.pause := CallbackCreate(GetMethod(implObj, "pause"), flags, 1)
        this.vtbl.resume := CallbackCreate(GetMethod(implObj, "resume"), flags, 1)
        this.vtbl.cancel := CallbackCreate(GetMethod(implObj, "cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_sourceURL)
        CallbackFree(this.vtbl.get_size)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_progress)
        CallbackFree(this.vtbl.get_downloadState)
        CallbackFree(this.vtbl.pause)
        CallbackFree(this.vtbl.resume)
        CallbackFree(this.vtbl.cancel)
    }
}
