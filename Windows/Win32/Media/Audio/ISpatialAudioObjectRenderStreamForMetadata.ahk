#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpatialAudioObjectRenderStreamBase.ahk" { ISpatialAudioObjectRenderStreamBase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpatialAudioObjectForMetadataItems.ahk" { ISpatialAudioObjectForMetadataItems }
#Import ".\ISpatialAudioObjectForMetadataCommands.ahk" { ISpatialAudioObjectForMetadataCommands }
#Import ".\AudioObjectType.ahk" { AudioObjectType }

/**
 * Provides methods for controlling a spatial audio object render stream for metadata, including starting, stopping, and resetting the stream.
 * @remarks
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase">ISpatialAudioObjectRenderStreamBase</a> interface.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectrenderstreamformetadata
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioObjectRenderStreamForMetadata extends ISpatialAudioObjectRenderStreamBase {
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamForMetadata
     * @type {Guid}
     */
    static IID := Guid("{bbc9c907-48d5-4a2e-a0c7-f7f0d67c1fb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioObjectRenderStreamForMetadata interfaces
    */
    struct Vtbl extends ISpatialAudioObjectRenderStreamBase.Vtbl {
        ActivateSpatialAudioObjectForMetadataCommands : IntPtr
        ActivateSpatialAudioObjectForMetadataItems    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioObjectRenderStreamForMetadata.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Activate an ISpatialAudioObjectForMetadataCommands for rendering.
     * @remarks
     * A dynamic <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadatacommands">ISpatialAudioObjectForMetadataCommands</a> is one that was activated by setting the <i>type</i> parameter to the   <b>ActivateSpatialAudioObjectForMetadataCommands</b> method to <b>AudioObjectType_Dynamic</b>. The client has a limit of the maximum number of dynamic spatial audio objects that can be activated at one time. After the limit has been reached, attempting to activate additional audio objects will result in this method returning an SPTLAUDCLNT_E_NO_MORE_OBJECTS error. To avoid this, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on each dynamic <b>ISpatialAudioObjectForMetadataCommands</b> after it is no longer being used to free up the resource so that it can be reallocated. See  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-isactive">ISpatialAudioObjectBase::IsActive</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream">ISpatialAudioObjectBase::SetEndOfStream</a> for more information on the managing the lifetime of spatial audio objects.
     * @param {AudioObjectType} type The type of audio object to activate. For dynamic audio objects, this value must be <b>AudioObjectType_Dynamic</b>. For static audio objects, specify one of the static audio channel values from the enumeration. Specifying <b>AudioObjectType_None</b> will produce an audio object that is not spatialized.
     * @returns {ISpatialAudioObjectForMetadataCommands} Receives a pointer to the activated interface.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectrenderstreamformetadata-activatespatialaudioobjectformetadatacommands
     */
    ActivateSpatialAudioObjectForMetadataCommands(type) {
        result := ComCall(10, this, AudioObjectType, type, "ptr*", &audioObject := 0, "HRESULT")
        return ISpatialAudioObjectForMetadataCommands(audioObject)
    }

    /**
     * Activate an ISpatialAudioObjectForMetadataItems for rendering.
     * @remarks
     * A dynamic <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadataitems">ISpatialAudioObjectForMetadataItems</a> is one that was activated by setting the <i>type</i> parameter to the   <b>ActivateSpatialAudioObjectForMetadataItems</b> method to <b>AudioObjectType_Dynamic</b>. The client has a limit of the maximum number of dynamic spatial audio objects that can be activated at one time. After the limit has been reached, attempting to activate additional audio objects will result in this method returning an SPTLAUDCLNT_E_NO_MORE_OBJECTS error. To avoid this, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on each dynamic <b>ISpatialAudioObjectForMetadataItems</b> after it is no longer being used to free up the resource so that it can be reallocated. See <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-isactive">ISpatialAudioObjectBase::IsActive</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream">ISpatialAudioObjectBase::SetEndOfStream</a> for more information on the managing the lifetime of spatial audio objects.
     * @param {AudioObjectType} type The type of audio object to activate. For dynamic audio objects, this value must be <b>AudioObjectType_Dynamic</b>. For static audio objects, specify one of the static audio channel values from the enumeration. Specifying <b>AudioObjectType_None</b> will produce an audio object that is not spatialized.
     * @returns {ISpatialAudioObjectForMetadataItems} Receives a pointer to the activated interface.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectrenderstreamformetadata-activatespatialaudioobjectformetadataitems
     */
    ActivateSpatialAudioObjectForMetadataItems(type) {
        result := ComCall(11, this, AudioObjectType, type, "ptr*", &audioObject := 0, "HRESULT")
        return ISpatialAudioObjectForMetadataItems(audioObject)
    }

    Query(iid) {
        if (ISpatialAudioObjectRenderStreamForMetadata.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ActivateSpatialAudioObjectForMetadataCommands := CallbackCreate(GetMethod(implObj, "ActivateSpatialAudioObjectForMetadataCommands"), flags, 3)
        this.vtbl.ActivateSpatialAudioObjectForMetadataItems := CallbackCreate(GetMethod(implObj, "ActivateSpatialAudioObjectForMetadataItems"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ActivateSpatialAudioObjectForMetadataCommands)
        CallbackFree(this.vtbl.ActivateSpatialAudioObjectForMetadataItems)
    }
}
