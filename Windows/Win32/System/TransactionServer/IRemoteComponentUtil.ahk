#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class IRemoteComponentUtil extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteComponentUtil
     * @type {Guid}
     */
    static IID => Guid("{6eb22875-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for RemoteComponentUtil
     * @type {Guid}
     */
    static CLSID => Guid("{6eb22886-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallRemoteComponent", "InstallRemoteComponentByName"]

    /**
     * 
     * @param {BSTR} bstrServer 
     * @param {BSTR} bstrPackageID 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    InstallRemoteComponent(bstrServer, bstrPackageID, bstrCLSID) {
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer
        bstrPackageID := bstrPackageID is String ? BSTR.Alloc(bstrPackageID).Value : bstrPackageID
        bstrCLSID := bstrCLSID is String ? BSTR.Alloc(bstrCLSID).Value : bstrCLSID

        result := ComCall(7, this, "ptr", bstrServer, "ptr", bstrPackageID, "ptr", bstrCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServer 
     * @param {BSTR} bstrPackageName 
     * @param {BSTR} bstrProgID 
     * @returns {HRESULT} 
     */
    InstallRemoteComponentByName(bstrServer, bstrPackageName, bstrProgID) {
        bstrServer := bstrServer is String ? BSTR.Alloc(bstrServer).Value : bstrServer
        bstrPackageName := bstrPackageName is String ? BSTR.Alloc(bstrPackageName).Value : bstrPackageName
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        result := ComCall(8, this, "ptr", bstrServer, "ptr", bstrPackageName, "ptr", bstrProgID, "HRESULT")
        return result
    }
}
