#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcCompiler3 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compile", "Disassemble"]

    /**
     * 
     * @param {Pointer<DxcBuffer>} pSource 
     * @param {Pointer<PWSTR>} pArguments 
     * @param {Integer} argCount 
     * @param {IDxcIncludeHandler} pIncludeHandler 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppResult 
     * @returns {HRESULT} 
     */
    Compile(pSource, pArguments, argCount, pIncludeHandler, riid, ppResult) {
        ppResultMarshal := ppResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pSource, "ptr", pArguments, "uint", argCount, "ptr", pIncludeHandler, "ptr", riid, ppResultMarshal, ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DxcBuffer>} pObject 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppResult 
     * @returns {HRESULT} 
     */
    Disassemble(pObject, riid, ppResult) {
        ppResultMarshal := ppResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pObject, "ptr", riid, ppResultMarshal, ppResult, "HRESULT")
        return result
    }
}
