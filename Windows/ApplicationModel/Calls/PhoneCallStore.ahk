#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of information about the phone lines available on a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallstore
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Checks to see if a phone number connects to a known emergency services provider.
     * @param {HSTRING} number_ The phone number to check to see if it is a known emergency number.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallstore.isemergencyphonenumberasync
     */
    IsEmergencyPhoneNumberAsync(number_) {
        if (!this.HasProp("__IPhoneCallStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallStore := IPhoneCallStore(outPtr)
        }

        return this.__IPhoneCallStore.IsEmergencyPhoneNumberAsync(number_)
    }

    /**
     * Gets the line ID for the current default phone line.
     * @returns {IAsyncOperation<Guid>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallstore.getdefaultlineasync
     */
    GetDefaultLineAsync() {
        if (!this.HasProp("__IPhoneCallStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallStore := IPhoneCallStore(outPtr)
        }

        return this.__IPhoneCallStore.GetDefaultLineAsync()
    }

    /**
     * Retrieves an instance of the [PhoneLineWatcher](phonelinewatcher.md) class for the device.
     * @returns {PhoneLineWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallstore.requestlinewatcher
     */
    RequestLineWatcher() {
        if (!this.HasProp("__IPhoneCallStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallStore := IPhoneCallStore(outPtr)
        }

        return this.__IPhoneCallStore.RequestLineWatcher()
    }

;@endregion Instance Methods
}
