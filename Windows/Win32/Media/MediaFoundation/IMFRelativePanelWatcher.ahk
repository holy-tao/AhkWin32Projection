#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import ".\IMFRelativePanelReport.ahk" { IMFRelativePanelReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFShutdown.ahk" { IMFShutdown }

/**
 * Monitors the panel associated with a display, so that the app receives notifications when the relative location of the panel changes.
 * @remarks
 * Get an instance of this interface by calling [MFCreateRelativePanelWatcher](nf-mfidl-mfcreaterelativepanelwatcher.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfrelativepanelwatcher
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFRelativePanelWatcher extends IMFShutdown {
    /**
     * The interface identifier for IMFRelativePanelWatcher
     * @type {Guid}
     */
    static IID := Guid("{421af7f6-573e-4ad0-8fda-2e57cedb18c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFRelativePanelWatcher interfaces
    */
    struct Vtbl extends IMFShutdown.Vtbl {
        BeginGetReport : IntPtr
        EndGetReport   : IntPtr
        GetReport      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFRelativePanelWatcher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Begins an asynchronous request to get an IMFRelativePanelReport interface that represents the relative panel location.
     * @param {IMFAsyncCallback} pCallback Pointer to the [IMFAsyncCallback](/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback) interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState Pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The function returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * | Return code | Description |
     * |--------------|------------------------|
     * |S_OK | The function succeeded.|
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelwatcher-begingetreport
     */
    BeginGetReport(pCallback, pState) {
        result := ComCall(5, this, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Ends an asynchronous request to get an IMFRelativePanelReport interface that represents the relative panel location.
     * @param {IMFAsyncResult} pResult Pointer to the [IMFAsyncResult](/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult) interface. Pass in the same pointer that your callback object received in the Invoke method.
     * @returns {IMFRelativePanelReport} A pointer to he [IMFRelativePanelReport](nn-mfidl-imfrelativepanelreport.md) interface that represents the relative panel location.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelwatcher-endgetreport
     */
    EndGetReport(pResult) {
        result := ComCall(6, this, "ptr", pResult, "ptr*", &ppRelativePanelReport := 0, "HRESULT")
        return IMFRelativePanelReport(ppRelativePanelReport)
    }

    /**
     * Gets an IMFRelativePanelReport interface that represents the relative panel location.
     * @returns {IMFRelativePanelReport} A pointer to he [IMFRelativePanelReport](nn-mfidl-imfrelativepanelreport.md) interface that represents the relative panel location.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelwatcher-getreport
     */
    GetReport() {
        result := ComCall(7, this, "ptr*", &ppRelativePanelReport := 0, "HRESULT")
        return IMFRelativePanelReport(ppRelativePanelReport)
    }

    Query(iid) {
        if (IMFRelativePanelWatcher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginGetReport := CallbackCreate(GetMethod(implObj, "BeginGetReport"), flags, 3)
        this.vtbl.EndGetReport := CallbackCreate(GetMethod(implObj, "EndGetReport"), flags, 3)
        this.vtbl.GetReport := CallbackCreate(GetMethod(implObj, "GetReport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginGetReport)
        CallbackFree(this.vtbl.EndGetReport)
        CallbackFree(this.vtbl.GetReport)
    }
}
