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
     * @param {Pointer<Integer>} pu32InputFrameCount 
     * @returns {HRESULT} 
     */
    CalcMaxInputFrames(u32MaxOutputFrameCount, pu32InputFrameCount) {
        pu32InputFrameCountMarshal := pu32InputFrameCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", u32MaxOutputFrameCount, pu32InputFrameCountMarshal, pu32InputFrameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} u32MaxInputFrameCount 
     * @param {Pointer<Integer>} pu32OutputFrameCount 
     * @returns {HRESULT} 
     */
    CalcMaxOutputFrames(u32MaxInputFrameCount, pu32OutputFrameCount) {
        pu32OutputFrameCountMarshal := pu32OutputFrameCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", u32MaxInputFrameCount, pu32OutputFrameCountMarshal, pu32OutputFrameCount, "HRESULT")
        return result
    }
}
