#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerIdleStateEnteredArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerIdleStateEnteredArgs
     * @type {Guid}
     */
    static IID => Guid("{50012faa-1510-4142-a1a5-019b09f8857b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestId"]

    /**
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
