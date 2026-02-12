#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\INDSendResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Sends registration, proximity detection, and license fetch messages between PlayReady-ND receivers and transmitters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indmessenger
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDMessenger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDMessenger
     * @type {Guid}
     */
    static IID => Guid("{d42df95d-a75b-47bf-8249-bc83820da38a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendRegistrationRequestAsync", "SendProximityDetectionStartAsync", "SendProximityDetectionResponseAsync", "SendLicenseFetchRequestAsync"]

    /**
     * Sends the specified data in an asynchronous registration request message.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier. The session identifier must be 16 bytes.
     * @param {Integer} challengeDataBytes_length 
     * @param {Pointer<Integer>} challengeDataBytes The data for the challenge message.
     * @returns {IAsyncOperation<INDSendResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indmessenger.sendregistrationrequestasync
     */
    SendRegistrationRequestAsync(sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes) {
        sessionIDBytesMarshal := sessionIDBytes is VarRef ? "char*" : "ptr"
        challengeDataBytesMarshal := challengeDataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", sessionIDBytes_length, sessionIDBytesMarshal, sessionIDBytes, "uint", challengeDataBytes_length, challengeDataBytesMarshal, challengeDataBytes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(INDSendResult, result_)
    }

    /**
     * Sends the specified data in an asynchronous proximity detection start message.
     * @param {Integer} pdType The type of proximity detection operation. This value can be **UDP**, **TCP**, or **Transport-Agnostic**.
     * @param {Integer} transmitterChannelBytes_length 
     * @param {Pointer<Integer>} transmitterChannelBytes The transmitter channel data.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier. The session identifier must be 16 bytes.
     * @param {Integer} challengeDataBytes_length 
     * @param {Pointer<Integer>} challengeDataBytes The data for the challenge message.
     * @returns {IAsyncOperation<INDSendResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indmessenger.sendproximitydetectionstartasync
     */
    SendProximityDetectionStartAsync(pdType, transmitterChannelBytes_length, transmitterChannelBytes, sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes) {
        transmitterChannelBytesMarshal := transmitterChannelBytes is VarRef ? "char*" : "ptr"
        sessionIDBytesMarshal := sessionIDBytes is VarRef ? "char*" : "ptr"
        challengeDataBytesMarshal := challengeDataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "int", pdType, "uint", transmitterChannelBytes_length, transmitterChannelBytesMarshal, transmitterChannelBytes, "uint", sessionIDBytes_length, sessionIDBytesMarshal, sessionIDBytes, "uint", challengeDataBytes_length, challengeDataBytesMarshal, challengeDataBytes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(INDSendResult, result_)
    }

    /**
     * Sends the specified data in an asynchronous proximity detection response message.
     * @param {Integer} pdType The type of proximity detection operation. This value can be **UDP**, **TCP**, or **Transport-Agnostic**.
     * @param {Integer} transmitterChannelBytes_length 
     * @param {Pointer<Integer>} transmitterChannelBytes The transmitter channel data.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier. The session identifier must be 16 bytes.
     * @param {Integer} responseDataBytes_length 
     * @param {Pointer<Integer>} responseDataBytes The data for the response message.
     * @returns {IAsyncOperation<INDSendResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indmessenger.sendproximitydetectionresponseasync
     */
    SendProximityDetectionResponseAsync(pdType, transmitterChannelBytes_length, transmitterChannelBytes, sessionIDBytes_length, sessionIDBytes, responseDataBytes_length, responseDataBytes) {
        transmitterChannelBytesMarshal := transmitterChannelBytes is VarRef ? "char*" : "ptr"
        sessionIDBytesMarshal := sessionIDBytes is VarRef ? "char*" : "ptr"
        responseDataBytesMarshal := responseDataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "int", pdType, "uint", transmitterChannelBytes_length, transmitterChannelBytesMarshal, transmitterChannelBytes, "uint", sessionIDBytes_length, sessionIDBytesMarshal, sessionIDBytes, "uint", responseDataBytes_length, responseDataBytesMarshal, responseDataBytes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(INDSendResult, result_)
    }

    /**
     * Sends the specified data in an asynchronous license fetch request message.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier. The session identifier must be 16 bytes.
     * @param {Integer} challengeDataBytes_length 
     * @param {Pointer<Integer>} challengeDataBytes The data for the challenge message.
     * @returns {IAsyncOperation<INDSendResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indmessenger.sendlicensefetchrequestasync
     */
    SendLicenseFetchRequestAsync(sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes) {
        sessionIDBytesMarshal := sessionIDBytes is VarRef ? "char*" : "ptr"
        challengeDataBytesMarshal := challengeDataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", sessionIDBytes_length, sessionIDBytesMarshal, sessionIDBytes, "uint", challengeDataBytes_length, challengeDataBytesMarshal, challengeDataBytes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(INDSendResult, result_)
    }
}
