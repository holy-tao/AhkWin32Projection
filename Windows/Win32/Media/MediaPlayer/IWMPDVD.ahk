#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPDVD interface provides methods for working with DVDs.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpdvd
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDVD extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDVD
     * @type {Guid}
     */
    static IID => Guid("{8da61686-4668-4a5c-ae5d-803193293dbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isAvailable", "get_domain", "topMenu", "titleMenu", "back", "resume"]

    /**
     */
    domain {
        get => this.get_domain()
    }

    /**
     * The get_isAvailable method indicates whether a specified type of information is available or a specified action can be performed.
     * @remarks
     * The DVD features of Windows Media Player will not work on computers that do not have a DVD decoder installed. You can determine whether a decoder is available by calling the <b>get_isAvailable</b> method and passing in the <b>BSTR</b> value "dvdDecoder".
     * 
     * Every DVD is authored differently. The methods available during DVD playback and navigation depend on how the DVD is authored.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable Pointer to a <b>VARIANT_BOOL</b> that indicates whether the specified parameter is available.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpdvd-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        if(bstrItem is String) {
            pin := BSTR.Alloc(bstrItem)
            bstrItem := pin.Value
        }

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_domain method retrieves the current domain of the DVD.
     * @remarks
     * Every DVD is authored differently. Some DVDs do not contain the firstPlay, videoManagerMenu, or videoTitleSetMenu domains.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
     * @param {Pointer<BSTR>} strDomain 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpdvd-get_domain
     */
    get_domain(strDomain) {
        result := ComCall(8, this, "ptr", strDomain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The topMenu method stops playback and displays the top (or root) menu for the current title.
     * @remarks
     * Every DVD is authored differently. The DVD must contain a menu for this method to work. Some DVDs are authored so that the <b>topMenu</b> and <b>IWMPDVD::titleMenu</b> methods open the same menu. The <b>topMenu</b> method usually invokes the top (or root) menu, but it may invoke the title menu if there is no root menu available.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpdvd-topmenu
     */
    topMenu() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The titleMenu method stops playback and displays the title menu.
     * @remarks
     * Every DVD is authored differently. The DVD must contain a menu for this method to work. Some DVDs are authored so that the <b>IWMPDVD::topMenu</b> and <b>titleMenu</b> methods open the same menu. The <b>titleMenu</b> method usually invokes the title menu, but it may invoke the top menu if there is no title menu available.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpdvd-titlemenu
     */
    titleMenu() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The back method returns the display from a submenu to its parent menu.
     * @remarks
     * Every DVD is authored differently. Some DVDs are authored so that the <b>back</b> method is available from the root menu, but when invoked, it will do nothing.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpdvd-back
     */
    back() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The resume method returns to playback mode from menu mode at the same title position as when the menu was invoked.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpdvd-resume
     */
    resume() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
