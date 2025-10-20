#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXWavesReverb extends IUnknown{
    /**
     * The interface identifier for IDirectSoundFXWavesReverb
     * @type {Guid}
     */
    static IID => Guid("{46858c3a-0dc6-45e3-b760-d4eef16cb325}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSFXWavesReverb>} pcDsFxWavesReverb 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxWavesReverb) {
        result := ComCall(3, this, "ptr", pcDsFxWavesReverb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSFXWavesReverb>} pDsFxWavesReverb 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxWavesReverb) {
        result := ComCall(4, this, "ptr", pDsFxWavesReverb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
