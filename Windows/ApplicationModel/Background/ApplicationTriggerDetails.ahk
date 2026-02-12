#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * The details of an [ApplicationTrigger](applicationtrigger.md).
 * @remarks
 * An instance of this class is passed to the background task in its [Run](ibackgroundtask_run_2017283929.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.applicationtriggerdetails
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ApplicationTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The arguments that were passed to the background task using the [ApplicationTrigger.RequestAsync(ValueSet)](applicationtrigger_requestasync_1089362155.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.applicationtriggerdetails.arguments
     * @type {ValueSet} 
     */
    Arguments {
        get => this.get_Arguments()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Arguments() {
        if (!this.HasProp("__IApplicationTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IApplicationTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationTriggerDetails := IApplicationTriggerDetails(outPtr)
        }

        return this.__IApplicationTriggerDetails.get_Arguments()
    }

;@endregion Instance Methods
}
