#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExecuteRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ExecuteRequested](xamluicommand_executerequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.executerequestedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ExecuteRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExecuteRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExecuteRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the command parameter passed into the [Execute](icommand_execute_171295283.md) method that raised this event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.executerequestedeventargs.parameter
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        if (!this.HasProp("__IExecuteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IExecuteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExecuteRequestedEventArgs := IExecuteRequestedEventArgs(outPtr)
        }

        return this.__IExecuteRequestedEventArgs.get_Parameter()
    }

;@endregion Instance Methods
}
