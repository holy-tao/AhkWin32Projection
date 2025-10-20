#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompartmentMgr interface is implemented by the TSF manager and used by clients (applications and text services) to obtain and manipulate TSF compartments.
 * @remarks
 * 
  * The set of compartments that this interface is responsible for depends upon how the interface was obtained. An instance of this interface can be obtained in one of the following ways. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TSF/compartments">Compartments</a>.
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-getglobalcompartment">ITfThreadMgr::GetGlobalCompartment
  *             </a> - Obtains the global compartment manager.</li>
  * <li><b>ITfThreadMgr::QueryInterface</b> with IID_ITfCompartmentMgr - Obtains the compartment manager for this specific thread manager.</li>
  * <li><b>ITfDocumentMgr::QueryInterface</b> with IID_ITfCompartmentMgr - Obtains the compartment manager for this specific document manager.</li>
  * <li><b>ITfContext::QueryInterface</b> with IID_ITfCompartmentMgr - Obtains the compartment manager for this specific context.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcompartmentmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCompartmentMgr extends IUnknown{
    /**
     * The interface identifier for ITfCompartmentMgr
     * @type {Guid}
     */
    static IID => Guid("{7dcf57ac-18ad-438b-824d-979bffb74b7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<ITfCompartment>} ppcomp 
     * @returns {HRESULT} 
     */
    GetCompartment(rguid, ppcomp) {
        result := ComCall(3, this, "ptr", rguid, "ptr", ppcomp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     */
    ClearCompartment(tid, rguid) {
        result := ComCall(4, this, "uint", tid, "ptr", rguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumCompartments(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
