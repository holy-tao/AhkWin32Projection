#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RoutedEvent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics6
     * @type {Guid}
     */
    static IID => Guid("{647e03b7-036a-4dea-9540-1dd7fd1266f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GettingFocusEvent", "get_LosingFocusEvent", "get_NoFocusCandidateFoundEvent"]

    /**
     * @type {RoutedEvent} 
     */
    GettingFocusEvent {
        get => this.get_GettingFocusEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    LosingFocusEvent {
        get => this.get_LosingFocusEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    NoFocusCandidateFoundEvent {
        get => this.get_NoFocusCandidateFoundEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_GettingFocusEvent() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_LosingFocusEvent() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_NoFocusCandidateFoundEvent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }
}
