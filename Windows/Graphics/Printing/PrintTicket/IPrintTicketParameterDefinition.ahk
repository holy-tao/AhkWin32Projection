#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Data\Xml\Dom\IXmlNode.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class IPrintTicketParameterDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTicketParameterDefinition
     * @type {Guid}
     */
    static IID => Guid("{d6bab4e4-2962-4c01-b7f3-9a9294eb8335}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_XmlNamespace", "get_XmlNode", "get_DataType", "get_UnitType", "get_RangeMin", "get_RangeMax"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * @type {Integer} 
     */
    DataType {
        get => this.get_DataType()
    }

    /**
     * @type {HSTRING} 
     */
    UnitType {
        get => this.get_UnitType()
    }

    /**
     * @type {Integer} 
     */
    RangeMin {
        get => this.get_RangeMin()
    }

    /**
     * @type {Integer} 
     */
    RangeMax {
        get => this.get_RangeMax()
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
    get_XmlNamespace() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataType() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnitType() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMin() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMax() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
