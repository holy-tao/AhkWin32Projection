#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Protection\MediaProtectionManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayerSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayerSource
     * @type {Guid}
     */
    static IID => Guid("{bd4f8897-1423-4c3e-82c5-0fb1af94f715}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProtectionManager", "put_ProtectionManager", "SetFileSource", "SetStreamSource", "SetMediaSource"]

    /**
     * @type {MediaProtectionManager} 
     */
    ProtectionManager {
        get => this.get_ProtectionManager()
        set => this.put_ProtectionManager(value)
    }

    /**
     * 
     * @returns {MediaProtectionManager} 
     */
    get_ProtectionManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaProtectionManager(value)
    }

    /**
     * 
     * @param {MediaProtectionManager} value 
     * @returns {HRESULT} 
     */
    put_ProtectionManager(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {HRESULT} 
     */
    SetFileSource(file_) {
        result := ComCall(8, this, "ptr", file_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @returns {HRESULT} 
     */
    SetStreamSource(stream) {
        result := ComCall(9, this, "ptr", stream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMediaSource} source 
     * @returns {HRESULT} 
     */
    SetMediaSource(source) {
        result := ComCall(10, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
