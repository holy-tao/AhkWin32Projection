#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Application.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IApplicationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationStatics
     * @type {Guid}
     */
    static IID => Guid("{06499997-f7b4-45fe-b763-7577d1d3cb4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "Start", "LoadComponent", "LoadComponentWithResourceLocation"]

    /**
     * @type {Application} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {Application} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Application(value)
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @param {ApplicationInitializationCallback} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start(callback) {
        result := ComCall(7, this, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} component_ 
     * @param {Uri} resourceLocator 
     * @returns {HRESULT} 
     */
    LoadComponent(component_, resourceLocator) {
        result := ComCall(8, this, "ptr", component_, "ptr", resourceLocator, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} component_ 
     * @param {Uri} resourceLocator 
     * @param {Integer} componentResourceLocation_ 
     * @returns {HRESULT} 
     */
    LoadComponentWithResourceLocation(component_, resourceLocator, componentResourceLocation_) {
        result := ComCall(9, this, "ptr", component_, "ptr", resourceLocator, "int", componentResourceLocation_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
