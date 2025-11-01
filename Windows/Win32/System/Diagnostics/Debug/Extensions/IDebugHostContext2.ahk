#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostContext.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContext2 extends IDebugHostContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostContext2
     * @type {Guid}
     */
    static IID => Guid("{e92274a2-47f4-4538-a196-b83db25fe403}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAddressSpaceRelation"]

    /**
     * 
     * @param {IDebugHostContext2} pContext 
     * @param {Pointer<Integer>} pAddressSpaceRelation 
     * @returns {HRESULT} 
     */
    GetAddressSpaceRelation(pContext, pAddressSpaceRelation) {
        pAddressSpaceRelationMarshal := pAddressSpaceRelation is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pContext, pAddressSpaceRelationMarshal, pAddressSpaceRelation, "HRESULT")
        return result
    }
}
