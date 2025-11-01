#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostTypeSignature extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHashCode", "IsMatch", "CompareAgainst"]

    /**
     * 
     * @param {Pointer<Integer>} hashCode 
     * @returns {HRESULT} 
     */
    GetHashCode(hashCode) {
        hashCodeMarshal := hashCode is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, hashCodeMarshal, hashCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostType} type 
     * @param {Pointer<Boolean>} isMatch 
     * @param {Pointer<IDebugHostSymbolEnumerator>} wildcardMatches 
     * @returns {HRESULT} 
     */
    IsMatch(type, isMatch, wildcardMatches) {
        isMatchMarshal := isMatch is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", type, isMatchMarshal, isMatch, "ptr*", wildcardMatches, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostTypeSignature} typeSignature 
     * @param {Pointer<Integer>} result 
     * @returns {HRESULT} 
     */
    CompareAgainst(typeSignature, result) {
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", typeSignature, resultMarshal, result, "HRESULT")
        return result
    }
}
