#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSiteDebugEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptSiteDebugEx
     * @type {Guid}
     */
    static IID => Guid("{bb722ccb-6ad2-41c6-b780-af9c03ee69f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCanNotJITScriptErrorDebug"]

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @returns {BOOL} 
     */
    OnCanNotJITScriptErrorDebug(pErrorDebug) {
        result := ComCall(3, this, "ptr", pErrorDebug, "int*", &pfCallOnScriptErrorWhenContinuing := 0, "HRESULT")
        return pfCallOnScriptErrorWhenContinuing
    }
}
