#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidDevice.ahk

/**
 * The IMSVidInputDevice interface represents any input device that is recognized by the Video Control, such as a television tuner card.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidInputDevice)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidinputdevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidInputDevice extends IMSVidDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidInputDevice
     * @type {Guid}
     */
    static IID => Guid("{37b0353d-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidInputDevice
     * @type {Guid}
     */
    static CLSID => Guid("{ac1972f2-138a-4ca3-90da-ae51112eda28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsViewable", "View"]

    /**
     * 
     * @param {Pointer<VARIANT>} v 
     * @param {Pointer<VARIANT_BOOL>} pfViewable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevice-isviewable
     */
    IsViewable(v, pfViewable) {
        result := ComCall(16, this, "ptr", v, "ptr", pfViewable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} v 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevice-view
     */
    View(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }
}
