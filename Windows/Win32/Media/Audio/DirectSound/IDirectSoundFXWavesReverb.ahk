#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSFXWavesReverb.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXWavesReverb extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllParameters", "GetAllParameters"]

    /**
     * 
     * @param {Pointer<DSFXWavesReverb>} pcDsFxWavesReverb 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxWavesReverb) {
        result := ComCall(3, this, "ptr", pcDsFxWavesReverb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXWavesReverb} 
     */
    GetAllParameters() {
        pDsFxWavesReverb := DSFXWavesReverb()
        result := ComCall(4, this, "ptr", pDsFxWavesReverb, "HRESULT")
        return pDsFxWavesReverb
    }
}
