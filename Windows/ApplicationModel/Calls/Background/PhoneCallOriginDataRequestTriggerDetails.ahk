#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallOriginDataRequestTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used to provide the origin details of the phone call.
  * 
  * > [!NOTE]
  * > This class is deprecated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallorigindatarequesttriggerdetails
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneCallOriginDataRequestTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallOriginDataRequestTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallOriginDataRequestTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier for this phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallorigindatarequesttriggerdetails.requestid
     * @type {Guid} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * Gets the phone number for the origin of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallorigindatarequesttriggerdetails.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RequestId() {
        if (!this.HasProp("__IPhoneCallOriginDataRequestTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOriginDataRequestTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOriginDataRequestTriggerDetails := IPhoneCallOriginDataRequestTriggerDetails(outPtr)
        }

        return this.__IPhoneCallOriginDataRequestTriggerDetails.get_RequestId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__IPhoneCallOriginDataRequestTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneCallOriginDataRequestTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallOriginDataRequestTriggerDetails := IPhoneCallOriginDataRequestTriggerDetails(outPtr)
        }

        return this.__IPhoneCallOriginDataRequestTriggerDetails.get_PhoneNumber()
    }

;@endregion Instance Methods
}
