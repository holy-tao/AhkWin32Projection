#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IEnumDebugStackFrames.ahk
#Include .\IDebugStackFrameSniffer.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugStackFrameSnifferEx32 extends IDebugStackFrameSniffer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugStackFrameSnifferEx32
     * @type {Guid}
     */
    static IID => Guid("{51973c19-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumStackFramesEx32"]

    /**
     * 
     * @param {Integer} dwSpMin 
     * @returns {IEnumDebugStackFrames} 
     */
    EnumStackFramesEx32(dwSpMin) {
        result := ComCall(4, this, "uint", dwSpMin, "ptr*", &ppedsf := 0, "HRESULT")
        return IEnumDebugStackFrames(ppedsf)
    }
}
