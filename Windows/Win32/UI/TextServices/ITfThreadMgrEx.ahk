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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateEx", "GetActiveFlags"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgrex-activateex
     */
    ActivateEx(dwFlags) {
        result := ComCall(14, this, "uint*", &ptid := 0, "uint", dwFlags, "HRESULT")
        return ptid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgrex-getactiveflags
     */
    GetActiveFlags() {
        result := ComCall(15, this, "uint*", &lpdwFlags := 0, "HRESULT")
        return lpdwFlags
    }
}
