#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherStatics5
     * @type {Guid}
     */
    static IID => Guid("{5b24ef84-d895-5fea-9153-1ac49aed9ba9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchFolderPathAsync", "LaunchFolderPathWithOptionsAsync", "LaunchFolderPathForUserAsync", "LaunchFolderPathWithOptionsForUserAsync"]

    /**
     * 
     * @param {HSTRING} path_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFolderPathAsync(path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(6, this, "ptr", path_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} path_ 
     * @param {FolderLauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFolderPathWithOptionsAsync(path_, options) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(7, this, "ptr", path_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} path_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFolderPathForUserAsync(user_, path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(8, this, "ptr", user_, "ptr", path_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} path_ 
     * @param {FolderLauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchFolderPathWithOptionsForUserAsync(user_, path_, options) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(9, this, "ptr", user_, "ptr", path_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
