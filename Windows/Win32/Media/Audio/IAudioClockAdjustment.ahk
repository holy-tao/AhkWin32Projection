#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioClockAdjustment interface is used to adjust the sample rate of a stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioclockadjustment
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioClockAdjustment extends IUnknown {
    /**
     * The interface identifier for IAudioClockAdjustment
     * @type {Guid}
     */
    static IID := Guid("{f6e4c0a0-46d9-4fb8-be21-57a3ef2b626c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioClockAdjustment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSampleRate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioClockAdjustment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetSampleRate method sets the sample rate of a stream.
     * @remarks
     * This method must not be called from a real-time processing thread.
     * 			
     * 		    
     * 
     * The new sample rate will take effect after the current frame is done processing and will remain in effect until <b>SetSampleRate</b> is called again.
     * 		The audio client must be initialized in shared-mode (AUDCLNT_SHAREMODE_SHARED), otherwise <b>SetSampleRate</b> fails.
     * @param {Float} flSampleRate The new sample rate in frames per second.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio stream has not been successfully initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample rate is out of the range for the Audio Processing Object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclockadjustment-setsamplerate
     */
    SetSampleRate(flSampleRate) {
        result := ComCall(3, this, "float", flSampleRate, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioClockAdjustment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSampleRate := CallbackCreate(GetMethod(implObj, "SetSampleRate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSampleRate)
    }
}
