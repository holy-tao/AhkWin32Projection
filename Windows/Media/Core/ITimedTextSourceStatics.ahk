#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedTextSource.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{7e311853-9aba-4ac4-bb98-2fb176c3bfdd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromStream", "CreateFromUri", "CreateFromStreamWithLanguage", "CreateFromUriWithLanguage"]

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @returns {TimedTextSource} 
     */
    CreateFromStream(stream) {
        result := ComCall(6, this, "ptr", stream, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(value)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {TimedTextSource} 
     */
    CreateFromUri(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(value)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     */
    CreateFromStreamWithLanguage(stream, defaultLanguage) {
        if(defaultLanguage is String) {
            pin := HSTRING.Create(defaultLanguage)
            defaultLanguage := pin.Value
        }
        defaultLanguage := defaultLanguage is Win32Handle ? NumGet(defaultLanguage, "ptr") : defaultLanguage

        result := ComCall(8, this, "ptr", stream, "ptr", defaultLanguage, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(value)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     */
    CreateFromUriWithLanguage(uri_, defaultLanguage) {
        if(defaultLanguage is String) {
            pin := HSTRING.Create(defaultLanguage)
            defaultLanguage := pin.Value
        }
        defaultLanguage := defaultLanguage is Win32Handle ? NumGet(defaultLanguage, "ptr") : defaultLanguage

        result := ComCall(9, this, "ptr", uri_, "ptr", defaultLanguage, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(value)
    }
}
