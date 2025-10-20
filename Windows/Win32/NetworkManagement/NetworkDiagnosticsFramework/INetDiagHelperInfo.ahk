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
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @param {Pointer<HelperAttributeInfo>} pprgAttributeInfos 
     * @returns {HRESULT} 
     */
    GetAttributeInfo(pcelt, pprgAttributeInfos) {
        result := ComCall(3, this, "uint*", pcelt, "ptr", pprgAttributeInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
