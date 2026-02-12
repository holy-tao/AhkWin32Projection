#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaEncodingProfile.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProfileStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProfileStatics
     * @type {Guid}
     */
    static IID => Guid("{197f352c-2ede-4a45-a896-817a4854f8fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateM4a", "CreateMp3", "CreateWma", "CreateMp4", "CreateWmv", "CreateFromFileAsync", "CreateFromStreamAsync"]

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateM4a(quality_) {
        result := ComCall(6, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateMp3(quality_) {
        result := ComCall(7, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateWma(quality_) {
        result := ComCall(8, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateMp4(quality_) {
        result := ComCall(9, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @param {Integer} quality_ 
     * @returns {MediaEncodingProfile} 
     */
    CreateWmv(quality_) {
        result := ComCall(10, this, "int", quality_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<MediaEncodingProfile>} 
     */
    CreateFromFileAsync(file_) {
        result := ComCall(11, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaEncodingProfile, operation)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncOperation<MediaEncodingProfile>} 
     */
    CreateFromStreamAsync(stream) {
        result := ComCall(12, this, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaEncodingProfile, operation)
    }
}
