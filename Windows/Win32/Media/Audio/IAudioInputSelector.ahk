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
     * The GetSelection method gets the local ID of the part that is connected to the selector input that is currently selected.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the local ID of the part that directly links to the currently selected selector input.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iaudioinputselector-getselection
     */
    GetSelection() {
        result := ComCall(3, this, "uint*", &pnIdSelected := 0, "HRESULT")
        return pnIdSelected
    }

    /**
     * The SetSelection method selects one of the inputs of the input selector.
     * @param {Integer} nIdSelect The new selector input. The caller should set this parameter to the local ID of a part that has a direct link to one of the selector inputs.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetSelection</b> call changes the state of the input-selector control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>nIdSelect</i> is not the local ID of a part at a selector input.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iaudioinputselector-setselection
     */
    SetSelection(nIdSelect, pguidEventContext) {
        result := ComCall(4, this, "uint", nIdSelect, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
