#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalContentSuggestionSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Stores settings that determine whether the app provides suggestions based on local files, and that define the criteria used to locate and filter these suggestions.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * The suggestions that the app provides are based on metadata fields and properties on the user's local, indexed files.
 * 
 * If enabled, local suggestions are displayed in the search pane when the user enters a query in the search box.
 * 
 * Disable these suggestions by setting the [Enabled](localcontentsuggestionsettings_enabled.md) property to `false`.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.localcontentsuggestionsettings
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class LocalContentSuggestionSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocalContentSuggestionSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocalContentSuggestionSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether suggestions based on local files are displayed in the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.localcontentsuggestionsettings.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * A list of the [StorageFolder](../windows.storage/storagefolder.md) objects that contain files that are used to provide suggestions. If the list is empty, suggestions are provided from files in all of the local libraries for which the app declared capabilities.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * If you add a location to the list, make sure you add all of the locations that contain files that you want used to provide local suggestions. If a location in this list is not valid, no suggestions are provided from that location. The remaining (valid) locations in this list are then used to provide suggestions.
     * 
     * Suggestions are provided based on local, indexed files in a listed [StorageFolder](../windows.storage/storagefolder.md).
     * 
     * If local suggestions are disabled, this property has no effect. Set the [LocalContentSuggestionSettings.Enabled](localcontentsuggestionsettings_enabled.md) property to `true` to display local suggestions in the search pane.
     * 
     * You can use this list to provide suggestions from libraries or folders for which your app hasn't declared capabilities, like folders that were accessed using the file picker. Learn more about capabilities in [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.localcontentsuggestionsettings.locations
     * @type {IVector<StorageFolder>} 
     */
    Locations {
        get => this.get_Locations()
    }

    /**
     * An Advanced Query Syntax (AQS) string that limits the types and kinds of files that are used to provide suggestions. If no Advanced Query Syntax (AQS) string is specified, suggestions are provided from all local files in locations specified by the [Locations](localcontentsuggestionsettings_locations.md) property.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * If local suggestions are disabled, this property has no effect. Set [LocalContentSuggestionSettings.Enabled](localcontentsuggestionsettings_enabled.md) property to `true` to display local suggestions in the search pane.
     * 
     * Use an AQS filter to help keep local suggestions relevant. For example, if your app is a video player, you may want to limit suggestions to videos or a specific file type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.localcontentsuggestionsettings.aqsfilter
     * @type {HSTRING} 
     */
    AqsFilter {
        get => this.get_AqsFilter()
        set => this.put_AqsFilter(value)
    }

    /**
     * A list of the file properties whose values are used to provide suggestions from local files. If the list is empty, all of the file properties that are available for suggestions are used.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * If local suggestions are disabled, this property has no effect.
     * 
     * Adding properties to this list limits local suggestions to the values of the specified properties for local, indexed files. For example, if you want to limit suggestions to musical artists, you would append the "System.Music.AlbumArtist" (Album artists) or the "System.Music.Artist" (Contributing artists) property to the PropertiesToMatch list.
     * 
     * Adding properties to this list limits local suggestions to local, indexed files that have the listed properties.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.localcontentsuggestionsettings.propertiestomatch
     * @type {IVector<HSTRING>} 
     */
    PropertiesToMatch {
        get => this.get_PropertiesToMatch()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [LocalContentSuggestionSettings](localcontentsuggestionsettings.md) class.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * When you create a new [LocalContentSuggestionSettings](localcontentsuggestionsettings.md) object, the [Enabled](localcontentsuggestionsettings_enabled.md) property is `true` by default.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Search.LocalContentSuggestionSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__ILocalContentSuggestionSettings")) {
            if ((queryResult := this.QueryInterface(ILocalContentSuggestionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalContentSuggestionSettings := ILocalContentSuggestionSettings(outPtr)
        }

        return this.__ILocalContentSuggestionSettings.put_Enabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__ILocalContentSuggestionSettings")) {
            if ((queryResult := this.QueryInterface(ILocalContentSuggestionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalContentSuggestionSettings := ILocalContentSuggestionSettings(outPtr)
        }

        return this.__ILocalContentSuggestionSettings.get_Enabled()
    }

    /**
     * 
     * @returns {IVector<StorageFolder>} 
     */
    get_Locations() {
        if (!this.HasProp("__ILocalContentSuggestionSettings")) {
            if ((queryResult := this.QueryInterface(ILocalContentSuggestionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalContentSuggestionSettings := ILocalContentSuggestionSettings(outPtr)
        }

        return this.__ILocalContentSuggestionSettings.get_Locations()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AqsFilter(value) {
        if (!this.HasProp("__ILocalContentSuggestionSettings")) {
            if ((queryResult := this.QueryInterface(ILocalContentSuggestionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalContentSuggestionSettings := ILocalContentSuggestionSettings(outPtr)
        }

        return this.__ILocalContentSuggestionSettings.put_AqsFilter(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AqsFilter() {
        if (!this.HasProp("__ILocalContentSuggestionSettings")) {
            if ((queryResult := this.QueryInterface(ILocalContentSuggestionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalContentSuggestionSettings := ILocalContentSuggestionSettings(outPtr)
        }

        return this.__ILocalContentSuggestionSettings.get_AqsFilter()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_PropertiesToMatch() {
        if (!this.HasProp("__ILocalContentSuggestionSettings")) {
            if ((queryResult := this.QueryInterface(ILocalContentSuggestionSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalContentSuggestionSettings := ILocalContentSuggestionSettings(outPtr)
        }

        return this.__ILocalContentSuggestionSettings.get_PropertiesToMatch()
    }

;@endregion Instance Methods
}
