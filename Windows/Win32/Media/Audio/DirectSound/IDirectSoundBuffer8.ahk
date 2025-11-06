#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSoundBuffer.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundBuffer8 extends IDirectSoundBuffer{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFX", "AcquireResources", "GetObjectInPath"]

    /**
     * 
     * @param {Integer} dwEffectsCount 
     * @param {Pointer<DSEFFECTDESC>} pDSFXDesc 
     * @returns {Integer} 
     */
    SetFX(dwEffectsCount, pDSFXDesc) {
        result := ComCall(21, this, "uint", dwEffectsCount, "ptr", pDSFXDesc, "uint*", &pdwResultCodes := 0, "HRESULT")
        return pdwResultCodes
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwEffectsCount 
     * @returns {Integer} 
     */
    AcquireResources(dwFlags, dwEffectsCount) {
        result := ComCall(22, this, "uint", dwFlags, "uint", dwEffectsCount, "uint*", &pdwResultCodes := 0, "HRESULT")
        return pdwResultCodes
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @returns {Pointer<Void>} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface) {
        result := ComCall(23, this, "ptr", rguidObject, "uint", dwIndex, "ptr", rguidInterface, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }
}
