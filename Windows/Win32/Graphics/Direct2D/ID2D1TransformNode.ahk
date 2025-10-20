#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes a node in a transform topology.
 * @remarks
 * 
  * Transform nodes are type-less and only define the notion of an object that accepts a number of inputs and is an output. This interface limits a topology to single output nodes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1transformnode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1TransformNode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1TransformNode
     * @type {Guid}
     */
    static IID => Guid("{b2efe1e7-729f-4102-949f-505fa21bf666}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputCount"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformnode-getinputcount
     */
    GetInputCount() {
        result := ComCall(3, this, "uint")
        return result
    }
}
