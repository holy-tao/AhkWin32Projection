#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IKnownAdaptiveNotificationHintsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownAdaptiveNotificationHintsStatics
     * @type {Guid}
     */
    static IID => Guid("{06206598-d496-497d-8692-4f7d7c2770df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Style", "get_Wrap", "get_MaxLines", "get_MinLines", "get_TextStacking", "get_Align"]

    /**
     * @type {HSTRING} 
     */
    Style {
        get => this.get_Style()
    }

    /**
     * @type {HSTRING} 
     */
    Wrap {
        get => this.get_Wrap()
    }

    /**
     * @type {HSTRING} 
     */
    MaxLines {
        get => this.get_MaxLines()
    }

    /**
     * @type {HSTRING} 
     */
    MinLines {
        get => this.get_MinLines()
    }

    /**
     * @type {HSTRING} 
     */
    TextStacking {
        get => this.get_TextStacking()
    }

    /**
     * @type {HSTRING} 
     */
    Align {
        get => this.get_Align()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Style() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wrap() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MaxLines() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MinLines() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextStacking() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Align() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
