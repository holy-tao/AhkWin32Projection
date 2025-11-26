#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioLfxControl interface allows the client to apply or remove local effects from the offloaded audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudiolfxcontrol
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioLfxControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioLfxControl
     * @type {Guid}
     */
    static IID => Guid("{076a6922-d802-4f83-baf6-409d9ca11bfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLocalEffectsState", "GetLocalEffectsState"]

    /**
     * The SetLocalEffectsState method sets the local effects state that is to be applied to the offloaded audio stream.
     * @param {BOOL} bEnabled Indicates the local effects state that is to be applied to the offloaded audio stream. A value of <b>TRUE</b> enables  local effects, and the local effects in the audio graph are applied to the stream. A value of <b>FALSE</b> disables local effects, so that the  local effects in the audio graph are not applied to the audio stream.
     * @returns {HRESULT} The <b>SetLocalEffectsState</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudiolfxcontrol-setlocaleffectsstate
     */
    SetLocalEffectsState(bEnabled) {
        result := ComCall(3, this, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * The GetLocalEffectsState method retrieves the local effects state that is currently applied to the offloaded audio stream.
     * @returns {BOOL} A pointer to the Boolean variable that indicates the state of the local effects that have been applied to the offloaded audio stream. A value of <b>TRUE</b> indicates that local effects have been enabled and applied to the stream. A value of <b>FALSE</b> indicates that local effects have been disabled.
     * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nf-audioengineendpoint-iaudiolfxcontrol-getlocaleffectsstate
     */
    GetLocalEffectsState() {
        result := ComCall(4, this, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }
}
