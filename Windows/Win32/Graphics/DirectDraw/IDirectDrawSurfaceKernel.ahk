#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nn-ddkernel-idirectdrawsurfacekernel
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawSurfaceKernel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawSurfaceKernel
     * @type {Guid}
     */
    static IID => Guid("{60755da0-6a40-11d0-9b06-00a0c903a3b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKernelHandle", "ReleaseKernelHandle"]

    /**
     * 
     * @param {Pointer<Pointer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawsurfacekernel-getkernelhandle
     */
    GetKernelHandle(param0) {
        param0Marshal := param0 is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawsurfacekernel-releasekernelhandle
     */
    ReleaseKernelHandle() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
