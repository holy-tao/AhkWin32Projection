#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDebugDocumentContext>} ppsc 
     * @returns {HRESULT} 
     */
    GetDocumentContextFromPosition(dwSourceContext, uCharacterOffset, uNumChars, ppsc) {
        result := ComCall(3, this, "uint", dwSourceContext, "uint", uCharacterOffset, "uint", uNumChars, "ptr*", ppsc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplication64>} ppda 
     * @returns {HRESULT} 
     */
    GetApplication(ppda) {
        result := ComCall(4, this, "ptr*", ppda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationNode>} ppdanRoot 
     * @returns {HRESULT} 
     */
    GetRootApplicationNode(ppdanRoot) {
        result := ComCall(5, this, "ptr*", ppdanRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @param {Pointer<BOOL>} pfEnterDebugger 
     * @param {Pointer<BOOL>} pfCallOnScriptErrorWhenContinuing 
     * @returns {HRESULT} 
     */
    OnScriptErrorDebug(pErrorDebug, pfEnterDebugger, pfCallOnScriptErrorWhenContinuing) {
        result := ComCall(6, this, "ptr", pErrorDebug, "ptr", pfEnterDebugger, "ptr", pfCallOnScriptErrorWhenContinuing, "HRESULT")
        return result
    }
}
