#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssCreateExpressWriterMetadata.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage metadata for a VSS express writer.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivssexpresswriter
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssExpressWriter extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMetadata", "LoadMetadata", "Register", "Unregister"]

    /**
     * 
     * @param {Guid} writerId 
     * @param {PWSTR} writerName 
     * @param {Integer} usageType 
     * @param {Integer} versionMajor 
     * @param {Integer} versionMinor 
     * @param {Integer} reserved 
     * @returns {IVssCreateExpressWriterMetadata} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivssexpresswriter-createmetadata
     */
    CreateMetadata(writerId, writerName, usageType, versionMajor, versionMinor, reserved) {
        writerName := writerName is String ? StrPtr(writerName) : writerName

        result := ComCall(3, this, "ptr", writerId, "ptr", writerName, "int", usageType, "uint", versionMajor, "uint", versionMinor, "uint", reserved, "ptr*", &ppMetadata := 0, "HRESULT")
        return IVssCreateExpressWriterMetadata(ppMetadata)
    }

    /**
     * 
     * @param {PWSTR} metadata 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivssexpresswriter-loadmetadata
     */
    LoadMetadata(metadata, reserved) {
        metadata := metadata is String ? StrPtr(metadata) : metadata

        result := ComCall(4, this, "ptr", metadata, "uint", reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivssexpresswriter-register
     */
    Register() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} writerId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivssexpresswriter-unregister
     */
    Unregister(writerId) {
        result := ComCall(6, this, "ptr", writerId, "HRESULT")
        return result
    }
}
