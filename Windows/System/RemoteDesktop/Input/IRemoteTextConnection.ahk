#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Input
 * @version WindowsRuntime 1.4
 */
class IRemoteTextConnection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteTextConnection
     * @type {Guid}
     */
    static IID => Guid("{4e7bb02a-183e-5e66-b5e4-3e6e5c570cf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "RegisterThread", "UnregisterThread", "ReportDataReceived"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    RegisterThread(threadId) {
        result := ComCall(8, this, "uint", threadId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    UnregisterThread(threadId) {
        result := ComCall(9, this, "uint", threadId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} pduData_length 
     * @param {Pointer<Integer>} pduData 
     * @returns {HRESULT} 
     */
    ReportDataReceived(pduData_length, pduData) {
        pduDataMarshal := pduData is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", pduData_length, pduDataMarshal, pduData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
