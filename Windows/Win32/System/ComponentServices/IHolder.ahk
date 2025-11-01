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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocResource", "FreeResource", "TrackResource", "TrackResourceS", "UntrackResource", "UntrackResourceS", "Close", "RequestDestroyResource"]

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0000 
     * @param {Pointer<Pointer>} __MIDL__IHolder0001 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-allocresource
     */
    AllocResource(__MIDL__IHolder0000, __MIDL__IHolder0001) {
        result := ComCall(3, this, "ptr", __MIDL__IHolder0000, "ptr*", __MIDL__IHolder0001, "HRESULT")
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
        result := ComCall(4, this, "ptr", __MIDL__IHolder0002, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0003 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-trackresource
     */
    TrackResource(__MIDL__IHolder0003) {
        result := ComCall(5, this, "ptr", __MIDL__IHolder0003, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IHolder0004 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-trackresources
     */
    TrackResourceS(__MIDL__IHolder0004) {
        result := ComCall(6, this, "ushort*", __MIDL__IHolder0004, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0005 
     * @param {BOOL} __MIDL__IHolder0006 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-untrackresource
     */
    UntrackResource(__MIDL__IHolder0005, __MIDL__IHolder0006) {
        result := ComCall(7, this, "ptr", __MIDL__IHolder0005, "int", __MIDL__IHolder0006, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IHolder0007 
     * @param {BOOL} __MIDL__IHolder0008 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-untrackresources
     */
    UntrackResourceS(__MIDL__IHolder0007, __MIDL__IHolder0008) {
        result := ComCall(8, this, "ushort*", __MIDL__IHolder0007, "int", __MIDL__IHolder0008, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} __MIDL__IHolder0009 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iholder-requestdestroyresource
     */
    RequestDestroyResource(__MIDL__IHolder0009) {
        result := ComCall(10, this, "ptr", __MIDL__IHolder0009, "HRESULT")
        return result
    }
}
