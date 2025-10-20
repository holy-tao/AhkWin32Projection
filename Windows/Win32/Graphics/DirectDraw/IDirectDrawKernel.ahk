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
     * 
     * @param {Pointer<DDKERNELCAPS>} param0 
     * @returns {HRESULT} 
     */
    GetCaps(param0) {
        result := ComCall(3, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} param0 
     * @returns {HRESULT} 
     */
    GetKernelHandle(param0) {
        result := ComCall(4, this, "ptr*", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseKernelHandle() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
