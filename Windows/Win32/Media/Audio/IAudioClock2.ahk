#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClock2 interface is used to get the current device position.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclock2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClock2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClock2
     * @type {Guid}
     */
    static IID => Guid("{6f49ff73-6727-49ac-a008-d98cf5e70048}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevicePosition"]

    /**
     * 
     * @param {Pointer<Integer>} DevicePosition 
     * @param {Pointer<Integer>} QPCPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclock2-getdeviceposition
     */
    GetDevicePosition(DevicePosition, QPCPosition) {
        DevicePositionMarshal := DevicePosition is VarRef ? "uint*" : "ptr"
        QPCPositionMarshal := QPCPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, DevicePositionMarshal, DevicePosition, QPCPositionMarshal, QPCPosition, "HRESULT")
        return result
    }
}
