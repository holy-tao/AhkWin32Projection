#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSSBufferAllocator interface provides methods for allocating a buffer.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-iwmsbufferallocator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSBufferAllocator extends IUnknown{
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
     * 
     * @param {Integer} dwMaxBufferSize 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    AllocateBuffer(dwMaxBufferSize, ppBuffer) {
        result := ComCall(3, this, "uint", dwMaxBufferSize, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxBufferSize 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    AllocatePageSizeBuffer(dwMaxBufferSize, ppBuffer) {
        result := ComCall(4, this, "uint", dwMaxBufferSize, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
