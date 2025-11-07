#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12StateObjectProperties1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12StateObjectProperties2 extends ID3D12StateObjectProperties1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12StateObjectProperties2
     * @type {Guid}
     */
    static IID => Guid("{d5e82917-f0f1-44cf-ae5e-ce222dd0b884}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGlobalRootSignatureForProgram", "GetGlobalRootSignatureForShader"]

    /**
     * 
     * @param {PWSTR} pProgramName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetGlobalRootSignatureForProgram(pProgramName, riid) {
        pProgramName := pProgramName is String ? StrPtr(pProgramName) : pProgramName

        result := ComCall(8, this, "ptr", pProgramName, "ptr", riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    /**
     * 
     * @param {PWSTR} pExportName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetGlobalRootSignatureForShader(pExportName, riid) {
        pExportName := pExportName is String ? StrPtr(pExportName) : pExportName

        result := ComCall(9, this, "ptr", pExportName, "ptr", riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }
}
