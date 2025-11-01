#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostContext
     * @type {Guid}
     */
    static IID => Guid("{a68c70d8-5ec0-46e5-b775-3134a48ea2e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEqualTo"]

    /**
     * 
     * @param {IDebugHostContext} pContext 
     * @param {Pointer<Boolean>} pIsEqual 
     * @returns {HRESULT} 
     */
    IsEqualTo(pContext, pIsEqual) {
        pIsEqualMarshal := pIsEqual is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pContext, pIsEqualMarshal, pIsEqual, "HRESULT")
        return result
    }
}
