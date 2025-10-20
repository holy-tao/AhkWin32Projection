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
     * @param {Integer} frameOffset 
     * @returns {HRESULT} 
     */
    WriteNextItem(frameOffset) {
        result := ComCall(4, this, "ushort", frameOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer} valueBuffer 
     * @param {Integer} valueBufferLength 
     * @returns {HRESULT} 
     */
    WriteNextItemCommand(commandID, valueBuffer, valueBufferLength) {
        result := ComCall(5, this, "char", commandID, "ptr", valueBuffer, "uint", valueBufferLength, "int")
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
