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
     * @param {Pointer<Integer>} pdwResultCodes 
     * @returns {HRESULT} 
     */
    SetFX(dwEffectsCount, pDSFXDesc, pdwResultCodes) {
        pdwResultCodesMarshal := pdwResultCodes is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwEffectsCount, "ptr", pDSFXDesc, pdwResultCodesMarshal, pdwResultCodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwEffectsCount 
     * @param {Pointer<Integer>} pdwResultCodes 
     * @returns {HRESULT} 
     */
    AcquireResources(dwFlags, dwEffectsCount, pdwResultCodes) {
        pdwResultCodesMarshal := pdwResultCodes is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", dwFlags, "uint", dwEffectsCount, pdwResultCodesMarshal, pdwResultCodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @param {Pointer<Pointer<Void>>} ppObject 
     * @returns {HRESULT} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface, ppObject) {
        ppObjectMarshal := ppObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, "ptr", rguidObject, "uint", dwIndex, "ptr", rguidInterface, ppObjectMarshal, ppObject, "HRESULT")
        return result
    }
}
