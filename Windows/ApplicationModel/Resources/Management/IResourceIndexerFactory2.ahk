#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceIndexer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IResourceIndexerFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceIndexerFactory2
     * @type {Guid}
     */
    static IID => Guid("{6040f18d-d5e5-4b60-9201-cd279cbcfed9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResourceIndexerWithExtension"]

    /**
     * 
     * @param {Uri} projectRoot 
     * @param {Uri} extensionDllPath 
     * @returns {ResourceIndexer} 
     */
    CreateResourceIndexerWithExtension(projectRoot, extensionDllPath) {
        result := ComCall(6, this, "ptr", projectRoot, "ptr", extensionDllPath, "ptr*", &indexer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceIndexer(indexer)
    }
}
