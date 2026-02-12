#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Provider\CachedFileUpdaterUI.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about the activated event that fires when the user saves a file that requires content management from the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icachedfileupdateractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ICachedFileUpdaterActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICachedFileUpdaterActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d06eb1c7-3805-4ecb-b757-6cf15e26fef3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CachedFileUpdaterUI"]

    /**
     * The letterbox UI of the file picker that is displayed when a file requires content management from the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icachedfileupdateractivatedeventargs.cachedfileupdaterui
     * @type {CachedFileUpdaterUI} 
     */
    CachedFileUpdaterUI {
        get => this.get_CachedFileUpdaterUI()
    }

    /**
     * 
     * @returns {CachedFileUpdaterUI} 
     */
    get_CachedFileUpdaterUI() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CachedFileUpdaterUI(value)
    }
}
