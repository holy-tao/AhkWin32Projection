#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputForceFeedbackEffect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputForceFeedbackEffect
     * @type {Guid}
     */
    static IID => Guid("{51bda05e-f742-45d9-b085-9444ae48381d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetMotorIndex", "GetGain", "SetGain", "GetParams", "SetParams", "GetState", "SetState"]

    /**
     * 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDevice(device) {
        ComCall(3, this, "ptr*", device)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMotorIndex() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetGain() {
        result := ComCall(5, this, "float")
        return result
    }

    /**
     * 
     * @param {Float} gain 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGain(gain) {
        ComCall(6, this, "float", gain)
    }

    /**
     * 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    GetParams(params) {
        ComCall(7, this, "ptr", params)
    }

    /**
     * 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {Boolean} 
     */
    SetParams(params) {
        result := ComCall(8, this, "ptr", params, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetState() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} state 
     * @returns {String} Nothing - always returns an empty string
     */
    SetState(state) {
        ComCall(10, this, "int", state)
    }
}
