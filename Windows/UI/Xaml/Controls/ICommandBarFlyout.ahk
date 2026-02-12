#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include .\ICommandBarElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBarFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarFlyout
     * @type {Guid}
     */
    static IID => Guid("{fecd2c4d-f16a-58cd-8aca-db0f046f25c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrimaryCommands", "get_SecondaryCommands"]

    /**
     * @type {IObservableVector<ICommandBarElement>} 
     */
    PrimaryCommands {
        get => this.get_PrimaryCommands()
    }

    /**
     * @type {IObservableVector<ICommandBarElement>} 
     */
    SecondaryCommands {
        get => this.get_SecondaryCommands()
    }

    /**
     * 
     * @returns {IObservableVector<ICommandBarElement>} 
     */
    get_PrimaryCommands() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(ICommandBarElement, value)
    }

    /**
     * 
     * @returns {IObservableVector<ICommandBarElement>} 
     */
    get_SecondaryCommands() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(ICommandBarElement, value)
    }
}
