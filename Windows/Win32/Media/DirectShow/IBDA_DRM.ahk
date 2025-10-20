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
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @param {Pointer<HRESULT>} phError 
     * @returns {HRESULT} 
     */
    GetDRMPairingStatus(pdwStatus, phError) {
        result := ComCall(3, this, "uint*", pdwStatus, "ptr", phError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fSync 
     * @returns {HRESULT} 
     */
    PerformDRMPairing(fSync) {
        result := ComCall(4, this, "int", fSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
