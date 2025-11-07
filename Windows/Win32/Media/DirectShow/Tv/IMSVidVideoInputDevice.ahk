#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidInputDevice.ahk

/**
 * The IMSVidVideoInputDevice interface represents a video input device. This interface inherits from the IMSVidInputDevice interface but adds no methods to it. It exists to support polymorphism.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoInputDevice)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidvideoinputdevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVideoInputDevice extends IMSVidInputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVideoInputDevice
     * @type {Guid}
     */
    static IID => Guid("{1c15d47f-911d-11d2-b632-00c04f79498e}")

    /**
     * The class identifier for MSVidVideoInputDevice
     * @type {Guid}
     */
    static CLSID => Guid("{95f4820b-bb3a-4e2d-bc64-5b817bc2c30e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
