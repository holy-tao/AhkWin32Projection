#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk

/**
 * The ITfRangeACP interface is implemented by the TSF manager and is used by an application character position (ACP)-based application to access and manipulate range objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfrangeacp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfRangeACP extends ITfRange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfRangeACP
     * @type {Guid}
     */
    static IID => Guid("{057a6296-029b-4154-b79a-0d461d4ea94c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtent", "SetExtent"]

    /**
     * ITfRangeACP::GetExtent method
     * @param {Pointer<Integer>} pacpAnchor Pointer to a <b>LONG</b> value that receives the application character position of the range start anchor.
     * @param {Pointer<Integer>} pcch Pointer to a <b>LONG</b> value that receives the number of characters in the range.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrangeacp-getextent
     */
    GetExtent(pacpAnchor, pcch) {
        pacpAnchorMarshal := pacpAnchor is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pacpAnchorMarshal, pacpAnchor, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * ITfRangeACP::SetExtent method
     * @param {Integer} acpAnchor Contains the application character position of the range start anchor.
     * @param {Integer} cch Contains the number of characters in the range.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrangeacp-setextent
     */
    SetExtent(acpAnchor, cch) {
        result := ComCall(26, this, "int", acpAnchor, "int", cch, "HRESULT")
        return result
    }
}
