#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallVideoCapabilitiesManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables an application to get the [PhoneCallVideoCapabilities](phonecallvideocapabilities.md) for a [PhoneLine](phoneline.md) instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallvideocapabilitiesmanager
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallVideoCapabilitiesManager extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously gets the video capabilities for a [PhoneLine](phoneline.md) instance.
     * @param {HSTRING} phoneNumber The [PhoneLine](phoneline.md) instance to query.
     * @returns {IAsyncOperation<PhoneCallVideoCapabilities>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallvideocapabilitiesmanager.getcapabilitiesasync
     */
    static GetCapabilitiesAsync(phoneNumber) {
        if (!PhoneCallVideoCapabilitiesManager.HasProp("__IPhoneCallVideoCapabilitiesManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallVideoCapabilitiesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallVideoCapabilitiesManagerStatics.IID)
            PhoneCallVideoCapabilitiesManager.__IPhoneCallVideoCapabilitiesManagerStatics := IPhoneCallVideoCapabilitiesManagerStatics(factoryPtr)
        }

        return PhoneCallVideoCapabilitiesManager.__IPhoneCallVideoCapabilitiesManagerStatics.GetCapabilitiesAsync(phoneNumber)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
