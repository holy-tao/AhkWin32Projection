#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAMTuner.ahk" { IAMTuner }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Note  This interface is not implemented and has been deprecated. The IBPCSatelliteTuner interface supports satellite television tuning.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ibpcsatellitetuner
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBPCSatelliteTuner extends IAMTuner {
    /**
     * The interface identifier for IBPCSatelliteTuner
     * @type {Guid}
     */
    static IID := Guid("{211a8765-03ac-11d1-8d13-00aa00bd8339}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBPCSatelliteTuner interfaces
    */
    struct Vtbl extends IAMTuner.Vtbl {
        get_DefaultSubChannelTypes : IntPtr
        put_DefaultSubChannelTypes : IntPtr
        IsTapingPermitted          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBPCSatelliteTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IBPCSatelliteTuner interface is deprecated. Gets the default sub-channel types.
     * @param {Pointer<Integer>} plDefaultVideoType Receives a provider-specific service type for video.
     * @param {Pointer<Integer>} plDefaultAudioType Receives a provider-specific service type for audio.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibpcsatellitetuner-get_defaultsubchanneltypes
     */
    get_DefaultSubChannelTypes(plDefaultVideoType, plDefaultAudioType) {
        plDefaultVideoTypeMarshal := plDefaultVideoType is VarRef ? "int*" : "ptr"
        plDefaultAudioTypeMarshal := plDefaultAudioType is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plDefaultVideoTypeMarshal, plDefaultVideoType, plDefaultAudioTypeMarshal, plDefaultAudioType, "HRESULT")
        return result
    }

    /**
     * Note  The IBPCSatelliteTuner interface is deprecated. Sets the default sub-channel types.
     * @param {Integer} lDefaultVideoType Provider-specific service type for video.
     * @param {Integer} lDefaultAudioType Provider-specific service type for audio.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibpcsatellitetuner-put_defaultsubchanneltypes
     */
    put_DefaultSubChannelTypes(lDefaultVideoType, lDefaultAudioType) {
        result := ComCall(19, this, "int", lDefaultVideoType, "int", lDefaultAudioType, "HRESULT")
        return result
    }

    /**
     * Note  The IBPCSatelliteTuner interface is deprecated. Queries whether taping is permitted.
     * @returns {HRESULT} Returns S_OK if taping is permitted or S_FALSE if taping is not permitted.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibpcsatellitetuner-istapingpermitted
     */
    IsTapingPermitted() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBPCSatelliteTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DefaultSubChannelTypes := CallbackCreate(GetMethod(implObj, "get_DefaultSubChannelTypes"), flags, 3)
        this.vtbl.put_DefaultSubChannelTypes := CallbackCreate(GetMethod(implObj, "put_DefaultSubChannelTypes"), flags, 3)
        this.vtbl.IsTapingPermitted := CallbackCreate(GetMethod(implObj, "IsTapingPermitted"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DefaultSubChannelTypes)
        CallbackFree(this.vtbl.put_DefaultSubChannelTypes)
        CallbackFree(this.vtbl.IsTapingPermitted)
    }
}
