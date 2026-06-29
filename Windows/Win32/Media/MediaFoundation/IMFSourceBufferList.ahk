#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSourceBuffer.ahk" { IMFSourceBuffer }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a collection of IMFSourceBuffer objects.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfsourcebufferlist
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceBufferList extends IUnknown {
    /**
     * The interface identifier for IMFSourceBufferList
     * @type {Guid}
     */
    static IID := Guid("{249981f8-8325-41f3-b80c-3b9e3aad0cbe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceBufferList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength       : IntPtr
        GetSourceBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceBufferList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of IMFSourceBuffer objects in the list.
     * @returns {Integer} The number of source buffers in the list.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebufferlist-getlength
     */
    GetLength() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Gets the IMFSourceBuffer at the specified index in the list.
     * @param {Integer} index The index of the source buffer to get.
     * @returns {IMFSourceBuffer} The source buffer.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebufferlist-getsourcebuffer
     */
    GetSourceBuffer(index) {
        result := ComCall(4, this, "uint", index, IMFSourceBuffer)
        return result
    }

    Query(iid) {
        if (IMFSourceBufferList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 1)
        this.vtbl.GetSourceBuffer := CallbackCreate(GetMethod(implObj, "GetSourceBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetSourceBuffer)
    }
}
