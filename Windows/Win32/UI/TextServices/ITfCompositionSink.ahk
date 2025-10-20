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
     * 
     * @param {Integer} ecWrite 
     * @param {Pointer<ITfComposition>} pComposition 
     * @returns {HRESULT} 
     */
    OnCompositionTerminated(ecWrite, pComposition) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pComposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
