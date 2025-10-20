#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisual.ahk

/**
 * Represents one DirectComposition visual in a visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvisual2
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVisual2 extends IDCompositionVisual{
    /**
     * The interface identifier for IDCompositionVisual2
     * @type {Guid}
     */
    static IID => Guid("{e8de1639-4331-4b26-bc5f-6a321d347a85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetOpacityMode(mode) {
        result := ComCall(20, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} visibility 
     * @returns {HRESULT} 
     */
    SetBackFaceVisibility(visibility) {
        result := ComCall(21, this, "int", visibility, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
