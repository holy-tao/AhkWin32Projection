#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerAssemblyReferenceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerAssemblyReferenceProvider
     * @type {Guid}
     */
    static IID => Guid("{66a78c24-2eef-4f65-b45f-dd1d8038bf3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAssemblyReference"]

    /**
     * 
     * @param {Pointer<COR_PRF_ASSEMBLY_REFERENCE_INFO>} pAssemblyRefInfo 
     * @returns {HRESULT} 
     */
    AddAssemblyReference(pAssemblyRefInfo) {
        result := ComCall(3, this, "ptr", pAssemblyRefInfo, "HRESULT")
        return result
    }
}
