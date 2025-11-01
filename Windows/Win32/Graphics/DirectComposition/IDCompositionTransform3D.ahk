#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a 3D transformation effect that can be used to modify the rasterization of a visual subtree.
 * @remarks
 * 
  * The <b>IDCompositionTransform3D</b> interface is an abstract interface that represents a 3D perspective transformation effect. A 3D transform object can be associated with multiple visuals and multiple effect groups. When a 3D transform object is modified, all affected visuals are recomposed to reflect the change.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontransform3d
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTransform3D extends IDCompositionEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTransform3D
     * @type {Guid}
     */
    static IID => Guid("{71185722-246b-41f2-aad1-0443f7f4bfc2}")

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
