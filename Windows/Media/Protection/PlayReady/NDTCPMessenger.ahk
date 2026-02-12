#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDMessenger.ahk
#Include .\INDTCPMessengerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Sends PlayReady-ND messages and challenges using the TCP network protocol.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndtcpmessenger
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDTCPMessenger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDMessenger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDMessenger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [NDTCPMessenger](ndtcpmessenger.md) class.
     * @param {HSTRING} remoteHostName The IP address of the remote host that will receive messages. The format is either an IPv4 address in dotted-decimal notation or an IPv6 address in colon-hex notation.
     * @param {Integer} remoteHostPort The TCP port of the remote host that will receive messages.
     * @returns {NDTCPMessenger} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndtcpmessenger.#ctor
     */
    static CreateInstance(remoteHostName, remoteHostPort) {
        if (!NDTCPMessenger.HasProp("__INDTCPMessengerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDTCPMessenger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INDTCPMessengerFactory.IID)
            NDTCPMessenger.__INDTCPMessengerFactory := INDTCPMessengerFactory(factoryPtr)
        }

        return NDTCPMessenger.__INDTCPMessengerFactory.CreateInstance(remoteHostName, remoteHostPort)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends the specified data in an asynchronous registration request message.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier. The session identifier must be 16 bytes.
     * @param {Integer} challengeDataBytes_length 
     * @param {Pointer<Integer>} challengeDataBytes The data for the challenge message.
     * @returns {IAsyncOperation<INDSendResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndtcpmessenger.sendregistrationrequestasync
     */
    SendRegistrationRequestAsync(sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes) {
        if (!this.HasProp("__INDMessenger")) {
            if ((queryResult := this.QueryInterface(INDMessenger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDMessenger := INDMessenger(outPtr)
        }

        return this.__INDMessenger.SendRegistrationRequestAsync(sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes)
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndtcpmessenger.sendproximitydetectionstartasync
     */
    SendProximityDetectionStartAsync(pdType, transmitterChannelBytes_length, transmitterChannelBytes, sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes) {
        if (!this.HasProp("__INDMessenger")) {
            if ((queryResult := this.QueryInterface(INDMessenger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDMessenger := INDMessenger(outPtr)
        }

        return this.__INDMessenger.SendProximityDetectionStartAsync(pdType, transmitterChannelBytes_length, transmitterChannelBytes, sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes)
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
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndtcpmessenger.sendproximitydetectionresponseasync
     */
    SendProximityDetectionResponseAsync(pdType, transmitterChannelBytes_length, transmitterChannelBytes, sessionIDBytes_length, sessionIDBytes, responseDataBytes_length, responseDataBytes) {
        if (!this.HasProp("__INDMessenger")) {
            if ((queryResult := this.QueryInterface(INDMessenger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDMessenger := INDMessenger(outPtr)
        }

        return this.__INDMessenger.SendProximityDetectionResponseAsync(pdType, transmitterChannelBytes_length, transmitterChannelBytes, sessionIDBytes_length, sessionIDBytes, responseDataBytes_length, responseDataBytes)
    }

    /**
     * Sends the specified data in an asynchronous license fetch request message.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier. The session identifier must be 16 bytes.
     * @param {Integer} challengeDataBytes_length 
     * @param {Pointer<Integer>} challengeDataBytes The data for the challenge message.
     * @returns {IAsyncOperation<INDSendResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndtcpmessenger.sendlicensefetchrequestasync
     */
    SendLicenseFetchRequestAsync(sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes) {
        if (!this.HasProp("__INDMessenger")) {
            if ((queryResult := this.QueryInterface(INDMessenger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDMessenger := INDMessenger(outPtr)
        }

        return this.__INDMessenger.SendLicenseFetchRequestAsync(sessionIDBytes_length, sessionIDBytes, challengeDataBytes_length, challengeDataBytes)
    }

;@endregion Instance Methods
}
