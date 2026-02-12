#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITimePickerSelectedValueChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimePickerSelectedValueChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6e20fb35-3b9b-5bb6-9888-266524db181e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldTime", "get_NewTime"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    OldTime {
        get => this.get_OldTime()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    NewTime {
        get => this.get_NewTime()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_OldTime() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_NewTime() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }
}
