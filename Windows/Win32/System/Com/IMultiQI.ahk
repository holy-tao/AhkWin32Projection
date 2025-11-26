#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a client to query an object proxy, or handler, for multiple interfaces by using a single RPC call.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imultiqi
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMultiQI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiQI
     * @type {Guid}
     */
    static IID => Guid("{00000020-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryMultipleInterfaces"]

    /**
     * Retrieves pointers to multiple supported interfaces on an object.
     * @param {Integer} cMQIs The number of elements in the <i>pMQIs</i> array.
     * @param {Pointer<MULTI_QI>} pMQIs An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. For more information, see Remarks.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
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
     * The method retrieved pointers to all requested interfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method retrieved pointers to some, but not all, of the requested interfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method retrieved pointers to none of the requested interfaces.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imultiqi-querymultipleinterfaces
     */
    QueryMultipleInterfaces(cMQIs, pMQIs) {
        result := ComCall(3, this, "uint", cMQIs, "ptr", pMQIs, "HRESULT")
        return result
    }
}
