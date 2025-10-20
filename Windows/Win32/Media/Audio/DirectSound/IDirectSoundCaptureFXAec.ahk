#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureFXAec extends IUnknown{
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
     * 
     * @param {Pointer<DSCFXAec>} pDscFxAec 
     * @returns {HRESULT} 
     */
    SetAllParameters(pDscFxAec) {
        result := ComCall(3, this, "ptr", pDscFxAec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSCFXAec>} pDscFxAec 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDscFxAec) {
        result := ComCall(4, this, "ptr", pDscFxAec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(5, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
