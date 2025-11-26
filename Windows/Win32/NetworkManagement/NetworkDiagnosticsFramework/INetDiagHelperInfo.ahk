#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INetDiagHelperInfo interface provides a method that is called by the Network Diagnostics Framework (NDF) when it needs to validate that it has the necessary information for a helper class and that it has chosen the correct helper class.
 * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nn-ndhelper-inetdiaghelperinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagHelperInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetDiagHelperInfo
     * @type {Guid}
     */
    static IID => Guid("{c0b35747-ebf5-11d8-bbe9-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeInfo"]

    /**
     * The GetAttributeInfo method retrieves the list of key parameters needed by the Helper Class Extension.
     * @param {Pointer<Integer>} pcelt A pointer to a count of elements in the array pointed to by <i>pprgAttributeInfos</i>.
     * @param {Pointer<Pointer<HelperAttributeInfo>>} pprgAttributeInfos A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-helperattributeinfo">HelperAttributeInfo</a> structures that contain helper class key parameters.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to perform the diagnosis or repair operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Helper Class Extensions may return HRESULTS that are specific to the diagnoses or repairs.
     * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nf-ndhelper-inetdiaghelperinfo-getattributeinfo
     */
    GetAttributeInfo(pcelt, pprgAttributeInfos) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributeInfosMarshal := pprgAttributeInfos is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pceltMarshal, pcelt, pprgAttributeInfosMarshal, pprgAttributeInfos, "HRESULT")
        return result
    }
}
