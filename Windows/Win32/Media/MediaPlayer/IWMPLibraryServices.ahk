#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPLibrary.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibraryServices interface provides methods to enumerate libraries.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibraryservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibraryServices extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getCountByType", "getLibraryByType"]

    /**
     * 
     * @param {Integer} wmplt 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibraryservices-getcountbytype
     */
    getCountByType(wmplt, plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", wmplt, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wmplt 
     * @param {Integer} lIndex 
     * @returns {IWMPLibrary} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibraryservices-getlibrarybytype
     */
    getLibraryByType(wmplt, lIndex) {
        result := ComCall(4, this, "int", wmplt, "int", lIndex, "ptr*", &ppIWMPLibrary := 0, "HRESULT")
        return IWMPLibrary(ppIWMPLibrary)
    }
}
