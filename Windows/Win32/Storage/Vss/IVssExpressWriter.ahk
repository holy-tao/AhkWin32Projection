#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage metadata for a VSS express writer.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivssexpresswriter
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssExpressWriter extends IUnknown{
    /**
     * The interface identifier for IVssExpressWriter
     * @type {Guid}
     */
    static IID => Guid("{e33affdc-59c7-47b1-97d5-4266598f6235}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} writerId 
     * @param {PWSTR} writerName 
     * @param {Integer} usageType 
     * @param {Integer} versionMajor 
     * @param {Integer} versionMinor 
     * @param {Integer} reserved 
     * @param {Pointer<IVssCreateExpressWriterMetadata>} ppMetadata 
     * @returns {HRESULT} 
     */
    CreateMetadata(writerId, writerName, usageType, versionMajor, versionMinor, reserved, ppMetadata) {
        writerName := writerName is String ? StrPtr(writerName) : writerName

        result := ComCall(3, this, "ptr", writerId, "ptr", writerName, "int", usageType, "uint", versionMajor, "uint", versionMinor, "uint", reserved, "ptr", ppMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} metadata 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    LoadMetadata(metadata, reserved) {
        metadata := metadata is String ? StrPtr(metadata) : metadata

        result := ComCall(4, this, "ptr", metadata, "uint", reserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Register() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} writerId 
     * @returns {HRESULT} 
     */
    Unregister(writerId) {
        result := ComCall(6, this, "ptr", writerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
