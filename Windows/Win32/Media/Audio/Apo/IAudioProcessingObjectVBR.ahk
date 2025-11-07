#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectVBR extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectVBR
     * @type {Guid}
     */
    static IID => Guid("{7ba1db8f-78ad-49cd-9591-f79d80a17c81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CalcMaxInputFrames", "CalcMaxOutputFrames"]

    /**
     * 
     * @param {Integer} u32MaxOutputFrameCount 
     * @returns {Integer} 
     */
    CalcMaxInputFrames(u32MaxOutputFrameCount) {
        result := ComCall(3, this, "uint", u32MaxOutputFrameCount, "uint*", &pu32InputFrameCount := 0, "HRESULT")
        return pu32InputFrameCount
    }

    /**
     * 
     * @param {Integer} u32MaxInputFrameCount 
     * @returns {Integer} 
     */
    CalcMaxOutputFrames(u32MaxInputFrameCount) {
        result := ComCall(4, this, "uint", u32MaxInputFrameCount, "uint*", &pu32OutputFrameCount := 0, "HRESULT")
        return pu32OutputFrameCount
    }
}
