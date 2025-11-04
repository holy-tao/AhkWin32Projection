#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INetDiagHelperInfo interface provides a method that is called by the Network Diagnostics Framework (NDF) when it needs to validate that it has the necessary information for a helper class and that it has chosen the correct helper class.
 * @see https://docs.microsoft.com/windows/win32/api//ndhelper/nn-ndhelper-inetdiaghelperinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagHelperInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetDiagHelperInfo
     * @type {Guid}
     */
    static IID => Guid("{c0b35747-ebf5-11d8-bbe9-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeInfo"]

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HelperAttributeInfo>>} pprgAttributeInfos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ndhelper/nf-ndhelper-inetdiaghelperinfo-getattributeinfo
     */
    GetAttributeInfo(pcelt, pprgAttributeInfos) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        pprgAttributeInfosMarshal := pprgAttributeInfos is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pceltMarshal, pcelt, pprgAttributeInfosMarshal, pprgAttributeInfos, "HRESULT")
        return result
    }
}
