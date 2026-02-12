#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Storage\IStorageItem.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated because it is the program associated with a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{bb2afc33-93b1-42ed-8b26-236dd9c78496}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Files", "get_Verb"]

    /**
     * Gets the files for which the app was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileactivatedeventargs.files
     * @type {IVectorView<IStorageItem>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * Gets the action associated with the activated file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * 
     * @returns {IVectorView<IStorageItem>} 
     */
    get_Files() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IStorageItem, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Verb() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
