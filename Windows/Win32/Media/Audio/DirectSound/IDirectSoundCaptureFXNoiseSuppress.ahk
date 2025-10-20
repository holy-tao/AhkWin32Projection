#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureFXNoiseSuppress extends IUnknown{
    /**
     * The interface identifier for IDirectSoundCaptureFXNoiseSuppress
     * @type {Guid}
     */
    static IID => Guid("{ed311e41-fbae-4175-9625-cd0854f693ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSCFXNoiseSuppress>} pcDscFxNoiseSuppress 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDscFxNoiseSuppress) {
        result := ComCall(3, this, "ptr", pcDscFxNoiseSuppress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSCFXNoiseSuppress>} pDscFxNoiseSuppress 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDscFxNoiseSuppress) {
        result := ComCall(4, this, "ptr", pDscFxNoiseSuppress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
