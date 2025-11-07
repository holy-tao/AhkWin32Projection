#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbolEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbolEnumerator
     * @type {Guid}
     */
    static IID => Guid("{28d96c86-10a3-4976-b14e-eaef4790aa1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugHostSymbol} 
     */
    GetNext() {
        result := ComCall(4, this, "ptr*", &symbol := 0, "HRESULT")
        return IDebugHostSymbol(symbol)
    }
}
