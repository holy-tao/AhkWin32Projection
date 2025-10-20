#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalDetailsEnumerator extends IUnknown{
    /**
     * The interface identifier for IDebugHostFunctionLocalDetailsEnumerator
     * @type {Guid}
     */
    static IID => Guid("{a61adc36-1ed5-40fe-a976-6a21cd81e811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostFunctionLocalDetails>} localDetails 
     * @returns {HRESULT} 
     */
    GetNext(localDetails) {
        result := ComCall(4, this, "ptr", localDetails, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
