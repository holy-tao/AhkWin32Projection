#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbolEnumerator extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @returns {HRESULT} 
     */
    GetNext(symbol) {
        result := ComCall(4, this, "ptr", symbol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
