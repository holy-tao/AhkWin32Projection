#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NETSETUP_PROVISIONING_PARAMS structure contains information that is used when creating a provisioning package using the NetCreateProvisionPackage function.
 * @remarks
 * The <b>NETSETUP_PROVISIONING_PARAMS</b> structure  provides flags for the <a href="https://docs.microsoft.com/windows/desktop/api/lmjoin/nf-lmjoin-netcreateprovisioningpackage">NetCreateProvisioningPackage</a> function which is supported on Windows 8 and  Windows Server 2012 for offline join operations.
  * 
  * In addition to domain joins, the provisioning package can provide certificates and policies to the machine. The provisioning package can be used in four ways:<ul>
  * <li>Domain join</li>
  * <li>Domain join and installation of certificates</li>
  * <li>Domain join and installation of policies</li>
  * <li>Domain join and installation of certificates and policies</li>
  * </ul>
  * 
  * When certificates need to be added to the package, this structure provides the <b>aCertTemplateNames</b> member as an array of <b>NULL</b>-terminated certificate template names.  The  <b>aCertTemplateNames</b> member requires the <b>cCertTemplateNames</b> member to provide an explicit count of the number of items in the array.
  * 
  * There are two different ways to add policies. You can use one or both methods:<ul>
  * <li>Policy name—An array of <b>NULL</b>-terminated policy names is provided in the <b>aMachinePolicyNames</b> member. During runtime, the policy name is mapped to the policy name in AD and the GUID that represents the policy in the enterprise space is retrieved. The <b>aMachinePolicyNames</b> member requires the <b>cMachinePolicyNames</b> member to provide an explicit count of the number of items in the array.</li>
  * <li>Policy path—A pointer to an array of  <b>NULL</b>-terminated character strings provided in the <b>aMachinePolicyPaths</b> member which specify the path to a file in the Registry Policy File format. For more information on the Registry Policy File Format , see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/registry-policy-file-format">Registry Policy File Format</a>. The policy path is a full or relative path to the policy file.</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/ns-lmjoin-netsetup_provisioning_params
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETSETUP_PROVISIONING_PARAMS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * The version of Windows in the provisioning package. This parameter should use the following value defined in the <i>Lmjoin.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION"></a><a id="netsetup_provisioning_params_current_version"></a><dl>
     * <dt><b>NETSETUP_PROVISIONING_PARAMS_CURRENT_VERSION</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version for this package is Windows Server 2012.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a <b>NULL</b>-terminated character string that specifies the name of the domain where the computer account is created.
     * @type {Pointer<Ptr>}
     */
    lpDomain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <b>NULL</b>-terminated character string that specifies the short name of the machine from which the computer account attribute sAMAccountName is derived by appending a '$'. This parameter must contain a valid DNS or NetBIOS machine name.
     * @type {Pointer<Ptr>}
     */
    lpHostName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A optional pointer to a <b>NULL</b>-terminated character string that contains the RFC 1779 format name of the organizational unit (OU) where the computer account will be created. If you specify this parameter, the string must contain a full path, for example, OU=testOU,DC=domain,DC=Domain,DC=com. Otherwise, this parameter must be <b>NULL</b>.
     * 
     * If this parameter is <b>NULL</b>, the well known computer object container will be used as published in the domain.
     * @type {Pointer<Ptr>}
     */
    lpMachineAccountOU {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * An optional pointer to a <b>NULL</b>-terminated character string that contains the name of the domain controller to target.
     * @type {Pointer<Ptr>}
     */
    lpDcName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    dwProvisionOptions {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to an array of <b>NULL</b>-terminated certificate template names.
     * @type {Pointer<Ptr>}
     */
    aCertTemplateNames {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * When <b>aCertTemplateNames</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
     * @type {Integer}
     */
    cCertTemplateNames {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A pointer to an array of <b>NULL</b>-terminated  machine policy names.
     * @type {Pointer<Ptr>}
     */
    aMachinePolicyNames {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * When <b>aMachinePolicyNames</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
     * @type {Integer}
     */
    cMachinePolicyNames {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A pointer to an array of  character strings. Each array element is a NULL-terminated character string which specifies the full or partial path to a file in the Registry Policy File format. For more information on the Registry Policy File Format , see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/registry-policy-file-format">Registry Policy File Format</a>
     * 
     * This path could be a UNC path on a remote server.
     * @type {Pointer<Ptr>}
     */
    aMachinePolicyPaths {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * When <b>aMachinePolicyPaths</b> is not <b>NULL</b>, this member provides an explicit count of the number of items in the array.
     * @type {Integer}
     */
    cMachinePolicyPaths {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * TBD
     * @type {Pointer<Ptr>}
     */
    lpNetbiosName {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * TBD
     * @type {Pointer<Ptr>}
     */
    lpSiteName {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * TBD
     * @type {Pointer<Ptr>}
     */
    lpPrimaryDNSDomain {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
