#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ChatCapabilities.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatCapabilitiesManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatCapabilitiesManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{e30d4274-d5c1-4ac9-9ffc-40e69184fec8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCachedCapabilitiesForTransportAsync", "GetCapabilitiesFromNetworkForTransportAsync"]

    /**
     * 
     * @param {HSTRING} address_ 
     * @param {HSTRING} transportId 
     * @returns {IAsyncOperation<ChatCapabilities>} 
     */
    GetCachedCapabilitiesForTransportAsync(address_, transportId) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId

        result := ComCall(6, this, "ptr", address_, "ptr", transportId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatCapabilities, operation)
    }

    /**
     * 
     * @param {HSTRING} address_ 
     * @param {HSTRING} transportId 
     * @returns {IAsyncOperation<ChatCapabilities>} 
     */
    GetCapabilitiesFromNetworkForTransportAsync(address_, transportId) {
        if(address_ is String) {
            pin := HSTRING.Create(address_)
            address_ := pin.Value
        }
        address_ := address_ is Win32Handle ? NumGet(address_, "ptr") : address_
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId

        result := ComCall(7, this, "ptr", address_, "ptr", transportId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatCapabilities, operation)
    }
}
