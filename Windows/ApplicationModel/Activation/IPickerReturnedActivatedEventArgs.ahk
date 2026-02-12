#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data for the Activated event when it occurs after a picker returns.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ipickerreturnedactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IPickerReturnedActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPickerReturnedActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{360defb9-a9d3-4984-a4ed-9ec734604921}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PickerOperationId"]

    /**
     * Gets an identifier indicating the type of picker operation that was performed prior to the activation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ipickerreturnedactivatedeventargs.pickeroperationid
     * @type {HSTRING} 
     */
    PickerOperationId {
        get => this.get_PickerOperationId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PickerOperationId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
