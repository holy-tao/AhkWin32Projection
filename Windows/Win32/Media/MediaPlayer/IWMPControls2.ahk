#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPControls.ahk" { IWMPControls }

/**
 * The IWMPControls2 interface provides a method that supplements the IWMPControls interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcontrols2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPControls2 extends IWMPControls {
    /**
     * The interface identifier for IWMPControls2
     * @type {Guid}
     */
    static IID := Guid("{6f030d25-0890-480f-9775-1f7e40ab5b8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPControls2 interfaces
    */
    struct Vtbl extends IWMPControls.Vtbl {
        step : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPControls2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The step method causes the current video media item to freeze playback on the next frame or the previous frame.
     * @remarks
     * This method currently only supports the parameters 1 or -1, so you can only step one frame at a time.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {Integer} lStep <b>long</b> indicating how many frames to step before freezing. Must be set to 1 or -1.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols2-step
     */
    step(lStep) {
        result := ComCall(23, this, "int", lStep, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPControls2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.step := CallbackCreate(GetMethod(implObj, "step"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.step)
    }
}
