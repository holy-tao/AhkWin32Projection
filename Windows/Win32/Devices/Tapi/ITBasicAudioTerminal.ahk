#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITBasicAudioTerminal interface provides methods that allow an application to control basic sound characteristics of terminal.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itbasicaudioterminal
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITBasicAudioTerminal extends IDispatch {
    /**
     * The interface identifier for ITBasicAudioTerminal
     * @type {Guid}
     */
    static IID := Guid("{b1efc38d-9355-11d0-835c-00aa003ccabd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITBasicAudioTerminal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_Volume  : IntPtr
        get_Volume  : IntPtr
        put_Balance : IntPtr
        get_Balance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITBasicAudioTerminal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {Integer} 
     */
    Balance {
        get => this.get_Balance()
        set => this.put_Balance(value)
    }

    /**
     * The put_Volume method sets the volume.
     * @param {Integer} lVolume The volume property is a value between 0 and FFFF, representing a set of logarithmic steps. Not all devices support as many distinguishable steps.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
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
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTERMINALSELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A terminal must be selected before the volume can be adjusted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-put_volume
     */
    put_Volume(lVolume) {
        result := ComCall(7, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * The get_Volume method gets the volume.
     * @returns {Integer} Pointer to volume. The volume property is a value between 0 and FFFF, representing a set of logarithmic steps. Not all devices support as many distinguishable steps.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-get_volume
     */
    get_Volume() {
        result := ComCall(8, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * The put_Balance method sets the balance. This method is not implemented for terminals shipped with TAPI 3.0 and higher.
     * @remarks
     * The balance property is a value between –10,000 and 10,000. A value of –10,000 indicates that the right speaker has been disabled and only the left speaker is receiving an audio signal. A value of 0 indicates that both speakers are receiving equivalent audio signals. A value of 10,000 indicates that the left speaker has been disabled and only the right speaker is receiving an audio signal.
     * @param {Integer} lBalance Balance.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
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
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Terminal's balance methods are not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-put_balance
     */
    put_Balance(lBalance) {
        result := ComCall(9, this, "int", lBalance, "HRESULT")
        return result
    }

    /**
     * The get_Balance method gets the balance. This method is not implemented for terminals shipped with TAPI 3.0 and higher.
     * @remarks
     * The balance property is a value between –10,000 and 10,000. A value of –10,000 indicates that the right speaker has been disabled and only the left speaker is receiving an audio signal. A value of 0 indicates that both speakers are receiving equivalent audio signals. A value of 10,000 indicates that the left speaker has been disabled and only the right speaker is receiving an audio signal.
     * @returns {Integer} Pointer to balance.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasicaudioterminal-get_balance
     */
    get_Balance() {
        result := ComCall(10, this, "int*", &plBalance := 0, "HRESULT")
        return plBalance
    }

    Query(iid) {
        if (ITBasicAudioTerminal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Volume := CallbackCreate(GetMethod(implObj, "put_Volume"), flags, 2)
        this.vtbl.get_Volume := CallbackCreate(GetMethod(implObj, "get_Volume"), flags, 2)
        this.vtbl.put_Balance := CallbackCreate(GetMethod(implObj, "put_Balance"), flags, 2)
        this.vtbl.get_Balance := CallbackCreate(GetMethod(implObj, "get_Balance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Volume)
        CallbackFree(this.vtbl.get_Volume)
        CallbackFree(this.vtbl.put_Balance)
        CallbackFree(this.vtbl.get_Balance)
    }
}
