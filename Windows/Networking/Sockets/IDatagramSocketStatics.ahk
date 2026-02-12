#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\EndpointPair.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IDatagramSocketStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatagramSocketStatics
     * @type {Guid}
     */
    static IID => Guid("{e9c62aee-1494-4a21-bb7e-8589fc751d9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEndpointPairsAsync", "GetEndpointPairsWithSortOptionsAsync"]

    /**
     * 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {IAsyncOperation<IVectorView<EndpointPair>>} 
     */
    GetEndpointPairsAsync(remoteHostName, remoteServiceName) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(6, this, "ptr", remoteHostName, "ptr", remoteServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EndpointPair), operation)
    }

    /**
     * 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @param {Integer} sortOptions 
     * @returns {IAsyncOperation<IVectorView<EndpointPair>>} 
     */
    GetEndpointPairsWithSortOptionsAsync(remoteHostName, remoteServiceName, sortOptions) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(7, this, "ptr", remoteHostName, "ptr", remoteServiceName, "uint", sortOptions, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EndpointPair), operation)
    }
}
