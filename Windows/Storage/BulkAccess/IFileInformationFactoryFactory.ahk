#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FileInformationFactory.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.BulkAccess
 * @version WindowsRuntime 1.4
 */
class IFileInformationFactoryFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileInformationFactoryFactory
     * @type {Guid}
     */
    static IID => Guid("{84ea0e7d-e4a2-4f00-8afa-af5e0f826bd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithMode", "CreateWithModeAndSize", "CreateWithModeAndSizeAndOptions", "CreateWithModeAndSizeAndOptionsAndFlags"]

    /**
     * 
     * @param {IStorageQueryResultBase} queryResult 
     * @param {Integer} mode_ 
     * @returns {FileInformationFactory} 
     */
    CreateWithMode(queryResult, mode_) {
        result := ComCall(6, this, "ptr", queryResult, "int", mode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileInformationFactory(value)
    }

    /**
     * 
     * @param {IStorageQueryResultBase} queryResult 
     * @param {Integer} mode_ 
     * @param {Integer} requestedThumbnailSize 
     * @returns {FileInformationFactory} 
     */
    CreateWithModeAndSize(queryResult, mode_, requestedThumbnailSize) {
        result := ComCall(7, this, "ptr", queryResult, "int", mode_, "uint", requestedThumbnailSize, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileInformationFactory(value)
    }

    /**
     * 
     * @param {IStorageQueryResultBase} queryResult 
     * @param {Integer} mode_ 
     * @param {Integer} requestedThumbnailSize 
     * @param {Integer} thumbnailOptions_ 
     * @returns {FileInformationFactory} 
     */
    CreateWithModeAndSizeAndOptions(queryResult, mode_, requestedThumbnailSize, thumbnailOptions_) {
        result := ComCall(8, this, "ptr", queryResult, "int", mode_, "uint", requestedThumbnailSize, "uint", thumbnailOptions_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileInformationFactory(value)
    }

    /**
     * 
     * @param {IStorageQueryResultBase} queryResult 
     * @param {Integer} mode_ 
     * @param {Integer} requestedThumbnailSize 
     * @param {Integer} thumbnailOptions_ 
     * @param {Boolean} delayLoad 
     * @returns {FileInformationFactory} 
     */
    CreateWithModeAndSizeAndOptionsAndFlags(queryResult, mode_, requestedThumbnailSize, thumbnailOptions_, delayLoad) {
        result := ComCall(9, this, "ptr", queryResult, "int", mode_, "uint", requestedThumbnailSize, "uint", thumbnailOptions_, "int", delayLoad, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileInformationFactory(value)
    }
}
