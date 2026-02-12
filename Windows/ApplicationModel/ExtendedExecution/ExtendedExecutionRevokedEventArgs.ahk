#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExtendedExecutionRevokedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * The object that is passed as a parameter to the event handler that is invoked when the system revokes background execution.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionrevokedeventargs
 * @namespace Windows.ApplicationModel.ExtendedExecution
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionRevokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExtendedExecutionRevokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExtendedExecutionRevokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reason background execution was revoked.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionrevokedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IExtendedExecutionRevokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionRevokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionRevokedEventArgs := IExtendedExecutionRevokedEventArgs(outPtr)
        }

        return this.__IExtendedExecutionRevokedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
