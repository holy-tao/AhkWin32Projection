#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITAllocatorProperties interface exposes the buffer allocator properties of the Media Streaming Terminal (MST) to an end-user or server application.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nn-tapi3ds-itallocatorproperties
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAllocatorProperties extends IUnknown{
    /**
     * The interface identifier for ITAllocatorProperties
     * @type {Guid}
     */
    static IID => Guid("{c1bc3c90-bcfe-11d1-9745-00c04fd91ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pAllocProperties 
     * @returns {HRESULT} 
     */
    SetAllocatorProperties(pAllocProperties) {
        result := ComCall(3, this, "ptr", pAllocProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pAllocProperties 
     * @returns {HRESULT} 
     */
    GetAllocatorProperties(pAllocProperties) {
        result := ComCall(4, this, "ptr", pAllocProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bAllocBuffers 
     * @returns {HRESULT} 
     */
    SetAllocateBuffers(bAllocBuffers) {
        result := ComCall(5, this, "int", bAllocBuffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAllocBuffers 
     * @returns {HRESULT} 
     */
    GetAllocateBuffers(pbAllocBuffers) {
        result := ComCall(6, this, "ptr", pbAllocBuffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    SetBufferSize(BufferSize) {
        result := ComCall(7, this, "uint", BufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pBufferSize 
     * @returns {HRESULT} 
     */
    GetBufferSize(pBufferSize) {
        result := ComCall(8, this, "uint*", pBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
