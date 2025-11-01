#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMExtensionInfo
     * @type {Guid}
     */
    static IID => Guid("{49acde79-9788-4d0a-8aa0-1746afdb9e9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupplierPID", "get_SupplierTaskID", "get_Title", "get_IconPath", "get_ExtraFile", "get_InvocationInfo"]

    /**
     * 
     * @param {Pointer<Guid>} pSupplierPID 
     * @returns {HRESULT} 
     */
    get_SupplierPID(pSupplierPID) {
        result := ComCall(3, this, "ptr", pSupplierPID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSupplierTID 
     * @returns {HRESULT} 
     */
    get_SupplierTaskID(pSupplierTID) {
        result := ComCall(4, this, "ptr", pSupplierTID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTitle 
     * @returns {HRESULT} 
     */
    get_Title(pTitle) {
        result := ComCall(5, this, "ptr", pTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pIconPath 
     * @returns {HRESULT} 
     */
    get_IconPath(pIconPath) {
        result := ComCall(6, this, "ptr", pIconPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pFilePath 
     * @returns {HRESULT} 
     */
    get_ExtraFile(pFilePath) {
        result := ComCall(7, this, "ptr", pFilePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(8, this, "ptr", pImageUrn, "ptr", pParameters, "HRESULT")
        return result
    }
}
