#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentSetup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentSetup
     * @type {Guid}
     */
    static IID => Guid("{932238e3-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Install", "Upgrade", "ReadAnswerFile", "Removing"]

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Install element specifies values used by Windows Media Player to install an online store.
     * @remarks
     * If any of the required attributes are missing or not available, Windows Media Player setup will not attempt to download and install the online store provider code. Setup will configure the offline default values as specified in the **ServiceInfo** document. **ServiceInfo** can be used when not connected to the Internet by passing the default provider name and the **ServiceInfo** information as command-line parameters. See [Redistributing Windows Media Player Software](redistributing-windows-media-player-software.md) for details about command-line options.
     * 
     * > [!Note]  
     * > Use of this element requires that you sign a redistribution agreement with Microsoft. Contact your business representative for details.
     * @param {Integer} dwSetupFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/install-element
     */
    Install(dwSetupFlags) {
        result := ComCall(3, this, "uint", dwSetupFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The UpgradeCode property is a GUID representing a related set of products. The UpgradeCode is used in the Upgrade Table to search for related versions of the product that are already installed.This property is used by the RegisterProduct action.
     * @remarks
     * It is strongly recommended that authors of installation packages specify an **UpgradeCode** for their application.
     * @param {Integer} dwSetupFlags 
     * @param {Integer} dwUpgradeFomBuildNo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Msi/upgradecode
     */
    Upgrade(dwSetupFlags, dwUpgradeFomBuildNo) {
        result := ComCall(4, this, "uint", dwSetupFlags, "uint", dwUpgradeFomBuildNo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwAnswerFile 
     * @param {PWSTR} pszwAnswerSections 
     * @returns {HRESULT} 
     */
    ReadAnswerFile(pszwAnswerFile, pszwAnswerSections) {
        pszwAnswerFile := pszwAnswerFile is String ? StrPtr(pszwAnswerFile) : pszwAnswerFile
        pszwAnswerSections := pszwAnswerSections is String ? StrPtr(pszwAnswerSections) : pszwAnswerSections

        result := ComCall(5, this, "ptr", pszwAnswerFile, "ptr", pszwAnswerSections, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removing a Column from a SQL Server Table (Native Client OLE DB provider)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-tables-indexes/removing-a-column-from-a-sql-server-table
     */
    Removing() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
