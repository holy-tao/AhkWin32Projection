#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSoundCaptureBuffer.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureBuffer8 extends IDirectSoundCaptureBuffer{
    /**
     * The interface identifier for IDirectSoundCaptureBuffer8
     * @type {Guid}
     */
    static IID => Guid("{00990df4-0dbb-4872-833e-6d303e80aeb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @param {Pointer<Void>} ppObject 
     * @returns {HRESULT} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface, ppObject) {
        result := ComCall(12, this, "ptr", rguidObject, "uint", dwIndex, "ptr", rguidInterface, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEffectsCount 
     * @param {Pointer<UInt32>} pdwFXStatus 
     * @returns {HRESULT} 
     */
    GetFXStatus(dwEffectsCount, pdwFXStatus) {
        result := ComCall(13, this, "uint", dwEffectsCount, "uint*", pdwFXStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
