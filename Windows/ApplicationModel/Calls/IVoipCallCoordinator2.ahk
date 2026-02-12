#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VoipPhoneCall.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipCallCoordinator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipCallCoordinator2
     * @type {Guid}
     */
    static IID => Guid("{beb4a9f3-c704-4234-89ce-e88cc0d28fbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetupNewAcceptedCall"]

    /**
     * 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} contactNumber 
     * @param {HSTRING} serviceName 
     * @param {Integer} media 
     * @returns {VoipPhoneCall} 
     */
    SetupNewAcceptedCall(context_, contactName, contactNumber, serviceName, media) {
        if(context_ is String) {
            pin := HSTRING.Create(context_)
            context_ := pin.Value
        }
        context_ := context_ is Win32Handle ? NumGet(context_, "ptr") : context_
        if(contactName is String) {
            pin := HSTRING.Create(contactName)
            contactName := pin.Value
        }
        contactName := contactName is Win32Handle ? NumGet(contactName, "ptr") : contactName
        if(contactNumber is String) {
            pin := HSTRING.Create(contactNumber)
            contactNumber := pin.Value
        }
        contactNumber := contactNumber is Win32Handle ? NumGet(contactNumber, "ptr") : contactNumber
        if(serviceName is String) {
            pin := HSTRING.Create(serviceName)
            serviceName := pin.Value
        }
        serviceName := serviceName is Win32Handle ? NumGet(serviceName, "ptr") : serviceName

        result := ComCall(6, this, "ptr", context_, "ptr", contactName, "ptr", contactNumber, "ptr", serviceName, "uint", media, "ptr*", &call := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(call)
    }
}
