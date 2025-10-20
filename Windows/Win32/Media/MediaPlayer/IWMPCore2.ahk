#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPCore.ahk

/**
 * The IWMPCore2 interface provides a method that supplements the IWMPCore interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcore2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCore2 extends IWMPCore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCore2
     * @type {Guid}
     */
    static IID => Guid("{bc17e5b7-7561-4c18-bb90-17d485775659}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_dvd"]

    /**
     * 
     * @param {Pointer<IWMPDVD>} ppDVD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore2-get_dvd
     */
    get_dvd(ppDVD) {
        result := ComCall(28, this, "ptr*", ppDVD, "HRESULT")
        return result
    }
}
