#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPPlayerApplication interface provides methods for switching between a remoted Windows Media Player control and the full mode of the Player. These methods can only be used with C++ programs that embed the control in remote mode.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayerapplication
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlayerApplication extends IDispatch {
    /**
     * The interface identifier for IWMPPlayerApplication
     * @type {Guid}
     */
    static IID := Guid("{40897764-ceab-47be-ad4a-8e28537f9bbf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlayerApplication interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        switchToPlayerApplication : IntPtr
        switchToControl           : IntPtr
        get_playerDocked          : IntPtr
        get_hasDisplay            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlayerApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IWMPPlayerApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.switchToPlayerApplication := CallbackCreate(GetMethod(implObj, "switchToPlayerApplication"), flags, 1)
        this.vtbl.switchToControl := CallbackCreate(GetMethod(implObj, "switchToControl"), flags, 1)
        this.vtbl.get_playerDocked := CallbackCreate(GetMethod(implObj, "get_playerDocked"), flags, 2)
        this.vtbl.get_hasDisplay := CallbackCreate(GetMethod(implObj, "get_hasDisplay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.switchToPlayerApplication)
        CallbackFree(this.vtbl.switchToControl)
        CallbackFree(this.vtbl.get_playerDocked)
        CallbackFree(this.vtbl.get_hasDisplay)
    }
}
