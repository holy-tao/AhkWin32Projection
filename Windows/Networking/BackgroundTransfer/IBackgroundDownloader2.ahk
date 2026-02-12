#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundTransferGroup.ahk
#Include ..\..\UI\Notifications\ToastNotification.ahk
#Include ..\..\UI\Notifications\TileNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundDownloader2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundDownloader2
     * @type {Guid}
     */
    static IID => Guid("{a94a5847-348d-4a35-890e-8a1ef3798479}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransferGroup", "put_TransferGroup", "get_SuccessToastNotification", "put_SuccessToastNotification", "get_FailureToastNotification", "put_FailureToastNotification", "get_SuccessTileNotification", "put_SuccessTileNotification", "get_FailureTileNotification", "put_FailureTileNotification"]

    /**
     * @type {BackgroundTransferGroup} 
     */
    TransferGroup {
        get => this.get_TransferGroup()
        set => this.put_TransferGroup(value)
    }

    /**
     * @type {ToastNotification} 
     */
    SuccessToastNotification {
        get => this.get_SuccessToastNotification()
        set => this.put_SuccessToastNotification(value)
    }

    /**
     * @type {ToastNotification} 
     */
    FailureToastNotification {
        get => this.get_FailureToastNotification()
        set => this.put_FailureToastNotification(value)
    }

    /**
     * @type {TileNotification} 
     */
    SuccessTileNotification {
        get => this.get_SuccessTileNotification()
        set => this.put_SuccessTileNotification(value)
    }

    /**
     * @type {TileNotification} 
     */
    FailureTileNotification {
        get => this.get_FailureTileNotification()
        set => this.put_FailureTileNotification(value)
    }

    /**
     * 
     * @returns {BackgroundTransferGroup} 
     */
    get_TransferGroup() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTransferGroup(value)
    }

    /**
     * 
     * @param {BackgroundTransferGroup} value 
     * @returns {HRESULT} 
     */
    put_TransferGroup(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_SuccessToastNotification() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotification(value)
    }

    /**
     * 
     * @param {ToastNotification} value 
     * @returns {HRESULT} 
     */
    put_SuccessToastNotification(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_FailureToastNotification() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotification(value)
    }

    /**
     * 
     * @param {ToastNotification} value 
     * @returns {HRESULT} 
     */
    put_FailureToastNotification(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_SuccessTileNotification() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileNotification(value)
    }

    /**
     * 
     * @param {TileNotification} value 
     * @returns {HRESULT} 
     */
    put_SuccessTileNotification(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_FailureTileNotification() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileNotification(value)
    }

    /**
     * 
     * @param {TileNotification} value 
     * @returns {HRESULT} 
     */
    put_FailureTileNotification(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
