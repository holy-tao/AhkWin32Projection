#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IGroupPolicyObject interface provides methods to create and modify a GPO directly, without using the Group Policy Object Editor.
 * @remarks
 * 
  * For methods that Microsoft Management Console (MMC) extension snap-ins can use to communicate with the Group Policy Object Editor, see the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nn-gpedit-igpeinformation">IGPEInformation</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpedit/nn-gpedit-igrouppolicyobject
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGroupPolicyObject extends IUnknown{
    /**
     * The interface identifier for IGroupPolicyObject
     * @type {Guid}
     */
    static IID => Guid("{ea502723-a23d-11d1-a7d3-0000f87571e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszDomainName 
     * @param {PWSTR} pszDisplayName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    New(pszDomainName, pszDisplayName, dwFlags) {
        pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pszDomainName, "ptr", pszDisplayName, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OpenDSGPO(pszPath, dwFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OpenLocalMachineGPO(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszComputerName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OpenRemoteMachineGPO(pszComputerName, dwFlags) {
        pszComputerName := pszComputerName is String ? StrPtr(pszComputerName) : pszComputerName

        result := ComCall(6, this, "ptr", pszComputerName, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMachine 
     * @param {BOOL} bAdd 
     * @param {Pointer<Guid>} pGuidExtension 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    Save(bMachine, bAdd, pGuidExtension, pGuid) {
        result := ComCall(7, this, "int", bMachine, "int", bAdd, "ptr", pGuidExtension, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(8, this, "int")
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
    GetName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, "int", cchMaxLength, "int")
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

        result := ComCall(10, this, "ptr", pszName, "int", cchMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    SetDisplayName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(11, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pszPath, cchMaxLength) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(12, this, "ptr", pszPath, "int", cchMaxLength, "int")
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

        result := ComCall(13, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "int")
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

        result := ComCall(14, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "int")
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
        result := ComCall(15, this, "uint", dwSection, "ptr", hKey, "int")
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
        result := ComCall(16, this, "uint*", dwOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     */
    SetOptions(dwOptions, dwMask) {
        result := ComCall(17, this, "uint", dwOptions, "uint", dwMask, "int")
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
        result := ComCall(18, this, "int*", gpoType, "int")
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
    GetMachineName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(19, this, "ptr", pszName, "int", cchMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HPROPSHEETPAGE>} hPages 
     * @param {Pointer<UInt32>} uPageCount 
     * @returns {HRESULT} 
     */
    GetPropertySheetPages(hPages, uPageCount) {
        result := ComCall(20, this, "ptr", hPages, "uint*", uPageCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
