#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCdrom interface provides a way to access a CD or DVD in its drive.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdrom
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdrom extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} pbstrDrive 
     * @returns {HRESULT} 
     */
    get_driveSpecifier(pbstrDrive) {
        result := ComCall(7, this, "ptr", pbstrDrive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} ppPlaylist 
     * @returns {HRESULT} 
     */
    get_playlist(ppPlaylist) {
        result := ComCall(8, this, "ptr", ppPlaylist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    eject() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
