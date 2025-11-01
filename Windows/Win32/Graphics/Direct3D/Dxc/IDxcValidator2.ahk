#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcValidator.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcValidator2 extends IDxcValidator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcValidator2
     * @type {Guid}
     */
    static IID => Guid("{458e1fd1-b1b2-4750-a6e1-9c10f03bed92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateWithDebug"]

    /**
     * 
     * @param {IDxcBlob} pShader 
     * @param {Integer} Flags 
     * @param {Pointer<DxcBuffer>} pOptDebugBitcode 
     * @param {Pointer<IDxcOperationResult>} ppResult 
     * @returns {HRESULT} 
     */
    ValidateWithDebug(pShader, Flags, pOptDebugBitcode, ppResult) {
        result := ComCall(4, this, "ptr", pShader, "uint", Flags, "ptr", pOptDebugBitcode, "ptr*", ppResult, "HRESULT")
        return result
    }
}
