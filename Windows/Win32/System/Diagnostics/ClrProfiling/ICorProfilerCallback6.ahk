#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback5.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback6 extends ICorProfilerCallback5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback6
     * @type {Guid}
     */
    static IID => Guid("{fc13df4b-4448-4f4f-950c-ba8d19d00c36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 90

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAssemblyReferences"]

    /**
     * 
     * @param {PWSTR} wszAssemblyPath 
     * @param {ICorProfilerAssemblyReferenceProvider} pAsmRefProvider 
     * @returns {HRESULT} 
     */
    GetAssemblyReferences(wszAssemblyPath, pAsmRefProvider) {
        wszAssemblyPath := wszAssemblyPath is String ? StrPtr(wszAssemblyPath) : wszAssemblyPath

        result := ComCall(90, this, "ptr", wszAssemblyPath, "ptr", pAsmRefProvider, "HRESULT")
        return result
    }
}
