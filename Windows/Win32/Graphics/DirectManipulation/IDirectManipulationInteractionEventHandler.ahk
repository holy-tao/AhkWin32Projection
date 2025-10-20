#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to handle interactions when they are detected.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationinteractioneventhandler
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationInteractionEventHandler extends IUnknown{
    /**
     * The interface identifier for IDirectManipulationInteractionEventHandler
     * @type {Guid}
     */
    static IID => Guid("{e43f45b8-42b4-403e-b1f2-273b8f510830}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDirectManipulationViewport2>} viewport 
     * @param {Integer} interaction 
     * @returns {HRESULT} 
     */
    OnInteraction(viewport, interaction) {
        result := ComCall(3, this, "ptr", viewport, "int", interaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
