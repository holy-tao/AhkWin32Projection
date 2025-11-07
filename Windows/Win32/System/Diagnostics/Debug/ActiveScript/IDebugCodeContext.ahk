#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentContext.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugCodeContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugCodeContext
     * @type {Guid}
     */
    static IID => Guid("{51973c13-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentContext", "SetBreakPoint"]

    /**
     * 
     * @returns {IDebugDocumentContext} 
     */
    GetDocumentContext() {
        result := ComCall(3, this, "ptr*", &ppsc := 0, "HRESULT")
        return IDebugDocumentContext(ppsc)
    }

    /**
     * 
     * @param {Integer} bps 
     * @returns {HRESULT} 
     */
    SetBreakPoint(bps) {
        result := ComCall(4, this, "int", bps, "HRESULT")
        return result
    }
}
