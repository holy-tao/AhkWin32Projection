#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGCHost.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IGCHost2 extends IGCHost{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGCHost2
     * @type {Guid}
     */
    static IID => Guid("{a1d70cec-2dbe-4e2f-9291-fdf81438a1df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGCStartupLimitsEx"]

    /**
     * 
     * @param {Pointer} SegmentSize 
     * @param {Pointer} MaxGen0Size 
     * @returns {HRESULT} 
     */
    SetGCStartupLimitsEx(SegmentSize, MaxGen0Size) {
        result := ComCall(8, this, "ptr", SegmentSize, "ptr", MaxGen0Size, "HRESULT")
        return result
    }
}
