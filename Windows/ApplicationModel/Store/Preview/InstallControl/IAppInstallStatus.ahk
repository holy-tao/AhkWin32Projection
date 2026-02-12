#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallStatus
     * @type {Guid}
     */
    static IID => Guid("{936dccfa-2450-4126-88b1-6127a644dd5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InstallState", "get_DownloadSizeInBytes", "get_BytesDownloaded", "get_PercentComplete", "get_ErrorCode"]

    /**
     * @type {Integer} 
     */
    InstallState {
        get => this.get_InstallState()
    }

    /**
     * @type {Integer} 
     */
    DownloadSizeInBytes {
        get => this.get_DownloadSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    BytesDownloaded {
        get => this.get_BytesDownloaded()
    }

    /**
     * @type {Float} 
     */
    PercentComplete {
        get => this.get_PercentComplete()
    }

    /**
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadSizeInBytes() {
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
    get_BytesDownloaded() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PercentComplete() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
