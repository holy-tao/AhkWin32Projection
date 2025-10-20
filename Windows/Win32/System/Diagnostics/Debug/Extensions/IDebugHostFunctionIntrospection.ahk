#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionIntrospection extends IUnknown{
    /**
     * The interface identifier for IDebugHostFunctionIntrospection
     * @type {Guid}
     */
    static IID => Guid("{a754393c-4fbe-4178-8ad5-fe6079ac048d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDebugHostFunctionLocalDetailsEnumerator>} localsEnum 
     * @returns {HRESULT} 
     */
    EnumerateLocalsDetails(localsEnum) {
        result := ComCall(3, this, "ptr", localsEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<IDebugHostSymbolEnumerator>} inlinesEnum 
     * @returns {HRESULT} 
     */
    EnumerateInlineFunctionsByRVA(rva, inlinesEnum) {
        result := ComCall(4, this, "uint", rva, "ptr", inlinesEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<Location>} rangeStart 
     * @param {Pointer<Location>} rangeEnd 
     * @returns {HRESULT} 
     */
    FindContainingCodeRangeByRVA(rva, rangeStart, rangeEnd) {
        result := ComCall(5, this, "uint", rva, "ptr", rangeStart, "ptr", rangeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<BSTR>} sourceFile 
     * @param {Pointer<UInt64>} sourceLine 
     * @returns {HRESULT} 
     */
    FindSourceLocationByRVA(rva, sourceFile, sourceLine) {
        result := ComCall(6, this, "uint", rva, "ptr", sourceFile, "uint*", sourceLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
