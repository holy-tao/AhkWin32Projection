#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidFilePlayback.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFilePlayback2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidfileplayback2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidFilePlayback2 extends IMSVidFilePlayback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidFilePlayback2
     * @type {Guid}
     */
    static IID => Guid("{2f7e44af-6e52-4660-bc08-d8d542587d72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put__SourceFilter", "put___SourceFilter"]

    /**
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback2-put__sourcefilter
     */
    put__SourceFilter(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(34, this, "ptr", FileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback2-put___sourcefilter
     */
    put___SourceFilter(FileName) {
        result := ComCall(35, this, "ptr", FileName, "HRESULT")
        return result
    }
}
