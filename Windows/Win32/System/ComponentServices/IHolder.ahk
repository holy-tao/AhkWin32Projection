#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allocates or frees resources for an installed Resource Dispenser.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iholder
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IHolder extends IUnknown{
    /**
     * The interface identifier for IHolder
     * @type {Guid}
     */
    static IID => Guid("{bf6a1850-2b45-11cf-be10-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0000 
     * @param {Pointer<UIntPtr>} __MIDL__IHolder0001 
     * @returns {HRESULT} 
     */
    AllocResource(__MIDL__IHolder0000, __MIDL__IHolder0001) {
        result := ComCall(3, this, "ptr", __MIDL__IHolder0000, "ptr*", __MIDL__IHolder0001, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decrements (decreases by one) the reference count of a loaded resource. When the reference count reaches zero, the memory occupied by the resource is freed.
     * @param {Pointer} __MIDL__IHolder0002 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is nonzero, which indicates that the resource has not been freed.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-freeresource
     */
    FreeResource(__MIDL__IHolder0002) {
        result := ComCall(4, this, "ptr", __MIDL__IHolder0002, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0003 
     * @returns {HRESULT} 
     */
    TrackResource(__MIDL__IHolder0003) {
        result := ComCall(5, this, "ptr", __MIDL__IHolder0003, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} __MIDL__IHolder0004 
     * @returns {HRESULT} 
     */
    TrackResourceS(__MIDL__IHolder0004) {
        result := ComCall(6, this, "ushort*", __MIDL__IHolder0004, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0005 
     * @param {BOOL} __MIDL__IHolder0006 
     * @returns {HRESULT} 
     */
    UntrackResource(__MIDL__IHolder0005, __MIDL__IHolder0006) {
        result := ComCall(7, this, "ptr", __MIDL__IHolder0005, "int", __MIDL__IHolder0006, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} __MIDL__IHolder0007 
     * @param {BOOL} __MIDL__IHolder0008 
     * @returns {HRESULT} 
     */
    UntrackResourceS(__MIDL__IHolder0007, __MIDL__IHolder0008) {
        result := ComCall(8, this, "ushort*", __MIDL__IHolder0007, "int", __MIDL__IHolder0008, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0009 
     * @returns {HRESULT} 
     */
    RequestDestroyResource(__MIDL__IHolder0009) {
        result := ComCall(10, this, "ptr", __MIDL__IHolder0009, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
