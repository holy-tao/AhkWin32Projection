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
     * 
     * @param {Pointer} buffer 
     * @param {Integer} bufferLength 
     * @returns {HRESULT} 
     */
    AttachToBuffer(buffer, bufferLength) {
        result := ComCall(3, this, "ptr", buffer, "uint", bufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} buffer 
     * @param {Integer} bufferLength 
     * @returns {HRESULT} 
     */
    AttachToPopulatedBuffer(buffer, bufferLength) {
        result := ComCall(4, this, "ptr", buffer, "uint", bufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DetachBuffer() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
