#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Search\StorageFileQueryResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated because it is the program associated with the neighboring files.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileactivatedeventargswithneighboringfiles
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileActivatedEventArgsWithNeighboringFiles extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileActivatedEventArgsWithNeighboringFiles
     * @type {Guid}
     */
    static IID => Guid("{433ba1a4-e1e2-48fd-b7fc-b5d6eee65033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NeighboringFilesQuery"]

    /**
     * Gets the neighboring files of the files for which the app was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileactivatedeventargswithneighboringfiles.neighboringfilesquery
     * @type {StorageFileQueryResult} 
     */
    NeighboringFilesQuery {
        get => this.get_NeighboringFilesQuery()
    }

    /**
     * 
     * @returns {StorageFileQueryResult} 
     */
    get_NeighboringFilesQuery() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFileQueryResult(value)
    }
}
