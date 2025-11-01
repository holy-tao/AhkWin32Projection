#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSiteInterruptPoll extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptSiteInterruptPoll
     * @type {Guid}
     */
    static IID => Guid("{539698a0-cdca-11cf-a5eb-00aa0047a063}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryContinue"]

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryContinue() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
