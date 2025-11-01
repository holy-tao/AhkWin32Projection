#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsWddmIddProps1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsWddmIddProps1
     * @type {Guid}
     */
    static IID => Guid("{60f71b1a-3682-4bc7-997e-4e4f02a08148}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHardwareId", "OnDriverLoad", "OnDriverUnload"]

    /**
     * 
     * @param {PWSTR} pDisplayDriverHardwareId 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetHardwareId(pDisplayDriverHardwareId, Count) {
        pDisplayDriverHardwareId := pDisplayDriverHardwareId is String ? StrPtr(pDisplayDriverHardwareId) : pDisplayDriverHardwareId

        result := ComCall(3, this, "ptr", pDisplayDriverHardwareId, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {PWSTR} DeviceInstance 
     * @returns {HRESULT} 
     */
    OnDriverLoad(SessionId, DeviceInstance) {
        DeviceInstance := DeviceInstance is String ? StrPtr(DeviceInstance) : DeviceInstance

        result := ComCall(4, this, "uint", SessionId, "ptr", DeviceInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     */
    OnDriverUnload(SessionId) {
        result := ComCall(5, this, "uint", SessionId, "HRESULT")
        return result
    }
}
