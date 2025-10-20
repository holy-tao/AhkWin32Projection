#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureFXAec extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundCaptureFXAec
     * @type {Guid}
     */
    static IID => Guid("{ad74143d-903d-4ab7-8066-28d363036d65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllParameters", "GetAllParameters", "GetStatus", "Reset"]

    /**
     * 
     * @param {Pointer<DSCFXAec>} pDscFxAec 
     * @returns {HRESULT} 
     */
    SetAllParameters(pDscFxAec) {
        result := ComCall(3, this, "ptr", pDscFxAec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DSCFXAec>} pDscFxAec 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDscFxAec) {
        result := ComCall(4, this, "ptr", pDscFxAec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(5, this, "uint*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
