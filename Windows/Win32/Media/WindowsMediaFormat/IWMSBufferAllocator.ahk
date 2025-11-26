#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSSBufferAllocator interface provides methods for allocating a buffer.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-iwmsbufferallocator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSBufferAllocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSBufferAllocator
     * @type {Guid}
     */
    static IID => Guid("{61103ca4-2033-11d2-9ef1-006097d2d7cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocateBuffer", "AllocatePageSizeBuffer"]

    /**
     * The AllocateBuffer method initializes a buffer.
     * @param {Integer} dwMaxBufferSize <b>DWORD</b> containing the maximum size of the buffer in bytes.
     * @returns {INSSBuffer} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-iwmsbufferallocator-allocatebuffer
     */
    AllocateBuffer(dwMaxBufferSize) {
        result := ComCall(3, this, "uint", dwMaxBufferSize, "ptr*", &ppBuffer := 0, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    /**
     * The AllocatePageSizeBuffer method initializes a buffer that can be used to perform page-aligned reads.
     * @param {Integer} dwMaxBufferSize <b>DWORD</b> containing the size of the buffer in bytes.
     * @returns {INSSBuffer} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-iwmsbufferallocator-allocatepagesizebuffer
     */
    AllocatePageSizeBuffer(dwMaxBufferSize) {
        result := ComCall(4, this, "uint", dwMaxBufferSize, "ptr*", &ppBuffer := 0, "HRESULT")
        return INSSBuffer(ppBuffer)
    }
}
