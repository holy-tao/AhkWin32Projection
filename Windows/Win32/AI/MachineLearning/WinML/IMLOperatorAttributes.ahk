#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorAttributes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLOperatorAttributes
     * @type {Guid}
     */
    static IID => Guid("{4b1b1759-ec40-466c-aab4-beb5347fd24c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeElementCount", "GetAttribute", "GetStringAttributeElementLength", "GetStringAttributeElement"]

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} type 
     * @param {Pointer<Integer>} elementCount 
     * @returns {HRESULT} 
     */
    GetAttributeElementCount(name, type, elementCount) {
        result := ComCall(3, this, "ptr", name, "uint", type, "uint*", elementCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} type 
     * @param {Integer} elementCount 
     * @param {Pointer} elementByteSize 
     * @param {Pointer<Void>} value 
     * @returns {HRESULT} 
     */
    GetAttribute(name, type, elementCount, elementByteSize, value) {
        result := ComCall(4, this, "ptr", name, "uint", type, "uint", elementCount, "ptr", elementByteSize, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} elementIndex 
     * @param {Pointer<Integer>} attributeElementByteSize 
     * @returns {HRESULT} 
     */
    GetStringAttributeElementLength(name, elementIndex, attributeElementByteSize) {
        result := ComCall(5, this, "ptr", name, "uint", elementIndex, "uint*", attributeElementByteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} elementIndex 
     * @param {Integer} attributeElementByteSize 
     * @param {PSTR} attributeElement 
     * @returns {HRESULT} 
     */
    GetStringAttributeElement(name, elementIndex, attributeElementByteSize, attributeElement) {
        result := ComCall(6, this, "ptr", name, "uint", elementIndex, "uint", attributeElementByteSize, "ptr", attributeElement, "HRESULT")
        return result
    }
}
