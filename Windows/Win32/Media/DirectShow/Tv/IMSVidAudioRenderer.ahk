#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidOutputDevice.ahk" { IMSVidOutputDevice }

/**
 * The IMSVidAudioRenderer interface represents an audio renderer device. It enables applications to control the volume and balance. To retrieve the audio renderer device that is currently active, call the IMSVidCtl::get_AudioRendererActive method.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAudioRenderer)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidaudiorenderer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidAudioRenderer extends IMSVidOutputDevice {
    /**
     * The interface identifier for IMSVidAudioRenderer
     * @type {Guid}
     */
    static IID := Guid("{37b0353f-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidAudioRenderer
     * @type {Guid}
     */
    static CLSID := Guid("{37b03544-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidAudioRenderer interfaces
    */
    struct Vtbl extends IMSVidOutputDevice.Vtbl {
        put_Volume  : IntPtr
        get_Volume  : IntPtr
        put_Balance : IntPtr
        get_Balance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidAudioRenderer.Vtbl()
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
     * The put_Volume method specifies the audio renderer's volume level.
     * @remarks
     * Full volume is 0 and silence is –10,000. Multiply the desired decibel level by 100; for example, –100 dB is –10,000.
     * @param {Integer} lVol Specifies the volume level, in units of .01 decibel (dB).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-put_volume
     */
    put_Volume(lVol) {
        result := ComCall(16, this, "int", lVol, "HRESULT")
        return result
    }

    /**
     * The get_Volume method retrieves the audio renderer's volume level.
     * @remarks
     * Full volume is 0 and silence is –10,000. Divide by 100 to get the equivalent decibel value; for example, –10,000 is –100 dB.
     * @returns {Integer} Pointer to a variable that receives the volume level, in units of .01 decibel (dB).
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-get_volume
     */
    get_Volume() {
        result := ComCall(17, this, "int*", &lVol := 0, "HRESULT")
        return lVol
    }

    /**
     * The put_Balance method specifies the audio renderer's balance level.
     * @remarks
     * The balance level is a value between –10,000 and 10,000, measured in hundredths of a decibel (dB). If the value is -10,000, the left channel is at full volume and the right channel is attenuated by 100 dB. If the value is 10,000, the right channel is at full volume and the left channel is attenuated by 100 dB. If the value is zero, both channels are at full volume.
     * @param {Integer} lBal Specifies the balance level.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-put_balance
     */
    put_Balance(lBal) {
        result := ComCall(18, this, "int", lBal, "HRESULT")
        return result
    }

    /**
     * .
     * @remarks
     * The balance level is a value between –10,000 and 10,000, measured in hundredths of a decibel (dB). If the value is –10,000, the left channel is at full volume and the right channel is attenuated by 100 dB. If the value is 10,000, the right channel is at full volume and the left channel is attenuated by 100 dB. If the value is zero, both channels are at full volume.
     * @returns {Integer} Pointer to a variable that receives the balance level.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-get_balance
     */
    get_Balance() {
        result := ComCall(19, this, "int*", &lBal := 0, "HRESULT")
        return lBal
    }

    Query(iid) {
        if (IMSVidAudioRenderer.IID.Equals(iid)) {
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
