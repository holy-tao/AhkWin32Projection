#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\StorageFolder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an activated event that fires after the app was suspended for a folder picker operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifolderpickercontinuationeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFolderPickerContinuationEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderPickerContinuationEventArgs
     * @type {Guid}
     */
    static IID => Guid("{51882366-9f4b-498f-beb0-42684f6e1c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Folder"]

    /**
     * Gets the folder selected by the user during the folder picker operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifolderpickercontinuationeventargs.folder
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Folder() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
