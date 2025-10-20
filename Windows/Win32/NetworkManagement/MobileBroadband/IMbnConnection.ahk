#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the network connectivity of a device.
 * @remarks
 * 
  * This interface is only available when a Mobile Broadband device is registered to a network or when the device is in <b>MBN_READY_STATE_DEVICE_LOCKED</b> state. When a device deregisters from the network this COM interface is removed and the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionremoval">OnConnectionRemoval</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanagerevents">IMbnConnectionManagerEvents</a> interface.
  * 
  * <b>IMbnConnection</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnection">GetConnection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionmanager-getconnections">GetConnections</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanager">IMbnConnectionManager</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnection
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnection extends IUnknown{
    /**
     * The interface identifier for IMbnConnection
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200d-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} ConnectionID 
     * @returns {HRESULT} 
     */
    get_ConnectionID(ConnectionID) {
        result := ComCall(3, this, "ptr", ConnectionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} InterfaceID 
     * @returns {HRESULT} 
     */
    get_InterfaceID(InterfaceID) {
        result := ComCall(4, this, "ptr", InterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} connectionMode 
     * @param {PWSTR} strProfile 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Connect(connectionMode, strProfile, requestID) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(5, this, "int", connectionMode, "ptr", strProfile, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Disconnect(requestID) {
        result := ComCall(6, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ConnectionState 
     * @param {Pointer<BSTR>} ProfileName 
     * @returns {HRESULT} 
     */
    GetConnectionState(ConnectionState, ProfileName) {
        result := ComCall(7, this, "int*", ConnectionState, "ptr", ProfileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} voiceCallState 
     * @returns {HRESULT} 
     */
    GetVoiceCallState(voiceCallState) {
        result := ComCall(8, this, "int*", voiceCallState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} networkError 
     * @returns {HRESULT} 
     */
    GetActivationNetworkError(networkError) {
        result := ComCall(9, this, "uint*", networkError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
