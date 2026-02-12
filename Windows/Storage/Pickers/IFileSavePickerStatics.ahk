#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FileSavePicker.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class IFileSavePickerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSavePickerStatics
     * @type {Guid}
     */
    static IID => Guid("{28e3cf9e-961c-5e2c-aed7-e64737f4ce37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {FileSavePicker} 
     */
    CreateForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileSavePicker(result_)
    }
}
