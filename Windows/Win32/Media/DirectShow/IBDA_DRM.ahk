#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_DRM interface is used to request a tuner to perform a DRM handshake with the user's computer.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DRM)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_drm
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DRM extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DRM
     * @type {Guid}
     */
    static IID => Guid("{f98d88b0-1992-4cd6-a6d9-b9afab99330d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDRMPairingStatus", "PerformDRMPairing"]

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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_drm-getdrmpairingstatus
     */
    GetDRMPairingStatus(pdwStatus, phError) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        phErrorMarshal := phError is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwStatusMarshal, pdwStatus, phErrorMarshal, phError, "HRESULT")
        return result
    }

    /**
     * The PerformDRMPairing method requests the tuner to perform a DRM handshake with the user's computer.
     * @param {BOOL} fSync If <b>TRUE</b>, the method blocks until the operation is completed. If <b>FALSE</b>, the operation is completed asynchronously.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_drm-performdrmpairing
     */
    PerformDRMPairing(fSync) {
        result := ComCall(4, this, "int", fSync, "HRESULT")
        return result
    }
}
