#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetCfgComponent.ahk
#Include .\IEnumNetCfgBindingInterface.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgBindingPath extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgBindingPath
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae96-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSamePathAs", "IsSubPathOf", "IsEnabled", "Enable", "GetPathToken", "GetOwner", "GetDepth", "EnumBindingInterfaces"]

    /**
     * 
     * @param {INetCfgBindingPath} pPath 
     * @returns {HRESULT} 
     */
    IsSamePathAs(pPath) {
        result := ComCall(3, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgBindingPath} pPath 
     * @returns {HRESULT} 
     */
    IsSubPathOf(pPath) {
        result := ComCall(4, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * The IsEnabled method of the Win32\_Tpm class indicates whether the device is enabled. This value can be changed by the Enable and Disable methods.
     * @remarks
     * According to the Trusted Computing Group (TCG) v1.2 specification only the following commands are available when the device is in a deactivated state.
     * 
     * -   TPM\_ContinueSelfTest
     * -   TPM\_DSAP
     * -   TPM\_FlushSpecific
     * -   TPM\_GetCapability
     * -   TPM\_GetTestResult
     * -   TPM\_Init
     * -   TPM\_OIAP
     * -   TPM\_OSAP
     * -   TPM\_OwnerSetDisable
     * -   TPM\_PCR\_Reset
     * -   TPM\_PhysicalDisable
     * -   TPM\_PhysicalEnable
     * -   TPM\_PhysicalSetDeactivated
     * -   TPM\_Reset
     * -   TPM\_SaveState
     * -   TPM\_SelfTestFull
     * -   TPM\_SetCapability
     * -   TPM\_SHA1Complete
     * -   TPM\_SHA1Start
     * -   TPM\_SHA1Update
     * -   TPM\_Startup
     * -   TPM\_TakeOwnership
     * -   TPM\_Terminate\_Handle
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/isenabled-win32-tpm
     */
    IsEnabled() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @param {BOOL} fEnable 
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetPathToken() {
        result := ComCall(7, this, "ptr*", &ppszwPathToken := 0, "HRESULT")
        return ppszwPathToken
    }

    /**
     * Retrieves data about the module that issued the context bind for a specific IPv6 TCP endpoint in a MIB table row.
     * @remarks
     * The <i>Buffer</i> parameter contains not only a structure with pointers to specific data,  for example, pointers to the zero-terminated strings that contain the name and path of the owner module, but the actual data itself; that is the name and path strings. Therefore, when calculating the size of the buffer, ensure that you have enough space for both the structure as well as the data the members of the structure point to.
     * 
     * The resolution of TCP table entries to owner modules is a best practice. In a few cases, the owner module name returned in the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure can be a process name (such as "svchost.exe"), a service name (such as "RPC"), or a component name (such as "timer.dll").
     * 
     * For computers running on Windows Vista or later, the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getownermodulefromtcpentry">GetOwnerModuleFromTcpEntry</a> function may point to an empty string for some TCP connections. Applications that start TCP connections located in the Windows system folder (C:\Windows\System32, by default) are considered protected. If the <b>GetOwnerModuleFromTcpEntry</b> function is called by a user that is not a member of the Administrators group, the function call will succeed but the <b>pModuleName</b> and <b>pModulePath</b> members will point to memory that contains an empty string for the TCP connections started by protected applications. 
     * 
     * For computers running on Windows Vista or later, accessing the <b>pModuleName</b> and <b>pModulePath</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info">TCPIP_OWNER_MODULE_BASIC_INFO</a> structure is limited  by user account control (UAC). If an application that calls this function is executed by a user logged on as a member of the Administrators group other than the built-in Administrator, this call will succeed but access to these members returns an empty string unless the application has been marked in the manifest file with a <b>requestedExecutionLevel</b> set to requireAdministrator. If the application on Windows Vista or later lacks this manifest file, a user logged on as a member of the Administrators group other than the built-in Administrator must then be executing the application in an enhanced shell as the built-in Administrator (RunAs administrator) for access to the protected <b>pModuleName</b> and <b>pModulePath</b> members to be allowed.
     * @returns {INetCfgComponent} 
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getownermodulefromtcp6entry
     */
    GetOwner() {
        result := ComCall(8, this, "ptr*", &ppComponent := 0, "HRESULT")
        return INetCfgComponent(ppComponent)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDepth() {
        result := ComCall(9, this, "uint*", &pcInterfaces := 0, "HRESULT")
        return pcInterfaces
    }

    /**
     * 
     * @returns {IEnumNetCfgBindingInterface} 
     */
    EnumBindingInterfaces() {
        result := ComCall(10, this, "ptr*", &ppenumInterface := 0, "HRESULT")
        return IEnumNetCfgBindingInterface(ppenumInterface)
    }
}
