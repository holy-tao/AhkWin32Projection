#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about the activated event that fires when the user saves a file through the file picker and selects the app as the location.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickeractivatedeventargs2
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileSavePickerActivatedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSavePickerActivatedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{6b73fe13-2cf2-4d48-8cbc-af67d23f1ce7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CallerPackageFamilyName", "get_EnterpriseId"]

    /**
     * The package family name of the app that launched your app.
     * @remarks
     * If the caller is an unpackaged app (such as an unpackaged desktop app), *CallerPackageFamilyName* will be empty, that is `""`.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickeractivatedeventargs2.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Gets the ID of the enterprise that owns the file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifilesavepickeractivatedeventargs2.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerPackageFamilyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
