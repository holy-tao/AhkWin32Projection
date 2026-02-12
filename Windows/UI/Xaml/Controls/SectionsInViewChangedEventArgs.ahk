#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISectionsInViewChangedEventArgs.ahk
#Include .\ISectionsInViewChangedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [Hub.SectionsInViewChanged](hub_sectionsinviewchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.sectionsinviewchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SectionsInViewChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISectionsInViewChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISectionsInViewChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection that contains the hub sections that moved into view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.sectionsinviewchangedeventargs.addedsections
     * @type {IVector<HubSection>} 
     */
    AddedSections {
        get => this.get_AddedSections()
    }

    /**
     * Gets a collection that contains the hub sections that moved out of view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.sectionsinviewchangedeventargs.removedsections
     * @type {IVector<HubSection>} 
     */
    RemovedSections {
        get => this.get_RemovedSections()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HubSection>} 
     */
    get_AddedSections() {
        if (!this.HasProp("__ISectionsInViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISectionsInViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISectionsInViewChangedEventArgs := ISectionsInViewChangedEventArgs(outPtr)
        }

        return this.__ISectionsInViewChangedEventArgs.get_AddedSections()
    }

    /**
     * 
     * @returns {IVector<HubSection>} 
     */
    get_RemovedSections() {
        if (!this.HasProp("__ISectionsInViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISectionsInViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISectionsInViewChangedEventArgs := ISectionsInViewChangedEventArgs(outPtr)
        }

        return this.__ISectionsInViewChangedEventArgs.get_RemovedSections()
    }

;@endregion Instance Methods
}
