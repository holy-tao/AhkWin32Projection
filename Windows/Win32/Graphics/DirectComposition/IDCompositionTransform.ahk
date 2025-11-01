#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents a 2D transformation that can be used to modify the coordinate space of a visual subtree.
 * @remarks
 * 
  * The <b>IDCompositionTransform</b> interface is an abstract interface that represents a 2D affine transformation. Transformations affect the entire visual subtree that is rooted at the visual that the transform is associated with. A transform object can be associated with multiple visuals. When a transform object is modified, all affected visuals are recomposed to reflect the change.
  * 
  * Transforms operate by modifying the coordinate system for all rendering operations on a visual. For example, ordinarily a bitmap that is associated with a visual draws at position (0,0) and extends the full width and height of the bitmap. If a translation transform is applied, the bitmap draws at a position that is offset by that transform. If a scale transform is applied, the extent covered by the bitmap is affected by the scale transform. More than one transform can be simultaneously applied to a visual by using the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createtransformgroup">IDCompositionDevice::CreateTransformGroup</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTransform extends IDCompositionTransform3D{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTransform
     * @type {Guid}
     */
    static IID => Guid("{fd55faa7-37e0-4c20-95d2-9be45bc33f55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
