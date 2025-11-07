#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentContext.ahk
#Include .\IDebugApplication64.ahk
#Include .\IDebugApplicationNode.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptSiteDebug64 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptSiteDebug64
     * @type {Guid}
     */
    static IID => Guid("{d6b96b0a-7463-402c-92ac-89984226942f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentContextFromPosition", "GetApplication", "GetRootApplicationNode", "OnScriptErrorDebug"]

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Integer} uCharacterOffset 
     * @param {Integer} uNumChars 
     * @returns {IDebugDocumentContext} 
     */
    GetDocumentContextFromPosition(dwSourceContext, uCharacterOffset, uNumChars) {
        result := ComCall(3, this, "uint", dwSourceContext, "uint", uCharacterOffset, "uint", uNumChars, "ptr*", &ppsc := 0, "HRESULT")
        return IDebugDocumentContext(ppsc)
    }

    /**
     * 
     * @returns {IDebugApplication64} 
     */
    GetApplication() {
        result := ComCall(4, this, "ptr*", &ppda := 0, "HRESULT")
        return IDebugApplication64(ppda)
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    GetRootApplicationNode() {
        result := ComCall(5, this, "ptr*", &ppdanRoot := 0, "HRESULT")
        return IDebugApplicationNode(ppdanRoot)
    }

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @param {Pointer<BOOL>} pfEnterDebugger 
     * @param {Pointer<BOOL>} pfCallOnScriptErrorWhenContinuing 
     * @returns {HRESULT} 
     */
    OnScriptErrorDebug(pErrorDebug, pfEnterDebugger, pfCallOnScriptErrorWhenContinuing) {
        pfEnterDebuggerMarshal := pfEnterDebugger is VarRef ? "int*" : "ptr"
        pfCallOnScriptErrorWhenContinuingMarshal := pfCallOnScriptErrorWhenContinuing is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pErrorDebug, pfEnterDebuggerMarshal, pfEnterDebugger, pfCallOnScriptErrorWhenContinuingMarshal, pfCallOnScriptErrorWhenContinuing, "HRESULT")
        return result
    }
}
