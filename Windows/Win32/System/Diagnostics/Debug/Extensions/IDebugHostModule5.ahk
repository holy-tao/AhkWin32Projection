#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostModule4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModule5 extends IDebugHostModule4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostModule5
     * @type {Guid}
     */
    static IID => Guid("{ed36a63d-ad2b-467e-a0ca-4ca949357625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrimaryCompilerInformation"]

    /**
     * 
     * @param {Pointer<Integer>} pCompilerId 
     * @param {Pointer<BSTR>} pPrimaryCompilerString 
     * @returns {HRESULT} 
     */
    GetPrimaryCompilerInformation(pCompilerId, pPrimaryCompilerString) {
        pCompilerIdMarshal := pCompilerId is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pCompilerIdMarshal, pCompilerId, "ptr", pPrimaryCompilerString, "HRESULT")
        return result
    }
}
