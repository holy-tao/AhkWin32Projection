#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFeature.ahk

/**
 * The IMSVidDataServices interface represents the data services feature. The MSVidDataServices feature object exposes this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDataServices)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsviddataservices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidDataServices extends IMSVidFeature{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidDataServices
     * @type {Guid}
     */
    static IID => Guid("{334125c1-77e5-11d3-b653-00c04f79498e}")

    /**
     * The class identifier for MSVidDataServices
     * @type {Guid}
     */
    static CLSID => Guid("{334125c0-77e5-11d3-b653-00c04f79498e}")

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
