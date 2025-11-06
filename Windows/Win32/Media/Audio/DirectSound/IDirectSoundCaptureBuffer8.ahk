#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSoundCaptureBuffer.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureBuffer8 extends IDirectSoundCaptureBuffer{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectInPath", "GetFXStatus"]

    /**
     * 
     * @param {Pointer<Guid>} rguidObject 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} rguidInterface 
     * @returns {Pointer<Void>} 
     */
    GetObjectInPath(rguidObject, dwIndex, rguidInterface) {
        result := ComCall(12, this, "ptr", rguidObject, "uint", dwIndex, "ptr", rguidInterface, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }

    /**
     * 
     * @param {Integer} dwEffectsCount 
     * @returns {Integer} 
     */
    GetFXStatus(dwEffectsCount) {
        result := ComCall(13, this, "uint", dwEffectsCount, "uint*", &pdwFXStatus := 0, "HRESULT")
        return pdwFXStatus
    }
}
