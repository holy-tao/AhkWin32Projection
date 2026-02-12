#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarViewSelectedDatesChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarViewSelectedDatesChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ee6069f6-13ef-4896-8ffc-5302b1b17539}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddedDates", "get_RemovedDates"]

    /**
     * @type {IVectorView<DateTime>} 
     */
    AddedDates {
        get => this.get_AddedDates()
    }

    /**
     * @type {IVectorView<DateTime>} 
     */
    RemovedDates {
        get => this.get_RemovedDates()
    }

    /**
     * 
     * @returns {IVectorView<DateTime>} 
     */
    get_AddedDates() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IVectorView<DateTime>} 
     */
    get_RemovedDates() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }
}
