#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IMemoryBufferByteAccess extends IUnknown {
    /**
     * The interface identifier for IMemoryBufferByteAccess
     * @type {Guid}
     */
    static IID := Guid("{5b0d3235-4dba-4d44-865e-8f1d0e4fd04d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMemoryBufferByteAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMemoryBufferByteAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an IMemoryBuffer as an array of bytes.
     * @remarks
     * When <a href="https://docs.microsoft.com/uwp/api/windows.foundation.memorybuffer.close">MemoryBuffer::Close</a> is called, the code using this buffer should set the <i>value</i> pointer to null.
     * @param {Pointer<Pointer<Integer>>} value A pointer to a byte array containing the buffer data.
     * @param {Pointer<Integer>} capacity The number of bytes in the returned array
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/memorybuffer/nf-memorybuffer-imemorybufferbyteaccess-getbuffer
     */
    GetBuffer(value, capacity) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"
        capacityMarshal := capacity is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, valueMarshal, value, capacityMarshal, capacity, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMemoryBufferByteAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBuffer)
    }
}
