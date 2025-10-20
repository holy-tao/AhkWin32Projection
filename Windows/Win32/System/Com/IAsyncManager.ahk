#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAsyncManager extends IUnknown{
    /**
     * The interface identifier for IAsyncManager
     * @type {Guid}
     */
    static IID => Guid("{0000002a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} Result 
     * @returns {HRESULT} 
     */
    CompleteCall(Result) {
        result := ComCall(3, this, "int", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pInterface 
     * @returns {HRESULT} 
     */
    GetCallContext(riid, pInterface) {
        result := ComCall(4, this, "ptr", riid, "ptr", pInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStateFlags 
     * @returns {HRESULT} 
     */
    GetState(pulStateFlags) {
        result := ComCall(5, this, "uint*", pulStateFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
