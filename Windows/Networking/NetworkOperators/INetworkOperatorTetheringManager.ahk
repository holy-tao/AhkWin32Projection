#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NetworkOperatorTetheringAccessPointConfiguration.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\NetworkOperatorTetheringOperationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringManager
     * @type {Guid}
     */
    static IID => Guid("{d45a8da0-0e86-4d98-8ba4-dd70d4b764d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxClientCount", "get_ClientCount", "get_TetheringOperationalState", "GetCurrentAccessPointConfiguration", "ConfigureAccessPointAsync", "StartTetheringAsync", "StopTetheringAsync"]

    /**
     * @type {Integer} 
     */
    MaxClientCount {
        get => this.get_MaxClientCount()
    }

    /**
     * @type {Integer} 
     */
    ClientCount {
        get => this.get_ClientCount()
    }

    /**
     * @type {Integer} 
     */
    TetheringOperationalState {
        get => this.get_TetheringOperationalState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxClientCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClientCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TetheringOperationalState() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {NetworkOperatorTetheringAccessPointConfiguration} 
     */
    GetCurrentAccessPointConfiguration() {
        result := ComCall(9, this, "ptr*", &configuration := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkOperatorTetheringAccessPointConfiguration(configuration)
    }

    /**
     * 
     * @param {NetworkOperatorTetheringAccessPointConfiguration} configuration 
     * @returns {IAsyncAction} 
     */
    ConfigureAccessPointAsync(configuration) {
        result := ComCall(10, this, "ptr", configuration, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncOperation<NetworkOperatorTetheringOperationResult>} 
     */
    StartTetheringAsync() {
        result := ComCall(11, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(NetworkOperatorTetheringOperationResult, asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncOperation<NetworkOperatorTetheringOperationResult>} 
     */
    StopTetheringAsync() {
        result := ComCall(12, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(NetworkOperatorTetheringOperationResult, asyncInfo)
    }
}
