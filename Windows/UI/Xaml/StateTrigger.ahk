#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StateTriggerBase.ahk
#Include .\IStateTrigger.ahk
#Include .\IStateTriggerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that applies visual states conditionally.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.statetrigger
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class StateTrigger extends StateTriggerBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStateTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStateTrigger.IID

    /**
     * Identifies the [IsActive](statetrigger_isactive.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.statetrigger.isactiveproperty
     * @type {DependencyProperty} 
     */
    static IsActiveProperty {
        get => StateTrigger.get_IsActiveProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsActiveProperty() {
        if (!StateTrigger.HasProp("__IStateTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.StateTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStateTriggerStatics.IID)
            StateTrigger.__IStateTriggerStatics := IStateTriggerStatics(factoryPtr)
        }

        return StateTrigger.__IStateTriggerStatics.get_IsActiveProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the trigger should be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.statetrigger.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
        set => this.put_IsActive(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [StateTrigger](statetrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.StateTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IStateTrigger")) {
            if ((queryResult := this.QueryInterface(IStateTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStateTrigger := IStateTrigger(outPtr)
        }

        return this.__IStateTrigger.get_IsActive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsActive(value) {
        if (!this.HasProp("__IStateTrigger")) {
            if ((queryResult := this.QueryInterface(IStateTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStateTrigger := IStateTrigger(outPtr)
        }

        return this.__IStateTrigger.put_IsActive(value)
    }

;@endregion Instance Methods
}
