#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides text manipulation methods that are used by several objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlCharacterData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlCharacterData
     * @type {Guid}
     */
    static IID => Guid("{132e42ab-4e36-4df6-b1c8-0ce62fd88b26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "put_Data", "get_Length", "SubstringData", "AppendData", "InsertData", "DeleteData", "ReplaceData"]

    /**
     * Gets or sets the node data depending on the node type.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.data
     * @type {HSTRING} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets the length of the data, in Unicode characters.
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Data() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves a substring of the full string from the specified range.
     * @param {Integer} offset Specifies the offset, in characters, from the beginning of the string. An offset of zero indicates copying from the start of the data.
     * @param {Integer} count Specifies the number of characters to retrieve from the specified offset.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.substringdata
     */
    SubstringData(offset, count) {
        data := HSTRING()
        result := ComCall(9, this, "uint", offset, "uint", count, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return data
    }

    /**
     * Appends the supplied string to the existing string data.
     * @param {HSTRING} data The data to be appended to the existing string.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.appenddata
     */
    AppendData(data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(10, this, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Inserts a string at the specified offset.
     * @param {Integer} offset The offset, in characters, at which to insert the supplied string data.
     * @param {HSTRING} data The data to be inserted into the existing string.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.insertdata
     */
    InsertData(offset, data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(11, this, "uint", offset, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes specified data.
     * @param {Integer} offset The offset, in characters, at which to start deleting the string data.
     * @param {Integer} count The number of characters to delete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.deletedata
     */
    DeleteData(offset, count) {
        result := ComCall(12, this, "uint", offset, "uint", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Replaces the specified number of characters with the supplied string.
     * @param {Integer} offset The offset, in characters, at which to start replacing string data.
     * @param {Integer} count The number of characters to replace.
     * @param {HSTRING} data The new data that replaces the old string data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmlcharacterdata.replacedata
     */
    ReplaceData(offset, count, data) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(13, this, "uint", offset, "uint", count, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
