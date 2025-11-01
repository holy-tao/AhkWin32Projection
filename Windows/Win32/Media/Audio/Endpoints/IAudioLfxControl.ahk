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
     * 
     * @param {BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiolfxcontrol-setlocaleffectsstate
     */
    SetLocalEffectsState(bEnabled) {
        result := ComCall(3, this, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiolfxcontrol-getlocaleffectsstate
     */
    GetLocalEffectsState(pbEnabled) {
        result := ComCall(4, this, "ptr", pbEnabled, "HRESULT")
        return result
    }
}
