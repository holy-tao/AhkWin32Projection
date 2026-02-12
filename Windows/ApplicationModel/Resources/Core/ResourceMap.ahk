#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\NamedResource.ahk
#Include ..\..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IResourceMap.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of related resources, typically either for a particular app package, or a resource file for a particular package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class ResourceMap extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceMap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceMap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a URI that can be used to refer to this [ResourceMap](resourcemap.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the number of resources in the map.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IResourceMap")) {
            if ((queryResult := this.QueryInterface(IResourceMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceMap := IResourceMap(outPtr)
        }

        return this.__IResourceMap.get_Uri()
    }

    /**
     * Returns the most appropriate candidate for a resource that is specified by a resource identifier for the supplied context.
     * 
     * 
     * <!--Writer todo: link to doc on how to form a resource identifier.-->
     * @remarks
     * Some resources are loaded according to the scale of the view where they will be displayed, and different views within an app might be displayed on different devices with different scales. Scale is a per-view characteristic.
     * 
     * Since the GetValue method selects the best candidate for the specified resource in relation to a runtime context, and since the scale qualifier of a [ResourceContext](resourcecontext.md) depends on the associated view, GetValue should always be called with a [ResourceContext](resourcecontext.md) object obtained from the view in which the resource will be used. Call [ResourceContext.GetForCurrentView](resourcecontext_getforcurrentview_1363600702.md) to retrieve the appropriate [ResourceContext](resourcecontext.md).
     * @param {HSTRING} resource A resource specified as a name or reference. For details, see the remarks for [ResourceMap](resourcemap.md) class.
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.getvalue
     */
    GetValue(resource) {
        if (!this.HasProp("__IResourceMap")) {
            if ((queryResult := this.QueryInterface(IResourceMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceMap := IResourceMap(outPtr)
        }

        return this.__IResourceMap.GetValue(resource)
    }

    /**
     * > [!NOTE]
     * > GetValue(String) may be altered or unavailable for releases after Windows 8.1. Instead, use [GetValue(String, ResourceContext)](resourcemap_getvalue_1450213417.md).
     * 
     * Returns the most appropriate candidate for a resource that is specified by a resource identifier within the default context.
     * @param {HSTRING} resource A resource identifier specified as a name or reference. For details, see the remarks for [ResourceMap](resourcemap.md) class.
     * @param {ResourceContext} context_ 
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.getvalue
     */
    GetValueForContext(resource, context_) {
        if (!this.HasProp("__IResourceMap")) {
            if ((queryResult := this.QueryInterface(IResourceMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceMap := IResourceMap(outPtr)
        }

        return this.__IResourceMap.GetValueForContext(resource, context_)
    }

    /**
     * Returns a [ResourceMap](resourcemap.md) that represents a part of another [ResourceMap](resourcemap.md), typically used to access a particular resource file within an app package.
     * 
     * This method finds subtree, ancestor, sibling and cousin maps to this resource map, as well as top-level maps. It returns the resource map represented by a given resource map identifier, relative to this resource map. This method is typically used to make simpler references to a particular subset of resources, such as a single resource file, or a directory of files.
     * @param {HSTRING} reference_ A resource map identifier that identifies the root of the new subtree. For details, see the remarks for [ResourceMap](resourcemap.md) class.
     * @returns {ResourceMap} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.getsubtree
     */
    GetSubtree(reference_) {
        if (!this.HasProp("__IResourceMap")) {
            if ((queryResult := this.QueryInterface(IResourceMap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceMap := IResourceMap(outPtr)
        }

        return this.__IResourceMap.GetSubtree(reference_)
    }

    /**
     * Returns the [NamedResource](namedresource.md) at the specified resource identifier in the map.
     * @param {Generic} key The resource identifier to use to locate the resource in the map. For syntax details, see the remarks for [ResourceMap](resourcemap.md) class.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{4825d6c4-835a-5da1-9bdd-12e97e16fb7a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), NamedResource, outPtr)
        }

        return this.__IMapView.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{4825d6c4-835a-5da1-9bdd-12e97e16fb7a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), NamedResource, outPtr)
        }

        return this.__IMapView.get_Size()
    }

    /**
     * Determines whether the map can retrieve a resource with the specified resource identifier.
     * @param {Generic} key The resource identifier to locate in the map. For syntax details, see the remarks for [ResourceMap](resourcemap.md) class.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{4825d6c4-835a-5da1-9bdd-12e97e16fb7a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), NamedResource, outPtr)
        }

        return this.__IMapView.HasKey(key)
    }

    /**
     * Splits the map view into two views.
     * @remarks
     * The two views that result from the split operation might not contain the same number of items. The two views do not overlap.
     * 
     * If a view can't be split, then both the first and second parameter are `null`.
     * @param {Pointer<IMapView>} first One half of the original map.
     * @param {Pointer<IMapView>} second The second half of the original map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.split
     */
    Split(first, second) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{4825d6c4-835a-5da1-9bdd-12e97e16fb7a}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), NamedResource, outPtr)
        }

        return this.__IMapView.Split(first, second)
    }

    /**
     * Returns an iterator to enumerate the items in the map.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.core.resourcemap.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{bf16482e-80ed-51f0-b9c9-3a804e2d6403}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), NamedResource), outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
