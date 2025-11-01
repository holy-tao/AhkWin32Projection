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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelection", "SetSelection"]

    /**
     * 
     * @param {Pointer<Integer>} pnIdSelected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioinputselector-getselection
     */
    GetSelection(pnIdSelected) {
        pnIdSelectedMarshal := pnIdSelected is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pnIdSelectedMarshal, pnIdSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIdSelect 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudioinputselector-setselection
     */
    SetSelection(nIdSelect, pguidEventContext) {
        result := ComCall(4, this, "uint", nIdSelect, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
