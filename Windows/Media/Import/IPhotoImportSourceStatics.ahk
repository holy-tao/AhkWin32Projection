#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhotoImportSource.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{0528e586-32d8-467c-8cee-23a1b2f43e85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync", "FromFolderAsync"]

    /**
     * 
     * @param {HSTRING} sourceId 
     * @returns {IAsyncOperation<PhotoImportSource>} 
     */
    FromIdAsync(sourceId) {
        if(sourceId is String) {
            pin := HSTRING.Create(sourceId)
            sourceId := pin.Value
        }
        sourceId := sourceId is Win32Handle ? NumGet(sourceId, "ptr") : sourceId

        result := ComCall(6, this, "ptr", sourceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhotoImportSource, operation)
    }

    /**
     * 
     * @param {IStorageFolder} sourceRootFolder 
     * @returns {IAsyncOperation<PhotoImportSource>} 
     */
    FromFolderAsync(sourceRootFolder) {
        result := ComCall(7, this, "ptr", sourceRootFolder, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhotoImportSource, operation)
    }
}
