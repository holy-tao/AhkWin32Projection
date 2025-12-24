#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Transfers the foreground window to the process hosting the COM server.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iforegroundtransfer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IForegroundTransfer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IForegroundTransfer
     * @type {Guid}
     */
    static IID => Guid("{00000145-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllowForegroundTransfer"]

    /**
     * Yields the foreground window to the COM server process.
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
     * The method completed successfully.
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
     * The <i>lpvReserved</i> parameter is not <b>NULL</b>, or this interface is on a proxy that does not support foreground control.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iforegroundtransfer-allowforegroundtransfer
     */
    AllowForegroundTransfer() {
        static lpvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", lpvReserved, "HRESULT")
        return result
    }
}
