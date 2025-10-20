#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a bitmap effect that modifies the rasterization of a visual's subtree.
 * @remarks
 * 
  * <b>IDCompositionEffect</b> is an abstract interface that represents a bitmap effect. An effect applies to the entire visual subtree rooted at the visual that the effect is associated with. An effect object can be associated with multiple visuals. When an effect object is modified, all affected visuals are recomposed to reflect the change.
  * 
  * 
  * 
  * More than one effect can be simultaneously applied to a visual by using the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffectgroup">IDCompositionEffectGroup</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositioneffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionEffect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionEffect
     * @type {Guid}
     */
    static IID => Guid("{ec81b08f-bfcb-4e8d-b193-a915587999e8}")

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
