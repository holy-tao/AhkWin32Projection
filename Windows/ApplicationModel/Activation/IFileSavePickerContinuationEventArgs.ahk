#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an activated event that fires after the app was suspended for a file save picker operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickercontinuationeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileSavePickerContinuationEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSavePickerContinuationEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2c846fe1-3bad-4f33-8c8b-e46fae824b4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_File"]

    /**
     * Gets the file selected by the user during the file save picker operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickercontinuationeventargs.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFile(value)
    }
}
