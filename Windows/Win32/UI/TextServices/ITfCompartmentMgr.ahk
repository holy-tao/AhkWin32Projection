#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfCompartment.ahk
#Include ..\..\System\Com\IEnumGUID.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCompartment", "ClearCompartment", "EnumCompartments"]

    /**
     * ITfCompartmentMgr::GetCompartment method
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the compartment.
     * @returns {ITfCompartment} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartment">ITfCompartment</a> interface pointer that receives the compartment object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcompartmentmgr-getcompartment
     */
    GetCompartment(rguid) {
        result := ComCall(3, this, "ptr", rguid, "ptr*", &ppcomp := 0, "HRESULT")
        return ITfCompartment(ppcomp)
    }

    /**
     * ITfCompartmentMgr::ClearCompartment method
     * @param {Integer} tid Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that identifies the client.
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the compartment.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The compartment cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The owner must clear this compartment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcompartmentmgr-clearcompartment
     */
    ClearCompartment(tid, rguid) {
        result := ComCall(4, this, "uint", tid, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * The ITfCompartmentMgr::EnumCompartments method obtains an enumerator that contains the GUID of the compartments within the compartment manager.
     * @returns {IEnumGUID} Pointer to an <b>IEnumGUID</b> interface pointer that receives the enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcompartmentmgr-enumcompartments
     */
    EnumCompartments() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }
}
