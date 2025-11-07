#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioMute interface provides access to a hardware mute control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiomute
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioMute extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioMute
     * @type {Guid}
     */
    static IID => Guid("{df45aeea-b74a-4b6b-afad-2366b6aa012e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMute", "GetMute"]

    /**
     * 
     * @param {BOOL} bMuted 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiomute-setmute
     */
    SetMute(bMuted, pguidEventContext) {
        result := ComCall(3, this, "int", bMuted, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiomute-getmute
     */
    GetMute() {
        result := ComCall(4, this, "int*", &pbMuted := 0, "HRESULT")
        return pbMuted
    }
}
