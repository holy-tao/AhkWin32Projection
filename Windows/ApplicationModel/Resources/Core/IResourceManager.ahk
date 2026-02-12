#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ResourceMap.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ResourceContext.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The IResourceManager interface resolves contentions for system resources.The filter graph manager exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iresourcemanager
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManager
     * @type {Guid}
     */
    static IID => Guid("{f744d97b-9988-44fb-abd6-5378844cfa8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MainResourceMap", "get_AllResourceMaps", "get_DefaultContext", "LoadPriFiles", "UnloadPriFiles"]

    /**
     * @type {ResourceMap} 
     */
    MainResourceMap {
        get => this.get_MainResourceMap()
    }

    /**
     * @type {IMapView<HSTRING, ResourceMap>} 
     */
    AllResourceMaps {
        get => this.get_AllResourceMaps()
    }

    /**
     * @type {ResourceContext} 
     */
    DefaultContext {
        get => this.get_DefaultContext()
    }

    /**
     * 
     * @returns {ResourceMap} 
     */
    get_MainResourceMap() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceMap(value)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, ResourceMap>} 
     */
    get_AllResourceMaps() {
        result := ComCall(7, this, "ptr*", &maps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), ResourceMap, maps)
    }

    /**
     * 
     * @returns {ResourceContext} 
     */
    get_DefaultContext() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceContext(value)
    }

    /**
     * 
     * @param {IIterable<IStorageFile>} files 
     * @returns {HRESULT} 
     */
    LoadPriFiles(files) {
        result := ComCall(9, this, "ptr", files, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<IStorageFile>} files 
     * @returns {HRESULT} 
     */
    UnloadPriFiles(files) {
        result := ComCall(10, this, "ptr", files, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
