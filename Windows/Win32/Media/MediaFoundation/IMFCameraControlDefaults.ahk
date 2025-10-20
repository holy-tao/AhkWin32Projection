#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlDefaults extends IUnknown{
    /**
     * The interface identifier for IMFCameraControlDefaults
     * @type {Guid}
     */
    static IID => Guid("{75510662-b034-48f4-88a7-8de61daa4af9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetType() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MF_CAMERA_CONTROL_RANGE_INFO>} rangeInfo 
     * @returns {HRESULT} 
     */
    GetRangeInfo(rangeInfo) {
        result := ComCall(4, this, "ptr", rangeInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} control 
     * @param {Pointer<UInt32>} controlSize 
     * @param {Pointer<Void>} data 
     * @param {Pointer<UInt32>} dataSize 
     * @returns {HRESULT} 
     */
    LockControlData(control, controlSize, data, dataSize) {
        result := ComCall(5, this, "ptr", control, "uint*", controlSize, "ptr", data, "uint*", dataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockControlData() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
