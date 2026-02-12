#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFlyoutShowOptions.ahk
#Include .\IFlyoutShowOptionsFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the options used to show a flyout.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutshowoptions
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class FlyoutShowOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlyoutShowOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlyoutShowOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FlyoutShowOptions} 
     */
    static CreateInstance() {
        if (!FlyoutShowOptions.HasProp("__IFlyoutShowOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.FlyoutShowOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlyoutShowOptionsFactory.IID)
            FlyoutShowOptions.__IFlyoutShowOptionsFactory := IFlyoutShowOptionsFactory(factoryPtr)
        }

        return FlyoutShowOptions.__IFlyoutShowOptionsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the position where the flyout opens.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutshowoptions.position
     * @type {IReference<POINT>} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets a rectangular area that the flyout tries to not overlap.
     * @remarks
     * In some cases, the flyout will not be able to honor the exclusion rect; for example, if there is not sufficient space between the exclusion rect and the window edge.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutshowoptions.exclusionrect
     * @type {IReference<RECT>} 
     */
    ExclusionRect {
        get => this.get_ExclusionRect()
        set => this.put_ExclusionRect(value)
    }

    /**
     * Gets or sets a value that indicates how the flyout behaves when opened.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutshowoptions.showmode
     * @type {Integer} 
     */
    ShowMode {
        get => this.get_ShowMode()
        set => this.put_ShowMode(value)
    }

    /**
     * Gets or sets a value that indicates where the flyout is placed in relation to its target element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutshowoptions.placement
     * @type {Integer} 
     */
    Placement {
        get => this.get_Placement()
        set => this.put_Placement(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_Position() {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.get_Position()
    }

    /**
     * 
     * @param {IReference<POINT>} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.put_Position(value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_ExclusionRect() {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.get_ExclusionRect()
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_ExclusionRect(value) {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.put_ExclusionRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShowMode() {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.get_ShowMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ShowMode(value) {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.put_ShowMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Placement() {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.get_Placement()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Placement(value) {
        if (!this.HasProp("__IFlyoutShowOptions")) {
            if ((queryResult := this.QueryInterface(IFlyoutShowOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutShowOptions := IFlyoutShowOptions(outPtr)
        }

        return this.__IFlyoutShowOptions.put_Placement(value)
    }

;@endregion Instance Methods
}
