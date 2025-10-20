#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IScriptEventHandler extends IUnknown{
    /**
     * The interface identifier for IScriptEventHandler
     * @type {Guid}
     */
    static IID => Guid("{3051083a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFunctionName 
     * @returns {HRESULT} 
     */
    FunctionName(pbstrFunctionName) {
        result := ComCall(3, this, "ptr", pbstrFunctionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppDebugDocumentContext 
     * @returns {HRESULT} 
     */
    DebugDocumentContext(ppDebugDocumentContext) {
        result := ComCall(4, this, "ptr", ppDebugDocumentContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDispHandler 
     * @returns {HRESULT} 
     */
    EventHandlerDispatch(ppDispHandler) {
        result := ComCall(5, this, "ptr", ppDispHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUsesCapture 
     * @returns {HRESULT} 
     */
    UsesCapture(pfUsesCapture) {
        result := ComCall(6, this, "ptr", pfUsesCapture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pullCookie 
     * @returns {HRESULT} 
     */
    Cookie(pullCookie) {
        result := ComCall(7, this, "uint*", pullCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
