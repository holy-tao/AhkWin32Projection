#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dom\XmlDocument.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Xsl
 * @version WindowsRuntime 1.4
 */
class IXsltProcessor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXsltProcessor2
     * @type {Guid}
     */
    static IID => Guid("{8da45c56-97a5-44cb-a8be-27d86280c70a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransformToDocument"]

    /**
     * 
     * @param {IXmlNode} inputNode 
     * @returns {XmlDocument} 
     */
    TransformToDocument(inputNode) {
        result := ComCall(6, this, "ptr", inputNode, "ptr*", &output := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(output)
    }
}
