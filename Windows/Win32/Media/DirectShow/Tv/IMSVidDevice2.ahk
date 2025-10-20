#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidDevice2 interface is implemented by some Video Control device objects.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDevice2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsviddevice2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidDevice2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidDevice2
     * @type {Guid}
     */
    static IID => Guid("{87bd2783-ebc0-478c-b4a0-e8e7f43ab78e}")

    /**
     * The class identifier for MSVidDevice2
     * @type {Guid}
     */
    static CLSID => Guid("{30997f7d-b3b5-4a1c-983a-1fe8098cb77d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DevicePath"]

    /**
     * 
     * @param {Pointer<BSTR>} DevPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice2-get_devicepath
     */
    get_DevicePath(DevPath) {
        result := ComCall(3, this, "ptr", DevPath, "HRESULT")
        return result
    }
}
