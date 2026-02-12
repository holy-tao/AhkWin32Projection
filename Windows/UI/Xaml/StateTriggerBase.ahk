#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IStateTriggerBase.ahk
#Include .\IStateTriggerBaseProtected.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base class for state triggers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.statetriggerbase
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class StateTriggerBase extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStateTriggerBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStateTriggerBase.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the value that indicates whether the state trigger is active.
     * @param {Boolean} IsActive **true** if the system should apply the trigger; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.statetriggerbase.setactive
     */
    SetActive(IsActive) {
        if (!this.HasProp("__IStateTriggerBaseProtected")) {
            if ((queryResult := this.QueryInterface(IStateTriggerBaseProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStateTriggerBaseProtected := IStateTriggerBaseProtected(outPtr)
        }

        return this.__IStateTriggerBaseProtected.SetActive(IsActive)
    }

;@endregion Instance Methods
}
