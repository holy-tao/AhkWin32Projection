#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserAuthenticationStatusChangeDeferral.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a user authentication status change deferral returned by the [UserAuthenticationStatusChangingEventArgs.GetDeferral](userauthenticationstatuschangingeventargs_getdeferral_254836512.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangedeferral
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserAuthenticationStatusChangeDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserAuthenticationStatusChangeDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserAuthenticationStatusChangeDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Reports that the application has completed its user authentication status change deferral.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userauthenticationstatuschangedeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IUserAuthenticationStatusChangeDeferral")) {
            if ((queryResult := this.QueryInterface(IUserAuthenticationStatusChangeDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserAuthenticationStatusChangeDeferral := IUserAuthenticationStatusChangeDeferral(outPtr)
        }

        return this.__IUserAuthenticationStatusChangeDeferral.Complete()
    }

;@endregion Instance Methods
}
