#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IEnumDebugStackFrames.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IEnumDebugStackFrames64 extends IEnumDebugStackFrames{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDebugStackFrames64
     * @type {Guid}
     */
    static IID => Guid("{0dc38853-c1b0-4176-a984-b298361027af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next64"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<DebugStackFrameDescriptor64>} prgdsfd 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next64(celt, prgdsfd, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", celt, "ptr", prgdsfd, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }
}
