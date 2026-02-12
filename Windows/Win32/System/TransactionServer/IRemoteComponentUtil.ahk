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
        if(bstrServer is String) {
            pin := BSTR.Alloc(bstrServer)
            bstrServer := pin.Value
        }
        if(bstrPackageID is String) {
            pin := BSTR.Alloc(bstrPackageID)
            bstrPackageID := pin.Value
        }
        if(bstrCLSID is String) {
            pin := BSTR.Alloc(bstrCLSID)
            bstrCLSID := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrServer, "ptr", bstrPackageID, "ptr", bstrCLSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrServer is String) {
            pin := BSTR.Alloc(bstrServer)
            bstrServer := pin.Value
        }
        if(bstrPackageName is String) {
            pin := BSTR.Alloc(bstrPackageName)
            bstrPackageName := pin.Value
        }
        if(bstrProgID is String) {
            pin := BSTR.Alloc(bstrProgID)
            bstrProgID := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrServer, "ptr", bstrPackageName, "ptr", bstrProgID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
