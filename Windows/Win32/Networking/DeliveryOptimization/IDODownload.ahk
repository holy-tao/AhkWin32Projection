#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DO_DOWNLOAD_STATUS.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to start and manage a download.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nn-deliveryoptimization-idodownload
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class IDODownload extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDODownload
     * @type {Guid}
     */
    static IID => Guid("{fbbd7fc0-c147-4727-a38d-827ef071ee77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Pause", "Abort", "Finalize", "GetStatus", "GetProperty", "SetProperty"]

    /**
     * Starts or resumes a download.
     * @param {Pointer<DO_DOWNLOAD_RANGES_INFO>} ranges Optional. A pointer to a [DO_DOWNLOAD_RANGES_INFO](/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_ranges_info) structure (to download only specific ranges of the file). The value passed here indicates whether the download is for the entire file or partial ranges within the file or simply to resume the download without changing the ranges info. A request to download the entire file is indicated by passing a pointer to an empty DO_DOWNLOAD_RANGES_INFO structure, that is, with its RangeCount member set to zero. A request to download a partial file is indicated by passing a pointer to a non-empty DO_DOWNLOAD_RANGES_INFO structure. Passing `nullptr` is allowed only when download has already been started once before with empty/non-empty ranges, and indicates download must be resumed without any changes to the ranges requested.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-start
     */
    Start(ranges) {
        result := ComCall(3, this, "ptr", ranges, "HRESULT")
        return result
    }

    /**
     * Pauses the download.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-pause
     */
    Pause() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Aborts the download.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Finalizes the download.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-finalize
     */
    Finalize() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * IDODownload::GetStatus retrieves a pointer to a DO_DOWNLOAD_STATUS structure that reflects the current status of the download.
     * @returns {DO_DOWNLOAD_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-getstatus
     */
    GetStatus() {
        _status := DO_DOWNLOAD_STATUS()
        result := ComCall(7, this, "ptr", _status, "HRESULT")
        return _status
    }

    /**
     * Retrieves a pointer to a **VARIANT** that contains a specific download property.
     * @param {Integer} propId The required property ID to get (of type **DODownloadProperty**).
     * @returns {VARIANT} The resulting property value, stored in a **VARIANT**.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-getproperty
     */
    GetProperty(propId) {
        propVal := VARIANT()
        result := ComCall(8, this, "int", propId, "ptr", propVal, "HRESULT")
        return propVal
    }

    /**
     * Sets a download property.
     * @param {Integer} propId The required property ID to set (of type **DODownloadProperty**).
     * @param {Pointer<VARIANT>} propVal The property value to set, stored in a **VARIANT**.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |DO_E_UNKNOWN_PROPERTY_ID|*propId* is unknown.|
     * |DO_E_INVALID_STATE|The download is not currently in a state that allows setting properties.|
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-setproperty
     */
    SetProperty(propId, propVal) {
        result := ComCall(9, this, "int", propId, "ptr", propVal, "HRESULT")
        return result
    }
}
