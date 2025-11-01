#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioOutputSelector interface provides access to a hardware demultiplexer control (output selector).
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiooutputselector
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioOutputSelector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioOutputSelector
     * @type {Guid}
     */
    static IID => Guid("{bb515f69-94a7-429e-8b9c-271b3f11a3ab}")

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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiooutputselector-getselection
     */
    GetSelection(pnIdSelected) {
        result := ComCall(3, this, "uint*", pnIdSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIdSelect 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiooutputselector-setselection
     */
    SetSelection(nIdSelect, pguidEventContext) {
        result := ComCall(4, this, "uint", nIdSelect, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
