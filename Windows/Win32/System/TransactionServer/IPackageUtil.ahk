#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class IPackageUtil extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageUtil
     * @type {Guid}
     */
    static IID => Guid("{6eb22874-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for PackageUtil
     * @type {Guid}
     */
    static CLSID => Guid("{6eb22885-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallPackage", "ExportPackage", "ShutdownPackage"]

    /**
     * 
     * @param {BSTR} bstrPackageFile 
     * @param {BSTR} bstrInstallPath 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     */
    InstallPackage(bstrPackageFile, bstrInstallPath, lOptions) {
        if(bstrPackageFile is String) {
            pin := BSTR.Alloc(bstrPackageFile)
            bstrPackageFile := pin.Value
        }
        if(bstrInstallPath is String) {
            pin := BSTR.Alloc(bstrInstallPath)
            bstrInstallPath := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrPackageFile, "ptr", bstrInstallPath, "int", lOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPackageID 
     * @param {BSTR} bstrPackageFile 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     */
    ExportPackage(bstrPackageID, bstrPackageFile, lOptions) {
        if(bstrPackageID is String) {
            pin := BSTR.Alloc(bstrPackageID)
            bstrPackageID := pin.Value
        }
        if(bstrPackageFile is String) {
            pin := BSTR.Alloc(bstrPackageFile)
            bstrPackageFile := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrPackageID, "ptr", bstrPackageFile, "int", lOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPackageID 
     * @returns {HRESULT} 
     */
    ShutdownPackage(bstrPackageID) {
        if(bstrPackageID is String) {
            pin := BSTR.Alloc(bstrPackageID)
            bstrPackageID := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrPackageID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
