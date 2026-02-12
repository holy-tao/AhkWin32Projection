#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPErrorItem.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPError interface provides methods for accessing a collection of IWMPErrorItem pointers.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmperror
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
     * @remarks
     * Use this method to clear the error queue after a series of errors has been processed.
     * 
     * You should set a <b>VARIANT_BOOL</b> to <b>FALSE</b> and pass it into <b>IWMPSettings::put_enableErrorDialogs</b> if you choose to display custom error messages.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmperror-clearerrorqueue
     */
    clearErrorQueue() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_errorCount method retrieves the number of errors in the error queue.
     * @remarks
     * You should set a <b>VARIANT_BOOL</b> to <b>FALSE</b> and pass it into <b>IWMPSettings::put_enableErrorDialogs</b> if you choose to display custom error messages.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmperror-get_errorcount
     */
    get_errorCount(plNumErrors) {
        plNumErrorsMarshal := plNumErrors is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plNumErrorsMarshal, plNumErrors, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_item method retrieves a pointer to an IWMPErrorItem interface from the error queue.
     * @remarks
     * Windows Media Player can generate a number of errors in response to an error condition. This method retrieves a specific error in the queue by using an index number. The index numbers for the error queue begin with zero.
     * 
     * You should set a <b>VARIANT_BOOL</b> to <b>FALSE</b> and pass it into <b>IWMPSettings::put_enableErrorDialogs</b> if you choose to display custom error messages.
     * @param {Integer} dwIndex <b>long</b> containing the index of the pointer to an <b>IWMPErrorItem</b> interface.
     * @returns {IWMPErrorItem} Pointer to a pointer to an <b>IWMPErrorItem</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmperror-get_item
     */
    get_item(dwIndex) {
        result := ComCall(9, this, "int", dwIndex, "ptr*", &ppErrorItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPErrorItem(ppErrorItem)
    }

    /**
     * The webHelp method launches the Windows Media Player Web Help page to display further information about the first error in the error queue (index zero).
     * @remarks
     * The Web Help pages always contain the latest and most detailed information about Windows Media Player errors. This method automatically transfers the other information needed by Web Help, such as the operating system version being used.
     * 
     * To access the Web Help pages directly, use the following error code and support center links.
     * 
     * <ul>
     * <li><a href="https://support.microsoft.com/windows/windows-media-player-errors-b3a9ccc1-6267-093e-0aa3-ea860644ecd4">Windows Media Player errors</a></li>
     * <li><a href="https://support.microsoft.com/ph/7763#tab0">Windows Media Player Solution Center</a></li>
     * </ul>
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not launch the Windows Media Player Web Help page.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmperror-webhelp
     */
    webHelp() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
