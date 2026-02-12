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
class ITimedTextSourceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextSourceStatics2
     * @type {Guid}
     */
    static IID => Guid("{b66b7602-923e-43fa-9633-587075812db5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromStreamWithIndex", "CreateFromUriWithIndex", "CreateFromStreamWithIndexAndLanguage", "CreateFromUriWithIndexAndLanguage"]

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {IRandomAccessStream} indexStream 
     * @returns {TimedTextSource} 
     */
    CreateFromStreamWithIndex(stream, indexStream) {
        result := ComCall(6, this, "ptr", stream, "ptr", indexStream, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(result_)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {Uri} indexUri 
     * @returns {TimedTextSource} 
     */
    CreateFromUriWithIndex(uri_, indexUri) {
        result := ComCall(7, this, "ptr", uri_, "ptr", indexUri, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(result_)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {IRandomAccessStream} indexStream 
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     */
    CreateFromStreamWithIndexAndLanguage(stream, indexStream, defaultLanguage) {
        if(defaultLanguage is String) {
            pin := HSTRING.Create(defaultLanguage)
            defaultLanguage := pin.Value
        }
        defaultLanguage := defaultLanguage is Win32Handle ? NumGet(defaultLanguage, "ptr") : defaultLanguage

        result := ComCall(8, this, "ptr", stream, "ptr", indexStream, "ptr", defaultLanguage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(result_)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {Uri} indexUri 
     * @param {HSTRING} defaultLanguage 
     * @returns {TimedTextSource} 
     */
    CreateFromUriWithIndexAndLanguage(uri_, indexUri, defaultLanguage) {
        if(defaultLanguage is String) {
            pin := HSTRING.Create(defaultLanguage)
            defaultLanguage := pin.Value
        }
        defaultLanguage := defaultLanguage is Win32Handle ? NumGet(defaultLanguage, "ptr") : defaultLanguage

        result := ComCall(9, this, "ptr", uri_, "ptr", indexUri, "ptr", defaultLanguage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextSource(result_)
    }
}
