#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Playlist.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playlists
 * @version WindowsRuntime 1.4
 */
class IPlaylistStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaylistStatics
     * @type {Guid}
     */
    static IID => Guid("{c5c331cd-81f9-4ff3-95b9-70b6ff046b68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<Playlist>} 
     */
    LoadAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Playlist, operation)
    }
}
