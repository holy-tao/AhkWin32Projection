#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationThreadEvents110 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationThreadEvents110
     * @type {Guid}
     */
    static IID => Guid("{84e5e468-d5da-48a8-83f4-40366429007b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSuspendForBreakPoint", "OnResumeFromBreakPoint", "OnThreadRequestComplete", "OnBeginThreadRequest"]

    /**
     * 
     * @returns {HRESULT} 
     */
    OnSuspendForBreakPoint() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnResumeFromBreakPoint() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnThreadRequestComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBeginThreadRequest() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
