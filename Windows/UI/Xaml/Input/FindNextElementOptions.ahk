#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFindNextElementOptions.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides options to help identify the next element that can programmatically receive navigation focus.
 * @remarks
 * [FocusNavigationDirection.Previous](focusnavigationdirection.md) and [FocusNavigationDirection.Next](focusnavigationdirection.md) cannot be used with FindNextElementOptions. Only [FocusNavigationDirection.Up](focusnavigationdirection.md), [FocusNavigationDirection.Down](focusnavigationdirection.md), [FocusNavigationDirection.Left](focusnavigationdirection.md), or [FocusNavigationDirection.Right](focusnavigationdirection.md) are valid.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class FindNextElementOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFindNextElementOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFindNextElementOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the object that must be the root from which to identify the next focus candidate to receive navigation focus.
     * @remarks
     * If one or more transforms are applied to the descendants of **SearchRoot**
     * that place them outside of the directional area, these elements are still considered candidates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions.searchroot
     * @type {DependencyObject} 
     */
    SearchRoot {
        get => this.get_SearchRoot()
        set => this.put_SearchRoot(value)
    }

    /**
     * Gets or sets a bounding rectangle where all overlapping navigation candidates are excluded from navigation focus.
     * @remarks
     * Potential candidates are calculated using the bounding rectangle as reference. This rectangle lets you specify another reference instead of the focused element. 
     * 
     * This rectangle is used only for calculations and is never added to the visual tree.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions.exclusionrect
     * @type {RECT} 
     */
    ExclusionRect {
        get => this.get_ExclusionRect()
        set => this.put_ExclusionRect(value)
    }

    /**
     * Gets or sets a bounding rectangle used to identify the focus candidates most likely to receive navigation focus.
     * @remarks
     * Potential candidates are calculated using the bounding rectangle as reference. This rectangle lets you specify another reference instead of the focused element. 
     * 
     * This rectangle is used only for calculations and is never added to the visual tree.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions.hintrect
     * @type {RECT} 
     */
    HintRect {
        get => this.get_HintRect()
        set => this.put_HintRect(value)
    }

    /**
     * Gets or sets the focus navigation strategy used to identify the best candidate element to receive focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions.xyfocusnavigationstrategyoverride
     * @type {Integer} 
     */
    XYFocusNavigationStrategyOverride {
        get => this.get_XYFocusNavigationStrategyOverride()
        set => this.put_XYFocusNavigationStrategyOverride(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FindNextElementOptions](findnextelementoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.FindNextElementOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_SearchRoot() {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.get_SearchRoot()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_SearchRoot(value) {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.put_SearchRoot(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ExclusionRect() {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.get_ExclusionRect()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_ExclusionRect(value) {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.put_ExclusionRect(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_HintRect() {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.get_HintRect()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_HintRect(value) {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.put_HintRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusNavigationStrategyOverride() {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.get_XYFocusNavigationStrategyOverride()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_XYFocusNavigationStrategyOverride(value) {
        if (!this.HasProp("__IFindNextElementOptions")) {
            if ((queryResult := this.QueryInterface(IFindNextElementOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindNextElementOptions := IFindNextElementOptions(outPtr)
        }

        return this.__IFindNextElementOptions.put_XYFocusNavigationStrategyOverride(value)
    }

;@endregion Instance Methods
}
