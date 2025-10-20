#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DBlob extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DBlob
     * @type {Guid}
     */
    static IID => Guid("{8ba5fb08-5195-40e2-ac58-0d989c3a0102}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBufferPointer", "GetBufferSize"]

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetBufferPointer() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetBufferSize() {
        result := ComCall(4, this, "ptr")
        return result
    }
}
