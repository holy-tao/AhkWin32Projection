#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for storing spatial audio metadata items positioned within a range of corresponding audio frames.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiometadata/nn-spatialaudiometadata-ispatialaudiometadatawriter
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioMetadataWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioMetadataWriter
     * @type {Guid}
     */
    static IID => Guid("{1b17ca01-2955-444d-a430-537dc589a844}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "WriteNextItem", "WriteNextItemCommand", "Close"]

    /**
     * 
     * @param {ISpatialAudioMetadataItems} metadataItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-open
     */
    Open(metadataItems) {
        result := ComCall(3, this, "ptr", metadataItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} frameOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitem
     */
    WriteNextItem(frameOffset) {
        result := ComCall(4, this, "ushort", frameOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer} valueBuffer 
     * @param {Integer} valueBufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiometadata/nf-spatialaudiometadata-ispatialaudiometadatawriter-writenextitemcommand
     */
    WriteNextItemCommand(commandID, valueBuffer, valueBufferLength) {
        result := ComCall(5, this, "char", commandID, "ptr", valueBuffer, "uint", valueBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/CoreAudio/ispatialaudiometadatawriter-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
