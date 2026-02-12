#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IResourceLoader.ahk
#Include .\IResourceLoader2.ahk
#Include .\IResourceLoaderFactory.ahk
#Include .\IResourceLoaderStatics4.ahk
#Include .\IResourceLoaderStatics3.ahk
#Include .\IResourceLoaderStatics.ahk
#Include .\IResourceLoaderStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides simplified access to app resources such as app UI strings.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.Windows.ApplicationModel.Resources.ResourceLoader](/windows/windows-app-sdk/api/winrt/microsoft.windows.applicationmodel.resources.resourceloader) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * A **ResourceLoader** object encapsulates a particular [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md) and a [ResourceContext](../windows.applicationmodel.resources.core/resourcecontext.md), combined in a simple API.
 * 
 * A specific resource map can be specified when the **ResourceLoader** is obtained; if no resource map is specified, the **ResourceLoader** will provide access to the "Resources" subtree of the app's main resource map.
 * 
 * In general, resources can be sensitive to scale or other display characteristics. For that reason, resource contexts are generally associated with a specific view. Since a **ResourceLoader** encapsulates a resource context, this also applies to a **ResourceLoader**. A **ResourceLoader** obtained using [GetForCurrentView](resourceloader_getforcurrentview_1363600702.md) has a resource context associated with a view in which it was obtained. A view-independent **ResourceLoader** can also be obtained using [GetForViewIndependentUse](resourceloader_getforviewindependentuse_1317372352.md)
 * 
 * + Obtain the scale factor for the current view by using the [DisplayInformation](../windows.graphics.display/displayinformation.md) class instead of the deprecated [DisplayProperties](../windows.graphics.display/displayproperties.md) class.
 * + Apps that set explicit width and height of elements should still work fine, other than possibly displaying blurry images.
 * + Obtain resources that are not associated with any view by getting a **ResourceLoader** via [GetForViewIndependentUse](resourceloader_getforviewindependentuse_1317372352.md).
 * 
 * Also see [Screen sizes and breakpoints](/windows/uwp/design/layout/screen-sizes-and-breakpoints-for-responsive-design).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader
 * @namespace Windows.ApplicationModel.Resources
 * @version WindowsRuntime 1.4
 */
class ResourceLoader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceLoader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceLoader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > ResourceLoader(String) may be altered or unavailable for releases after Windows 8.1. Instead, use [GetForCurrentView(String)](resourceloader_getforcurrentview_147266590.md).
     * 
     * Constructs a new [ResourceLoader](resourceloader.md) object for the specified [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [ResourceLoader(String)](/windows/windows-app-sdk/api/winrt/microsoft.windows.applicationmodel.resources.resourceloader.-ctor#microsoft-windows-applicationmodel-resources-resourceloader-ctor(system-string)) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * This constructor is typically used to access resources relative to a resource file with the specified resource identifier. For example, `new ResourceLoader('Errors');` is relative to errors.resjson or errors.resw.
     * @param {HSTRING} name The resource identifier of the [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md) that the new resource loader uses for unqualified resource references. It can then retrieve resources relative to those references.
     * 
     * > [!NOTE]
     * > The resource identifier is treated as a Uniform Resource Identifier (URI) fragment, subject to Uniform Resource Identifier (URI) semantics. For example, "Caption%20" is treated as "Caption ". Do not use "?" or "#" in resource identifiers, as they terminate the named resource path. For example, "Foo?3" is treated as "Foo".
     * @returns {ResourceLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.#ctor
     */
    static CreateResourceLoaderByName(name) {
        if (!ResourceLoader.HasProp("__IResourceLoaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderFactory.IID)
            ResourceLoader.__IResourceLoaderFactory := IResourceLoaderFactory(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderFactory.CreateResourceLoaderByName(name)
    }

    /**
     * Provides the location of the `resources.pri` file for the app.
     * @param {HSTRING} packageFullName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getdefaultpripath
     */
    static GetDefaultPriPath(packageFullName) {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics4.IID)
            ResourceLoader.__IResourceLoaderStatics4 := IResourceLoaderStatics4(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics4.GetDefaultPriPath(packageFullName)
    }

    /**
     * Gets a [ResourceLoader](resourceloader.md) object for the specified [UIContext](../windows.ui/uicontext.md).
     * @remarks
     * This method fails if it is called in a windowless thread.
     * @param {UIContext} context_ The UI context for which to get the [ResourceLoader](resourceloader.md).
     * @returns {ResourceLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getforuicontext
     */
    static GetForUIContext(context_) {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics3.IID)
            ResourceLoader.__IResourceLoaderStatics3 := IResourceLoaderStatics3(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics3.GetForUIContext(context_)
    }

    /**
     * > [!NOTE]
     * > GetStringForReference may be altered or unavailable for releases after Windows 8.1. Instead, use [GetStringForUri](resourceloader_getstringforuri_449569482.md).
     * 
     * Returns the most appropriate string value of a resource, specified as a [Uri](../windows.foundation/uri.md) for a resource identifier, for the default [ResourceContext](../windows.applicationmodel.resources.core/resourcecontext.md) of the currently running app.
     * @remarks
     * [Uri](../windows.foundation/uri.md) objects require a scheme to be identified. In this context, the ms-resource scheme must be specified in the [Uri](../windows.foundation/uri.md) passed to the method.
     * @param {Uri} uri_ A [Uri](../windows.foundation/uri.md) that represents the resource to be retrieved.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getstringforreference
     */
    static GetStringForReference(uri_) {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics.IID)
            ResourceLoader.__IResourceLoaderStatics := IResourceLoaderStatics(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics.GetStringForReference(uri_)
    }

    /**
     * Gets a [ResourceLoader](resourceloader.md) object for the specified [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md). This [ResourceLoader](resourceloader.md) uses a default context associated with the current view.
     * @remarks
     * This method is typically used to access resources relative to a resource file with the specified resource identifier. For example, `GetForCurrentView('Errors');` is relative to errors.resjson or errors.resw.
     * 
     * To construct a resource loader for resources from a library package, a resource reference Uniform Resource Identifier (URI) is used.
     * 
     * The [ResourceLoader](resourceloader.md) that is returned uses a default context associated with the current view.
     * 
     * The resource management system for UWP apps supports the tailoring of resources for scale. Starting in Windows 8.1, different views owned by an app are able to display simultaneously on different display devices that may use different scales. In this way, scale is a per-view characteristic.
     * 
     * A [ResourceLoader](resourceloader.md) has an implicit context that is used when [ResourceLoader](resourceloader.md) methods are used to retrieve a resource. Since a [ResourceLoader](resourceloader.md) has an implicit context, and since the scale qualifier of contexts is dependent on an associated view, a [ResourceLoader](resourceloader.md) must be associated with a particular view.
     * @returns {ResourceLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getforcurrentview
     */
    static GetForCurrentView() {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics2.IID)
            ResourceLoader.__IResourceLoaderStatics2 := IResourceLoaderStatics2(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics2.GetForCurrentView()
    }

    /**
     * Gets a [ResourceLoader](resourceloader.md) object for the [Resources subtree](../windows.applicationmodel.resources.core/resourcemap_getsubtree_1701937926.md) of the currently running app's main [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md). This [ResourceLoader](resourceloader.md) uses a default context associated with the current view.
     * @remarks
     * This method allows access relative to a resource file named "resources" (resources.resjson or resources.resw). The [ResourceLoader](resourceloader.md) that is returned uses a default context associated with the current view.
     * 
     * The resource management system for UWP apps supports the tailoring of resources for scale. Starting in Windows 8.1, different views owned by an app are able to display simultaneously on different display devices that may use different scales. In this way, scale is a per-view characteristic.
     * 
     * A [ResourceLoader](resourceloader.md) has an implicit context that is used when [ResourceLoader](resourceloader.md) methods are used to retrieve a resource. Since a [ResourceLoader](resourceloader.md) has an implicit context, and since the scale qualifier of contexts is dependent on an associated view, a [ResourceLoader](resourceloader.md) must be associated with a particular view.
     * @param {HSTRING} name 
     * @returns {ResourceLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getforcurrentview
     */
    static GetForCurrentViewWithName(name) {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics2.IID)
            ResourceLoader.__IResourceLoaderStatics2 := IResourceLoaderStatics2(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics2.GetForCurrentViewWithName(name)
    }

    /**
     * Gets a [ResourceLoader](resourceloader.md) object for the specified [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md). This [ResourceLoader](resourceloader.md) uses a default context that's not associated with any view.
     * @returns {ResourceLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getforviewindependentuse
     */
    static GetForViewIndependentUse() {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics2.IID)
            ResourceLoader.__IResourceLoaderStatics2 := IResourceLoaderStatics2(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics2.GetForViewIndependentUse()
    }

    /**
     * Gets a [ResourceLoader](resourceloader.md) object for the [Resources subtree](../windows.applicationmodel.resources.core/resourcemap_getsubtree_1701937926.md) of the currently running app's main [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md). This [ResourceLoader](resourceloader.md) uses a default context that's not associated with any view.
     * @param {HSTRING} name 
     * @returns {ResourceLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getforviewindependentuse
     */
    static GetForViewIndependentUseWithName(name) {
        if (!ResourceLoader.HasProp("__IResourceLoaderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceLoaderStatics2.IID)
            ResourceLoader.__IResourceLoaderStatics2 := IResourceLoaderStatics2(factoryPtr)
        }

        return ResourceLoader.__IResourceLoaderStatics2.GetForViewIndependentUseWithName(name)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * > [!NOTE]
     * > ResourceLoader() may be altered or unavailable for releases after Windows 8.1. Instead, use [GetForCurrentView()](resourceloader_getforcurrentview_1363600702.md).
     * 
     * Constructs a new [ResourceLoader](resourceloader.md) object for the "Resources" subtree of the currently running app's main [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [ResourceLoader()](/windows/windows-app-sdk/api/winrt/microsoft.windows.applicationmodel.resources.resourceloader.-ctor#microsoft-windows-applicationmodel-resources-resourceloader-ctor) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The empty constructor typically allows access relative to a resource file's named resources (resources.resjson or resources.resw).
     * 
     * This constructor fails with an exception if the main [ResourceMap](../windows.applicationmodel.resources.core/resourcemap.md) does not have a "Resources" subtree.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Resources.ResourceLoader")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns the most appropriate string value of a resource, specified by resource identifier, for the default [ResourceContext](../windows.applicationmodel.resources.core/resourcecontext.md) of the view in which the [ResourceLoader](resourceloader.md) was obtained using [ResourceLoader.GetForCurrentView](resourceloader_getforcurrentview_1363600702.md).
     * 
     * 
     * <!--Writer todo: Link to how to create and identify resources.-->
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.Windows.ApplicationModel.Resources.ResourceLoader.GetString](/windows/windows-app-sdk/api/winrt/microsoft.windows.applicationmodel.resources.resourceloader.getstring) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * <!--Writer todo: remarks: discuss when to use GetString vs. GetStringByReference.-->
     * @param {HSTRING} resource The resource identifier of the resource to be resolved.
     * 
     * > [!NOTE]
     * > The resource identifier is treated as a Uniform Resource Identifier (URI) fragment, subject to Uniform Resource Identifier (URI) semantics. For example, **getString** ("Caption%20") is treated as **getString** ("Caption "). Do not use "?" or "#" in resource identifiers, as they terminate the named resource path. For example, "Foo?3" is treated as "Foo".
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getstring
     */
    GetString(resource) {
        if (!this.HasProp("__IResourceLoader")) {
            if ((queryResult := this.QueryInterface(IResourceLoader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceLoader := IResourceLoader(outPtr)
        }

        return this.__IResourceLoader.GetString(resource)
    }

    /**
     * Returns the most appropriate string value of a resource, specified by a Uniform Resource Identifier (URI) resource identifier, for the default [ResourceContext](../windows.applicationmodel.resources.core/resourcecontext.md) of the currently running app.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.Windows.ApplicationModel.Resources.ResourceLoader.GetStringForUri](/windows/windows-app-sdk/api/winrt/microsoft.windows.applicationmodel.resources.resourceloader.getstringforuri) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * Uniform Resource Identifier (URI) objects require a scheme to be identified. In this context, the ms-resource scheme must be specified in the Uniform Resource Identifier (URI) passed to the method.
     * @param {Uri} uri_ A Uniform Resource Identifier (URI) that represents the resource to be retrieved.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.resourceloader.getstringforuri
     */
    GetStringForUri(uri_) {
        if (!this.HasProp("__IResourceLoader2")) {
            if ((queryResult := this.QueryInterface(IResourceLoader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceLoader2 := IResourceLoader2(outPtr)
        }

        return this.__IResourceLoader2.GetStringForUri(uri_)
    }

;@endregion Instance Methods
}
