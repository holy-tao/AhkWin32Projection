#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods and properties that store the target name returned by a load-balancing algorithm.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbloadbalanceresult
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbLoadBalanceResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbLoadBalanceResult
     * @type {Guid}
     */
    static IID => Guid("{24fdb7ac-fea6-11dc-9672-9a8956d89593}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetName"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbloadbalanceresult-get_targetname
     */
    get_TargetName(pVal) {
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return result
    }
}
