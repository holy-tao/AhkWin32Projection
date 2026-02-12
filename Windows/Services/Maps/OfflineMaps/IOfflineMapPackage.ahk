#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\OfflineMapPackageStartDownloadResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class IOfflineMapPackage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineMapPackage
     * @type {Guid}
     */
    static IID => Guid("{a797673b-a5b5-4144-b525-e68c8862664b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_DisplayName", "get_EnclosingRegionName", "get_EstimatedSizeInBytes", "remove_StatusChanged", "add_StatusChanged", "RequestStartDownloadAsync"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    EnclosingRegionName {
        get => this.get_EnclosingRegionName()
    }

    /**
     * @type {Integer} 
     */
    EstimatedSizeInBytes {
        get => this.get_EstimatedSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnclosingRegionName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedSizeInBytes() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<OfflineMapPackage, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @returns {IAsyncOperation<OfflineMapPackageStartDownloadResult>} 
     */
    RequestStartDownloadAsync() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(OfflineMapPackageStartDownloadResult, value)
    }
}
