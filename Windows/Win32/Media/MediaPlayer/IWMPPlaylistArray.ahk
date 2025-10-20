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
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPPlaylist>} ppItem 
     * @returns {HRESULT} 
     */
    item(lIndex, ppItem) {
        result := ComCall(8, this, "int", lIndex, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
