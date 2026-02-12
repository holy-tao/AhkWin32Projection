#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhoneCallVideoCapabilities.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallVideoCapabilitiesManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallVideoCapabilitiesManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{f3c64b56-f00b-4a1c-a0c6-ee1910749ce7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilitiesAsync"]

    /**
     * 
     * @param {HSTRING} phoneNumber 
     * @returns {IAsyncOperation<PhoneCallVideoCapabilities>} 
     */
    GetCapabilitiesAsync(phoneNumber) {
        if(phoneNumber is String) {
            pin := HSTRING.Create(phoneNumber)
            phoneNumber := pin.Value
        }
        phoneNumber := phoneNumber is Win32Handle ? NumGet(phoneNumber, "ptr") : phoneNumber

        result := ComCall(6, this, "ptr", phoneNumber, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneCallVideoCapabilities, result_)
    }
}
