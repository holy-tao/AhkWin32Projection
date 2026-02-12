#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the phone line operation status, and enumerates phone calls on the line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallsresult
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the phone line operation status.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallsresult.operationstatus
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * Gets the collection of phone calls on the line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallsresult.allactivephonecalls
     * @type {IVectorView<PhoneCall>} 
     */
    AllActivePhoneCalls {
        get => this.get_AllActivePhoneCalls()
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
    get_OperationStatus() {
        if (!this.HasProp("__IPhoneCallsResult")) {
            if ((queryResult := this.QueryInterface(IPhoneCallsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallsResult := IPhoneCallsResult(outPtr)
        }

        return this.__IPhoneCallsResult.get_OperationStatus()
    }

    /**
     * 
     * @returns {IVectorView<PhoneCall>} 
     */
    get_AllActivePhoneCalls() {
        if (!this.HasProp("__IPhoneCallsResult")) {
            if ((queryResult := this.QueryInterface(IPhoneCallsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallsResult := IPhoneCallsResult(outPtr)
        }

        return this.__IPhoneCallsResult.get_AllActivePhoneCalls()
    }

;@endregion Instance Methods
}
