#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\UDTKind.ahk" { UDTKind }
#Import ".\IDebugHostType3.ahk" { IDebugHostType3 }
#Import ".\ExtendedArrayDimension.ahk" { ExtendedArrayDimension }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostType4 extends IDebugHostType3 {
    /**
     * The interface identifier for IDebugHostType4
     * @type {Guid}
     */
    static IID := Guid("{77d3cdc6-bd55-42bf-a4fd-d9aa60e3c1e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostType4 interfaces
    */
    struct Vtbl extends IDebugHostType3.Vtbl {
        GetExtendedArrayHeaderSize : IntPtr
        GetExtendedArrayDimensions : IntPtr
        GetUDTKind                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostType4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExtendedArrayHeaderSize() {
        result := ComCall(35, this, "uint*", &headerSize := 0, "HRESULT")
        return headerSize
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @returns {ExtendedArrayDimension} 
     */
    GetExtendedArrayDimensions(dimensions) {
        pDimensions := ExtendedArrayDimension()
        result := ComCall(36, this, "uint", dimensions, ExtendedArrayDimension.Ptr, pDimensions, "HRESULT")
        return pDimensions
    }

    /**
     * 
     * @returns {UDTKind} 
     */
    GetUDTKind() {
        result := ComCall(37, this, "int*", &_udtKind := 0, "HRESULT")
        return _udtKind
    }

    Query(iid) {
        if (IDebugHostType4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtendedArrayHeaderSize := CallbackCreate(GetMethod(implObj, "GetExtendedArrayHeaderSize"), flags, 2)
        this.vtbl.GetExtendedArrayDimensions := CallbackCreate(GetMethod(implObj, "GetExtendedArrayDimensions"), flags, 3)
        this.vtbl.GetUDTKind := CallbackCreate(GetMethod(implObj, "GetUDTKind"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtendedArrayHeaderSize)
        CallbackFree(this.vtbl.GetExtendedArrayDimensions)
        CallbackFree(this.vtbl.GetUDTKind)
    }
}
