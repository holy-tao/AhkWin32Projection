#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1TransformNode.ahk

/**
 * Instructs the effect-rendering system to offset an input bitmap without inserting a rendering pass.
 * @remarks
 * 
  * Because a rendering pass is not required, the interface derives from a transform node. This allows it to be inserted into a graph but does not allow an output buffer to be specified.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1offsettransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1OffsetTransform extends ID2D1TransformNode{
    /**
     * The interface identifier for ID2D1OffsetTransform
     * @type {Guid}
     */
    static IID => Guid("{3fe6adea-7643-4f53-bd14-a0ce63f24042}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {POINT} offset 
     * @returns {String} Nothing - always returns an empty string
     */
    SetOffset(offset) {
        ComCall(4, this, "ptr", offset)
        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    GetOffset() {
        result := ComCall(5, this, "ptr")
        return result
    }
}
