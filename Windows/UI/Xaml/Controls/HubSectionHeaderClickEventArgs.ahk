#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHubSectionHeaderClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [Hub.SectionHeaderClick](hub_sectionheaderclick.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectionheaderclickeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HubSectionHeaderClickEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHubSectionHeaderClickEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHubSectionHeaderClickEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [HubSection](hubsection.md) for the header that was clicked.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsectionheaderclickeventargs.section
     * @type {HubSection} 
     */
    Section {
        get => this.get_Section()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HubSectionHeaderClickEventArgs](hubsectionheaderclickeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HubSectionHeaderClickEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HubSection} 
     */
    get_Section() {
        if (!this.HasProp("__IHubSectionHeaderClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IHubSectionHeaderClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSectionHeaderClickEventArgs := IHubSectionHeaderClickEventArgs(outPtr)
        }

        return this.__IHubSectionHeaderClickEventArgs.get_Section()
    }

;@endregion Instance Methods
}
