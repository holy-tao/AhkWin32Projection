#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The composite effect is used to combine 2 or more images.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositioncompositeeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionCompositeEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionCompositeEffect
     * @type {Guid}
     */
    static IID => Guid("{576616c0-a231-494d-a38d-00fd5ec4db46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMode"]

    /**
     * Sets the mode for the composite effect.
     * @param {Integer} _mode 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncompositeeffect-setmode
     */
    SetMode(_mode) {
        result := ComCall(4, this, "int", _mode, "HRESULT")
        return result
    }
}
