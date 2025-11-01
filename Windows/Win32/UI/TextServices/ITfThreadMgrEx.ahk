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
     * @param {Pointer<Integer>} ptid 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgrex-activateex
     */
    ActivateEx(ptid, dwFlags) {
        ptidMarshal := ptid is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, ptidMarshal, ptid, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgrex-getactiveflags
     */
    GetActiveFlags(lpdwFlags) {
        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, lpdwFlagsMarshal, lpdwFlags, "HRESULT")
        return result
    }
}
