#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModuleSignature extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostModuleSignature
     * @type {Guid}
     */
    static IID => Guid("{31e53a5a-01ee-4bbb-b899-4b46ae7d595c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsMatch"]

    /**
     * 
     * @param {IDebugHostModule} pModule 
     * @param {Pointer<Boolean>} isMatch 
     * @returns {HRESULT} 
     */
    IsMatch(pModule, isMatch) {
        isMatchMarshal := isMatch is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pModule, isMatchMarshal, isMatch, "HRESULT")
        return result
    }
}
