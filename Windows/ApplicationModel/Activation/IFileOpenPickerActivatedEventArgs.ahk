#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Pickers\Provider\FileOpenPickerUI.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about the activated event that fires when the user tries to pick files or folders that are provided by the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileopenpickeractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileOpenPickerActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenPickerActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{72827082-5525-4bf2-bc09-1f5095d4964d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileOpenPickerUI"]

    /**
     * The letterbox UI of the file picker that is displayed when the user wants to pick files or folders that are provided by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileopenpickeractivatedeventargs.fileopenpickerui
     * @type {FileOpenPickerUI} 
     */
    FileOpenPickerUI {
        get => this.get_FileOpenPickerUI()
    }

    /**
     * 
     * @returns {FileOpenPickerUI} 
     */
    get_FileOpenPickerUI() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileOpenPickerUI(value)
    }
}
