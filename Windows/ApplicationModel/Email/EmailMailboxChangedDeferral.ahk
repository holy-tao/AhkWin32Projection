#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxChangedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a deferred process that will halt a thread until the deferral is complete.
 * @remarks
 * Call the **GetDeferral** method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangeddeferral
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxChangedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxChangedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxChangedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates to waiting processes that the deferral is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangeddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IEmailMailboxChangedDeferral")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangedDeferral := IEmailMailboxChangedDeferral(outPtr)
        }

        return this.__IEmailMailboxChangedDeferral.Complete()
    }

;@endregion Instance Methods
}
