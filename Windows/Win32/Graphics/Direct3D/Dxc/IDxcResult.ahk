#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcOperationResult.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcResult extends IDxcOperationResult{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcResult
     * @type {Guid}
     */
    static IID => Guid("{58346cda-dde7-4497-9461-6f87af5e0659}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasOutput", "GetOutput", "GetNumOutputs", "GetOutputByIndex", "PrimaryOutput"]

    /**
     * 
     * @param {Integer} dxcOutKind 
     * @returns {BOOL} 
     */
    HasOutput(dxcOutKind) {
        result := ComCall(6, this, "int", dxcOutKind, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dxcOutKind 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @param {Pointer<IDxcBlobUtf16>} ppOutputName 
     * @returns {HRESULT} 
     */
    GetOutput(dxcOutKind, iid, ppvObject, ppOutputName) {
        result := ComCall(7, this, "int", dxcOutKind, "ptr", iid, "ptr*", ppvObject, "ptr*", ppOutputName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumOutputs() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    GetOutputByIndex(Index) {
        result := ComCall(9, this, "uint", Index, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    PrimaryOutput() {
        result := ComCall(10, this, "int")
        return result
    }
}
