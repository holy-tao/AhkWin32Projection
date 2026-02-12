#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class ILockScreenStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockScreenStatics
     * @type {Guid}
     */
    static IID => Guid("{3ee9d3ad-b607-40ae-b426-7631d9821269}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OriginalImageFile", "GetImageStream", "SetImageFileAsync", "SetImageStreamAsync"]

    /**
     * @type {Uri} 
     */
    OriginalImageFile {
        get => this.get_OriginalImageFile()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_OriginalImageFile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    GetImageStream() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @param {IStorageFile} value 
     * @returns {IAsyncAction} 
     */
    SetImageFileAsync(value) {
        result := ComCall(8, this, "ptr", value, "ptr*", &Operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(Operation)
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {IAsyncAction} 
     */
    SetImageStreamAsync(value) {
        result := ComCall(9, this, "ptr", value, "ptr*", &Operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(Operation)
    }
}
