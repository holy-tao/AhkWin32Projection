#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostStatus extends IUnknown{
    /**
     * The interface identifier for IDebugHostStatus
     * @type {Guid}
     */
    static IID => Guid("{4f3e1ce2-86b2-4c7a-9c65-d0a9d0eecf44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Boolean>} interruptRequested 
     * @returns {HRESULT} 
     */
    PollUserInterrupt(interruptRequested) {
        result := ComCall(3, this, "int*", interruptRequested, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
