#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTextLayoutSink interface supports the context layout change by an application. Install this advise sink by calling ITfSource::AdviseSink with IID_ITfTextLayoutSink. A text service can optionally implement this interface.
 * @remarks
 * 
  * TSF does not currently support multiple views; some features of this interface are limited.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftextlayoutsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTextLayoutSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfTextLayoutSink
     * @type {Guid}
     */
    static IID => Guid("{2af2d06a-dd5b-4927-a0b4-54f19c91fade}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLayoutChange"]

    /**
     * 
     * @param {ITfContext} pic 
     * @param {Integer} lcode 
     * @param {ITfContextView} pView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftextlayoutsink-onlayoutchange
     */
    OnLayoutChange(pic, lcode, pView) {
        result := ComCall(3, this, "ptr", pic, "int", lcode, "ptr", pView, "HRESULT")
        return result
    }
}
