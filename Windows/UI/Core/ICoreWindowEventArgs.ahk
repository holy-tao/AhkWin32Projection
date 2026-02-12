#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the set of arguments returned to an app after a window input or behavior event.
 * @remarks
 * This interface is passed to the app in the corresponding event delegate. The app can use this to set the [Handled](icorewindoweventargs_handled.md) property, which, when true, informs the framework to perform default processing of the event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindoweventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindowEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowEventArgs
     * @type {Guid}
     */
    static IID => Guid("{272b1ef3-c633-4da5-a26c-c6d0f56b29da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handled", "put_Handled"]

    /**
     * Specifies the property that gets or sets whether the event was handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindoweventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
