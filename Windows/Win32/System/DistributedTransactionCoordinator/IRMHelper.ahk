#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IRMHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRMHelper
     * @type {Guid}
     */
    static IID => Guid("{e793f6d1-f53d-11cf-a60d-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RMCount", "RMInfo"]

    /**
     * 
     * @param {Integer} dwcTotalNumberOfRMs 
     * @returns {HRESULT} 
     */
    RMCount(dwcTotalNumberOfRMs) {
        result := ComCall(3, this, "uint", dwcTotalNumberOfRMs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<xa_switch_t>} pXa_Switch 
     * @param {BOOL} fCDeclCallingConv 
     * @param {PSTR} pszOpenString 
     * @param {PSTR} pszCloseString 
     * @param {Guid} guidRMRecovery 
     * @returns {HRESULT} 
     */
    RMInfo(pXa_Switch, fCDeclCallingConv, pszOpenString, pszCloseString, guidRMRecovery) {
        pszOpenString := pszOpenString is String ? StrPtr(pszOpenString) : pszOpenString
        pszCloseString := pszCloseString is String ? StrPtr(pszCloseString) : pszCloseString

        result := ComCall(4, this, "ptr", pXa_Switch, "int", fCDeclCallingConv, "ptr", pszOpenString, "ptr", pszCloseString, "ptr", guidRMRecovery, "HRESULT")
        return result
    }
}
