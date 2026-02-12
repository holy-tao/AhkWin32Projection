#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXmlNode.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlNodeList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlNodeList
     * @type {Guid}
     */
    static IID => Guid("{8c60ad77-83a4-4ec1-9c54-7ba429e13da6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Length", "Item"]

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} index 
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(index) {
        result := ComCall(7, this, "uint", index, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXmlNode(node_)
    }
}
