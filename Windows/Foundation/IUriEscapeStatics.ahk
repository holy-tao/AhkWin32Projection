#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IUriEscapeStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriEscapeStatics
     * @type {Guid}
     */
    static IID => Guid("{c1d432ba-c824-4452-a7fd-512bc3bbe9a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnescapeComponent", "EscapeComponent"]

    /**
     * 
     * @param {HSTRING} toUnescape 
     * @returns {HSTRING} 
     */
    UnescapeComponent(toUnescape) {
        if(toUnescape is String) {
            pin := HSTRING.Create(toUnescape)
            toUnescape := pin.Value
        }
        toUnescape := toUnescape is Win32Handle ? NumGet(toUnescape, "ptr") : toUnescape

        value := HSTRING()
        result := ComCall(6, this, "ptr", toUnescape, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} toEscape 
     * @returns {HSTRING} 
     */
    EscapeComponent(toEscape) {
        if(toEscape is String) {
            pin := HSTRING.Create(toEscape)
            toEscape := pin.Value
        }
        toEscape := toEscape is Win32Handle ? NumGet(toEscape, "ptr") : toEscape

        value := HSTRING()
        result := ComCall(7, this, "ptr", toEscape, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
