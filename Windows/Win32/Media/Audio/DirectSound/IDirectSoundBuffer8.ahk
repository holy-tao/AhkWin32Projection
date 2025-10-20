#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSoundBuffer.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundBuffer8 extends IDirectSoundBuffer{
    /**
     * The interface identifier for IDirectSoundBuffer8
     * @type {Guid}
     */
    static IID => Guid("{6825a449-7524-4d82-920f-50e36ab3ab1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * 
     * @param {Integer} dwEffectsCount 
     * @param {Pointer<DSEFFECTDESC>} pDSFXDesc 
     * @param {Pointer<UInt32>} pdwResultCodes 
     * @returns {HRESULT} 
     */
    SetFX(dwEffectsCount, pDSFXDesc, pdwResultCodes) {
        result := ComCall(21, this, "uint", dwEffectsCount, "ptr", pDSFXDesc, "uint*", pdwResultCodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwEffectsCount 
     * @param {Pointer<UInt32>} pdwResultCodes 
     * @returns {HRESULT} 
     */
    AcquireResources(dwFlags, dwEffectsCount, pdwResultCodes) {
        result := ComCall(22, this, "uint", dwFlags, "uint", dwEffectsCount, "uint*", pdwResultCodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @param {Pointer<Void>} ppObject 
     * @returns {HRESULT} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface, ppObject) {
        result := ComCall(23, this, "ptr", rguidObject, "uint", dwIndex, "ptr", rguidInterface, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
