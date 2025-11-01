#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugApplicationThread.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationThread64 extends IDebugApplicationThread{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationThread64
     * @type {Guid}
     */
    static IID => Guid("{9dac5886-dbad-456d-9dee-5dec39ab3dda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SynchronousCallIntoThread64"]

    /**
     * 
     * @param {IDebugThreadCall64} pstcb 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallIntoThread64(pstcb, dwParam1, dwParam2, dwParam3) {
        result := ComCall(17, this, "ptr", pstcb, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }
}
