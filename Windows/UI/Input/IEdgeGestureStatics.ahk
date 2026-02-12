#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\EdgeGesture.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IEdgeGestureStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEdgeGestureStatics
     * @type {Guid}
     */
    static IID => Guid("{bc6a8519-18ee-4043-9839-4fc584d60a14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {EdgeGesture} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &current := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EdgeGesture(current)
    }
}
