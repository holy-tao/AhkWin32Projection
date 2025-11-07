#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPPlaylist.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCdrom interface provides a way to access a CD or DVD in its drive.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdrom
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdrom extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCdrom
     * @type {Guid}
     */
    static IID => Guid("{cfab6e98-8730-11d3-b388-00c04f68574b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_driveSpecifier", "get_playlist", "eject"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDrive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-get_drivespecifier
     */
    get_driveSpecifier(pbstrDrive) {
        result := ComCall(7, this, "ptr", pbstrDrive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-get_playlist
     */
    get_playlist() {
        result := ComCall(8, this, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-eject
     */
    eject() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
