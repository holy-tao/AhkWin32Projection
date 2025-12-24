#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObjectForMetadataCommands.ahk
#Include .\ISpatialAudioObjectForMetadataItems.ahk
#Include .\ISpatialAudioObjectRenderStreamBase.ahk

/**
 * Provides methods for controlling a spatial audio object render stream for metadata, including starting, stopping, and resetting the stream.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase">ISpatialAudioObjectRenderStreamBase</a> interface.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectrenderstreamformetadata
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStreamForMetadata extends ISpatialAudioObjectRenderStreamBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamForMetadata
     * @type {Guid}
     */
    static IID => Guid("{bbc9c907-48d5-4a2e-a0c7-f7f0d67c1fb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateSpatialAudioObjectForMetadataCommands", "ActivateSpatialAudioObjectForMetadataItems"]

    /**
     * Activate an ISpatialAudioObjectForMetadataCommands for rendering.
     * @param {Integer} type The type of audio object to activate. For dynamic audio objects, this value must be <b>AudioObjectType_Dynamic</b>. For static audio objects, specify one of the static audio channel values from the enumeration. Specifying <b>AudioObjectType_None</b> will produce an audio object that is not spatialized.
     * @returns {ISpatialAudioObjectForMetadataCommands} Receives a pointer to the activated interface.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectrenderstreamformetadata-activatespatialaudioobjectformetadatacommands
     */
    ActivateSpatialAudioObjectForMetadataCommands(type) {
        result := ComCall(10, this, "int", type, "ptr*", &audioObject := 0, "HRESULT")
        return ISpatialAudioObjectForMetadataCommands(audioObject)
    }

    /**
     * Activate an ISpatialAudioObjectForMetadataItems for rendering.
     * @param {Integer} type The type of audio object to activate. For dynamic audio objects, this value must be <b>AudioObjectType_Dynamic</b>. For static audio objects, specify one of the static audio channel values from the enumeration. Specifying <b>AudioObjectType_None</b> will produce an audio object that is not spatialized.
     * @returns {ISpatialAudioObjectForMetadataItems} Receives a pointer to the activated interface.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectrenderstreamformetadata-activatespatialaudioobjectformetadataitems
     */
    ActivateSpatialAudioObjectForMetadataItems(type) {
        result := ComCall(11, this, "int", type, "ptr*", &audioObject := 0, "HRESULT")
        return ISpatialAudioObjectForMetadataItems(audioObject)
    }
}
