#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk

/**
 * Represents additional information about a filter that can be used to control which changes are included in an ISyncChangeBatch object.
 * @remarks
 * 
 * <b>ISyncFilterInfo2</b> can obtained by calling <b>QueryInterface</b> on an <b>ISyncFilterInfo</b> object or an object derived from <b>ISyncFilterInfo</b>, such as an <b>IChangeUnitListFilterInfo</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncfilterinfo2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFilterInfo2 extends ISyncFilterInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncFilterInfo2
     * @type {Guid}
     */
    static IID => Guid("{19b394ba-e3d0-468c-934d-321968b2ab34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFlags"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfilterinfo2-getflags
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }
}
