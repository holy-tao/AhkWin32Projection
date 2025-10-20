#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback10.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback11 extends ICorProfilerCallback10{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback11
     * @type {Guid}
     */
    static IID => Guid("{42350846-aaed-47f7-b128-fd0c98881cde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 97

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadAsNotificationOnly"]

    /**
     * 
     * @param {Pointer<BOOL>} pbNotificationOnly 
     * @returns {HRESULT} 
     */
    LoadAsNotificationOnly(pbNotificationOnly) {
        result := ComCall(97, this, "ptr", pbNotificationOnly, "HRESULT")
        return result
    }
}
