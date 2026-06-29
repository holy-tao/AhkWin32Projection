#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPrintSchemaDisplayableElement.ahk" { IPrintSchemaDisplayableElement }
#Import ".\PrintSchemaParameterDataType.ahk" { PrintSchemaParameterDataType }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaParameterDefinition extends IPrintSchemaDisplayableElement {
    /**
     * The interface identifier for IPrintSchemaParameterDefinition
     * @type {Guid}
     */
    static IID := Guid("{b5ade81e-0e61-4fe1-81c6-c333e4ffe0f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaParameterDefinition interfaces
    */
    struct Vtbl extends IPrintSchemaDisplayableElement.Vtbl {
        get_UserInputRequired : IntPtr
        get_UnitType          : IntPtr
        get_DataType          : IntPtr
        get_RangeMin          : IntPtr
        get_RangeMax          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaParameterDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    UserInputRequired {
        get => this.get_UserInputRequired()
    }

    /**
     * @type {BSTR} 
     */
    UnitType {
        get => this.get_UnitType()
    }

    /**
     * @type {PrintSchemaParameterDataType} 
     */
    DataType {
        get => this.get_DataType()
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
     * @returns {BOOL} 
     */
    get_UserInputRequired() {
        result := ComCall(11, this, BOOL.Ptr, &pbIsRequired := 0, "HRESULT")
        return pbIsRequired
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UnitType() {
        pbstrUnitType := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrUnitType, "HRESULT")
        return pbstrUnitType
    }

    /**
     * 
     * @returns {PrintSchemaParameterDataType} 
     */
    get_DataType() {
        result := ComCall(13, this, "int*", &pDataType := 0, "HRESULT")
        return pDataType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMin() {
        result := ComCall(14, this, "int*", &pRangeMin := 0, "HRESULT")
        return pRangeMin
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMax() {
        result := ComCall(15, this, "int*", &pRangeMax := 0, "HRESULT")
        return pRangeMax
    }

    Query(iid) {
        if (IPrintSchemaParameterDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserInputRequired := CallbackCreate(GetMethod(implObj, "get_UserInputRequired"), flags, 2)
        this.vtbl.get_UnitType := CallbackCreate(GetMethod(implObj, "get_UnitType"), flags, 2)
        this.vtbl.get_DataType := CallbackCreate(GetMethod(implObj, "get_DataType"), flags, 2)
        this.vtbl.get_RangeMin := CallbackCreate(GetMethod(implObj, "get_RangeMin"), flags, 2)
        this.vtbl.get_RangeMax := CallbackCreate(GetMethod(implObj, "get_RangeMax"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserInputRequired)
        CallbackFree(this.vtbl.get_UnitType)
        CallbackFree(this.vtbl.get_DataType)
        CallbackFree(this.vtbl.get_RangeMin)
        CallbackFree(this.vtbl.get_RangeMax)
    }
}
