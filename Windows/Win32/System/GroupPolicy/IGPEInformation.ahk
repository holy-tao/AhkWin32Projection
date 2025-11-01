#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IGPEInformation interface provides methods for Microsoft Management Console (MMC) extension snap-ins to communicate with the Group Policy Object Editor. For more information about MMC, see the Microsoft Management Console.
 * @remarks
 * 
  * To create and modify a GPO directly, without using the Group Policy Object Editor, see the methods of the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nn-gpedit-igrouppolicyobject">IGroupPolicyObject</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpedit/nn-gpedit-igpeinformation
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPEInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPEInformation
     * @type {Guid}
     */
    static IID => Guid("{8fc0b735-a0e1-11d1-a7d3-0000f87571e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDisplayName", "GetRegistryKey", "GetDSPath", "GetFileSysPath", "GetOptions", "GetType", "GetHint", "PolicyChanged"]

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getname
     */
    GetName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getdisplayname
     */
    GetDisplayName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {Pointer<HKEY>} hKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getregistrykey
     */
    GetRegistryKey(dwSection, hKey) {
        result := ComCall(5, this, "uint", dwSection, "ptr", hKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getdspath
     */
    GetDSPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getfilesyspath
     */
    GetFileSysPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getoptions
     */
    GetOptions(dwOptions) {
        result := ComCall(8, this, "uint*", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} gpoType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-gettype
     */
    GetType(gpoType) {
        result := ComCall(9, this, "int*", gpoType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} gpHint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-gethint
     */
    GetHint(gpHint) {
        result := ComCall(10, this, "int*", gpHint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bMachine 
     * @param {BOOL} bAdd 
     * @param {Pointer<Guid>} pGuidExtension 
     * @param {Pointer<Guid>} pGuidSnapin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-policychanged
     */
    PolicyChanged(bMachine, bAdd, pGuidExtension, pGuidSnapin) {
        result := ComCall(11, this, "int", bMachine, "int", bAdd, "ptr", pGuidExtension, "ptr", pGuidSnapin, "HRESULT")
        return result
    }
}
