#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\XboxLiveEndpointPair.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveEndpointPairStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveEndpointPairStatics
     * @type {Guid}
     */
    static IID => Guid("{64316b30-217a-4243-8ee1-6729281d27db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindEndpointPairBySocketAddressBytes", "FindEndpointPairByHostNamesAndPorts"]

    /**
     * 
     * @param {Integer} localSocketAddress_length 
     * @param {Pointer<Integer>} localSocketAddress 
     * @param {Integer} remoteSocketAddress_length 
     * @param {Pointer<Integer>} remoteSocketAddress 
     * @returns {XboxLiveEndpointPair} 
     */
    FindEndpointPairBySocketAddressBytes(localSocketAddress_length, localSocketAddress, remoteSocketAddress_length, remoteSocketAddress) {
        localSocketAddressMarshal := localSocketAddress is VarRef ? "char*" : "ptr"
        remoteSocketAddressMarshal := remoteSocketAddress is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", localSocketAddress_length, localSocketAddressMarshal, localSocketAddress, "uint", remoteSocketAddress_length, remoteSocketAddressMarshal, remoteSocketAddress, "ptr*", &endpointPair_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveEndpointPair(endpointPair_)
    }

    /**
     * 
     * @param {HostName} localHostName 
     * @param {HSTRING} localPort 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remotePort 
     * @returns {XboxLiveEndpointPair} 
     */
    FindEndpointPairByHostNamesAndPorts(localHostName, localPort, remoteHostName, remotePort) {
        if(localPort is String) {
            pin := HSTRING.Create(localPort)
            localPort := pin.Value
        }
        localPort := localPort is Win32Handle ? NumGet(localPort, "ptr") : localPort
        if(remotePort is String) {
            pin := HSTRING.Create(remotePort)
            remotePort := pin.Value
        }
        remotePort := remotePort is Win32Handle ? NumGet(remotePort, "ptr") : remotePort

        result := ComCall(7, this, "ptr", localHostName, "ptr", localPort, "ptr", remoteHostName, "ptr", remotePort, "ptr*", &endpointPair_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveEndpointPair(endpointPair_)
    }
}
