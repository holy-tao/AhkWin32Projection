#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a clip object that is used to restrict the rendering of a visual subtree to a rectangular area.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionclip
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionClip extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionClip
     * @type {Guid}
     */
    static IID => Guid("{64ac3703-9d3f-45ec-a109-7cac0e7a13a7}")

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
