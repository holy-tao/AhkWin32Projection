#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherStatics
     * @type {Guid}
     */
    static IID => Guid("{277151c3-9e3e-42f6-91a4-5dfdeb232451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchFileAsync", "LaunchFileWithOptionsAsync", "LaunchUriAsync", "LaunchUriWithOptionsAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFileAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {LauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFileWithOptionsAsync(file_, options) {
        result := ComCall(7, this, "ptr", file_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchUriAsync(uri_) {
        result := ComCall(8, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchUriWithOptionsAsync(uri_, options) {
        result := ComCall(9, this, "ptr", uri_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
