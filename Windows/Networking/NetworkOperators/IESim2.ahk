#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ESimDiscoverResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESim2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESim2
     * @type {Guid}
     */
    static IID => Guid("{bd4fd0a0-c68f-56eb-b99b-8f34b8100299}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Discover", "DiscoverWithServerAddressAndMatchingId", "DiscoverAsync", "DiscoverWithServerAddressAndMatchingIdAsync"]

    /**
     * Discovering Data Flow Components Programmatically
     * @returns {ESimDiscoverResult} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/building-packages-programmatically/discovering-data-flow-components-programmatically
     */
    Discover() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimDiscoverResult(result_)
    }

    /**
     * Discovering Data Flow Components Programmatically
     * @param {HSTRING} serverAddress 
     * @param {HSTRING} matchingId 
     * @returns {ESimDiscoverResult} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/building-packages-programmatically/discovering-data-flow-components-programmatically
     */
    DiscoverWithServerAddressAndMatchingId(serverAddress, matchingId) {
        if(serverAddress is String) {
            pin := HSTRING.Create(serverAddress)
            serverAddress := pin.Value
        }
        serverAddress := serverAddress is Win32Handle ? NumGet(serverAddress, "ptr") : serverAddress
        if(matchingId is String) {
            pin := HSTRING.Create(matchingId)
            matchingId := pin.Value
        }
        matchingId := matchingId is Win32Handle ? NumGet(matchingId, "ptr") : matchingId

        result := ComCall(7, this, "ptr", serverAddress, "ptr", matchingId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimDiscoverResult(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<ESimDiscoverResult>} 
     */
    DiscoverAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimDiscoverResult, operation)
    }

    /**
     * 
     * @param {HSTRING} serverAddress 
     * @param {HSTRING} matchingId 
     * @returns {IAsyncOperation<ESimDiscoverResult>} 
     */
    DiscoverWithServerAddressAndMatchingIdAsync(serverAddress, matchingId) {
        if(serverAddress is String) {
            pin := HSTRING.Create(serverAddress)
            serverAddress := pin.Value
        }
        serverAddress := serverAddress is Win32Handle ? NumGet(serverAddress, "ptr") : serverAddress
        if(matchingId is String) {
            pin := HSTRING.Create(matchingId)
            matchingId := pin.Value
        }
        matchingId := matchingId is Win32Handle ? NumGet(matchingId, "ptr") : matchingId

        result := ComCall(9, this, "ptr", serverAddress, "ptr", matchingId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimDiscoverResult, operation)
    }
}
