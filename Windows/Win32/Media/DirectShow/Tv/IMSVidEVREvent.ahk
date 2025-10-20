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
     * 
     * @param {Integer} lEventCode 
     * @returns {HRESULT} 
     */
    OnUserEvent(lEventCode) {
        result := ComCall(8, this, "int", lEventCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
