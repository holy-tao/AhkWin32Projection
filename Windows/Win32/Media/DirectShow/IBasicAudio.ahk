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
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_Volume(lVolume) {
        result := ComCall(7, this, "int", lVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plVolume 
     * @returns {HRESULT} 
     */
    get_Volume(plVolume) {
        result := ComCall(8, this, "int*", plVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lBalance 
     * @returns {HRESULT} 
     */
    put_Balance(lBalance) {
        result := ComCall(9, this, "int", lBalance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBalance 
     * @returns {HRESULT} 
     */
    get_Balance(plBalance) {
        result := ComCall(10, this, "int*", plBalance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
