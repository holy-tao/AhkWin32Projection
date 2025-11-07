#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioLoudness interface provides access to a &quot;loudness&quot; compensation control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudioloudness
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioLoudness extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioLoudness
     * @type {Guid}
     */
    static IID => Guid("{7d8b1437-dd53-4350-9c1b-1ee2890bd938}")

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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioloudness-getenabled
     */
    GetEnabled() {
        result := ComCall(3, this, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * 
     * @param {BOOL} bEnable 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioloudness-setenabled
     */
    SetEnabled(bEnable, pguidEventContext) {
        result := ComCall(4, this, "int", bEnable, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
