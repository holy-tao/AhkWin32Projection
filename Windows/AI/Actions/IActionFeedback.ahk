#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Raised when user feedback is submitted for an app action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.provider.iactionfeedbackhandler.processfeedbackasync
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionFeedback extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionFeedback
     * @type {Guid}
     */
    static IID => Guid("{a12ee7ab-2454-56c9-bbdf-c089457fbc5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FeedbackKind"]

    /**
     * @type {Integer} 
     */
    FeedbackKind {
        get => this.get_FeedbackKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FeedbackKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
