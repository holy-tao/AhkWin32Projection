#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompositionSink interface is implemented by a text service to receive a notification when a composition is terminated.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfcompositionsink
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
     * ITfCompositionSink::OnCompositionTerminated method
     * @remarks
     * There is no required action for the TSF text service when this method is called. The TSF text service can use this notification to revert partially composed text into readable text or erase the composition entirely. The TSF manager will automatically clear the GUID_PROP_COMPOSING property value over the affected text.
     * @param {Integer} ecWrite Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfeditcookie">TfEditCookie</a> value that identifies the edit context. This is the same value passed for <i>ecWrite</i> in the call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontextcomposition-startcomposition">ITfContextComposition::StartComposition</a>.
     * @param {ITfComposition} pComposition Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfComposition</a> object terminated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcompositionsink-oncompositionterminated
     */
    OnCompositionTerminated(ecWrite, pComposition) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pComposition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
