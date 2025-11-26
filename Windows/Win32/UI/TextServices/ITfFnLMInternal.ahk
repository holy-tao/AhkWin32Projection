#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFnLMProcessor.ahk

/**
 * The ITfFnLMInternal interface is not used.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnlminternal
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnLMInternal extends ITfFnLMProcessor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnLMInternal
     * @type {Guid}
     */
    static IID => Guid("{04b825b1-ac9a-4f7b-b5ad-c7168f1ee445}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessLattice"]

    /**
     * ITfFnLMInternal::ProcessLattice method
     * @param {ITfRange} pRange Not used.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlminternal-processlattice
     */
    ProcessLattice(pRange) {
        result := ComCall(11, this, "ptr", pRange, "HRESULT")
        return result
    }
}
