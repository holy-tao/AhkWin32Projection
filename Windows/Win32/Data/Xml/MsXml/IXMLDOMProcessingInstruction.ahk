#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMProcessingInstruction extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMProcessingInstruction
     * @type {Guid}
     */
    static IID => Guid("{2933bf89-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_target", "get_data", "put_data"]

    /**
     * @type {BSTR} 
     */
    target {
        get => this.get_target()
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_target() {
        name := BSTR()
        result := ComCall(43, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        value := BSTR()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_data(value) {
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
