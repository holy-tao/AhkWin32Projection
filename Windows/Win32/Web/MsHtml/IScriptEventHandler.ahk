#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IScriptEventHandler extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FunctionName", "DebugDocumentContext", "EventHandlerDispatch", "UsesCapture", "Cookie"]

    /**
     * 
     * @returns {BSTR} 
     */
    FunctionName() {
        pbstrFunctionName := BSTR()
        result := ComCall(3, this, "ptr", pbstrFunctionName, "HRESULT")
        return pbstrFunctionName
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    DebugDocumentContext() {
        result := ComCall(4, this, "ptr*", &ppDebugDocumentContext := 0, "HRESULT")
        return IUnknown(ppDebugDocumentContext)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    EventHandlerDispatch() {
        result := ComCall(5, this, "ptr*", &ppDispHandler := 0, "HRESULT")
        return IDispatch(ppDispHandler)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    UsesCapture() {
        result := ComCall(6, this, "int*", &pfUsesCapture := 0, "HRESULT")
        return pfUsesCapture
    }

    /**
     * 
     * @returns {Integer} 
     */
    Cookie() {
        result := ComCall(7, this, "uint*", &pullCookie := 0, "HRESULT")
        return pullCookie
    }
}
