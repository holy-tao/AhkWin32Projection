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
     * 
     * @param {Pointer<UInt32>} pcStreams 
     * @returns {HRESULT} 
     */
    Count(pcStreams) {
        result := ComCall(3, this, "uint*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<AM_MEDIA_TYPE>} ppmt 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<UInt32>} plcid 
     * @param {Pointer<UInt32>} pdwGroup 
     * @param {Pointer<PWSTR>} ppszName 
     * @param {Pointer<IUnknown>} ppObject 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    Info(lIndex, ppmt, pdwFlags, plcid, pdwGroup, ppszName, ppObject, ppUnk) {
        result := ComCall(4, this, "int", lIndex, "ptr", ppmt, "uint*", pdwFlags, "uint*", plcid, "uint*", pdwGroup, "ptr", ppszName, "ptr", ppObject, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Enable(lIndex, dwFlags) {
        result := ComCall(5, this, "int", lIndex, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
