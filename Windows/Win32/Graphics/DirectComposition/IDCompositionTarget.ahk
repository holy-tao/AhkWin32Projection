#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a binding between a Microsoft DirectComposition visual tree and a destination on top of which the visual tree should be composed.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontarget
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTarget
     * @type {Guid}
     */
    static IID => Guid("{eacdd04c-117e-4e17-88f4-d1b12b0e3d89}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRoot"]

    /**
     * Sets a visual object as the new root object of a visual tree.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The visual object that is the new root of this visual tree. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositiontarget-setroot
     */
    SetRoot(visual) {
        result := ComCall(3, this, "ptr", visual, "HRESULT")
        return result
    }
}
