#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidFeature.ahk

/**
 * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidXDS interface provides access to the extended data services. The MSVidXDS feature exposes this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidXDS)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidxds
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidXDS extends IMSVidFeature{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidXDS
     * @type {Guid}
     */
    static IID => Guid("{11ebc158-e712-4d1f-8bb3-01ed5274c4ce}")

    /**
     * The class identifier for MSVidXDS
     * @type {Guid}
     */
    static CLSID => Guid("{0149eedf-d08f-4142-8d73-d23903d21e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChannelChangeInterface"]

    /**
     * @type {IUnknown} 
     */
    ChannelChangeInterface {
        get => this.get_ChannelChangeInterface()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidxds-get_channelchangeinterface
     */
    get_ChannelChangeInterface() {
        result := ComCall(16, this, "ptr*", &punkCC := 0, "HRESULT")
        return IUnknown(punkCC)
    }
}
