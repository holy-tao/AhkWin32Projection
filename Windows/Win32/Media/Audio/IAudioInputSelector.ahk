#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioInputSelector interface provides access to a hardware multiplexer control (input selector).
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudioinputselector
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioInputSelector extends IUnknown{
    /**
     * The interface identifier for IAudioInputSelector
     * @type {Guid}
     */
    static IID => Guid("{4f03dc02-5e6e-4653-8f72-a030c123d598}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pnIdSelected 
     * @returns {HRESULT} 
     */
    GetSelection(pnIdSelected) {
        result := ComCall(3, this, "uint*", pnIdSelected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIdSelect 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetSelection(nIdSelect, pguidEventContext) {
        result := ComCall(4, this, "uint", nIdSelect, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
