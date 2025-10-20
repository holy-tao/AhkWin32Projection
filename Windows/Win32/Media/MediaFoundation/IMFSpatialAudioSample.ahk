#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSample.ahk

/**
 * Represents a multimedia sample with spatial sound information. Every IMFSpatialAudioSample contains one or more IMFSpatialAudioObjectBuffer objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nn-mfspatialaudio-imfspatialaudiosample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSpatialAudioSample extends IMFSample{
    /**
     * The interface identifier for IMFSpatialAudioSample
     * @type {Guid}
     */
    static IID => Guid("{abf28a9b-3393-4290-ba79-5ffc46d986b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * 
     * @param {Pointer<UInt32>} pdwObjectCount 
     * @returns {HRESULT} 
     */
    GetObjectCount(pdwObjectCount) {
        result := ComCall(47, this, "uint*", pdwObjectCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFSpatialAudioObjectBuffer>} pAudioObjBuffer 
     * @returns {HRESULT} 
     */
    AddSpatialAudioObject(pAudioObjBuffer) {
        result := ComCall(48, this, "ptr", pAudioObjBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFSpatialAudioObjectBuffer>} ppAudioObjBuffer 
     * @returns {HRESULT} 
     */
    GetSpatialAudioObjectByIndex(dwIndex, ppAudioObjBuffer) {
        result := ComCall(49, this, "uint", dwIndex, "ptr", ppAudioObjBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
