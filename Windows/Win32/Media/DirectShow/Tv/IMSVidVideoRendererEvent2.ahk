#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidOutputDeviceEvent.ahk

/**
 * This interface is not implemented.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRendererEvent2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidvideorendererevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVideoRendererEvent2 extends IMSVidOutputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVideoRendererEvent2
     * @type {Guid}
     */
    static IID => Guid("{7145ed66-4730-4fdb-8a53-fde7508d3e5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OverlayUnavailable"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererevent2-overlayunavailable
     */
    OverlayUnavailable() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
