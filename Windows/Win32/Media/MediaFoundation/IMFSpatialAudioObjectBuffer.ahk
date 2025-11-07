#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Audio\ISpatialAudioMetadataItems.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetID", "GetID", "SetType", "GetType", "GetMetadataItems"]

    /**
     * 
     * @param {Integer} u32ID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-setid
     */
    SetID(u32ID) {
        result := ComCall(8, this, "uint", u32ID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-getid
     */
    GetID() {
        result := ComCall(9, this, "uint*", &pu32ID := 0, "HRESULT")
        return pu32ID
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-settype
     */
    SetType(type) {
        result := ComCall(10, this, "int", type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-gettype
     */
    GetType() {
        result := ComCall(11, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {ISpatialAudioMetadataItems} 
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-getmetadataitems
     */
    GetMetadataItems() {
        result := ComCall(12, this, "ptr*", &ppMetadataItems := 0, "HRESULT")
        return ISpatialAudioMetadataItems(ppMetadataItems)
    }
}
