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
     * 
     * @param {Pointer<UInt32>} minimumExtents 
     * @param {Pointer<UInt32>} maximimumExtents 
     * @param {Pointer<UInt32>} strides 
     * @param {Integer} dimensions 
     * @param {Pointer<Byte>} data 
     * @param {Integer} dataCount 
     * @returns {HRESULT} 
     */
    Update(minimumExtents, maximimumExtents, strides, dimensions, data, dataCount) {
        result := ComCall(3, this, "uint*", minimumExtents, "uint*", maximimumExtents, "uint*", strides, "uint", dimensions, "char*", data, "uint", dataCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
