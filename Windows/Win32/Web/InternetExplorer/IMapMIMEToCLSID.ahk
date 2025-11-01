#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IMapMIMEToCLSID extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapMIMEToCLSID
     * @type {Guid}
     */
    static IID => Guid("{d9e89500-30fa-11d0-b724-00aa006c1a01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableDefaultMappings", "MapMIMEToCLSID", "SetMapping"]

    /**
     * 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     */
    EnableDefaultMappings(bEnable) {
        result := ComCall(3, this, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMIMEType 
     * @param {Pointer<Guid>} pCLSID 
     * @returns {HRESULT} 
     */
    MapMIMEToCLSID(pszMIMEType, pCLSID) {
        pszMIMEType := pszMIMEType is String ? StrPtr(pszMIMEType) : pszMIMEType

        result := ComCall(4, this, "ptr", pszMIMEType, "ptr", pCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMIMEType 
     * @param {Integer} dwMapMode 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    SetMapping(pszMIMEType, dwMapMode, clsid) {
        pszMIMEType := pszMIMEType is String ? StrPtr(pszMIMEType) : pszMIMEType

        result := ComCall(5, this, "ptr", pszMIMEType, "uint", dwMapMode, "ptr", clsid, "HRESULT")
        return result
    }
}
