#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSiteDebugEx extends IUnknown{
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
     * 
     * @param {Pointer<IActiveScriptErrorDebug>} pErrorDebug 
     * @param {Pointer<BOOL>} pfCallOnScriptErrorWhenContinuing 
     * @returns {HRESULT} 
     */
    OnCanNotJITScriptErrorDebug(pErrorDebug, pfCallOnScriptErrorWhenContinuing) {
        result := ComCall(3, this, "ptr", pErrorDebug, "ptr", pfCallOnScriptErrorWhenContinuing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
