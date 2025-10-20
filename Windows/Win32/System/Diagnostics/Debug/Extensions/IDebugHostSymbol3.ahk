#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbol3 extends IDebugHostSymbol2{
    /**
     * The interface identifier for IDebugHostSymbol3
     * @type {Guid}
     */
    static IID => Guid("{1b3fc1b3-d03d-43e0-8eb0-9aa4baa21edb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<Int32>} pCompilerId 
     * @param {Pointer<BSTR>} pCompilerString 
     * @returns {HRESULT} 
     */
    GetCompilerInformation(pCompilerId, pCompilerString) {
        result := ComCall(11, this, "int*", pCompilerId, "ptr", pCompilerString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
