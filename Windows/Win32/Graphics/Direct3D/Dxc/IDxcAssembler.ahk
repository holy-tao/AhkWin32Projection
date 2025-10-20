#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcAssembler extends IUnknown{
    /**
     * The interface identifier for IDxcAssembler
     * @type {Guid}
     */
    static IID => Guid("{091f7a26-1c1f-4948-904b-e6e3a8a771d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDxcBlob>} pShader 
     * @param {Pointer<IDxcOperationResult>} ppResult 
     * @returns {HRESULT} 
     */
    AssembleToContainer(pShader, ppResult) {
        result := ComCall(3, this, "ptr", pShader, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
