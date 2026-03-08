#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlayerApplication interface provides methods for switching between a remoted Windows Media Player control and the full mode of the Player. These methods can only be used with C++ programs that embed the control in remote mode.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayerapplication
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayerApplication extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayerApplication
     * @type {Guid}
     */
    static IID => Guid("{40897764-ceab-47be-ad4a-8e28537f9bbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["switchToPlayerApplication", "switchToControl", "get_playerDocked", "get_hasDisplay"]

    /**
     */
    playerDocked {
        get => this.get_playerDocked()
    }

    /**
     */
    hasDisplay {
        get => this.get_hasDisplay()
    }

    /**
     * The switchToPlayerApplication method switches a remoted Windows Media Player control to the full mode of the Player.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-switchtoplayerapplication
     */
    switchToPlayerApplication() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The switchToControl method switches a remoted Windows Media Player control to the docked state.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * You should avoid keeping a remoted instance of the Player running in the background during times when the control is not in use. Because the remoted Player control instance shares its playback engine with the full mode Player, keeping a background instance running can cause unexpected behavior. For example, the user might close the full mode Player while a file is playing. The user would expect that file playback would completely stop when the Player closes, but audio might continue to play because the playback engine is still active.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-switchtocontrol
     */
    switchToControl() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The get_playerDocked method retrieves a value indicating whether Windows Media Player is in a docked state.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {Pointer<VARIANT_BOOL>} pbPlayerDocked Pointer to a <b>VARIANT_BOOL</b> indicating whether Windows Media Player is in a docked state.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-get_playerdocked
     */
    get_playerDocked(pbPlayerDocked) {
        pbPlayerDockedMarshal := pbPlayerDocked is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, pbPlayerDockedMarshal, pbPlayerDocked, "HRESULT")
        return result
    }

    /**
     * The get_hasDisplay method retrieves a value indicating whether video can display through the remoted Windows Media Player control.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * Several Windows Media Player controls can be running remotely at the same time, but video can only display in one location at a time, either in the full mode of the Player or in one of the remoted controls. Use this method to determine whether the current control is the one through which video can be displayed.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>TRUE</b>.
     * @param {Pointer<VARIANT_BOOL>} pbHasDisplay Pointer to a <b>VARIANT_BOOL</b> indicating whether video can display through the remoted Windows Media Player control.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-get_hasdisplay
     */
    get_hasDisplay(pbHasDisplay) {
        pbHasDisplayMarshal := pbHasDisplay is VarRef ? "short*" : "ptr"

        result := ComCall(10, this, pbHasDisplayMarshal, pbHasDisplay, "HRESULT")
        return result
    }
}
