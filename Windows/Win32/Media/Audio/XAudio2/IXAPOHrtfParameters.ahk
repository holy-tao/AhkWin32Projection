#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\HrtfEnvironment.ahk" { HrtfEnvironment }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HrtfOrientation.ahk" { HrtfOrientation }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\HrtfPosition.ahk" { HrtfPosition }

/**
 * The interface used to set parameters that control how head-related transfer function (HRTF) is applied to a sound.
 * @remarks
 * Create instances of the XAPO interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/hrtfapoapi/nf-hrtfapoapi-createhrtfapo">CreateHrtfApo</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nn-hrtfapoapi-ixapohrtfparameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct IXAPOHrtfParameters extends IUnknown {
    /**
     * The interface identifier for IXAPOHrtfParameters
     * @type {Guid}
     */
    static IID := Guid("{15b3cd66-e9de-4464-b6e6-2bc3cf63d455}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXAPOHrtfParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSourcePosition    : IntPtr
        SetSourceOrientation : IntPtr
        SetSourceGain        : IntPtr
        SetEnvironment       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXAPOHrtfParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the position of the sound relative to the listener.
     * @param {Pointer<HrtfPosition>} position The position of the sound relative to the listener.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourceposition
     */
    SetSourcePosition(position) {
        result := ComCall(3, this, HrtfPosition.Ptr, position, "HRESULT")
        return result
    }

    /**
     * Set the rotation matrix for the source orientation, with respect to the listener's coordinate system.
     * @param {Pointer<HrtfOrientation>} orientation The rotation matrix for the source orientation, with respect to the listener's frame of reference.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourceorientation
     */
    SetSourceOrientation(orientation) {
        result := ComCall(4, this, HrtfOrientation.Ptr, orientation, "HRESULT")
        return result
    }

    /**
     * Sets the custom direct-path gain value for the current source position. Valid only for sounds played with the HrtfDistanceDecayType custom decay type.
     * @param {Float} gain The custom direct-path gain value for the current source position in dB. Valid only for sounds played with the HrtfDistanceDecayType custom decay type.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourcegain
     */
    SetSourceGain(gain) {
        result := ComCall(5, this, "float", gain, "HRESULT")
        return result
    }

    /**
     * Selects the acoustic environment to simulate.
     * @remarks
     * The environment represents distance-cue params.
     * @param {HrtfEnvironment} environment The acoustic environment to simulate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setenvironment
     */
    SetEnvironment(environment) {
        result := ComCall(6, this, HrtfEnvironment, environment, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXAPOHrtfParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSourcePosition := CallbackCreate(GetMethod(implObj, "SetSourcePosition"), flags, 2)
        this.vtbl.SetSourceOrientation := CallbackCreate(GetMethod(implObj, "SetSourceOrientation"), flags, 2)
        this.vtbl.SetSourceGain := CallbackCreate(GetMethod(implObj, "SetSourceGain"), flags, 2)
        this.vtbl.SetEnvironment := CallbackCreate(GetMethod(implObj, "SetEnvironment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSourcePosition)
        CallbackFree(this.vtbl.SetSourceOrientation)
        CallbackFree(this.vtbl.SetSourceGain)
        CallbackFree(this.vtbl.SetEnvironment)
    }
}
