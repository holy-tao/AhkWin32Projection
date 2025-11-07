#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObjectBase.ahk

/**
 * Used to write metadata commands for spatial audio.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudioobjectformetadatacommands
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectForMetadataCommands extends ISpatialAudioObjectBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectForMetadataCommands
     * @type {Guid}
     */
    static IID => Guid("{0df2c94b-f5f9-472d-af6b-c46e0ac9cd05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteNextMetadataCommand"]

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer} valueBuffer 
     * @param {Integer} valueBufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudioobjectformetadatacommands-writenextmetadatacommand
     */
    WriteNextMetadataCommand(commandID, valueBuffer, valueBufferLength) {
        result := ComCall(7, this, "char", commandID, "ptr", valueBuffer, "uint", valueBufferLength, "HRESULT")
        return result
    }
}
