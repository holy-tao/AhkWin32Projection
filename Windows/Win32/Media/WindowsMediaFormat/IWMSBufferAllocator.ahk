#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMSSBufferAllocator interface provides methods for allocating a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-iwmsbufferallocator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMSBufferAllocator extends IUnknown {
    /**
     * The interface identifier for IWMSBufferAllocator
     * @type {Guid}
     */
    static IID := Guid("{61103ca4-2033-11d2-9ef1-006097d2d7cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMSBufferAllocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AllocateBuffer         : IntPtr
        AllocatePageSizeBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMSBufferAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AllocateBuffer method initializes a buffer.
     * @param {Integer} dwMaxBufferSize <b>DWORD</b> containing the maximum size of the buffer in bytes.
     * @returns {INSSBuffer} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-iwmsbufferallocator-allocatebuffer
     */
    AllocateBuffer(dwMaxBufferSize) {
        result := ComCall(3, this, "uint", dwMaxBufferSize, "ptr*", &ppBuffer := 0, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    /**
     * The AllocatePageSizeBuffer method initializes a buffer that can be used to perform page-aligned reads.
     * @param {Integer} dwMaxBufferSize <b>DWORD</b> containing the size of the buffer in bytes.
     * @returns {INSSBuffer} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-iwmsbufferallocator-allocatepagesizebuffer
     */
    AllocatePageSizeBuffer(dwMaxBufferSize) {
        result := ComCall(4, this, "uint", dwMaxBufferSize, "ptr*", &ppBuffer := 0, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    Query(iid) {
        if (IWMSBufferAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AllocateBuffer := CallbackCreate(GetMethod(implObj, "AllocateBuffer"), flags, 3)
        this.vtbl.AllocatePageSizeBuffer := CallbackCreate(GetMethod(implObj, "AllocatePageSizeBuffer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AllocateBuffer)
        CallbackFree(this.vtbl.AllocatePageSizeBuffer)
    }
}
