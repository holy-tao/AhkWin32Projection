#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICanExecuteRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [CanExecuteRequested](xamluicommand_canexecuterequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.canexecuterequestedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class CanExecuteRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICanExecuteRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICanExecuteRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the command parameter passed into the [CanExecute](icommand_canexecute_508446764.md) method that raised this event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.canexecuterequestedeventargs.parameter
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * Gets or sets a value indicating whether the [ICommand](icommand.md) that raised this event is able to execute.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.canexecuterequestedeventargs.canexecute
     * @type {Boolean} 
     */
    CanExecute {
        get => this.get_CanExecute()
        set => this.put_CanExecute(value)
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
        if (!this.HasProp("__ICanExecuteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICanExecuteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICanExecuteRequestedEventArgs := ICanExecuteRequestedEventArgs(outPtr)
        }

        return this.__ICanExecuteRequestedEventArgs.get_Parameter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanExecute() {
        if (!this.HasProp("__ICanExecuteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICanExecuteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICanExecuteRequestedEventArgs := ICanExecuteRequestedEventArgs(outPtr)
        }

        return this.__ICanExecuteRequestedEventArgs.get_CanExecute()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanExecute(value) {
        if (!this.HasProp("__ICanExecuteRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICanExecuteRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICanExecuteRequestedEventArgs := ICanExecuteRequestedEventArgs(outPtr)
        }

        return this.__ICanExecuteRequestedEventArgs.put_CanExecute(value)
    }

;@endregion Instance Methods
}
