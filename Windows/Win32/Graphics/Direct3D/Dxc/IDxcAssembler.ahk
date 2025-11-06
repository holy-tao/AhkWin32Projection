#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcOperationResult.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcAssembler extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssembleToContainer"]

    /**
     * 
     * @param {IDxcBlob} pShader 
     * @returns {IDxcOperationResult} 
     */
    AssembleToContainer(pShader) {
        result := ComCall(3, this, "ptr", pShader, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcOperationResult(ppResult)
    }
}
