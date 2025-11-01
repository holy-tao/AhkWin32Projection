#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for attaching buffers to SpatialAudioMetadataItems for in-place storage of data.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadataitemsbuffer
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataItemsBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioMetadataItemsBuffer
     * @type {Guid}
     */
    static IID => Guid("{42640a16-e1bd-42d9-9ff6-031ab71a2dba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachToBuffer", "AttachToPopulatedBuffer", "DetachBuffer"]

    /**
     * 
     * @param {Pointer} buffer 
     * @param {Integer} bufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-attachtobuffer
     */
    AttachToBuffer(buffer, bufferLength) {
        result := ComCall(3, this, "ptr", buffer, "uint", bufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} buffer 
     * @param {Integer} bufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-attachtopopulatedbuffer
     */
    AttachToPopulatedBuffer(buffer, bufferLength) {
        result := ComCall(4, this, "ptr", buffer, "uint", bufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadataitemsbuffer-detachbuffer
     */
    DetachBuffer() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
