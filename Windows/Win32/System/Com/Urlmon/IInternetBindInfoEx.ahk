#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetBindInfo.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetBindInfoEx extends IInternetBindInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetBindInfoEx
     * @type {Guid}
     */
    static IID => Guid("{a3e015b7-a82c-4dcd-a150-569aeeed36ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

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

        result := ComCall(5, this, grfBINDFMarshal, grfBINDF, "ptr", pbindinfo, grfBINDF2Marshal, grfBINDF2, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}
