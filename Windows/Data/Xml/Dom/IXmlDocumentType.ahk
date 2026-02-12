#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XmlNamedNodeMap.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlDocumentType extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlDocumentType
     * @type {Guid}
     */
    static IID => Guid("{f7342425-9781-4964-8e94-9b1c6dfc9bc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Entities", "get_Notations"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {XmlNamedNodeMap} 
     */
    Entities {
        get => this.get_Entities()
    }

    /**
     * @type {XmlNamedNodeMap} 
     */
    Notations {
        get => this.get_Notations()
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
     * @returns {XmlNamedNodeMap} 
     */
    get_Entities() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNamedNodeMap(value)
    }

    /**
     * 
     * @returns {XmlNamedNodeMap} 
     */
    get_Notations() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlNamedNodeMap(value)
    }
}
