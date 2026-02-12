#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.Telemetry
 * @version WindowsRuntime 1.4
 */
class IPlatformTelemetryRegistrationSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlatformTelemetryRegistrationSettings
     * @type {Guid}
     */
    static IID => Guid("{819a8582-ca19-415e-bb79-9c224bfa3a73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StorageSize", "put_StorageSize", "get_UploadQuotaSize", "put_UploadQuotaSize"]

    /**
     * @type {Integer} 
     */
    StorageSize {
        get => this.get_StorageSize()
        set => this.put_StorageSize(value)
    }

    /**
     * @type {Integer} 
     */
    UploadQuotaSize {
        get => this.get_UploadQuotaSize()
        set => this.put_UploadQuotaSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StorageSize() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StorageSize(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UploadQuotaSize() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UploadQuotaSize(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
