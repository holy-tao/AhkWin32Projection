#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSFXI3DL2Reverb.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXI3DL2Reverb extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllParameters", "GetAllParameters", "SetPreset", "GetPreset", "SetQuality", "GetQuality"]

    /**
     * 
     * @param {Pointer<DSFXI3DL2Reverb>} pcDsFxI3DL2Reverb 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxI3DL2Reverb) {
        result := ComCall(3, this, "ptr", pcDsFxI3DL2Reverb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXI3DL2Reverb} 
     */
    GetAllParameters() {
        pDsFxI3DL2Reverb := DSFXI3DL2Reverb()
        result := ComCall(4, this, "ptr", pDsFxI3DL2Reverb, "HRESULT")
        return pDsFxI3DL2Reverb
    }

    /**
     * 
     * @param {Integer} dwPreset 
     * @returns {HRESULT} 
     */
    SetPreset(dwPreset) {
        result := ComCall(5, this, "uint", dwPreset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPreset() {
        result := ComCall(6, this, "uint*", &pdwPreset := 0, "HRESULT")
        return pdwPreset
    }

    /**
     * 
     * @param {Integer} lQuality 
     * @returns {HRESULT} 
     */
    SetQuality(lQuality) {
        result := ComCall(7, this, "int", lQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetQuality() {
        result := ComCall(8, this, "int*", &plQuality := 0, "HRESULT")
        return plQuality
    }
}
