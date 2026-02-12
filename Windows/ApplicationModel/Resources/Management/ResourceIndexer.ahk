#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceIndexer.ahk
#Include .\IResourceIndexerFactory2.ahk
#Include .\IResourceIndexerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Indexes source resource files or containers, and generates named resource candidates using particular file and folder naming conventions.
  * 
  * > [!IMPORTANT]
  * > You can't use this class in a UWP app.
 * @remarks
 * ResourceIndexer does not guarantee parity of discovered resource candidates with MakePRI.exe because MakePRI may have arbitrary configurations.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.resourceindexer
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class ResourceIndexer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceIndexer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceIndexer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [ResourceIndexer](resourceindexer.md) specifying the root of the project files and an extension DLL.
     * @remarks
     * The parameter *projectRoot* represents the root of the project for the files to be produced. This is used to determine file paths relative to the package that will contain them.
     * 
     * The parameter *extensionDllPath* represents a full path to an extension DLL that is Microsoft-signed and implements the ext-ms-win-mrmcorer-environment-l1 API set. This determines the file path from where the MRT environment extension DLL will be loaded.
     * 
     * The paths must be absolute paths with the drive letter specified. Long file paths are not supported.
     * 
     * 
     * 
     * This example shows the constructor used to index source assets intended for a Windows Phone project:
     * 
     * ```csharp
     * var idxr = new Windows.ApplicationModel.Resources.Management.ResourceIndexer( 
     *     new Uri("file:///C:\MyApp\"), 
     *     new Uri("file:///C:\WPSDKPATH\bin\MrmEnvironmentExtDl.dll"));
     * 
     * ```
     * @param {Uri} projectRoot The project root folder (file:// URI).
     * @param {Uri} extensionDllPath The extension DLL path (file:// URI).
     * @returns {ResourceIndexer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.resourceindexer.#ctor
     */
    static CreateResourceIndexerWithExtension(projectRoot, extensionDllPath) {
        if (!ResourceIndexer.HasProp("__IResourceIndexerFactory2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Management.ResourceIndexer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceIndexerFactory2.IID)
            ResourceIndexer.__IResourceIndexerFactory2 := IResourceIndexerFactory2(factoryPtr)
        }

        return ResourceIndexer.__IResourceIndexerFactory2.CreateResourceIndexerWithExtension(projectRoot, extensionDllPath)
    }

    /**
     * Creates a new [ResourceIndexer](resourceindexer.md) specifying the root of the project files.
     * @remarks
     * The parameter *projectRoot* represents the root of the project for the files to be produced. This is used to determine file paths relative to the package that will contain them.
     * 
     * The path must be an absolute path with the drive letter specified. Long file paths are not supported.
     * 
     * 
     * 
     * Example:
     * 
     * ```csharp
     * var idxr = new Windows.ApplicationModel.Resources.Management.ResourceIndexer( 
     *     new Uri("file:///C:\MyApp\"));
     * 
     * ```
     * @param {Uri} projectRoot The project root folder (file:// URI).
     * @returns {ResourceIndexer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.resourceindexer.#ctor
     */
    static CreateResourceIndexer(projectRoot) {
        if (!ResourceIndexer.HasProp("__IResourceIndexerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Management.ResourceIndexer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceIndexerFactory.IID)
            ResourceIndexer.__IResourceIndexerFactory := IResourceIndexerFactory(factoryPtr)
        }

        return ResourceIndexer.__IResourceIndexerFactory.CreateResourceIndexer(projectRoot)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indexes a file path for file and folder naming conventions.
     * @param {Uri} filePath The file to be indexed (file:// URI). The path must be an absolute path with the drive letter specified. The [Uri](../windows.foundation/uri.md) can also provide an empty authority which is assumed to be the local file system. Long file paths are not supported.
     * @returns {IndexedResourceCandidate} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.resourceindexer.indexfilepath
     */
    IndexFilePath(filePath) {
        if (!this.HasProp("__IResourceIndexer")) {
            if ((queryResult := this.QueryInterface(IResourceIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceIndexer := IResourceIndexer(outPtr)
        }

        return this.__IResourceIndexer.IndexFilePath(filePath)
    }

    /**
     * Indexes a ResW, ResJSON, PRI, or PRI XML dump file path for file and folder naming conventions, and applies the qualifiers to the resources found within the contents of the file.
     * @param {Uri} file_ The file to be indexed (file:// URI). The path must be an absolute path with the drive letter specified. The [Uri](../windows.foundation/uri.md) can also provide an empty authority which is assumed to be the local file system. Long file paths are not supported.
     * @returns {IAsyncOperation<IVectorView<IndexedResourceCandidate>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.resourceindexer.indexfilecontentsasync
     */
    IndexFileContentsAsync(file_) {
        if (!this.HasProp("__IResourceIndexer")) {
            if ((queryResult := this.QueryInterface(IResourceIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceIndexer := IResourceIndexer(outPtr)
        }

        return this.__IResourceIndexer.IndexFileContentsAsync(file_)
    }

;@endregion Instance Methods
}
