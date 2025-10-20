#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMStreamSelect interface selects from the available streams on a parser filter.
 * @remarks
 * 
  * The following filters implement this interface:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-1-stream-splitter-filter">MPEG-1 Stream Splitter</a> filter</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-2-splitter">MPEG-2 Splitter</a> filter</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/sami--cc--parser-filter">SAMI (CC) Parser</a> filter</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamstreamselect
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMStreamSelect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMStreamSelect
     * @type {Guid}
     */
    static IID => Guid("{c1960960-17f5-11d1-abe1-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Count", "Info", "Enable"]

    /**
     * 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamselect-count
     */
    Count(pcStreams) {
        result := ComCall(3, this, "uint*", pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppmt 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} plcid 
     * @param {Pointer<Integer>} pdwGroup 
     * @param {Pointer<PWSTR>} ppszName 
     * @param {Pointer<IUnknown>} ppObject 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamselect-info
     */
    Info(lIndex, ppmt, pdwFlags, plcid, pdwGroup, ppszName, ppObject, ppUnk) {
        result := ComCall(4, this, "int", lIndex, "ptr*", ppmt, "uint*", pdwFlags, "uint*", plcid, "uint*", pdwGroup, "ptr", ppszName, "ptr*", ppObject, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamselect-enable
     */
    Enable(lIndex, dwFlags) {
        result := ComCall(5, this, "int", lIndex, "uint", dwFlags, "HRESULT")
        return result
    }
}
