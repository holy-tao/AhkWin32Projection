#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcCompiler3 extends IUnknown{
    /**
     * The interface identifier for IDxcCompiler3
     * @type {Guid}
     */
    static IID => Guid("{228b4687-5a6a-4730-900c-9702b2203f54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DxcBuffer>} pSource 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @param {Pointer<IDxcIncludeHandler>} pIncludeHandler 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppResult 
     * @returns {HRESULT} 
     */
    Compile(pSource, pArguments, argCount, pIncludeHandler, riid, ppResult) {
        result := ComCall(3, this, "ptr", pSource, "ptr", pArguments, "uint", argCount, "ptr", pIncludeHandler, "ptr", riid, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pObject 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppResult 
     * @returns {HRESULT} 
     */
    Disassemble(pObject, riid, ppResult) {
        result := ComCall(4, this, "ptr", pObject, "ptr", riid, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
