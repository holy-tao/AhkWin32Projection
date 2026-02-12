#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a name-value pair in a URL query string.
 * @remarks
 * The [WwwFormUrlDecoder](wwwformurldecoder.md) class represents a URL query string as a sequence of name-value pairs. Each name-value pair is represented by an IWwwFormUrlDecoderEntry object.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.iwwwformurldecoderentry
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IWwwFormUrlDecoderEntry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWwwFormUrlDecoderEntry
     * @type {Guid}
     */
    static IID => Guid("{125e7431-f678-4e8e-b670-20a9b06c512d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Value"]

    /**
     * Represents the name of a parameter in a URL query string.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iwwwformurldecoderentry.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Represents a named value in a URL query string.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.iwwwformurldecoderentry.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
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
    get_Value() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
