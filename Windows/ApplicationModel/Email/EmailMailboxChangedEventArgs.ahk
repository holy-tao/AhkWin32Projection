#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the deferral process.
 * @remarks
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangedeventargs
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the deferral object.
     * @returns {EmailMailboxChangedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxchangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IEmailMailboxChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxChangedEventArgs := IEmailMailboxChangedEventArgs(outPtr)
        }

        return this.__IEmailMailboxChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
