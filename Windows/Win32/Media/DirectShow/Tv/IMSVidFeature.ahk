#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidDevice.ahk

/**
 * The IMSVidFeature interface represents a feature that is available through the Video Control, such as data services or closed captioning.
 * @remarks
 * 
  * To obtain a collection of the features that are available, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresavailable">IMSVidCtl::get_FeaturesAvailable</a> method on the Video Control. To activate a feature, create a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd695126(v=vs.85)">MSVidFeatures</a> collection object and assign it to the Video Control by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-put_featuresactive">IMSVidCtl::put_FeaturesActive</a> method.
  *       
  * 
  * Feature objects do not implement the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get_power">IMSVidDevice::get_Power</a> or <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get_status">IMSVidDevice::get_Status</a> method.
  *       
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFeature)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidfeature
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidFeature extends IMSVidDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidFeature
     * @type {Guid}
     */
    static IID => Guid("{37b03547-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidFeature
     * @type {Guid}
     */
    static CLSID => Guid("{7748530b-c08a-47ea-b24c-be8695ff405f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
