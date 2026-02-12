#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceManager.ahk
#Include .\IResourceManager2.ahk
#Include .\IResourceManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to application resource maps and more advanced resource functionality.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceManager.IID

    /**
     * Gets the [ResourceManager](resourcemanager.md) for the currently running application.
     * @remarks
     * Returns ERROR_MRM_INVALID_PRI_FILE if one of the packages contains a malformed PRI file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.current
     * @type {ResourceManager} 
     */
    static Current {
        get => ResourceManager.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ResourceManager} 
     */
    static get_Current() {
        if (!ResourceManager.HasProp("__IResourceManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceManagerStatics.IID)
            ResourceManager.__IResourceManagerStatics := IResourceManagerStatics(factoryPtr)
        }

        return ResourceManager.__IResourceManagerStatics.get_Current()
    }

    /**
     * Determines whether a supplied string matches the resource reference format (an ms-resource string URI identifier).
     * @remarks
     * An example of matching an ms-resource string URI identifier format: `isResourceReference('ms-resource:Hello')` returns `true`, but `isResourceReference('Hello')` returns `false`.
     * @param {HSTRING} resourceReference The string you want to match.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.isresourcereference
     */
    static IsResourceReference(resourceReference) {
        if (!ResourceManager.HasProp("__IResourceManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.Core.ResourceManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceManagerStatics.IID)
            ResourceManager.__IResourceManagerStatics := IResourceManagerStatics(factoryPtr)
        }

        return ResourceManager.__IResourceManagerStatics.IsResourceReference(resourceReference)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [ResourceMap](resourcemap.md) that is associated with the main package of the currently running application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.mainresourcemap
     * @type {ResourceMap} 
     */
    MainResourceMap {
        get => this.get_MainResourceMap()
    }

    /**
     * Gets a map of [ResourceMap](resourcemap.md) objects typically associated with the app packages, indexed by package name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.allresourcemaps
     * @type {IMapView<HSTRING, ResourceMap>} 
     */
    AllResourceMaps {
        get => this.get_AllResourceMaps()
    }

    /**
     * Gets the default [ResourceContext](resourcecontext.md) for the currently running application. Unless explicitly overridden, the default [ResourceContext](resourcecontext.md) is used to determine the most appropriate representation of any given named resource.
     * 
     * > [!NOTE]
     * > DefaultContext may be altered or unavailable for releases after Windows 8.1. Instead, use [ResourceContext.GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.defaultcontext
     * @type {ResourceContext} 
     */
    DefaultContext {
        get => this.get_DefaultContext()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ResourceMap} 
     */
    get_MainResourceMap() {
        if (!this.HasProp("__IResourceManager")) {
            if ((queryResult := this.QueryInterface(IResourceManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager := IResourceManager(outPtr)
        }

        return this.__IResourceManager.get_MainResourceMap()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, ResourceMap>} 
     */
    get_AllResourceMaps() {
        if (!this.HasProp("__IResourceManager")) {
            if ((queryResult := this.QueryInterface(IResourceManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager := IResourceManager(outPtr)
        }

        return this.__IResourceManager.get_AllResourceMaps()
    }

    /**
     * 
     * @returns {ResourceContext} 
     */
    get_DefaultContext() {
        if (!this.HasProp("__IResourceManager")) {
            if ((queryResult := this.QueryInterface(IResourceManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager := IResourceManager(outPtr)
        }

        return this.__IResourceManager.get_DefaultContext()
    }

    /**
     * Loads one or more Package Resource Index (PRI) files and adds their contents to the default resource manager.
     * @remarks
     * The `LoadPRIFiles` method accepts files only from inside the app package or dependent packages.
     * 
     * If resource packs are used by an app, this method will always fail.
     * 
     * For more info about PRI files, see [Resource Management System](/windows/uwp/app-resources/resource-management-system).
     * @param {IIterable<IStorageFile>} files The Package Resource Index (PRI) files you want to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.loadprifiles
     */
    LoadPriFiles(files) {
        if (!this.HasProp("__IResourceManager")) {
            if ((queryResult := this.QueryInterface(IResourceManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager := IResourceManager(outPtr)
        }

        return this.__IResourceManager.LoadPriFiles(files)
    }

    /**
     * Unloads one or more Package Resource Index (PRI) files.
     * @remarks
     * If resource packs are used by an app, this method will always fail.
     * 
     * For more info about PRI files, see [Resource Management System](/windows/uwp/app-resources/resource-management-system).
     * @param {IIterable<IStorageFile>} files The Package Resource Index (PRI) files you want to unload.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.unloadprifiles
     */
    UnloadPriFiles(files) {
        if (!this.HasProp("__IResourceManager")) {
            if ((queryResult := this.QueryInterface(IResourceManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager := IResourceManager(outPtr)
        }

        return this.__IResourceManager.UnloadPriFiles(files)
    }

    /**
     * Gets a list of all named resources for an app package.
     * @param {HSTRING} packageName The name of the app package.
     * @param {ResourceLayoutInfo} resourceLayoutInfo_ Specifies the resource version and the named resource count.
     * @returns {IVectorView<NamedResource>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.getallnamedresourcesforpackage
     */
    GetAllNamedResourcesForPackage(packageName, resourceLayoutInfo_) {
        if (!this.HasProp("__IResourceManager2")) {
            if ((queryResult := this.QueryInterface(IResourceManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager2 := IResourceManager2(outPtr)
        }

        return this.__IResourceManager2.GetAllNamedResourcesForPackage(packageName, resourceLayoutInfo_)
    }

    /**
     * Gets a list of all collections of resource subtrees for an app package.
     * @param {HSTRING} packageName The name of the app package.
     * @param {ResourceLayoutInfo} resourceLayoutInfo_ Specifies the resource version and the resource subtree count.
     * @returns {IVectorView<ResourceMap>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemanager.getallsubtreesforpackage
     */
    GetAllSubtreesForPackage(packageName, resourceLayoutInfo_) {
        if (!this.HasProp("__IResourceManager2")) {
            if ((queryResult := this.QueryInterface(IResourceManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceManager2 := IResourceManager2(outPtr)
        }

        return this.__IResourceManager2.GetAllSubtreesForPackage(packageName, resourceLayoutInfo_)
    }

;@endregion Instance Methods
}
