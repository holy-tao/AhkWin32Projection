#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInertiaExpansionBehavior.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Controls the deceleration of a resizing manipulation during inertia.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiaexpansionbehavior
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class InertiaExpansionBehavior extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInertiaExpansionBehavior

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInertiaExpansionBehavior.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rate that resizing slows.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiaexpansionbehavior.desireddeceleration
     * @type {Float} 
     */
    DesiredDeceleration {
        get => this.get_DesiredDeceleration()
        set => this.put_DesiredDeceleration(value)
    }

    /**
     * Gets or sets the amount the element resizes at the end of inertia.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiaexpansionbehavior.desiredexpansion
     * @type {Float} 
     */
    DesiredExpansion {
        get => this.get_DesiredExpansion()
        set => this.put_DesiredExpansion(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredDeceleration() {
        if (!this.HasProp("__IInertiaExpansionBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaExpansionBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaExpansionBehavior := IInertiaExpansionBehavior(outPtr)
        }

        return this.__IInertiaExpansionBehavior.get_DesiredDeceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredDeceleration(value) {
        if (!this.HasProp("__IInertiaExpansionBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaExpansionBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaExpansionBehavior := IInertiaExpansionBehavior(outPtr)
        }

        return this.__IInertiaExpansionBehavior.put_DesiredDeceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredExpansion() {
        if (!this.HasProp("__IInertiaExpansionBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaExpansionBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaExpansionBehavior := IInertiaExpansionBehavior(outPtr)
        }

        return this.__IInertiaExpansionBehavior.get_DesiredExpansion()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredExpansion(value) {
        if (!this.HasProp("__IInertiaExpansionBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaExpansionBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaExpansionBehavior := IInertiaExpansionBehavior(outPtr)
        }

        return this.__IInertiaExpansionBehavior.put_DesiredExpansion(value)
    }

;@endregion Instance Methods
}
