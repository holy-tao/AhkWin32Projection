#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SetterBaseCollection.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\StateTriggerBase.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IVisualState2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualState2
     * @type {Guid}
     */
    static IID => Guid("{0fa0f896-64c0-45fb-8d24-fb83298c0d93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Setters", "get_StateTriggers"]

    /**
     * @type {SetterBaseCollection} 
     */
    Setters {
        get => this.get_Setters()
    }

    /**
     * @type {IVector<StateTriggerBase>} 
     */
    StateTriggers {
        get => this.get_StateTriggers()
    }

    /**
     * 
     * @returns {SetterBaseCollection} 
     */
    get_Setters() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SetterBaseCollection(value)
    }

    /**
     * 
     * @returns {IVector<StateTriggerBase>} 
     */
    get_StateTriggers() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(StateTriggerBase, value)
    }
}
