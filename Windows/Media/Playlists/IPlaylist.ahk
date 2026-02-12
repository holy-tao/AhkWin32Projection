#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playlists
 * @version WindowsRuntime 1.4
 */
class IPlaylist extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaylist
     * @type {Guid}
     */
    static IID => Guid("{803736f5-cf44-4d97-83b3-7a089e9ab663}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Files", "SaveAsync", "SaveAsAsync", "SaveAsWithFormatAsync"]

    /**
     * @type {IVector<StorageFile>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * 
     * @returns {IVector<StorageFile>} 
     */
    get_Files() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(StorageFile, value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFolder} saveLocation 
     * @param {HSTRING} desiredName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    SaveAsAsync(saveLocation, desiredName, option) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(8, this, "ptr", saveLocation, "ptr", desiredName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {IStorageFolder} saveLocation 
     * @param {HSTRING} desiredName 
     * @param {Integer} option 
     * @param {Integer} playlistFormat_ 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    SaveAsWithFormatAsync(saveLocation, desiredName, option, playlistFormat_) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(9, this, "ptr", saveLocation, "ptr", desiredName, "int", option, "int", playlistFormat_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }
}
