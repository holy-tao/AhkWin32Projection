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
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     */
    GetName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "int", cchMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     */
    GetDisplayName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "int", cchMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {Pointer<HKEY>} hKey 
     * @returns {HRESULT} 
     */
    GetRegistryKey(dwSection, hKey) {
        result := ComCall(5, this, "uint", dwSection, "ptr", hKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxPath 
     * @returns {HRESULT} 
     */
    GetDSPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxPath 
     * @returns {HRESULT} 
     */
    GetFileSysPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwOptions 
     * @returns {HRESULT} 
     */
    GetOptions(dwOptions) {
        result := ComCall(8, this, "uint*", dwOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} gpoType 
     * @returns {HRESULT} 
     */
    GetType(gpoType) {
        result := ComCall(9, this, "int*", gpoType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} gpHint 
     * @returns {HRESULT} 
     */
    GetHint(gpHint) {
        result := ComCall(10, this, "int*", gpHint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMachine 
     * @param {BOOL} bAdd 
     * @param {Pointer<Guid>} pGuidExtension 
     * @param {Pointer<Guid>} pGuidSnapin 
     * @returns {HRESULT} 
     */
    PolicyChanged(bMachine, bAdd, pGuidExtension, pGuidSnapin) {
        result := ComCall(11, this, "int", bMachine, "int", bAdd, "ptr", pGuidExtension, "ptr", pGuidSnapin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
