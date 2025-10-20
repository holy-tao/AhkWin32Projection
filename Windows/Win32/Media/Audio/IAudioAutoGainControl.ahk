#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioAutoGainControl interface provides access to a hardware automatic gain control (AGC).
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudioautogaincontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioAutoGainControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioAutoGainControl
     * @type {Guid}
     */
    static IID => Guid("{85401fd4-6de4-4b9d-9869-2d6753a82f3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnabled", "SetEnabled"]

    /**
     * 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioautogaincontrol-getenabled
     */
    GetEnabled(pbEnabled) {
        result := ComCall(3, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bEnable 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioautogaincontrol-setenabled
     */
    SetEnabled(bEnable, pguidEventContext) {
        result := ComCall(4, this, "int", bEnable, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
