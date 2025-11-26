#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IBasicAudio interface controls the volume and balance of the audio stream.This interface is implemented on the Audio Renderer (WaveOut) filter and the DirectSound Renderer filter, but is exposed to applications through the Filter Graph Manager.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ibasicaudio
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBasicAudio extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicAudio
     * @type {Guid}
     */
    static IID => Guid("{56a868b3-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Volume", "get_Volume", "put_Balance", "get_Balance"]

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
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-put_volume
     */
    put_Volume(lVolume) {
        result := ComCall(7, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-get_volume
     */
    get_Volume() {
        result := ComCall(8, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {Integer} lBalance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-put_balance
     */
    put_Balance(lBalance) {
        result := ComCall(9, this, "int", lBalance, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicaudio-get_balance
     */
    get_Balance() {
        result := ComCall(10, this, "int*", &plBalance := 0, "HRESULT")
        return plBalance
    }
}
