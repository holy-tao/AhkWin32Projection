#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPErrorItem.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPError interface provides methods for accessing a collection of IWMPErrorItem pointers.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperror
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPError extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPError
     * @type {Guid}
     */
    static IID => Guid("{a12dcf7d-14ab-4c1b-a8cd-63909f06025b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["clearErrorQueue", "get_errorCount", "get_item", "webHelp"]

    /**
     */
    errorCount {
        get => this.get_errorCount()
    }

    /**
     * The clearErrorQueue method clears the errors from the error queue.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperror-clearerrorqueue
     */
    clearErrorQueue() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The get_errorCount method retrieves the number of errors in the error queue.
     * @param {Pointer<Integer>} plNumErrors Pointer to a <b>long</b> containing the number of errors.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperror-get_errorcount
     */
    get_errorCount(plNumErrors) {
        plNumErrorsMarshal := plNumErrors is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plNumErrorsMarshal, plNumErrors, "HRESULT")
        return result
    }

    /**
     * The get_item method retrieves a pointer to an IWMPErrorItem interface from the error queue.
     * @param {Integer} dwIndex <b>long</b> containing the index of the pointer to an <b>IWMPErrorItem</b> interface.
     * @returns {IWMPErrorItem} Pointer to a pointer to an <b>IWMPErrorItem</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperror-get_item
     */
    get_item(dwIndex) {
        result := ComCall(9, this, "int", dwIndex, "ptr*", &ppErrorItem := 0, "HRESULT")
        return IWMPErrorItem(ppErrorItem)
    }

    /**
     * The webHelp method launches the Windows Media Player Web Help page to display further information about the first error in the error queue (index zero).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperror-webhelp
     */
    webHelp() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
