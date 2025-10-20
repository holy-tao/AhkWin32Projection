#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1TransformNode.ahk

/**
 * Represents the set of transforms implemented by the effect-rendering system, which provides fixed-functionality.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1concretetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ConcreteTransform extends ID2D1TransformNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ConcreteTransform
     * @type {Guid}
     */
    static IID => Guid("{1a799d8a-69f7-4e4c-9fed-437ccc6684cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputBuffer", "SetCached"]

    /**
     * 
     * @param {Integer} bufferPrecision 
     * @param {Integer} channelDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1concretetransform-setoutputbuffer
     */
    SetOutputBuffer(bufferPrecision, channelDepth) {
        result := ComCall(4, this, "int", bufferPrecision, "int", channelDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isCached 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1concretetransform-setcached
     */
    SetCached(isCached) {
        ComCall(5, this, "int", isCached)
    }
}
