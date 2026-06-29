#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MLOperatorAttributeType.ahk" { MLOperatorAttributeType }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorAttributes extends IUnknown {
    /**
     * The interface identifier for IMLOperatorAttributes
     * @type {Guid}
     */
    static IID := Guid("{4b1b1759-ec40-466c-aab4-beb5347fd24c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorAttributes interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAttributeElementCount        : IntPtr
        GetAttribute                    : IntPtr
        GetStringAttributeElementLength : IntPtr
        GetStringAttributeElement       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorAttributes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {MLOperatorAttributeType} type 
     * @returns {Integer} 
     */
    GetAttributeElementCount(name, type) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, MLOperatorAttributeType, type, "uint*", &elementCount := 0, "HRESULT")
        return elementCount
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {MLOperatorAttributeType} type 
     * @param {Integer} elementCount 
     * @param {Pointer} elementByteSize 
     * @returns {Void} 
     */
    GetAttribute(name, type, elementCount, elementByteSize) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", name, MLOperatorAttributeType, type, "uint", elementCount, "ptr", elementByteSize, "ptr", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {PSTR} name 
     * @param {Integer} elementIndex 
     * @returns {Integer} 
     */
    GetStringAttributeElementLength(name, elementIndex) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(5, this, "ptr", name, "uint", elementIndex, "uint*", &attributeElementByteSize := 0, "HRESULT")
        return attributeElementByteSize
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
        name := name is String ? StrPtr(name) : name
        attributeElement := attributeElement is String ? StrPtr(attributeElement) : attributeElement

        result := ComCall(6, this, "ptr", name, "uint", elementIndex, "uint", attributeElementByteSize, "ptr", attributeElement, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorAttributes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAttributeElementCount := CallbackCreate(GetMethod(implObj, "GetAttributeElementCount"), flags, 4)
        this.vtbl.GetAttribute := CallbackCreate(GetMethod(implObj, "GetAttribute"), flags, 6)
        this.vtbl.GetStringAttributeElementLength := CallbackCreate(GetMethod(implObj, "GetStringAttributeElementLength"), flags, 4)
        this.vtbl.GetStringAttributeElement := CallbackCreate(GetMethod(implObj, "GetStringAttributeElement"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAttributeElementCount)
        CallbackFree(this.vtbl.GetAttribute)
        CallbackFree(this.vtbl.GetStringAttributeElementLength)
        CallbackFree(this.vtbl.GetStringAttributeElement)
    }
}
