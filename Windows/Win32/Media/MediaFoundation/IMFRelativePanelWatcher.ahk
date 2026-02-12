#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFRelativePanelReport.ahk
#Include .\IMFShutdown.ahk

/**
 * Monitors the panel associated with a display, so that the app receives notifications when the relative location of the panel changes.
 * @remarks
 * Get an instance of this interface by calling [MFCreateRelativePanelWatcher](nf-mfidl-mfcreaterelativepanelwatcher.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfrelativepanelwatcher
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRelativePanelWatcher extends IMFShutdown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRelativePanelWatcher
     * @type {Guid}
     */
    static IID => Guid("{421af7f6-573e-4ad0-8fda-2e57cedb18c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginGetReport", "EndGetReport", "GetReport"]

    /**
     * Begins an asynchronous request to get an IMFRelativePanelReport interface that represents the relative panel location.
     * @param {IMFAsyncCallback} pCallback Pointer to the [IMFAsyncCallback](/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback) interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState Pointer to the IUnknown interface of a state object, defined by the caller. This parameter can be NULL. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The function returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * | Return code | Description |
     * |--------------|------------------------|
     * |S_OK | The function succeeded.|
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfrelativepanelwatcher-begingetreport
     */
    BeginGetReport(pCallback, pState) {
        result := ComCall(5, this, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ends an asynchronous request to get an IMFRelativePanelReport interface that represents the relative panel location.
     * @param {IMFAsyncResult} pResult Pointer to the [IMFAsyncResult](/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult) interface. Pass in the same pointer that your callback object received in the Invoke method.
     * @returns {Pointer<IMFRelativePanelReport>} A pointer to he [IMFRelativePanelReport](nn-mfidl-imfrelativepanelreport.md) interface that represents the relative panel location.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfrelativepanelwatcher-endgetreport
     */
    EndGetReport(pResult) {
        result := ComCall(6, this, "ptr", pResult, "ptr*", &ppRelativePanelReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRelativePanelReport
    }

    /**
     * Gets an IMFRelativePanelReport interface that represents the relative panel location.
     * @returns {Pointer<IMFRelativePanelReport>} A pointer to he [IMFRelativePanelReport](nn-mfidl-imfrelativepanelreport.md) interface that represents the relative panel location.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfrelativepanelwatcher-getreport
     */
    GetReport() {
        result := ComCall(7, this, "ptr*", &ppRelativePanelReport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRelativePanelReport
    }
}
