#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDatePickedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatePickedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a1527b12-59c1-4521-b28c-b176675e7c5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldDate", "get_NewDate"]

    /**
     * @type {DateTime} 
     */
    OldDate {
        get => this.get_OldDate()
    }

    /**
     * @type {DateTime} 
     */
    NewDate {
        get => this.get_NewDate()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_OldDate() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NewDate() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
