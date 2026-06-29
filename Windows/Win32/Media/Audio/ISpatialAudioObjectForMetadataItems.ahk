#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpatialAudioObjectBase.ahk" { ISpatialAudioObjectBase }
#Import ".\ISpatialAudioMetadataItems.ahk" { ISpatialAudioMetadataItems }

/**
 * Used to write spatial audio metadata for applications that require multiple metadata items per buffer with frame-accurate placement.
 * @remarks
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadataitems
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioObjectForMetadataItems extends ISpatialAudioObjectBase {
    /**
     * The interface identifier for ISpatialAudioObjectForMetadataItems
     * @type {Guid}
     */
    static IID := Guid("{ddea49ff-3bc0-4377-8aad-9fbcfd808566}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioObjectForMetadataItems interfaces
    */
    struct Vtbl extends ISpatialAudioObjectBase.Vtbl {
        GetSpatialAudioMetadataItems : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioObjectForMetadataItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the ISpatialAudioMetadataItems object which stores metadata items for the ISpatialAudioObjectForMetadataItems.
     * @remarks
     * The client must free this object when it is no longer being used by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @returns {ISpatialAudioMetadataItems} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitems">ISpatialAudioMetadataItems</a> associated with the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadataitems">ISpatialAudioObjectForMetadataItems</a>.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectformetadataitems-getspatialaudiometadataitems
     */
    GetSpatialAudioMetadataItems() {
        result := ComCall(7, this, "ptr*", &metadataItems := 0, "HRESULT")
        return ISpatialAudioMetadataItems(metadataItems)
    }

    Query(iid) {
        if (ISpatialAudioObjectForMetadataItems.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSpatialAudioMetadataItems := CallbackCreate(GetMethod(implObj, "GetSpatialAudioMetadataItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSpatialAudioMetadataItems)
    }
}
