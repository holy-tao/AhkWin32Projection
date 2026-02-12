#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GraphicsCaptureItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCaptureItemStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureItemStatics2
     * @type {Guid}
     */
    static IID => Guid("{3b92acc9-e584-5862-bf5c-9c316c6d2dbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateFromWindowId", "TryCreateFromDisplayId"]

    /**
     * 
     * @param {WindowId} windowId_ 
     * @returns {GraphicsCaptureItem} 
     */
    TryCreateFromWindowId(windowId_) {
        windowId_ := windowId_ is Win32Handle ? NumGet(windowId_, "ptr") : windowId_

        result := ComCall(6, this, "ptr", windowId_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GraphicsCaptureItem(result_)
    }

    /**
     * 
     * @param {DisplayId} displayId_ 
     * @returns {GraphicsCaptureItem} 
     */
    TryCreateFromDisplayId(displayId_) {
        displayId_ := displayId_ is Win32Handle ? NumGet(displayId_, "ptr") : displayId_

        result := ComCall(7, this, "ptr", displayId_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GraphicsCaptureItem(result_)
    }
}
