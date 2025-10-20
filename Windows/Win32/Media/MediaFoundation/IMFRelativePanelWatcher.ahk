#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFShutdown.ahk

/**
 * Monitors the panel associated with a display, so that the app receives notifications when the relative location of the panel changes.
 * @remarks
 * 
  * Get an instance of this interface by calling [MFCreateRelativePanelWatcher](nf-mfidl-mfcreaterelativepanelwatcher.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfrelativepanelwatcher
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
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelwatcher-begingetreport
     */
    BeginGetReport(pCallback, pState) {
        result := ComCall(5, this, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<IMFRelativePanelReport>} ppRelativePanelReport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelwatcher-endgetreport
     */
    EndGetReport(pResult, ppRelativePanelReport) {
        result := ComCall(6, this, "ptr", pResult, "ptr*", ppRelativePanelReport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFRelativePanelReport>} ppRelativePanelReport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrelativepanelwatcher-getreport
     */
    GetReport(ppRelativePanelReport) {
        result := ComCall(7, this, "ptr*", ppRelativePanelReport, "HRESULT")
        return result
    }
}
