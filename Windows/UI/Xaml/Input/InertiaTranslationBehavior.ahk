#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInertiaTranslationBehavior.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Controls deceleration on a translation manipulation during inertia.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiatranslationbehavior
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class InertiaTranslationBehavior extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInertiaTranslationBehavior

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInertiaTranslationBehavior.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rate the linear movement slows in device-independent units (1/96th inch per unit) per squared millisecond.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiatranslationbehavior.desireddeceleration
     * @type {Float} 
     */
    DesiredDeceleration {
        get => this.get_DesiredDeceleration()
        set => this.put_DesiredDeceleration(value)
    }

    /**
     * Gets or sets the linear movement of the manipulation at the end of inertia.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiatranslationbehavior.desireddisplacement
     * @type {Float} 
     */
    DesiredDisplacement {
        get => this.get_DesiredDisplacement()
        set => this.put_DesiredDisplacement(value)
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
        if (!this.HasProp("__IInertiaTranslationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaTranslationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaTranslationBehavior := IInertiaTranslationBehavior(outPtr)
        }

        return this.__IInertiaTranslationBehavior.get_DesiredDeceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredDeceleration(value) {
        if (!this.HasProp("__IInertiaTranslationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaTranslationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaTranslationBehavior := IInertiaTranslationBehavior(outPtr)
        }

        return this.__IInertiaTranslationBehavior.put_DesiredDeceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredDisplacement() {
        if (!this.HasProp("__IInertiaTranslationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaTranslationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaTranslationBehavior := IInertiaTranslationBehavior(outPtr)
        }

        return this.__IInertiaTranslationBehavior.get_DesiredDisplacement()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredDisplacement(value) {
        if (!this.HasProp("__IInertiaTranslationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaTranslationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaTranslationBehavior := IInertiaTranslationBehavior(outPtr)
        }

        return this.__IInertiaTranslationBehavior.put_DesiredDisplacement(value)
    }

;@endregion Instance Methods
}
