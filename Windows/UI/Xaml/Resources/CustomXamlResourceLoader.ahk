#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomXamlResourceLoader.ahk
#Include .\ICustomXamlResourceLoaderOverrides.ahk
#Include .\ICustomXamlResourceLoaderStatics.ahk
#Include .\ICustomXamlResourceLoaderFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables loading of custom resource dictionaries as sources. Override [GetResource](customxamlresourceloader_getresource_689752583.md) to provide the logic that a XAML parser can use to look up the necessary resources at load time.
 * @remarks
 * CustomXamlResourceLoader supports a markup extension usage `{CustomResource}`. This markup extension is unique to the Windows Runtime XAML framework (it did not exist in precursor XAML technologies such as Windows Presentation Foundation (WPF) and Microsoft Silverlight.)
 * 
 * A `{CustomResource}` usage doesn't work by default (the base implementation of [GetResource](customxamlresourceloader_getresource_689752583.md) is incomplete). To make a valid `{CustomResource}` reference, you must perform each of these steps:
 * 1. Derive a custom class from CustomXamlResourceLoader and override [GetResource](customxamlresourceloader_getresource_689752583.md) method. Do not call base in the implementation.
 * 1. Set [CustomXamlResourceLoader.Current](customxamlresourceloader_current.md) to reference your class in initialization logic. This must happen before any page-level XAML that includes the `{CustomResource}` extension usage is loaded. One place to set [CustomXamlResourceLoader.Current](customxamlresourceloader_current.md) is in the Application subclass constructor that's generated for you in the App.xaml code-behind templates.
 * 1. Now you can use `{CustomResource}` extensions in the XAML that your app loads as pages, or from within XAML resource dictionaries.
 * 
 * 
 * [{CustomResource} markup extension](/windows/uwp/xaml-platform/customresource-markup-extension) can be used from XAML in a similar way to [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension), which performs built-in resource lookup from various [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) locations. The difference is that the app itself implements the resource lookup logic for a [{CustomResource} markup extension](/windows/uwp/xaml-platform/customresource-markup-extension) usage by supplying a custom resource loader. To implement the custom resource loader, the application must provide a class that derives from CustomXamlResourceLoader and override the [GetResource](customxamlresourceloader_getresource_689752583.md) method. The app must register its custom resource loader by setting the static property [CustomXamlResourceLoader.Current](customxamlresourceloader_current.md) to an instance of its custom resource loader class. This registration must be done on a XAML UI thread before any parsing of XAML that uses [{CustomResource} markup extension](/windows/uwp/xaml-platform/customresource-markup-extension). If the application uses multiple UI threads, a separate registration must be done on each.
 * 
 * The way in which the CustomXamlResourceLoader stores its resources is probably not related to [ResourceDictionary](../windows.ui.xaml/resourcedictionary.md) at all. Typically, in addition to the required overrides, your CustomXamlResourceLoader class would provide internal or public methods that enable storing, keying and otherwise working with the resource items in an underlying collection.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resources.customxamlresourceloader
 * @namespace Windows.UI.Xaml.Resources
 * @version WindowsRuntime 1.4
 */
class CustomXamlResourceLoader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomXamlResourceLoader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomXamlResourceLoader.IID

    /**
     * Returns the active [CustomXamlResourceLoader](customxamlresourceloader.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resources.customxamlresourceloader.current
     * @type {CustomXamlResourceLoader} 
     */
    static Current {
        get => CustomXamlResourceLoader.get_Current()
        set => CustomXamlResourceLoader.put_Current(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CustomXamlResourceLoader} 
     */
    static get_Current() {
        if (!CustomXamlResourceLoader.HasProp("__ICustomXamlResourceLoaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Resources.CustomXamlResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomXamlResourceLoaderStatics.IID)
            CustomXamlResourceLoader.__ICustomXamlResourceLoaderStatics := ICustomXamlResourceLoaderStatics(factoryPtr)
        }

        return CustomXamlResourceLoader.__ICustomXamlResourceLoaderStatics.get_Current()
    }

    /**
     * 
     * @param {CustomXamlResourceLoader} value 
     * @returns {HRESULT} 
     */
    static put_Current(value) {
        if (!CustomXamlResourceLoader.HasProp("__ICustomXamlResourceLoaderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Resources.CustomXamlResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomXamlResourceLoaderStatics.IID)
            CustomXamlResourceLoader.__ICustomXamlResourceLoaderStatics := ICustomXamlResourceLoaderStatics(factoryPtr)
        }

        return CustomXamlResourceLoader.__ICustomXamlResourceLoaderStatics.put_Current(value)
    }

    /**
     * 
     * @returns {CustomXamlResourceLoader} 
     */
    static CreateInstance() {
        if (!CustomXamlResourceLoader.HasProp("__ICustomXamlResourceLoaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Resources.CustomXamlResourceLoader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomXamlResourceLoaderFactory.IID)
            CustomXamlResourceLoader.__ICustomXamlResourceLoaderFactory := ICustomXamlResourceLoaderFactory(factoryPtr)
        }

        return CustomXamlResourceLoader.__ICustomXamlResourceLoaderFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * When overridden in a derived class, specifies the logic of resource lookup for this [CustomXamlResourceLoader](customxamlresourceloader.md). Given a resource ID and some type information about the expected result, returns the requested resource.
     * @remarks
     * This method will be called by the Windows Runtime XAML parser whenever it encounters a [{CustomResource} markup extension](/windows/uwp/xaml-platform/customresource-markup-extension) usage in markup. The *resourceId* comes from the default *key* markup extension argument to [{CustomResource} markup extension](/windows/uwp/xaml-platform/customresource-markup-extension), and the other input parameters come from context, such as which property the usage is applied to.
     * @param {HSTRING} resourceId The string-form key of the resource to get.
     * @param {HSTRING} objectType_ The expected type of the resource.
     * @param {HSTRING} propertyName The name of the property that serves as the key in the custom resource lookup logic.
     * @param {HSTRING} propertyType_ The type of the property that serves as the key, with type represented as a string.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resources.customxamlresourceloader.getresource
     */
    GetResource(resourceId, objectType_, propertyName, propertyType_) {
        if (!this.HasProp("__ICustomXamlResourceLoaderOverrides")) {
            if ((queryResult := this.QueryInterface(ICustomXamlResourceLoaderOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomXamlResourceLoaderOverrides := ICustomXamlResourceLoaderOverrides(outPtr)
        }

        return this.__ICustomXamlResourceLoaderOverrides.GetResource(resourceId, objectType_, propertyName, propertyType_)
    }

;@endregion Instance Methods
}
