#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICLRGCManager.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRGCManager2 extends ICLRGCManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRGCManager2
     * @type {Guid}
     */
    static IID => Guid("{0603b793-a97a-4712-9cb4-0cd1c74c0f7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

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
        result := ComCall(6, this, "ptr", SegmentSize, "ptr", MaxGen0Size, "HRESULT")
        return result
    }
}
