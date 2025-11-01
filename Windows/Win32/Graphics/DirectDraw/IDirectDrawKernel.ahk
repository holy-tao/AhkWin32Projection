#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IDirectDrawKernel interface
 * @see https://docs.microsoft.com/windows/win32/api//ddkernel/nn-ddkernel-idirectdrawkernel
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawKernel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawKernel
     * @type {Guid}
     */
    static IID => Guid("{8d56c120-6a08-11d0-9b06-00a0c903a3b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "GetKernelHandle", "ReleaseKernelHandle"]

    /**
     * 
     * @param {Pointer<DDKERNELCAPS>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawkernel-getcaps
     */
    GetCaps(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawkernel-getkernelhandle
     */
    GetKernelHandle(param0) {
        result := ComCall(4, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawkernel-releasekernelhandle
     */
    ReleaseKernelHandle() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
