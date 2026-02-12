#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExtendedExecutionForegroundRevokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Passed to the event handler that is invoked when the system revokes extended execution.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundrevokedeventargs
 * @namespace Windows.ApplicationModel.ExtendedExecution.Foreground
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionForegroundRevokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExtendedExecutionForegroundRevokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExtendedExecutionForegroundRevokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reason extended execution was revoked.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundrevokedeventargs.reason
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
        if (!this.HasProp("__IExtendedExecutionForegroundRevokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IExtendedExecutionForegroundRevokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExtendedExecutionForegroundRevokedEventArgs := IExtendedExecutionForegroundRevokedEventArgs(outPtr)
        }

        return this.__IExtendedExecutionForegroundRevokedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
