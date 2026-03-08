#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IGPEInformation interface provides methods for Microsoft Management Console (MMC) extension snap-ins to communicate with the Group Policy Object Editor. For more information about MMC, see the Microsoft Management Console.
 * @remarks
 * To create and modify a GPO directly, without using the Group Policy Object Editor, see the methods of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nn-gpedit-igrouppolicyobject">IGroupPolicyObject</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/gpedit/nn-gpedit-igpeinformation
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
     * The GetName method retrieves the unique name for the GPO. This value is usually a GUID.
     * @remarks
     * To retrieve the GPO's friendly name, which is suitable for display, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igpeinformation-getdisplayname">GetDisplayName</a> method.
     * @param {PWSTR} pszName Receives the GPO name.
     * @param {Integer} cchMaxLength Specifies the size, in characters, of the <i>pszName</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getname
     */
    GetName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The GetDisplayName method retrieves the display name for the GPO. (IGPEInformation.GetDisplayName)
     * @remarks
     * To retrieve the unique name for the GPO (typically a GUID), you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igpeinformation-getname">GetName</a> method.
     * @param {PWSTR} pszName Receives the display name for the GPO.
     * @param {Integer} cchMaxLength Specifies the size, in characters, of the <i>pszName</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getdisplayname
     */
    GetDisplayName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The GetRegistryKey method retrieves a handle to the root of the registry key for the specified section of the GPO.
     * @remarks
     * The registry handle is a handle to the root of the registry key. To get or set values in the 
     * Policies key, first call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function to open the <b>Software\Policies</b> key.
     * 
     * When you have finished using the registry handle, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close the handle.
     * @param {Integer} dwSection 
     * @param {Pointer<HKEY>} hKey Receives the handle to the registry key. This handle is opened with all access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h. If registry information is not loaded, the method returns <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getregistrykey
     */
    GetRegistryKey(dwSection, hKey) {
        result := ComCall(5, this, "uint", dwSection, "ptr", hKey, "HRESULT")
        return result
    }

    /**
     * The GetDSPath method retrieves the Active Directory path for the specified section of the GPO.
     * @remarks
     * If you call the 
     * <b>GetDSPath</b> method and specify a computer GPO, the method succeeds, but on return, the <i>pszPath</i> parameter contains an empty string. This is because computer GPOs do not have Active Directory storage; they have only file system storage.
     * 
     * To retrieve the file system path for the specified section of a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igpeinformation-getfilesyspath">GetFileSysPath</a> method.
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath Receives the Active Directory path to the root of the requested section. For more information, see the following Remarks section.
     * @param {Integer} cchMaxPath Specifies the size, in characters, of the <i>pszPath</i> parameter.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getdspath
     */
    GetDSPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * The GetFileSysPath method returns the file system path for the specified section of the GPO. The path is in UNC format.
     * @remarks
     * To retrieve the Active Directory path for the specified section of a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igpeinformation-getdspath">GetDSPath</a> method.
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath Receives the file system path.
     * @param {Integer} cchMaxPath Specifies the size, in characters, of the <i>pszPath</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getfilesyspath
     */
    GetFileSysPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * The GetOptions method retrieves the options the user has selected for the Group Policy Object Editor.
     * @param {Pointer<Integer>} dwOptions Receives a bitmask value representing the options the user has selected. Currently, this parameter returns only zero.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-getoptions
     */
    GetOptions(dwOptions) {
        dwOptionsMarshal := dwOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, dwOptionsMarshal, dwOptions, "HRESULT")
        return result
    }

    /**
     * The GetType method retrieves type information for the GPO being edited. (IGPEInformation.GetType)
     * @param {Pointer<Integer>} gpoType 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-gettype
     */
    GetType(gpoType) {
        gpoTypeMarshal := gpoType is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, gpoTypeMarshal, gpoType, "HRESULT")
        return result
    }

    /**
     * The GetHint method retrieves the type of Active Directory object to which this GPO can be linked.
     * @remarks
     * The Group Policy Object Editor cannot determine which Active Directory objects are linked to a particular GPO. The 
     * <b>GetHint</b> method provides linking information based on how the user started the Group Policy Object Editor. It can be started in the following ways:
     * 
     * <ul>
     * <li>As an extension to the Active Directory Manager. Navigate to the site, domain, or organizational unit, then select <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/group-policy-start-page">Group Policy</a>.</li>
     * <li>As a stand-alone MMC tool with a specific link.</li>
     * <li>As a stand-alone MMC tool without a specific link.</li>
     * </ul>
     * You may want to customize your application's user interface based on the result of calling this method. However, use this method with caution because the returned value may indicate the wrong scope.
     * @param {Pointer<Integer>} gpHint 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-gethint
     */
    GetHint(gpHint) {
        gpHintMarshal := gpHint is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, gpHintMarshal, gpHint, "HRESULT")
        return result
    }

    /**
     * The PolicyChanged method informs the Group Policy Object Editor that policy settings have changed.
     * @remarks
     * An extension must call this method every time it makes a change to a group policy object. Note that when you 
     *     write an MMC snap-in you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> 
     *     interface and call the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-notify">IComponentData::Notify</a> 
     *     method. To get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nn-gpedit-igpeinformation">IGPEInformation</a> interface, set the 
     *     <i>event</i> parameter of the 
     *     <b>IComponentData::Notify</b> method to be 
     *     <b>MMCN_EXPAND</b> and the <i>arg</i> parameter to 
     *     <b>TRUE</b>. You can then obtain the 
     *     <b>IGPEInformation</b> interface by calling 
     *     <b>QueryInterface</b> and by using the usual Rules for Implementing QueryInterface.
     * 
     * For example, you can obtain the interface by calling as follows.
     * 
     * 
     * ```cpp
     * lpDataObject->QueryInterface(IID_IGPEInformation, (LPVOID lpDataObject->*)&m_pGPTInformation);
     * ```
     * @param {BOOL} bMachine Specifies whether computer or user policy has changed. If this value is <b>TRUE</b>, 
     *       computer policy has changed. If this value is <b>FALSE</b>, user policy has changed.
     * @param {BOOL} bAdd Specifies whether this is an add or delete operation. If this parameter is <b>FALSE</b>, 
     *       the last policy setting for the specified extension <i>pGuidExtension</i> is removed. In all 
     *       other cases, this parameter is <b>TRUE</b>.
     * @param {Pointer<Guid>} pGuidExtension Pointer to the <b>GUID</b> or unique name of the snap-in extension that will process 
     *       policy. If the GPO is to be processed by the snap-in that processes .pol files, this parameter must specify the 
     *       <b>REGISTRY_EXTENSION_GUID</b> value.
     * @param {Pointer<Guid>} pGuidSnapin Pointer to the GUID or unique name of the snap-in extension making this method call.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes 
     *        defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igpeinformation-policychanged
     */
    PolicyChanged(bMachine, bAdd, pGuidExtension, pGuidSnapin) {
        result := ComCall(11, this, "int", bMachine, "int", bAdd, "ptr", pGuidExtension, "ptr", pGuidSnapin, "HRESULT")
        return result
    }
}
