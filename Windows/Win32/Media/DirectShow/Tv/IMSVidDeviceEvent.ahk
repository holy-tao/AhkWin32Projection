#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * This topic applies to Windows XP or later. The IMSVidDeviceEvent interface is the base interface for device events. Do not implement this interface directly. Other event interfaces derive from this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDeviceEvent)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsviddeviceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidDeviceEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidDeviceEvent
     * @type {Guid}
     */
    static IID => Guid("{1c15d480-911d-11d2-b632-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StateChange"]

    /**
     * 
     * @param {IMSVidDevice} lpd 
     * @param {Integer} oldState 
     * @param {Integer} newState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddeviceevent-statechange
     */
    StateChange(lpd, oldState, newState) {
        result := ComCall(7, this, "ptr", lpd, "int", oldState, "int", newState, "HRESULT")
        return result
    }
}
