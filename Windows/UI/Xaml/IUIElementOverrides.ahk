#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Automation\Peers\AutomationPeer.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementOverrides
     * @type {Guid}
     */
    static IID => Guid("{608d2f1d-7858-4aeb-89e4-b54e2c7ed3d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCreateAutomationPeer", "OnDisconnectVisualChildren", "FindSubElementsForTouchTargeting"]

    /**
     * 
     * @returns {AutomationPeer} 
     */
    OnCreateAutomationPeer() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnDisconnectVisualChildren() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} point_ 
     * @param {RECT} boundingRect 
     * @returns {IIterable<IIterable<POINT>>} 
     */
    FindSubElementsForTouchTargeting(point_, boundingRect) {
        result := ComCall(8, this, "ptr", point_, "ptr", boundingRect, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(IIterable.Call.Bind(IIterable, (ptr) => IPropertyValue(ptr).GetPOINT()), result_)
    }
}
