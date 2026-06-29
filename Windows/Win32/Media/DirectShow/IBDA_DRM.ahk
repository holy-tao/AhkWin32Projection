#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_DRM interface is used to request a tuner to perform a DRM handshake with the user's computer.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DRM)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_drm
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DRM extends IUnknown {
    /**
     * The interface identifier for IBDA_DRM
     * @type {Guid}
     */
    static IID := Guid("{f98d88b0-1992-4cd6-a6d9-b9afab99330d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DRM interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDRMPairingStatus : IntPtr
        PerformDRMPairing   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DRM.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDRMPairingStatus method queries the status of the DRM handshake.
     * @param {Pointer<Integer>} pdwStatus Receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/ne-bdaiface-bda_drmpairingerror">BDA_DrmPairingError</a> enumeration.
     * @param {Pointer<HRESULT>} phError Receives an <b>HRESULT</b> value indicating the success or failure of the DRM handshake.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support this functionality, or the handshake is still in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_drm-getdrmpairingstatus
     */
    GetDRMPairingStatus(pdwStatus, phError) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        phErrorMarshal := phError is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwStatusMarshal, pdwStatus, phErrorMarshal, phError, "HRESULT")
        return result
    }

    /**
     * The PerformDRMPairing method requests the tuner to perform a DRM handshake with the user's computer.
     * @remarks
     * If you call this method asynchronously (<i>fSync</i> equal to <b>FALSE</b>), you can poll the status of the operation by calling <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_drm-getdrmpairingstatus">IBDA_DRM::GetDRMPairingStatus</a>. While the operation is in progress, <b>GetDRMPairingStatus</b> returns S_FALSE.
     * @param {BOOL} fSync If <b>TRUE</b>, the method blocks until the operation is completed. If <b>FALSE</b>, the operation is completed asynchronously.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_drm-performdrmpairing
     */
    PerformDRMPairing(fSync) {
        result := ComCall(4, this, BOOL, fSync, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DRM.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDRMPairingStatus := CallbackCreate(GetMethod(implObj, "GetDRMPairingStatus"), flags, 3)
        this.vtbl.PerformDRMPairing := CallbackCreate(GetMethod(implObj, "PerformDRMPairing"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDRMPairingStatus)
        CallbackFree(this.vtbl.PerformDRMPairing)
    }
}
