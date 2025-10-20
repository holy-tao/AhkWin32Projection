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
     * 
     * @param {Pointer<IDCompositionVisual>} visual 
     * @returns {HRESULT} 
     */
    SetRoot(visual) {
        result := ComCall(3, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
