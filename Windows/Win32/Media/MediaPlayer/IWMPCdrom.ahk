#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPPlaylist.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCdrom interface provides a way to access a CD or DVD in its drive.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcdrom
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
     */
    driveSpecifier {
        get => this.get_driveSpecifier()
    }

    /**
     * @type {IWMPPlaylist} 
     */
    playlist {
        get => this.get_playlist()
    }

    /**
     * The get_driveSpecifier method retrieves the CD or DVD drive letter.
     * @remarks
     * Typically, DVD drives can play CD media, but CD drives cannot play DVD media.
     * 
     * This method retrieves a drive letter for a zero-based drive index within the range retrieved using the <b>IWMPCdromCollection::get_count</b> method. The value retrieved takes the form <i>X</i>:, where <i>X</i> represents the drive letter.
     * 
     * To retrieve the value of this property, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<BSTR>} pbstrDrive Pointer to a <b>BSTR</b> containing the drive.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-get_drivespecifier
     */
    get_driveSpecifier(pbstrDrive) {
        result := ComCall(7, this, "ptr", pbstrDrive, "HRESULT")
        return result
    }

    /**
     * The get_playlist method retrieves a pointer to an IWMPPlaylist interface representing the tracks on the CD currently in the CD drive or the root-level title entries for a DVD.
     * @remarks
     * Typically, DVD-based content organized into titles. Each title contains one or more chapters. Each DVD is authored differently, so how titles and chapters are used is up to the content author.
     * 
     * For a DVD, this method retrieves a playlist that contains as the first item a pointer to an <b>IWMPMedia</b> interface named "DVD". This interface represents the DVD media. Playing the item results in the DVD playing from the beginning if it is the first play after inserting a new DVD, or resuming playback if the DVD is the same as the last DVD viewed. Setting this item as the current item during playback results in the DVD playing from the beginning.
     * 
     * Additional items (<b>IWMPMedia</b> objects) in the playlist are DVD titles that are represented by nested playlists. When you specify a value for the <b>IWMPControls::put_currentItem</b> method to equal one of these nested playlist items, Windows Media Player automatically sets the nested playlist as the current playlist after chapter playback begins. You can then use the <b>IWMPPlaylist</b> interface methods and associated events to work with DVD chapters, which are also playlist items.
     * 
     * To retrieve the value of this property, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-get_playlist
     */
    get_playlist() {
        result := ComCall(8, this, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The eject method ejects the CD or DVD from the drive.
     * @remarks
     * If the drive door is open, this method closes the door.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-eject
     */
    eject() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
