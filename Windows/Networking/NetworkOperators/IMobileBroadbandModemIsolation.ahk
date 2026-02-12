#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandModemIsolation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModemIsolation
     * @type {Guid}
     */
    static IID => Guid("{b5618fec-e661-4330-9bb4-3480212ec354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAllowedHost", "AddAllowedHostRange", "ApplyConfigurationAsync", "ClearConfigurationAsync"]

    /**
     * 
     * @param {HostName} host 
     * @returns {HRESULT} 
     */
    AddAllowedHost(host) {
        result := ComCall(6, this, "ptr", host, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HostName} first 
     * @param {HostName} last 
     * @returns {HRESULT} 
     */
    AddAllowedHostRange(first, last) {
        result := ComCall(7, this, "ptr", first, "ptr", last, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ApplyConfigurationAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearConfigurationAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
