#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines methods that detect user activity in a Protected Broadcast Driver Architecture (PBDA) media graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_UserActivityService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_useractivityservice
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_UserActivityService extends IUnknown {
    /**
     * The interface identifier for IBDA_UserActivityService
     * @type {Guid}
     */
    static IID := Guid("{53b14189-e478-4b7a-a1ff-506db4b99dfe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_UserActivityService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCurrentTunerUseReason : IntPtr
        GetUserActivityInterval  : IntPtr
        UserActivityDetected     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_UserActivityService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the current tuner use reason for a Media Sink Device (MSD) in a Protected Broadcast Driver Architecture (PBDA) media graph.
     * @param {Integer} dwUseReason 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_useractivityservice-setcurrenttunerusereason
     */
    SetCurrentTunerUseReason(dwUseReason) {
        result := ComCall(3, this, "uint", dwUseReason, "HRESULT")
        return result
    }

    /**
     * Gets the interval that a Media Sink Device (MSD) in a Protected Broadcast Driver Architecture (PBDA) media graph waits before calling the UserActivityDetected method after the MSD detects user activity.
     * @returns {Integer} Gets the user activity interval, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_useractivityservice-getuseractivityinterval
     */
    GetUserActivityInterval() {
        result := ComCall(4, this, "uint*", &pdwActivityInterval := 0, "HRESULT")
        return pdwActivityInterval
    }

    /**
     * Indicates that a Media Sink Device (MSD) in a Protected Broadcast Driver Architecture (PBDA) media graph has detected user activity and is informing a Media Transfer Device (MTD) of this activity.
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
     * Success.
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
     * User activity service failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_useractivityservice-useractivitydetected
     */
    UserActivityDetected() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_UserActivityService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCurrentTunerUseReason := CallbackCreate(GetMethod(implObj, "SetCurrentTunerUseReason"), flags, 2)
        this.vtbl.GetUserActivityInterval := CallbackCreate(GetMethod(implObj, "GetUserActivityInterval"), flags, 2)
        this.vtbl.UserActivityDetected := CallbackCreate(GetMethod(implObj, "UserActivityDetected"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCurrentTunerUseReason)
        CallbackFree(this.vtbl.GetUserActivityInterval)
        CallbackFree(this.vtbl.UserActivityDetected)
    }
}
