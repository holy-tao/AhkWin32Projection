#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaBuffer.ahk" { IMFMediaBuffer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\ISpatialAudioMetadataItems.ahk" { ISpatialAudioMetadataItems }
#Import "..\Audio\AudioObjectType.ahk" { AudioObjectType }

/**
 * Represents a section of audio data with associated positional and rendering metadata. Spatial audio objects are stored in IMFSpatialAudioSample instances, and allow passing of spatial audio information between Media Foundation components.
 * @remarks
 * To get the audio data contained in the spatial audio object, use the    <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">IMFMediaBuffer::Lock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock">IMFMediaBuffer::Unlock</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nn-mfspatialaudio-imfspatialaudioobjectbuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSpatialAudioObjectBuffer extends IMFMediaBuffer {
    /**
     * The interface identifier for IMFSpatialAudioObjectBuffer
     * @type {Guid}
     */
    static IID := Guid("{d396ec8c-605e-4249-978d-72ad1c312872}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSpatialAudioObjectBuffer interfaces
    */
    struct Vtbl extends IMFMediaBuffer.Vtbl {
        SetID            : IntPtr
        GetID            : IntPtr
        SetType          : IntPtr
        GetType          : IntPtr
        GetMetadataItems : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSpatialAudioObjectBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the ID of the spatial audio object represented by the buffer.
     * @remarks
     * The object ID must be unique for each spatial audio sample.  Subsequent samples can 
     *     contain spatial audio objects with the same IDs to represent moving dynamic objects or constant
     *     static objects.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-setid
     */
    SetID(u32ID) {
        result := ComCall(8, this, "uint", u32ID, "HRESULT")
        return result
    }

    /**
     * Returns the unique, unsigned 32-bit ID of the spatial audio object represented by the buffer.
     * @returns {Integer} Pointer to a 32-bit variable where the object ID will be stored.
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-getid
     */
    GetID() {
        result := ComCall(9, this, "uint*", &pu32ID := 0, "HRESULT")
        return pu32ID
    }

    /**
     * Sets the type of the spatial audio object represented by the buffer.
     * @remarks
     * A spatial audio object can be of type <b>AudioObjectType_Dynamic</b>, which means that it can change position and orientation in 3D space over time, or it can have a value such as <b>AudioObjectType_FrontLeft</b> which represents the static position of a real or virtual speaker that does not change position over time.
     * @param {AudioObjectType} type A value from the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a> enumeration specifying the type of audio object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-settype
     */
    SetType(type) {
        result := ComCall(10, this, AudioObjectType, type, "HRESULT")
        return result
    }

    /**
     * Gets the type of the spatial audio object represented by the buffer. If SetType has not been called previously, this method returns the default value of AudioObjectType_None.
     * @returns {AudioObjectType} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a> variable where the audio object type will be stored.
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-gettype
     */
    GetType() {
        result := ComCall(11, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves a pointer to a buffer that may contain spatial audio metadata.
     * @remarks
     * The metadata is written to the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> collection in a format identified by the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-spatial-audio-object-metadata-format-id">MF_MT_SPATIAL_AUDIO_OBJECT_METADATA_FORMAT_ID</a>     media type attribute specified during media type negotiation phase of Media Foundation     topology construction.
     * @returns {ISpatialAudioMetadataItems} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> object in which the collection
     *     of metadata items will be stored.
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudioobjectbuffer-getmetadataitems
     */
    GetMetadataItems() {
        result := ComCall(12, this, "ptr*", &ppMetadataItems := 0, "HRESULT")
        return ISpatialAudioMetadataItems(ppMetadataItems)
    }

    Query(iid) {
        if (IMFSpatialAudioObjectBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetID := CallbackCreate(GetMethod(implObj, "SetID"), flags, 2)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 2)
        this.vtbl.SetType := CallbackCreate(GetMethod(implObj, "SetType"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetMetadataItems := CallbackCreate(GetMethod(implObj, "GetMetadataItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetID)
        CallbackFree(this.vtbl.GetID)
        CallbackFree(this.vtbl.SetType)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetMetadataItems)
    }
}
