#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorAttributes extends IUnknown{
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
     * 
     * @param {PSTR} name 
     * @param {Integer} type 
     * @param {Pointer<UInt32>} elementCount 
     * @returns {HRESULT} 
     */
    GetAttributeElementCount(name, type, elementCount) {
        result := ComCall(3, this, "ptr", name, "uint", type, "uint*", elementCount, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(4, this, "ptr", name, "uint", type, "uint", elementCount, "ptr", elementByteSize, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} elementIndex 
     * @param {Pointer<UInt32>} attributeElementByteSize 
     * @returns {HRESULT} 
     */
    GetStringAttributeElementLength(name, elementIndex, attributeElementByteSize) {
        result := ComCall(5, this, "ptr", name, "uint", elementIndex, "uint*", attributeElementByteSize, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "ptr", name, "uint", elementIndex, "uint", attributeElementByteSize, "ptr", attributeElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
