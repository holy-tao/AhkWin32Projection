#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetHttpTimeouts extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRequestTimeouts"]

    /**
     * 
     * @param {Pointer<Integer>} pdwConnectTimeout 
     * @param {Pointer<Integer>} pdwSendTimeout 
     * @param {Pointer<Integer>} pdwReceiveTimeout 
     * @returns {HRESULT} 
     */
    GetRequestTimeouts(pdwConnectTimeout, pdwSendTimeout, pdwReceiveTimeout) {
        pdwConnectTimeoutMarshal := pdwConnectTimeout is VarRef ? "uint*" : "ptr"
        pdwSendTimeoutMarshal := pdwSendTimeout is VarRef ? "uint*" : "ptr"
        pdwReceiveTimeoutMarshal := pdwReceiveTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwConnectTimeoutMarshal, pdwConnectTimeout, pdwSendTimeoutMarshal, pdwSendTimeout, pdwReceiveTimeoutMarshal, pdwReceiveTimeout, "HRESULT")
        return result
    }
}
