#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a buffer as an array of bytes.
 * @remarks
 * The client creates an [IBuffer](/uwp/api/Windows.Storage.Streams.IBuffer) object, and the buffer is provided by the [Buffer](nf-robuffer-ibufferbyteaccess-buffer.md) method.
 * 
 * When you implement the **IBuffer** interface, you must implement the **IBufferByteAccess** interface.
 * @see https://learn.microsoft.com/windows/win32/api/robuffer/ns-robuffer-ibufferbyteaccess
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IBufferByteAccess extends IUnknown {
    /**
     * The interface identifier for IBufferByteAccess
     * @type {Guid}
     */
    static IID := Guid("{905a0fef-bc53-11df-8c49-001e4fc686da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBufferByteAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Buffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBufferByteAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the array of bytes in the buffer.
     * @returns {Pointer<Integer>} The byte array.
     * @see https://learn.microsoft.com/windows/win32/api/robuffer/nf-robuffer-ibufferbyteaccess-buffer
     */
    Buffer() {
        result := ComCall(3, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IBufferByteAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Buffer := CallbackCreate(GetMethod(implObj, "Buffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Buffer)
    }
}
