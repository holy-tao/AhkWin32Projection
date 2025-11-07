#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfContextComposition.ahk

/**
 * The ITfContextOwnerCompositionServices interface is implemented by the TSF manager and used by a context owner to manipulate compositions created by a text service.
 * @remarks
 * 
 * Normally, an application creates a context and is the context owner. On occasion a text service will create a context. In this case, the text service is the context owner. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TSF/edit-contexts">Edit Contexts</a>.
 * 
 * Obtain this interface by calling <b>ITfContext::QueryInterface</b> with IID_ITfContextOwnerCompositionServices.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextownercompositionservices
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwnerCompositionServices extends ITfContextComposition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextOwnerCompositionServices
     * @type {Guid}
     */
    static IID => Guid("{86462810-593b-4916-9764-19c08e9ce110}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TerminateComposition"]

    /**
     * 
     * @param {ITfCompositionView} pComposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionservices-terminatecomposition
     */
    TerminateComposition(pComposition) {
        result := ComCall(7, this, "ptr", pComposition, "HRESULT")
        return result
    }
}
