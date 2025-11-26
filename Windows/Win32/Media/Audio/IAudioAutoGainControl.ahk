#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioAutoGainControl interface provides access to a hardware automatic gain control (AGC).
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudioautogaincontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioAutoGainControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioAutoGainControl
     * @type {Guid}
     */
    static IID => Guid("{85401fd4-6de4-4b9d-9869-2d6753a82f3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnabled", "SetEnabled"]

    /**
     * The GetEnabled method gets the current state (enabled or disabled) of the AGC.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the current AGC state. If the state is <b>TRUE</b>, AGC is enabled. If <b>FALSE</b>, AGC is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iaudioautogaincontrol-getenabled
     */
    GetEnabled() {
        result := ComCall(3, this, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The SetEnabled method enables or disables the AGC.
     * @param {BOOL} bEnable The new AGC state. If this parameter is <b>TRUE</b> (nonzero), the method enables AGC. If <b>FALSE</b>, it disables AGC.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetEnabled</b> call changes the state of the AGC control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iaudioautogaincontrol-setenabled
     */
    SetEnabled(bEnable, pguidEventContext) {
        result := ComCall(4, this, "int", bEnable, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
