#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylistArray interface provides methods for accessing a collection of IWMPPlaylist interface pointers by index number.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplaylistarray
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlaylistArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlaylistArray
     * @type {Guid}
     */
    static IID => Guid("{679409c0-99f7-11d3-9fb7-00105aa620bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "item"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistarray-get_count
     */
    get_count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPPlaylist>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistarray-item
     */
    item(lIndex, ppItem) {
        result := ComCall(8, this, "int", lIndex, "ptr*", ppItem, "HRESULT")
        return result
    }
}
