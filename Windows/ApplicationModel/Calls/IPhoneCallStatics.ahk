#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneCall.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallStatics
     * @type {Guid}
     */
    static IID => Guid("{2218eeab-f60b-53e7-ba13-5aeafbc22957}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFromId"]

    /**
     * 
     * @param {HSTRING} callId 
     * @returns {PhoneCall} 
     */
    GetFromId(callId) {
        if(callId is String) {
            pin := HSTRING.Create(callId)
            callId := pin.Value
        }
        callId := callId is Win32Handle ? NumGet(callId, "ptr") : callId

        result := ComCall(6, this, "ptr", callId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCall(result_)
    }
}
