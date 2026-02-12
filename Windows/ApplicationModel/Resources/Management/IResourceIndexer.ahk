#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IndexedResourceCandidate.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IResourceIndexer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceIndexer
     * @type {Guid}
     */
    static IID => Guid("{2d4cf9a5-e32f-4ab2-8748-96350a016da3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IndexFilePath", "IndexFileContentsAsync"]

    /**
     * Indexes a file path for file and folder naming conventions.
     * @param {Uri} filePath The path for the folder that you want to index. The path must be an absolute path with the drive letter specified. Long file paths are not supported.
     * @returns {IndexedResourceCandidate} 
     * @see https://learn.microsoft.com/windows/win32/api//content/resourceindexer/nf-resourceindexer-indexfilepath
     */
    IndexFilePath(filePath) {
        result := ComCall(6, this, "ptr", filePath, "ptr*", &candidate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IndexedResourceCandidate(candidate)
    }

    /**
     * 
     * @param {Uri} file_ 
     * @returns {IAsyncOperation<IVectorView<IndexedResourceCandidate>>} 
     */
    IndexFileContentsAsync(file_) {
        result := ComCall(7, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IndexedResourceCandidate), operation)
    }
}
