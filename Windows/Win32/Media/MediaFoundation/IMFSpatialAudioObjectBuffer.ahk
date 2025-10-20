#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaBuffer.ahk

/**
 * Represents a section of audio data with associated positional and rendering metadata. Spatial audio objects are stored in IMFSpatialAudioSample instances, and allow passing of spatial audio information between Media Foundation components.
 * @remarks
 * 
  * To get the audio data contained in the spatial audio object, use the    <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">IMFMediaBuffer::Lock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock">IMFMediaBuffer::Unlock</a> methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nn-mfspatialaudio-imfspatialaudioobjectbuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSpatialAudioObjectBuffer extends IMFMediaBuffer{
    /**
     * The interface identifier for IMFSpatialAudioObjectBuffer
     * @type {Guid}
     */
    static IID => Guid("{d396ec8c-605e-4249-978d-72ad1c312872}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} u32ID 
     * @returns {HRESULT} 
     */
    SetID(u32ID) {
        result := ComCall(8, this, "uint", u32ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pu32ID 
     * @returns {HRESULT} 
     */
    GetID(pu32ID) {
        result := ComCall(9, this, "uint*", pu32ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     */
    SetType(type) {
        result := ComCall(10, this, "int", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetType(pType) {
        result := ComCall(11, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataItems>} ppMetadataItems 
     * @returns {HRESULT} 
     */
    GetMetadataItems(ppMetadataItems) {
        result := ComCall(12, this, "ptr", ppMetadataItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
