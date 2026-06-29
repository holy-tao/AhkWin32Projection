#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SpatialAudioMetadataItemsInfo.ahk" { SpatialAudioMetadataItemsInfo }

/**
 * Represents a buffer of spatial audio metadata items.
 * @remarks
 * Get an instance of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataclient-activatespatialaudiometadataitems">ISpatialAudioMetadataClient::ActivateSpatialAudioMetadataItems</a>.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioMetadataItems extends IUnknown {
    /**
     * The interface identifier for ISpatialAudioMetadataItems
     * @type {Guid}
     */
    static IID := Guid("{bcd7c78f-3098-4f22-b547-a2f25a381269}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioMetadataItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFrameCount           : IntPtr
        GetItemCount            : IntPtr
        GetMaxItemCount         : IntPtr
        GetMaxValueBufferLength : IntPtr
        GetInfo                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioMetadataItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the total frame count of the ISpatialAudioMetadataItems, which defines valid item offsets.
     * @returns {Integer} The total frame count.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getframecount
     */
    GetFrameCount() {
        result := ComCall(3, this, "ushort*", &frameCount := 0, "HRESULT")
        return frameCount
    }

    /**
     * The current number of items stored by the ISpatialAudioMetadataItems.
     * @returns {Integer} The current number of stored items.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getitemcount
     */
    GetItemCount() {
        result := ComCall(4, this, "ushort*", &itemCount := 0, "HRESULT")
        return itemCount
    }

    /**
     * The maximum number of items allowed by the ISpatialAudioMetadataItems, defined when the object is created.
     * @returns {Integer} The maximum number of items allowed.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getmaxitemcount
     */
    GetMaxItemCount() {
        result := ComCall(5, this, "ushort*", &maxItemCount := 0, "HRESULT")
        return maxItemCount
    }

    /**
     * The size of the largest command value defined by the metadata format for the ISpatialAudioMetadataItems.
     * @returns {Integer} The size of the largest command value defined by the metadata format.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getmaxvaluebufferlength
     */
    GetMaxValueBufferLength() {
        result := ComCall(6, this, "uint*", &maxValueBufferLength := 0, "HRESULT")
        return maxValueBufferLength
    }

    /**
     * Gets the total frame count for the ISpatialAudioMetadataItems, which defines valid item offsets.
     * @returns {SpatialAudioMetadataItemsInfo} The total frame count, which defines valid item offsets.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitems-getinfo
     */
    GetInfo() {
        info := SpatialAudioMetadataItemsInfo()
        result := ComCall(7, this, SpatialAudioMetadataItemsInfo.Ptr, info, "HRESULT")
        return info
    }

    Query(iid) {
        if (ISpatialAudioMetadataItems.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFrameCount := CallbackCreate(GetMethod(implObj, "GetFrameCount"), flags, 2)
        this.vtbl.GetItemCount := CallbackCreate(GetMethod(implObj, "GetItemCount"), flags, 2)
        this.vtbl.GetMaxItemCount := CallbackCreate(GetMethod(implObj, "GetMaxItemCount"), flags, 2)
        this.vtbl.GetMaxValueBufferLength := CallbackCreate(GetMethod(implObj, "GetMaxValueBufferLength"), flags, 2)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFrameCount)
        CallbackFree(this.vtbl.GetItemCount)
        CallbackFree(this.vtbl.GetMaxItemCount)
        CallbackFree(this.vtbl.GetMaxValueBufferLength)
        CallbackFree(this.vtbl.GetInfo)
    }
}
