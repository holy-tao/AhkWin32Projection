#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidOutputDeviceEvent.ahk

/**
 * This topic applies to Windows Vista or later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEVREvent)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidevrevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidEVREvent extends IMSVidOutputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidEVREvent
     * @type {Guid}
     */
    static IID => Guid("{349abb10-883c-4f22-8714-cecaeee45d62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUserEvent"]

    /**
     * 
     * @param {Integer} lEventCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevrevent-onuserevent
     */
    OnUserEvent(lEventCode) {
        result := ComCall(8, this, "int", lEventCode, "HRESULT")
        return result
    }
}
