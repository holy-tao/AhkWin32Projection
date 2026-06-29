#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IBasicAudio interface controls the volume and balance of the audio stream.This interface is implemented on the Audio Renderer (WaveOut) filter and the DirectSound Renderer filter, but is exposed to applications through the Filter Graph Manager.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-ibasicaudio
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBasicAudio extends IDispatch {
    /**
     * The interface identifier for IBasicAudio
     * @type {Guid}
     */
    static IID := Guid("{56a868b3-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBasicAudio interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_Volume  : IntPtr
        get_Volume  : IntPtr
        put_Balance : IntPtr
        get_Balance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBasicAudio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {Integer} 
     */
    Balance {
        get => this.get_Balance()
        set => this.put_Balance(value)
    }

    /**
     * The put_Volume method sets the volume (amplitude) of the audio signal.
     * @param {Integer} lVolume Specifies the volume, as a number from –10,000 to 0, inclusive. Full volume is 0, and –10,000 is silence. Multiply the desired decibel level by 100. For example, –10,000 = –100 dB.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying audio device returned an error.
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
     * The value of <i>lVolume</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph does not contain an audio renderer filter. (Possibly the source does not contain an audio stream.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-put_volume
     */
    put_Volume(lVolume) {
        result := ComCall(7, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * The get_Volume method retrieves the volume (amplitude) of the audio signal.
     * @returns {Integer} Pointer to a variable that receive the volume. Divide by 100 to get equivalent decibel value. For example, –10,000 is –100 dB.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-get_volume
     */
    get_Volume() {
        result := ComCall(8, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * The put_Balance method sets the balance of the audio signal.
     * @param {Integer} lBalance Specifies the balance. The value can range from -10,000 to 10,000. The value -10,000 means the right channel is attenuated by 100 dB and is effectively silent. The value 10,000 means the left channel is silent. The neutral value is 0, which means that both channels are at full volume. When one channel is attenuated, the other remains at full volume.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying audio device returned an error.
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
     * The value of <i>lBalance</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph does not contain an audio renderer filter. (Possibly the source does not contain an audio stream.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-put_balance
     */
    put_Balance(lBalance) {
        result := ComCall(9, this, "int", lBalance, "HRESULT")
        return result
    }

    /**
     * The get_Balance method retrieves the balance for the audio signal.
     * @remarks
     * The balance ranges from -10,000 to 10,000. The value -10,000 means the right channel is attenuated by 100 dB and is effectively silent. The value 10,000 means the left channel is silent. The neutral value is 0, which means that both channels are at full volume. When one channel is attenuated, the other remains at full volume.
     * @returns {Integer} Pointer to a variable that receives the balance.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-get_balance
     */
    get_Balance() {
        result := ComCall(10, this, "int*", &plBalance := 0, "HRESULT")
        return plBalance
    }

    Query(iid) {
        if (IBasicAudio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Volume := CallbackCreate(GetMethod(implObj, "put_Volume"), flags, 2)
        this.vtbl.get_Volume := CallbackCreate(GetMethod(implObj, "get_Volume"), flags, 2)
        this.vtbl.put_Balance := CallbackCreate(GetMethod(implObj, "put_Balance"), flags, 2)
        this.vtbl.get_Balance := CallbackCreate(GetMethod(implObj, "get_Balance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Volume)
        CallbackFree(this.vtbl.get_Volume)
        CallbackFree(this.vtbl.put_Balance)
        CallbackFree(this.vtbl.get_Balance)
    }
}
