#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Pickers\Provider\FileSavePickerUI.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about the activated event that fires when the user saves a file through the file picker and selects the app as the location.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickeractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileSavePickerActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSavePickerActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{81c19cf1-74e6-4387-82eb-bb8fd64b4346}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileSavePickerUI"]

    /**
     * The letterbox UI of the file picker that is displayed when the user saves a file and selects the app as the save location.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickeractivatedeventargs.filesavepickerui
     * @type {FileSavePickerUI} 
     */
    FileSavePickerUI {
        get => this.get_FileSavePickerUI()
    }

    /**
     * 
     * @returns {FileSavePickerUI} 
     */
    get_FileSavePickerUI() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileSavePickerUI(value)
    }
}
