#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcCompilerArgs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcCompilerArgs
     * @type {Guid}
     */
    static IID => Guid("{73effe2a-70dc-45f8-9690-eff64c02429d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetArguments", "GetCount", "AddArguments", "AddArgumentsUTF8", "AddDefines"]

    /**
     * 
     * @returns {Pointer<PWSTR>} 
     */
    GetArguments() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @returns {HRESULT} 
     */
    AddArguments(pArguments, argCount) {
        result := ComCall(5, this, "ptr", pArguments, "uint", argCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pArguments 
     * @param {Integer} argCount 
     * @returns {HRESULT} 
     */
    AddArgumentsUTF8(pArguments, argCount) {
        result := ComCall(6, this, "ptr", pArguments, "uint", argCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DxcDefine>} pDefines 
     * @param {Integer} defineCount 
     * @returns {HRESULT} 
     */
    AddDefines(pDefines, defineCount) {
        result := ComCall(7, this, "ptr", pDefines, "uint", defineCount, "HRESULT")
        return result
    }
}
