#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompositionSink interface is implemented by a text service to receive a notification when a composition is terminated.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcompositionsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCompositionSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCompositionSink
     * @type {Guid}
     */
    static IID => Guid("{a781718c-579a-4b15-a280-32b8577acc5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCompositionTerminated"]

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {ITfComposition} pComposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompositionsink-oncompositionterminated
     */
    OnCompositionTerminated(ecWrite, pComposition) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pComposition, "HRESULT")
        return result
    }
}
