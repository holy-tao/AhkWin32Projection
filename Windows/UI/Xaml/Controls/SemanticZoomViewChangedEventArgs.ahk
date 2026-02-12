#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISemanticZoomViewChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ViewChangeStarted](semanticzoom_viewchangestarted.md) and [ViewChangeCompleted](semanticzoom_viewchangecompleted.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomviewchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SemanticZoomViewChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISemanticZoomViewChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISemanticZoomViewChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the starting view is the [ZoomedInView](semanticzoom_zoomedinview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomviewchangedeventargs.issourcezoomedinview
     * @type {Boolean} 
     */
    IsSourceZoomedInView {
        get => this.get_IsSourceZoomedInView()
        set => this.put_IsSourceZoomedInView(value)
    }

    /**
     * Provides information about the item and its bounds, for the item as represented in the previous view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomviewchangedeventargs.sourceitem
     * @type {SemanticZoomLocation} 
     */
    SourceItem {
        get => this.get_SourceItem()
        set => this.put_SourceItem(value)
    }

    /**
     * Provides information about the item and its bounds, once the view change is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomviewchangedeventargs.destinationitem
     * @type {SemanticZoomLocation} 
     */
    DestinationItem {
        get => this.get_DestinationItem()
        set => this.put_DestinationItem(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SemanticZoomViewChangedEventArgs](semanticzoomviewchangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoomViewChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSourceZoomedInView() {
        if (!this.HasProp("__ISemanticZoomViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomViewChangedEventArgs := ISemanticZoomViewChangedEventArgs(outPtr)
        }

        return this.__ISemanticZoomViewChangedEventArgs.get_IsSourceZoomedInView()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSourceZoomedInView(value) {
        if (!this.HasProp("__ISemanticZoomViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomViewChangedEventArgs := ISemanticZoomViewChangedEventArgs(outPtr)
        }

        return this.__ISemanticZoomViewChangedEventArgs.put_IsSourceZoomedInView(value)
    }

    /**
     * 
     * @returns {SemanticZoomLocation} 
     */
    get_SourceItem() {
        if (!this.HasProp("__ISemanticZoomViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomViewChangedEventArgs := ISemanticZoomViewChangedEventArgs(outPtr)
        }

        return this.__ISemanticZoomViewChangedEventArgs.get_SourceItem()
    }

    /**
     * 
     * @param {SemanticZoomLocation} value 
     * @returns {HRESULT} 
     */
    put_SourceItem(value) {
        if (!this.HasProp("__ISemanticZoomViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomViewChangedEventArgs := ISemanticZoomViewChangedEventArgs(outPtr)
        }

        return this.__ISemanticZoomViewChangedEventArgs.put_SourceItem(value)
    }

    /**
     * 
     * @returns {SemanticZoomLocation} 
     */
    get_DestinationItem() {
        if (!this.HasProp("__ISemanticZoomViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomViewChangedEventArgs := ISemanticZoomViewChangedEventArgs(outPtr)
        }

        return this.__ISemanticZoomViewChangedEventArgs.get_DestinationItem()
    }

    /**
     * 
     * @param {SemanticZoomLocation} value 
     * @returns {HRESULT} 
     */
    put_DestinationItem(value) {
        if (!this.HasProp("__ISemanticZoomViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomViewChangedEventArgs := ISemanticZoomViewChangedEventArgs(outPtr)
        }

        return this.__ISemanticZoomViewChangedEventArgs.put_DestinationItem(value)
    }

;@endregion Instance Methods
}
