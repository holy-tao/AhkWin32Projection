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
class IVoipCallCoordinator3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipCallCoordinator3
     * @type {Guid}
     */
    static IID => Guid("{338d0cbf-9b55-4021-87ca-e64b9bd666c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestNewAppInitiatedCall", "RequestNewIncomingCallWithContactRemoteId"]

    /**
     * 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} contactNumber 
     * @param {HSTRING} serviceName 
     * @param {Integer} media 
     * @returns {VoipPhoneCall} 
     */
    RequestNewAppInitiatedCall(context_, contactName, contactNumber, serviceName, media) {
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

    /**
     * 
     * @param {HSTRING} context_ 
     * @param {HSTRING} contactName 
     * @param {HSTRING} contactNumber 
     * @param {Uri} contactImage 
     * @param {HSTRING} serviceName 
     * @param {Uri} brandingImage 
     * @param {HSTRING} callDetails 
     * @param {Uri} ringtone 
     * @param {Integer} media 
     * @param {TimeSpan} ringTimeout 
     * @param {HSTRING} contactRemoteId 
     * @returns {VoipPhoneCall} 
     */
    RequestNewIncomingCallWithContactRemoteId(context_, contactName, contactNumber, contactImage, serviceName, brandingImage, callDetails, ringtone, media, ringTimeout, contactRemoteId) {
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
        if(callDetails is String) {
            pin := HSTRING.Create(callDetails)
            callDetails := pin.Value
        }
        callDetails := callDetails is Win32Handle ? NumGet(callDetails, "ptr") : callDetails
        if(contactRemoteId is String) {
            pin := HSTRING.Create(contactRemoteId)
            contactRemoteId := pin.Value
        }
        contactRemoteId := contactRemoteId is Win32Handle ? NumGet(contactRemoteId, "ptr") : contactRemoteId

        result := ComCall(7, this, "ptr", context_, "ptr", contactName, "ptr", contactNumber, "ptr", contactImage, "ptr", serviceName, "ptr", brandingImage, "ptr", callDetails, "ptr", ringtone, "uint", media, "ptr", ringTimeout, "ptr", contactRemoteId, "ptr*", &call := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(call)
    }
}
