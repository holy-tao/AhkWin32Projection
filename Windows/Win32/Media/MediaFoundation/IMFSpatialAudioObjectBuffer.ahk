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
     * Sets the ID of the spatial audio object represented by the buffer.
     * @param {Integer} u32ID A 32-bit unsigned unique ID of the audio object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-setid
     */
    SetID(u32ID) {
        result := ComCall(8, this, "uint", u32ID, "HRESULT")
        return result
    }

    /**
     * Returns the unique, unsigned 32-bit ID of the spatial audio object represented by the buffer.
     * @returns {Integer} Pointer to a 32-bit variable where the object ID will be stored.
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-getid
     */
    GetID() {
        result := ComCall(9, this, "uint*", &pu32ID := 0, "HRESULT")
        return pu32ID
    }

    /**
     * Sets the type of the spatial audio object represented by the buffer.
     * @param {Integer} type A value from the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a> enumeration specifying the type of audio object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-settype
     */
    SetType(type) {
        result := ComCall(10, this, "int", type, "HRESULT")
        return result
    }

    /**
     * Gets the type of the spatial audio object represented by the buffer. If SetType has not been called previously, this method returns the default value of AudioObjectType_None.
     * @returns {Integer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a> variable where the audio object type will be stored.
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-gettype
     */
    GetType() {
        result := ComCall(11, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves a pointer to a buffer that may contain spatial audio metadata.
     * @returns {ISpatialAudioMetadataItems} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object in which the collection
     *     of metadata items will be stored.
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-getmetadataitems
     */
    GetMetadataItems() {
        result := ComCall(12, this, "ptr*", &ppMetadataItems := 0, "HRESULT")
        return ISpatialAudioMetadataItems(ppMetadataItems)
    }
}
