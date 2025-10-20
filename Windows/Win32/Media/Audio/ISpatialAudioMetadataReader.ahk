#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for extracting spatial audio metadata items and item command value pairs from an ISpatialAudioMetadataItems object.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatareader
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataReader extends IUnknown{
    /**
     * The interface identifier for ISpatialAudioMetadataReader
     * @type {Guid}
     */
    static IID => Guid("{b78e86a2-31d9-4c32-94d2-7df40fc7ebec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISpatialAudioMetadataItems>} metadataItems 
     * @returns {HRESULT} 
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} commandCount 
     * @param {Pointer<UInt16>} frameOffset 
     * @returns {HRESULT} 
     */
    ReadNextItem(commandCount, frameOffset) {
        result := ComCall(4, this, "char*", commandCount, "ushort*", frameOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} commandID 
     * @param {Pointer} valueBuffer 
     * @param {Integer} maxValueBufferLength 
     * @param {Pointer<UInt32>} valueBufferLength 
     * @returns {HRESULT} 
     */
    ReadNextItemCommand(commandID, valueBuffer, maxValueBufferLength, valueBufferLength) {
        result := ComCall(5, this, "char*", commandID, "ptr", valueBuffer, "uint", maxValueBufferLength, "uint*", valueBufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
