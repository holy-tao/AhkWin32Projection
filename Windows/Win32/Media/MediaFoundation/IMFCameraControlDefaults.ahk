#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontroldefaults
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlDefaults extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetRangeInfo", "LockControlData", "UnlockControlData"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-gettype
     */
    GetType() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MF_CAMERA_CONTROL_RANGE_INFO>} rangeInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-getrangeinfo
     */
    GetRangeInfo(rangeInfo) {
        result := ComCall(4, this, "ptr", rangeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} control 
     * @param {Pointer<Integer>} controlSize 
     * @param {Pointer<Pointer<Void>>} data 
     * @param {Pointer<Integer>} dataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-lockcontroldata
     */
    LockControlData(control, controlSize, data, dataSize) {
        controlSizeMarshal := controlSize is VarRef ? "uint*" : "ptr"
        dataSizeMarshal := dataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", control, controlSizeMarshal, controlSize, "ptr*", data, dataSizeMarshal, dataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaults-unlockcontroldata
     */
    UnlockControlData() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
