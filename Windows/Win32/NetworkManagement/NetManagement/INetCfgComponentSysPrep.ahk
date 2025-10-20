#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentSysPrep extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentSysPrep
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae9a-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveAdapterParameters", "RestoreAdapterParameters"]

    /**
     * 
     * @param {INetCfgSysPrep} pncsp 
     * @param {PWSTR} pszwAnswerSections 
     * @param {Pointer<Guid>} pAdapterInstanceGuid 
     * @returns {HRESULT} 
     */
    SaveAdapterParameters(pncsp, pszwAnswerSections, pAdapterInstanceGuid) {
        pszwAnswerSections := pszwAnswerSections is String ? StrPtr(pszwAnswerSections) : pszwAnswerSections

        result := ComCall(3, this, "ptr", pncsp, "ptr", pszwAnswerSections, "ptr", pAdapterInstanceGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwAnswerFile 
     * @param {PWSTR} pszwAnswerSection 
     * @param {Pointer<Guid>} pAdapterInstanceGuid 
     * @returns {HRESULT} 
     */
    RestoreAdapterParameters(pszwAnswerFile, pszwAnswerSection, pAdapterInstanceGuid) {
        pszwAnswerFile := pszwAnswerFile is String ? StrPtr(pszwAnswerFile) : pszwAnswerFile
        pszwAnswerSection := pszwAnswerSection is String ? StrPtr(pszwAnswerSection) : pszwAnswerSection

        result := ComCall(4, this, "ptr", pszwAnswerFile, "ptr", pszwAnswerSection, "ptr", pAdapterInstanceGuid, "HRESULT")
        return result
    }
}
