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
        bstrPackageFile := bstrPackageFile is String ? BSTR.Alloc(bstrPackageFile).Value : bstrPackageFile
        bstrInstallPath := bstrInstallPath is String ? BSTR.Alloc(bstrInstallPath).Value : bstrInstallPath

        result := ComCall(7, this, "ptr", bstrPackageFile, "ptr", bstrInstallPath, "int", lOptions, "HRESULT")
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
        bstrPackageID := bstrPackageID is String ? BSTR.Alloc(bstrPackageID).Value : bstrPackageID
        bstrPackageFile := bstrPackageFile is String ? BSTR.Alloc(bstrPackageFile).Value : bstrPackageFile

        result := ComCall(8, this, "ptr", bstrPackageID, "ptr", bstrPackageFile, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPackageID 
     * @returns {HRESULT} 
     */
    ShutdownPackage(bstrPackageID) {
        bstrPackageID := bstrPackageID is String ? BSTR.Alloc(bstrPackageID).Value : bstrPackageID

        result := ComCall(9, this, "ptr", bstrPackageID, "HRESULT")
        return result
    }
}
