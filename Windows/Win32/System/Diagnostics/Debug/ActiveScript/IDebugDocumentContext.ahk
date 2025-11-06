#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocument.ahk
#Include .\IEnumDebugCodeContexts.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentContext
     * @type {Guid}
     */
    static IID => Guid("{51973c28-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocument", "EnumCodeContexts"]

    /**
     * 
     * @returns {IDebugDocument} 
     */
    GetDocument() {
        result := ComCall(3, this, "ptr*", &ppsd := 0, "HRESULT")
        return IDebugDocument(ppsd)
    }

    /**
     * 
     * @returns {IEnumDebugCodeContexts} 
     */
    EnumCodeContexts() {
        result := ComCall(4, this, "ptr*", &ppescc := 0, "HRESULT")
        return IEnumDebugCodeContexts(ppescc)
    }
}
