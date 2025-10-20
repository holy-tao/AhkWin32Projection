#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXCoreAdapter.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapter1 extends IDXCoreAdapter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXCoreAdapter1
     * @type {Guid}
     */
    static IID => Guid("{a0783366-cfa3-43be-9d79-55b2da97c63c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyWithInput"]

    /**
     * 
     * @param {Integer} property 
     * @param {Pointer} inputPropertyDetailsSize 
     * @param {Pointer} inputPropertyDetails 
     * @param {Pointer} outputBufferSize 
     * @param {Pointer} outputBuffer 
     * @returns {HRESULT} 
     */
    GetPropertyWithInput(property, inputPropertyDetailsSize, inputPropertyDetails, outputBufferSize, outputBuffer) {
        result := ComCall(13, this, "uint", property, "ptr", inputPropertyDetailsSize, "ptr", inputPropertyDetails, "ptr", outputBufferSize, "ptr", outputBuffer, "HRESULT")
        return result
    }
}
