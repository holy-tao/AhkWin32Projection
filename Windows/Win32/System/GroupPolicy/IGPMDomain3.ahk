#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMResult.ahk
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
     * @type {BSTR} 
     */
    InfrastructureDC {
        get => this.get_InfrastructureDC()
        set => this.put_InfrastructureDC(value)
    }

    /**
     * @type {HRESULT} 
     */
    InfrastructureFlags {
        set => this.put_InfrastructureFlags(value)
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @returns {IGPMResult} 
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(23, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InfrastructureDC() {
        pVal := BSTR()
        result := ComCall(24, this, "ptr", pVal, "HRESULT")
        return pVal
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
