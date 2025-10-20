#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugStackFrameSniffer.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugStackFrameSnifferEx64 extends IDebugStackFrameSniffer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugStackFrameSnifferEx64
     * @type {Guid}
     */
    static IID => Guid("{8cd12af4-49c1-4d52-8d8a-c146f47581aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumStackFramesEx64"]

    /**
     * 
     * @param {Integer} dwSpMin 
     * @param {Pointer<IEnumDebugStackFrames64>} ppedsf 
     * @returns {HRESULT} 
     */
    EnumStackFramesEx64(dwSpMin, ppedsf) {
        result := ComCall(4, this, "uint", dwSpMin, "ptr*", ppedsf, "HRESULT")
        return result
    }
}
