#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ICodeAddressConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICodeAddressConcept
     * @type {Guid}
     */
    static IID => Guid("{c7371568-5c78-4a00-a4ab-6ef8823184cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainingSymbol"]

    /**
     * 
     * @param {IModelObject} pContextObject 
     * @returns {IDebugHostSymbol} 
     */
    GetContainingSymbol(pContextObject) {
        result := ComCall(3, this, "ptr", pContextObject, "ptr*", &ppSymbol := 0, "HRESULT")
        return IDebugHostSymbol(ppSymbol)
    }
}
