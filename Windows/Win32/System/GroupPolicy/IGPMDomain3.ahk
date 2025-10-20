#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMDomain2.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMDomain3 extends IGPMDomain2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMDomain3
     * @type {Guid}
     */
    static IID => Guid("{0077fdfe-88c7-4acf-a11d-d10a7c310a03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateReport", "get_InfrastructureDC", "put_InfrastructureDC", "put_InfrastructureFlags"]

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(23, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_InfrastructureDC(pVal) {
        result := ComCall(24, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_InfrastructureDC(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(25, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_InfrastructureFlags(dwFlags) {
        result := ComCall(26, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
