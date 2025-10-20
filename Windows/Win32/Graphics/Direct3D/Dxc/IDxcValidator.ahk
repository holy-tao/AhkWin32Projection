#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcValidator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcValidator
     * @type {Guid}
     */
    static IID => Guid("{a6e82bd2-1fd7-4826-9811-2857e797f49a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Validate"]

    /**
     * 
     * @param {IDxcBlob} pShader 
     * @param {Integer} Flags 
     * @param {Pointer<IDxcOperationResult>} ppResult 
     * @returns {HRESULT} 
     */
    Validate(pShader, Flags, ppResult) {
        result := ComCall(3, this, "ptr", pShader, "uint", Flags, "ptr*", ppResult, "HRESULT")
        return result
    }
}
