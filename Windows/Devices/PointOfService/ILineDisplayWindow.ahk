#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayWindow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayWindow
     * @type {Guid}
     */
    static IID => Guid("{d21feef4-2364-4be5-bee1-851680af4964}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SizeInCharacters", "get_InterCharacterWaitInterval", "put_InterCharacterWaitInterval", "TryRefreshAsync", "TryDisplayTextAsync", "TryDisplayTextAtPositionAsync", "TryDisplayTextNormalAsync", "TryScrollTextAsync", "TryClearTextAsync"]

    /**
     * @type {SIZE} 
     */
    SizeInCharacters {
        get => this.get_SizeInCharacters()
    }

    /**
     * @type {TimeSpan} 
     */
    InterCharacterWaitInterval {
        get => this.get_InterCharacterWaitInterval()
        set => this.put_InterCharacterWaitInterval(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_SizeInCharacters() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_InterCharacterWaitInterval() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_InterCharacterWaitInterval(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRefreshAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} displayAttribute 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayTextAsync(text, displayAttribute) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(10, this, "ptr", text, "int", displayAttribute, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} displayAttribute 
     * @param {POINT} startPosition 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayTextAtPositionAsync(text, displayAttribute, startPosition) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(11, this, "ptr", text, "int", displayAttribute, "ptr", startPosition, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayTextNormalAsync(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(12, this, "ptr", text, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} direction_ 
     * @param {Integer} numberOfColumnsOrRows 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryScrollTextAsync(direction_, numberOfColumnsOrRows) {
        result := ComCall(13, this, "int", direction_, "uint", numberOfColumnsOrRows, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryClearTextAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
