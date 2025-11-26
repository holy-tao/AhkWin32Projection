#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidClosedCaptioning2.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidClosedCaptioning3 interface retrieves the teletext filter. The MSVidClosedCaptioning feature exposes this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidClosedCaptioning3)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidclosedcaptioning3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidClosedCaptioning3 extends IMSVidClosedCaptioning2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidClosedCaptioning3
     * @type {Guid}
     */
    static IID => Guid("{c8638e8a-7625-4c51-9366-2f40a9831fc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TeleTextFilter"]

    /**
     * @type {IUnknown} 
     */
    TeleTextFilter {
        get => this.get_TeleTextFilter()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning3-get_teletextfilter
     */
    get_TeleTextFilter() {
        result := ComCall(20, this, "ptr*", &punkTTFilter := 0, "HRESULT")
        return IUnknown(punkTTFilter)
    }
}
