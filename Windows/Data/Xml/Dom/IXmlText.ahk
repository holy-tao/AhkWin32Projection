#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXmlText.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the text content of an element or attribute.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmltext
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlText extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlText
     * @type {Guid}
     */
    static IID => Guid("{f931a4cb-308d-4760-a1d5-43b67450ac7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SplitText"]

    /**
     * Splits this text node into two text nodes at the specified offset and inserts the new text node into the tree as a sibling that immediately follows this node.
     * @param {Integer} offset The number of characters at which to split this text node into two nodes, starting from zero.
     * @returns {IXmlText} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.xml.dom.ixmltext.splittext
     */
    SplitText(offset) {
        result := ComCall(6, this, "uint", offset, "ptr*", &secondPart := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlText(secondPart)
    }
}
