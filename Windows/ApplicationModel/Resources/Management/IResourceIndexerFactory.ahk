#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceIndexer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IResourceIndexerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceIndexerFactory
     * @type {Guid}
     */
    static IID => Guid("{b8de3f09-31cd-4d97-bd30-8d39f742bc61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResourceIndexer"]

    /**
     * Creates a new resource indexer for the specified paths of the root of the project files and the extension DLL.
     * @param {Uri} projectRoot The path of the root folder to use for the project for the files to be produced, in string form. This path is used to determine file paths relative to the package that contains them. This path must be an absolute path with the drive letter specified. Long file paths are not supported.
     * @returns {ResourceIndexer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/resourceindexer/nf-resourceindexer-createresourceindexer
     */
    CreateResourceIndexer(projectRoot) {
        result := ComCall(6, this, "ptr", projectRoot, "ptr*", &indexer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceIndexer(indexer)
    }
}
