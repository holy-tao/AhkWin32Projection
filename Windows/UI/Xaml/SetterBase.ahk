#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\ISetterBase.ahk
#Include .\ISetterBaseFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base class for value setters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbase
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class SetterBase extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISetterBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISetterBase.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether this object is in an immutable state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setterbase.issealed
     * @type {Boolean} 
     */
    IsSealed {
        get => this.get_IsSealed()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSealed() {
        if (!this.HasProp("__ISetterBase")) {
            if ((queryResult := this.QueryInterface(ISetterBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetterBase := ISetterBase(outPtr)
        }

        return this.__ISetterBase.get_IsSealed()
    }

;@endregion Instance Methods
}
