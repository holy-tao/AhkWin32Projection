#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfUIElementSink interface is implemented by an application to receive notifications when the UI element is changed.
 * @remarks
 * 
  * To install this advise sink, obtain an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> object from an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielementmgr">ITfUIElementMgr</a> object by calling <b>ITfUIElementMgr::QueryInterface</b> with IID_ ITfSource. Then call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a> with IID_ ITfUIElementSink.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfuielementsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfUIElementSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfUIElementSink
     * @type {Guid}
     */
    static IID => Guid("{ea1ea136-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginUIElement", "UpdateUIElement", "EndUIElement"]

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @param {Pointer<BOOL>} pbShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementsink-beginuielement
     */
    BeginUIElement(dwUIElementId, pbShow) {
        result := ComCall(3, this, "uint", dwUIElementId, "ptr", pbShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementsink-updateuielement
     */
    UpdateUIElement(dwUIElementId) {
        result := ComCall(4, this, "uint", dwUIElementId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementsink-enduielement
     */
    EndUIElement(dwUIElementId) {
        result := ComCall(5, this, "uint", dwUIElementId, "HRESULT")
        return result
    }
}
