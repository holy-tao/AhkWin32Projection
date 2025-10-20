#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostTypeSignature extends IUnknown{
    /**
     * The interface identifier for IDebugHostTypeSignature
     * @type {Guid}
     */
    static IID => Guid("{3aadc353-2b14-4abb-9893-5e03458e07ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} hashCode 
     * @returns {HRESULT} 
     */
    GetHashCode(hashCode) {
        result := ComCall(3, this, "uint*", hashCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} type 
     * @param {Pointer<Boolean>} isMatch 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    IsMatch(type, isMatch, wildcardMatches) {
        result := ComCall(4, this, "ptr", type, "int*", isMatch, "ptr", wildcardMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @param {Pointer<Int32>} result 
     * @returns {HRESULT} 
     */
    CompareAgainst(typeSignature, result) {
        result := ComCall(5, this, "ptr", typeSignature, "int*", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
