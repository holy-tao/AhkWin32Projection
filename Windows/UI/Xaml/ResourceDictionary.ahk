#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IResourceDictionary.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\IResourceDictionaryFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a repository for XAML resources, such as styles, that your app uses. You define the resources in XAML and can then retrieve them in XAML using the [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) and [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension) s. You can also access resources with code, but that is less common.
 * @remarks
 * A resource dictionary is a repository for XAML resources, such as styles, that your app uses. You define the resources in XAML and can then retrieve them in XAML using the [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) and [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension) s. You can also access resources with code, but that is less common. You can use resources to enforce that certain values such as brush colors or pixel measurements are used consistently throughout your app. For more info on using resource dictionaries effectively, see [ResourceDictionary and XAML resource references](/windows/apps/design/style/xaml-resource-dictionary).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ResourceDictionary extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IResourceDictionary

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IResourceDictionary.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ResourceDictionary} 
     */
    static CreateInstance() {
        if (!ResourceDictionary.HasProp("__IResourceDictionaryFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ResourceDictionary")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IResourceDictionaryFactory.IID)
            ResourceDictionary.__IResourceDictionaryFactory := IResourceDictionaryFactory(factoryPtr)
        }

        return ResourceDictionary.__IResourceDictionaryFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a Uniform Resource Identifier (URI) that provides the source location of a merged resource dictionary.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.source
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets a collection of the [ResourceDictionary](resourcedictionary.md) dictionaries that constitute the various resource dictionaries in the merged dictionaries.
     * @remarks
     * Setting a MergedDictionaries value enables you to share a [ResourceDictionary](resourcedictionary.md) XAML file amongst several pages, or also as a common file you might add to multiple app projects. This provides a useful factoring and reuse technique for resources from a development and design standpoint. You typically include the XAML file as a **Content** item as part of the project and app manifest.
     * 
     * The keyed resources in any MergedDictionaries XAML do not have to be unique versus the keys as found in the primary [ResourceDictionary](resourcedictionary.md) for [Application.Resources](application_resources.md) or [FrameworkElement.Resources](frameworkelement_resources.md), and the lookup order for keys will look in the primary dictionary first. This enables a technique whereby you can override any key value obtained from within MergedDictionaries XAML files, but you could also have the merged dictionaries available as a fallback or as a general set of non-customized resources.
     * 
     * You can include more than one [ResourceDictionary](resourcedictionary.md) in a MergedDictionaries set in order to provide a fallback sequence even within the MergedDictionaries set.
     * 
     * For more info on how to use MergedDictionaries and the resource lookup sequence, see [ResourceDictionary and XAML resource references](/windows/apps/design/style/xaml-resource-dictionary).
     * 
     * [ThemeDictionaries](resourcedictionary_themedictionaries.md) is a related property that also merges additional XAML [ResourceDictionary](resourcedictionary.md) sources into the overall keyed resource set, where the scenario is for providing theme-related resources for controls.
     * 
     * Changing the contents of the collection of [ResourceDictionary](resourcedictionary.md) items for MergedDictionaries is not a common scenario. Generally you establish the collection contents in XAML and don't change it at runtime. There aren't many scenarios where you would access the collection itself in run-time code. Usually you rely on the built-in resource lookup that happens at XAML load time, or you query the relevant [Application.Resources](application_resources.md) or [FrameworkElement.Resources](frameworkelement_resources.md) collections that can reference resources by key, including the merged resources.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.mergeddictionaries
     * @type {IVector<ResourceDictionary>} 
     */
    MergedDictionaries {
        get => this.get_MergedDictionaries()
    }

    /**
     * Gets a collection of merged resource dictionaries that are specifically keyed and composed to address theme scenarios, for example supplying theme values for "HighContrast".
     * @remarks
     * Theme dictionaries have two primary scenarios: resources for your own app, and resources that the system provides for you on a per-theme basis. You'll only need to set values for the ThemeDictionaries resource set if you're defining your own app resources in app.xaml. Otherwise, the [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension) usages you'll be using in XAML control templates and elsewhere are typically referring to the system ThemeDictionaries resources, which can be viewed for design purposes within the generic.xaml design file.
     * 
     * Brush resources are often theme-specific. Default Windows Runtime XAML control UI defines many brush resources that are used for the various default XAML controls. You can see these resource definitions as part of the generic.xaml design file. The system ThemeDictionaries definitions are located early in the file, so that they are lexically forward of the [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension)s that reference them from within the default control templates. Your own page definitions and custom control definitions can make [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension) references to the system-supplied theme resources. In fact that's a recommended practice if you are writing controls that are intended to be in the same UI as the default controls. The default controls are using the theme resources extensively, and using the theme resources in your own controls can help prevent visual mismatches if the user changes the theme at runtime, or if the app is running under a theme that you hadn't specifically designed for.
     * 
     * There are also non-brush resources in the system theme resources in generic.xaml, such as default measures and font properties.
     * 
     * Theme dictionaries that you specify for individual apps aren't intended to supply the resource definition of an entire app theme. Instead, you should factor your page UI and custom control definitions to use system theme resources whenever possible, and to use app-specific theme resources for just a few cases where you want to override the system default values. For page-level app UI you typically only need new theme resources for certain non-brush resources used in composition such as glyphs or path-based graphics. The resources in ThemeDictionaries that you define yourself are intended for scenarios like accessibility. In particular, different resources might be needed for high contrast themes. For more info on the high contrast scenario, see [High-contrast themes](/windows/uwp/accessibility/high-contrast-themes). For more info on system-supplied themes, see [RequestedTheme](application_requestedtheme.md) or [XAML requested theme sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/XAML%20requested%20theme%20sample).
     * 
     * The expected keys for the basic themes are "Light" and "Dark".
     * 
     * For custom controls, you should also have a "HighContrast" keyed theme dictionary whenever you have theme dictionaries for "Light" and "Dark". There are other named high contrast themes, but the "HighContrast" theme key is the fallback the system uses for finding the high contrast theme if no other theme resources for high contrast are available.
     * 
     * For custom controls, if you don't support "Light" and "Dark" themes and only support one theme as well as at least one "HighContrast" theme, you can change your main dictionary's [x:Key attribute](/windows/uwp/xaml-platform/x-key-attribute) to "Default". "Default" is the [ResourceDictionary](resourcedictionary.md) that will be used if a [ResourceDictionary](resourcedictionary.md) in the specified theme (such as "Dark") cannot be found.
     * 
     * For high contrast themes and custom control scenarios, in addition to system brush resources, there are also system color resources such as "SystemColorButtonFaceColor" that you can assign to be the [Color](../windows.ui.xaml.media/solidcolorbrush_color.md) value of [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) resources. You can use these as values for your "HighContrast" theme dictionary and also "Default". If the resource exists for each of the themes your control supports, the XAML templates will load the appropriate resource for the theme that's active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.themedictionaries
     * @type {IMap<IInspectable, IInspectable>} 
     */
    ThemeDictionaries {
        get => this.get_ThemeDictionaries()
    }

    /**
     * Gets the number of elements contained in the collection.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Count](/dotnet/api/system.windows.resourcedictionary.count).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.size
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
    get_Source() {
        if (!this.HasProp("__IResourceDictionary")) {
            if ((queryResult := this.QueryInterface(IResourceDictionary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceDictionary := IResourceDictionary(outPtr)
        }

        return this.__IResourceDictionary.get_Source()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IResourceDictionary")) {
            if ((queryResult := this.QueryInterface(IResourceDictionary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceDictionary := IResourceDictionary(outPtr)
        }

        return this.__IResourceDictionary.put_Source(value)
    }

    /**
     * 
     * @returns {IVector<ResourceDictionary>} 
     */
    get_MergedDictionaries() {
        if (!this.HasProp("__IResourceDictionary")) {
            if ((queryResult := this.QueryInterface(IResourceDictionary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceDictionary := IResourceDictionary(outPtr)
        }

        return this.__IResourceDictionary.get_MergedDictionaries()
    }

    /**
     * 
     * @returns {IMap<IInspectable, IInspectable>} 
     */
    get_ThemeDictionaries() {
        if (!this.HasProp("__IResourceDictionary")) {
            if ((queryResult := this.QueryInterface(IResourceDictionary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IResourceDictionary := IResourceDictionary(outPtr)
        }

        return this.__IResourceDictionary.get_ThemeDictionaries()
    }

    /**
     * Returns the value from the requested key, if an entry with that key exists.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is the [Item](/dotnet/api/system.windows.resourcedictionary.item) indexer.
     * @param {Generic} key The requested key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Returns whether the [ResourceDictionary](resourcedictionary.md) has an entry with the requested key.
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Contains](/dotnet/api/system.windows.resourcedictionary.contains).
     * @param {Generic} key The requested key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Retrieves a view against the [ResourceDictionary](resourcedictionary.md).
     * @remarks
     * > [!NOTE]
     * > There is no exact Microsoft .NET equivalent for this API, although [CopyTo](/dotnet/api/system.windows.resourcedictionary.copyto) is similar.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Adds a new entry to the [ResourceDictionary](resourcedictionary.md).
     * @remarks
     * > [!NOTE]
     * > The equivalent Microsoft .NET API is [Add](/dotnet/api/system.windows.resourcedictionary.add).
     * @param {Generic} key The object key for the resource to insert.
     * @param {Generic} value The object value for the resource to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes a specific item from the [ResourceDictionary](resourcedictionary.md).
     * @param {Generic} key The key of the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from this [ResourceDictionary](resourcedictionary.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{f5f69427-55ed-5512-8429-d4f6626dfcdd}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap(IInspectable, IInspectable, outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns an iterator for the items in the collection.
     * @remarks
     * <!--Begin NET note for IEnumerable support-->
     * You can iterate through a [ResourceDictionary](resourcedictionary.md) in C# or Microsoft Visual Basic. In many cases, such as using **foreach** syntax, the compiler does this casting for you and you won't need to cast to `IEnumerable<KeyValuePair>` explicitly. If you do need to cast explicitly, for example if you want to call [GetEnumerator](/dotnet/api/system.collections.ienumerable.getenumerator?view=dotnet-uwp-10.0&preserve-view=true), cast to [IEnumerable<T>](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) with a **KeyValuePair&lt;Object,Object&gt;** constraint.
     * 
     * 
     * <!--End NET note for IEnumerable support-->
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.resourcedictionary.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{33ac68f0-1084-529a-8a17-4e7c8adb7a0c}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, IInspectable, IInspectable), outPtr)
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
