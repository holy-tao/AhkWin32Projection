#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Html
 * @version WindowsRuntime 1.4
 */
class IHtmlUtilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHtmlUtilities
     * @type {Guid}
     */
    static IID => Guid("{fec00add-2399-4fac-b5a7-05e9acd7181d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertToText"]

    /**
     * 
     * @param {HSTRING} html 
     * @returns {HSTRING} 
     */
    ConvertToText(html) {
        if(html is String) {
            pin := HSTRING.Create(html)
            html := pin.Value
        }
        html := html is Win32Handle ? NumGet(html, "ptr") : html

        text := HSTRING()
        result := ComCall(6, this, "ptr", html, "ptr", text, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return text
    }
}
