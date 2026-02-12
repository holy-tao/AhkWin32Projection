#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\EndpointPair.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class IEndpointPairFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEndpointPairFactory
     * @type {Guid}
     */
    static IID => Guid("{b609d971-64e0-442b-aa6f-cc8c8f181f78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEndpointPair"]

    /**
     * 
     * @param {HostName} localHostName 
     * @param {HSTRING} localServiceName 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {EndpointPair} 
     */
    CreateEndpointPair(localHostName, localServiceName, remoteHostName, remoteServiceName) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(6, this, "ptr", localHostName, "ptr", localServiceName, "ptr", remoteHostName, "ptr", remoteServiceName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EndpointPair(value)
    }
}
