#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioStateMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStateMonitor
     * @type {Guid}
     */
    static IID => Guid("{63bd8738-e30d-4c77-bf5c-834e87c657e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterCallback", "UnregisterCallback", "GetSoundLevel"]

    /**
     * 
     * @param {Pointer<PAudioStateMonitorCallback>} callback 
     * @param {Pointer<Void>} context 
     * @param {Pointer<Integer>} registration 
     * @returns {HRESULT} 
     */
    RegisterCallback(callback, context, registration) {
        result := ComCall(3, this, "ptr", callback, "ptr", context, "int64*", registration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} registration 
     * @returns {String} Nothing - always returns an empty string
     */
    UnregisterCallback(registration) {
        ComCall(4, this, "int64", registration)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSoundLevel() {
        result := ComCall(5, this, "int")
        return result
    }
}
