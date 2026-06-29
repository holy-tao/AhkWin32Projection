#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct ITypeMarshal extends IUnknown {
    /**
     * The interface identifier for ITypeMarshal
     * @type {Guid}
     */
    static IID := Guid("{0000002d-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeMarshal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Size      : IntPtr
        Marshal   : IntPtr
        Unmarshal : IntPtr
        Free      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeMarshal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Represents an ordered pair of floating-point numbers that specify a height and width.
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwDestContext 
     * @param {Pointer<Void>} pvDestContext 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-size
     */
    Size(pvType, dwDestContext, pvDestContext) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvTypeMarshal, pvType, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint*", &pSize := 0, "HRESULT")
        return pSize
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwDestContext 
     * @param {Pointer<Void>} pvDestContext 
     * @param {Integer} cbBufferLength 
     * @param {Integer} pBuffer 
     * @returns {Integer} 
     */
    Marshal(pvType, dwDestContext, pvDestContext, cbBufferLength, pBuffer) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvTypeMarshal, pvType, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint", cbBufferLength, "ptr", pBuffer, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwFlags 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     */
    Unmarshal(pvType, dwFlags, cbBufferLength, pBuffer, pcbRead) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pvTypeMarshal, pvType, "uint", dwFlags, "uint", cbBufferLength, pBufferMarshal, pBuffer, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @returns {HRESULT} 
     */
    Free(pvType) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pvTypeMarshal, pvType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITypeMarshal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Size := CallbackCreate(GetMethod(implObj, "Size"), flags, 5)
        this.vtbl.Marshal := CallbackCreate(GetMethod(implObj, "Marshal"), flags, 7)
        this.vtbl.Unmarshal := CallbackCreate(GetMethod(implObj, "Unmarshal"), flags, 6)
        this.vtbl.Free := CallbackCreate(GetMethod(implObj, "Free"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Size)
        CallbackFree(this.vtbl.Marshal)
        CallbackFree(this.vtbl.Unmarshal)
        CallbackFree(this.vtbl.Free)
    }
}
