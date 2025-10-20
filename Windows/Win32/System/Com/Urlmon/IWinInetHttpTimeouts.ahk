#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetHttpTimeouts extends IUnknown{
    /**
     * The interface identifier for IWinInetHttpTimeouts
     * @type {Guid}
     */
    static IID => Guid("{f286fa56-c1fd-4270-8e67-b3eb790a81e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwConnectTimeout 
     * @param {Pointer<UInt32>} pdwSendTimeout 
     * @param {Pointer<UInt32>} pdwReceiveTimeout 
     * @returns {HRESULT} 
     */
    GetRequestTimeouts(pdwConnectTimeout, pdwSendTimeout, pdwReceiveTimeout) {
        result := ComCall(3, this, "uint*", pdwConnectTimeout, "uint*", pdwSendTimeout, "uint*", pdwReceiveTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
