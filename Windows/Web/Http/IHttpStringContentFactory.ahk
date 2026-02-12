#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpStringContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpStringContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpStringContentFactory
     * @type {Guid}
     */
    static IID => Guid("{46649d5b-2e93-48eb-8e61-19677878e57f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromString", "CreateFromStringWithEncoding", "CreateFromStringWithEncodingAndMediaType"]

    /**
     * Default constructor for **CreateFromStringAttribute**
     * @param {HSTRING} content 
     * @returns {HttpStringContent} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.createfromstringattribute.#ctor
     */
    CreateFromString(content) {
        if(content is String) {
            pin := HSTRING.Create(content)
            content := pin.Value
        }
        content := content is Win32Handle ? NumGet(content, "ptr") : content

        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpStringContent(value)
    }

    /**
     * 
     * @param {HSTRING} content 
     * @param {Integer} encoding 
     * @returns {HttpStringContent} 
     */
    CreateFromStringWithEncoding(content, encoding) {
        if(content is String) {
            pin := HSTRING.Create(content)
            content := pin.Value
        }
        content := content is Win32Handle ? NumGet(content, "ptr") : content

        result := ComCall(7, this, "ptr", content, "int", encoding, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpStringContent(value)
    }

    /**
     * 
     * @param {HSTRING} content 
     * @param {Integer} encoding 
     * @param {HSTRING} mediaType_ 
     * @returns {HttpStringContent} 
     */
    CreateFromStringWithEncodingAndMediaType(content, encoding, mediaType_) {
        if(content is String) {
            pin := HSTRING.Create(content)
            content := pin.Value
        }
        content := content is Win32Handle ? NumGet(content, "ptr") : content
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_

        result := ComCall(8, this, "ptr", content, "int", encoding, "ptr", mediaType_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpStringContent(value)
    }
}
