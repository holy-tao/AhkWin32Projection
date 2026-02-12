#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VoipPhoneCall.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipCallCoordinator5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipCallCoordinator5
     * @type {Guid}
     */
    static IID => Guid("{d4f79017-d1c1-5820-955e-7a1676355d00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestNewIncomingCallWithOptions", "RequestNewOutgoingCallWithOptions", "SetupNewAcceptedCallWithOptions", "RequestNewAppInitiatedCallWithOptions"]

    /**
     * 
     * @param {IncomingVoipPhoneCallOptions} callOptions 
     * @returns {VoipPhoneCall} 
     */
    RequestNewIncomingCallWithOptions(callOptions) {
        result := ComCall(6, this, "ptr", callOptions, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(result_)
    }

    /**
     * 
     * @param {OutgoingVoipPhoneCallOptions} callOptions 
     * @returns {VoipPhoneCall} 
     */
    RequestNewOutgoingCallWithOptions(callOptions) {
        result := ComCall(7, this, "ptr", callOptions, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(result_)
    }

    /**
     * 
     * @param {AcceptedVoipPhoneCallOptions} callOptions 
     * @returns {VoipPhoneCall} 
     */
    SetupNewAcceptedCallWithOptions(callOptions) {
        result := ComCall(8, this, "ptr", callOptions, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(result_)
    }

    /**
     * 
     * @param {AppInitiatedVoipPhoneCallOptions} callOptions 
     * @returns {VoipPhoneCall} 
     */
    RequestNewAppInitiatedCallWithOptions(callOptions) {
        result := ComCall(9, this, "ptr", callOptions, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoipPhoneCall(result_)
    }
}
