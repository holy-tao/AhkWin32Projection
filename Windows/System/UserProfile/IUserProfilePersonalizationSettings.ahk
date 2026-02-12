#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IUserProfilePersonalizationSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserProfilePersonalizationSettings
     * @type {Guid}
     */
    static IID => Guid("{8ceddab4-7998-46d5-8dd3-184f1c5f9ab9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrySetLockScreenImageAsync", "TrySetWallpaperImageAsync"]

    /**
     * 
     * @param {StorageFile} imageFile 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetLockScreenImageAsync(imageFile) {
        result := ComCall(6, this, "ptr", imageFile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {StorageFile} imageFile 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetWallpaperImageAsync(imageFile) {
        result := ComCall(7, this, "ptr", imageFile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
