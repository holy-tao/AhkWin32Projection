#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RoutedEvent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics7
     * @type {Guid}
     */
    static IID => Guid("{da9b4493-a695-4145-ae93-888024396a0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreviewKeyDownEvent", "get_CharacterReceivedEvent", "get_PreviewKeyUpEvent"]

    /**
     * @type {RoutedEvent} 
     */
    PreviewKeyDownEvent {
        get => this.get_PreviewKeyDownEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    CharacterReceivedEvent {
        get => this.get_CharacterReceivedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    PreviewKeyUpEvent {
        get => this.get_PreviewKeyUpEvent()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_PreviewKeyDownEvent() {
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
    get_CharacterReceivedEvent() {
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
    get_PreviewKeyUpEvent() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }
}
