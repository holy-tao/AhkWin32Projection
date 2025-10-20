#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXI3DL2Reverb extends IUnknown{
    /**
     * The interface identifier for IDirectSoundFXI3DL2Reverb
     * @type {Guid}
     */
    static IID => Guid("{4b166a6a-0d66-43f3-80e3-ee6280dee1a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSFXI3DL2Reverb>} pcDsFxI3DL2Reverb 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxI3DL2Reverb) {
        result := ComCall(3, this, "ptr", pcDsFxI3DL2Reverb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSFXI3DL2Reverb>} pDsFxI3DL2Reverb 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxI3DL2Reverb) {
        result := ComCall(4, this, "ptr", pDsFxI3DL2Reverb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPreset 
     * @returns {HRESULT} 
     */
    SetPreset(dwPreset) {
        result := ComCall(5, this, "uint", dwPreset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPreset 
     * @returns {HRESULT} 
     */
    GetPreset(pdwPreset) {
        result := ComCall(6, this, "uint*", pdwPreset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lQuality 
     * @returns {HRESULT} 
     */
    SetQuality(lQuality) {
        result := ComCall(7, this, "int", lQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plQuality 
     * @returns {HRESULT} 
     */
    GetQuality(plQuality) {
        result := ComCall(8, this, "int*", plQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
