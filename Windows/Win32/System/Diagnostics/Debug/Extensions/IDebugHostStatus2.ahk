#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostStatus.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostStatus2 extends IDebugHostStatus{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostStatus2
     * @type {Guid}
     */
    static IID => Guid("{4a168d3f-04d0-49c4-8f9a-7b5b3108c6c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUserInterrupt", "ClearUserInterrupt"]

    /**
     * 
     * @returns {HRESULT} 
     */
    SetUserInterrupt() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearUserInterrupt() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
