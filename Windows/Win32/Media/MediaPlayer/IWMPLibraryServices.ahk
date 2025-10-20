#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibraryServices interface provides methods to enumerate libraries.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibraryservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibraryServices extends IUnknown{
    /**
     * The interface identifier for IWMPLibraryServices
     * @type {Guid}
     */
    static IID => Guid("{39c2f8d5-1cf2-4d5e-ae09-d73492cf9eaa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} wmplt 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    getCountByType(wmplt, plCount) {
        result := ComCall(3, this, "int", wmplt, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wmplt 
     * @param {Integer} lIndex 
     * @param {Pointer<IWMPLibrary>} ppIWMPLibrary 
     * @returns {HRESULT} 
     */
    getLibraryByType(wmplt, lIndex, ppIWMPLibrary) {
        result := ComCall(4, this, "int", wmplt, "int", lIndex, "ptr", ppIWMPLibrary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
