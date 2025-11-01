#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISQLRequestDiagFields extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISQLRequestDiagFields
     * @type {Guid}
     */
    static IID => Guid("{228972f0-b5ff-11d0-8a80-00c04fd611cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestDiagFields"]

    /**
     * 
     * @param {Integer} cDiagFields 
     * @param {Pointer<KAGREQDIAG>} rgDiagFields 
     * @returns {HRESULT} 
     */
    RequestDiagFields(cDiagFields, rgDiagFields) {
        result := ComCall(3, this, "uint", cDiagFields, "ptr", rgDiagFields, "HRESULT")
        return result
    }
}
