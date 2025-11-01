#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBindStatusCallback.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindStatusCallbackEx extends IBindStatusCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindStatusCallbackEx
     * @type {Guid}
     */
    static IID => Guid("{aaa74ef9-8ee7-4659-88d9-f8c504da73cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBindInfoEx"]

    /**
     * 
     * @param {Pointer<Integer>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @param {Pointer<Integer>} grfBINDF2 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetBindInfoEx(grfBINDF, pbindinfo, grfBINDF2, pdwReserved) {
        grfBINDFMarshal := grfBINDF is VarRef ? "uint*" : "ptr"
        grfBINDF2Marshal := grfBINDF2 is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, grfBINDFMarshal, grfBINDF, "ptr", pbindinfo, grfBINDF2Marshal, grfBINDF2, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}
