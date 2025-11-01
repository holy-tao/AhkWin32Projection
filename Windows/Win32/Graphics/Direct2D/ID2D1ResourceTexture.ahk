#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Tracks a transform-created resource texture.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ResourceTexture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ResourceTexture
     * @type {Guid}
     */
    static IID => Guid("{688d15c3-02b0-438d-b13a-d1b44c32c39a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update"]

    /**
     * 
     * @param {Pointer<Integer>} minimumExtents 
     * @param {Pointer<Integer>} maximimumExtents 
     * @param {Pointer<Integer>} strides 
     * @param {Integer} dimensions 
     * @param {Pointer<Integer>} data 
     * @param {Integer} dataCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1resourcetexture-update
     */
    Update(minimumExtents, maximimumExtents, strides, dimensions, data, dataCount) {
        result := ComCall(3, this, "uint*", minimumExtents, "uint*", maximimumExtents, "uint*", strides, "uint", dimensions, "char*", data, "uint", dataCount, "HRESULT")
        return result
    }
}
