#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlMonitor extends IUnknown{
    /**
     * The interface identifier for IMFCameraControlMonitor
     * @type {Guid}
     */
    static IID => Guid("{4d46f2c9-28ba-4970-8c7b-1f0c9d80af69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    AddControlSubscription(controlSet, id) {
        result := ComCall(5, this, "ptr", controlSet, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    RemoveControlSubscription(controlSet, id) {
        result := ComCall(6, this, "ptr", controlSet, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Shutdown() {
        ComCall(7, this)
        return result
    }
}
