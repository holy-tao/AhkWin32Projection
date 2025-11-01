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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["New", "OpenDSGPO", "OpenLocalMachineGPO", "OpenRemoteMachineGPO", "Save", "Delete", "GetName", "GetDisplayName", "SetDisplayName", "GetPath", "GetDSPath", "GetFileSysPath", "GetRegistryKey", "GetOptions", "SetOptions", "GetType", "GetMachineName", "GetPropertySheetPages"]

    /**
     * 
     * @param {PWSTR} pszDomainName 
     * @param {PWSTR} pszDisplayName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-new
     */
    New(pszDomainName, pszDisplayName, dwFlags) {
        pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pszDomainName, "ptr", pszDisplayName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-opendsgpo
     */
    OpenDSGPO(pszPath, dwFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-openlocalmachinegpo
     */
    OpenLocalMachineGPO(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszComputerName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-openremotemachinegpo
     */
    OpenRemoteMachineGPO(pszComputerName, dwFlags) {
        pszComputerName := pszComputerName is String ? StrPtr(pszComputerName) : pszComputerName

        result := ComCall(6, this, "ptr", pszComputerName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bMachine 
     * @param {BOOL} bAdd 
     * @param {Pointer<Guid>} pGuidExtension 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-save
     */
    Save(bMachine, bAdd, pGuidExtension, pGuid) {
        result := ComCall(7, this, "int", bMachine, "int", bAdd, "ptr", pGuidExtension, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-delete
     */
    Delete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getname
     */
    GetName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getdisplayname
     */
    GetDisplayName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-setdisplayname
     */
    SetDisplayName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(11, this, "ptr", pszName, "HRESULT")
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

        result := ComCall(12, this, "ptr", pszPath, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getdspath
     */
    GetDSPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(13, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchMaxPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getfilesyspath
     */
    GetFileSysPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(14, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSection 
     * @param {Pointer<HKEY>} hKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getregistrykey
     */
    GetRegistryKey(dwSection, hKey) {
        result := ComCall(15, this, "uint", dwSection, "ptr", hKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getoptions
     */
    GetOptions(dwOptions) {
        result := ComCall(16, this, "uint*", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-setoptions
     */
    SetOptions(dwOptions, dwMask) {
        result := ComCall(17, this, "uint", dwOptions, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} gpoType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-gettype
     */
    GetType(gpoType) {
        result := ComCall(18, this, "int*", gpoType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getmachinename
     */
    GetMachineName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(19, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<HPROPSHEETPAGE>>} hPages 
     * @param {Pointer<Integer>} uPageCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getpropertysheetpages
     */
    GetPropertySheetPages(hPages, uPageCount) {
        result := ComCall(20, this, "ptr*", hPages, "uint*", uPageCount, "HRESULT")
        return result
    }
}
