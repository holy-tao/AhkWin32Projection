#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfThreadMgr.ahk

/**
 * The ITfThreadMgrEx interface is used by the application to activate the textservices with some flags. ITfThreadMgrEx can be obtained by QI from ITfThreadMgr.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgrex
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgrEx extends ITfThreadMgr{
    /**
     * The interface identifier for ITfThreadMgrEx
     * @type {Guid}
     */
    static IID => Guid("{3e90ade3-7594-4cb0-bb58-69628f5f458c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<UInt32>} ptid 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ActivateEx(ptid, dwFlags) {
        result := ComCall(14, this, "uint*", ptid, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpdwFlags 
     * @returns {HRESULT} 
     */
    GetActiveFlags(lpdwFlags) {
        result := ComCall(15, this, "uint*", lpdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
