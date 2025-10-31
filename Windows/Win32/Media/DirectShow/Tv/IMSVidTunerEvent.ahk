#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidInputDeviceEvent.ahk

/**
 * This topic applies to Windows XP or later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidTunerEvent)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidtunerevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidTunerEvent extends IMSVidInputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidTunerEvent
     * @type {Guid}
     */
    static IID => Guid("{1c15d485-911d-11d2-b632-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TuneChanged"]

    /**
     * 
     * @param {IMSVidTuner} lpd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidtunerevent-tunechanged
     */
    TuneChanged(lpd) {
        result := ComCall(7, this, "ptr", lpd, "HRESULT")
        return result
    }
}
