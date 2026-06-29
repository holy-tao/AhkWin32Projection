#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DO_DOWNLOAD_RANGES_INFO.ahk" { DO_DOWNLOAD_RANGES_INFO }
#Import ".\DODownloadProperty.ahk" { DODownloadProperty }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DO_DOWNLOAD_STATUS.ahk" { DO_DOWNLOAD_STATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to start and manage a download.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nn-deliveryoptimization-idodownload
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct IDODownload extends IUnknown {
    /**
     * The interface identifier for IDODownload
     * @type {Guid}
     */
    static IID := Guid("{fbbd7fc0-c147-4727-a38d-827ef071ee77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDODownload interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start       : IntPtr
        Pause       : IntPtr
        Abort       : IntPtr
        Finalize    : IntPtr
        GetStatus   : IntPtr
        GetProperty : IntPtr
        SetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDODownload.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts or resumes a download.
     * @param {Pointer<DO_DOWNLOAD_RANGES_INFO>} ranges Optional. A pointer to a [DO_DOWNLOAD_RANGES_INFO](/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_ranges_info) structure (to download only specific ranges of the file). The value passed here indicates whether the download is for the entire file or partial ranges within the file or simply to resume the download without changing the ranges info. A request to download the entire file is indicated by passing a pointer to an empty DO_DOWNLOAD_RANGES_INFO structure, that is, with its RangeCount member set to zero. A request to download a partial file is indicated by passing a pointer to a non-empty DO_DOWNLOAD_RANGES_INFO structure. Passing `nullptr` is allowed only when download has already been started once before with empty/non-empty ranges, and indicates download must be resumed without any changes to the ranges requested.
     * @returns {HRESULT} If the function succeeds, it returns **S_OK**. Otherwise, it returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-start
     */
    Start(ranges) {
        result := ComCall(3, this, DO_DOWNLOAD_RANGES_INFO.Ptr, ranges, "HRESULT")
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
     * @returns {DO_DOWNLOAD_STATUS} A pointer to a **DO_DOWNLOAD_STATUS** structure.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-getstatus
     */
    GetStatus() {
        _status := DO_DOWNLOAD_STATUS()
        result := ComCall(7, this, DO_DOWNLOAD_STATUS.Ptr, _status, "HRESULT")
        return _status
    }

    /**
     * Retrieves a pointer to a **VARIANT** that contains a specific download property.
     * @param {DODownloadProperty} propId The required property ID to get (of type **DODownloadProperty**).
     * @returns {VARIANT} The resulting property value, stored in a **VARIANT**.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idodownload-getproperty
     */
    GetProperty(propId) {
        propVal := VARIANT()
        result := ComCall(8, this, DODownloadProperty, propId, VARIANT.Ptr, propVal, "HRESULT")
        return propVal
    }

    /**
     * Sets a download property.
     * @param {DODownloadProperty} propId The required property ID to set (of type **DODownloadProperty**).
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
        result := ComCall(9, this, DODownloadProperty, propId, VARIANT.Ptr, propVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDODownload.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
        this.vtbl.Finalize := CallbackCreate(GetMethod(implObj, "Finalize"), flags, 1)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.Finalize)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
    }
}
