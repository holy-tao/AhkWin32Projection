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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "ReadNextItem", "ReadNextItemCommand", "Close"]

    /**
     * 
     * @param {ISpatialAudioMetadataItems} metadataItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} commandCount 
     * @param {Pointer<Integer>} frameOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitem
     */
    ReadNextItem(commandCount, frameOffset) {
        result := ComCall(4, this, "char*", commandCount, "ushort*", frameOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} commandID 
     * @param {Pointer} valueBuffer 
     * @param {Integer} maxValueBufferLength 
     * @param {Pointer<Integer>} valueBufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-readnextitemcommand
     */
    ReadNextItemCommand(commandID, valueBuffer, maxValueBufferLength, valueBufferLength) {
        result := ComCall(5, this, "char*", commandID, "ptr", valueBuffer, "uint", maxValueBufferLength, "uint*", valueBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatareader-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
