#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HFILTER.ahk
#Include .\HFILTER_INSTANCE.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class InstallableFileSystems {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_NAME_MAX_CHARS => 255

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_NAME_MAX_CHARS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static INSTANCE_NAME_MAX_CHARS => 255

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_AGGREGATE_INFO_IS_MINIFILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_AGGREGATE_INFO_IS_LEGACYFILTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_ASI_IS_MINIFILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_ASI_IS_LEGACYFILTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_VSI_DETACHED_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IASI_IS_MINIFILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IASI_IS_LEGACYFILTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IASIM_DETACHED_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLTFL_IASIL_DETACHED_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLT_PORT_FLAG_SYNC_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_MSNET => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SMB => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_NETWARE => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_VINES => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_10NET => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_LOCUS => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SUN_PC_NFS => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_LANSTEP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_9TILES => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_LANTASTIC => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_AS400 => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_FTP_NFS => 786432

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_PATHWORKS => 851968

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_LIFENET => 917504

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_POWERLAN => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_BWNFS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_COGENT => 1114112

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_FARALLON => 1179648

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_APPLETALK => 1245184

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_INTERGRAPH => 1310720

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SYMFONET => 1376256

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_CLEARCASE => 1441792

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_FRONTIER => 1507328

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_BMC => 1572864

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DCE => 1638400

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_AVID => 1703936

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DOCUSPACE => 1769472

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_MANGOSOFT => 1835008

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SERNET => 1900544

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_RIVERFRONT1 => 1966080

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_RIVERFRONT2 => 2031616

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DECORB => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_PROTSTOR => 2162688

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_FJ_REDIR => 2228224

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DISTINCT => 2293760

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_TWINS => 2359296

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_RDR2SAMPLE => 2424832

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_CSC => 2490368

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_3IN1 => 2555904

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_EXTENDNET => 2686976

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_STAC => 2752512

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_FOXBAT => 2818048

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_YAHOO => 2883584

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_EXIFS => 2949120

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DAV => 3014656

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_KNOWARE => 3080192

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_OBJECT_DIRE => 3145728

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_MASFAX => 3211264

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_HOB_NFS => 3276800

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SHIVA => 3342336

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_IBMAL => 3407872

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_LOCK => 3473408

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_TERMSRV => 3538944

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SRT => 3604480

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_QUINCY => 3670016

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_OPENAFS => 3735552

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_AVID1 => 3801088

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DFS => 3866624

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_KWNP => 3932160

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_ZENWORKS => 3997696

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DRIVEONWEB => 4063232

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_VMWARE => 4128768

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_RSFX => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_MFILES => 4259840

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_MS_NFS => 4325376

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_GOOGLE => 4390912

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_NDFS => 4456448

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_DOCUSHARE => 4521984

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_AURISTOR_FS => 4587520

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_SECUREAGENT => 4653056

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_9P => 4718592

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CRED_MANAGER => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_LANMAN => 131072
;@endregion Constants

;@region Methods
    /**
     * The FilterLoad function dynamically loads a minifilter driver into the system.
     * @remarks
     * <b>FilterLoad</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltloadfilter">FltLoadFilter</a>. 
     * 
     * A user-mode application that has a dependency on a kernel-mode minifilter driver can load the minifilter driver by calling <b>FilterLoad</b>. 
     * 
     * Callers of <b>FilterLoad</b> must have <b>SeLoadDriverPrivilege</b> (the LUID of SE_LOAD_DRIVER_PRIVILEGE) to load or unload a minifilter driver. This privilege is named by the SE_LOAD_DRIVER_NAME name constant. (Privileges are described in the Microsoft Windows Software Development Kit (SDK) for Windows 7 and .NET Framework 4.0 documentation.) 
     * 
     * To unload the minifilter driver, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterunload">FilterUnload</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string that specifies the service name of the minifilter driver. This parameter is required and cannot be <b>NULL</b> or an empty string.
     * @returns {HRESULT} <b>FilterLoad</b> returns S_OK if successful. Otherwise, it returns one of the following error values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32 (ERROR_ALREADY_EXISTS)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minifilter driver is already running. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32 (ERROR_FILE_NOT_FOUND)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No matching minifilter driver was found. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32 (ERROR_SERVICE_ALREADY_RUNNING)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minifilter driver is already running. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32 (ERROR_BAD_EXE_FORMAT)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load image for the minifilter driver specified by <i>lpFilterName</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32 (ERROR_BAD_DRIVER)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load image for the minifilter driver specified by <i>lpFilterName</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32 (ERROR_INVALID_IMAGE_HASH)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minifilter driver has an invalid digital signature.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterload
     */
    static FilterLoad(lpFilterName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

        result := DllCall("FLTLIB.dll\FilterLoad", "ptr", lpFilterName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * An application that has loaded a supporting minifilter by calling FilterLoad can unload the minifilter by calling the FilterUnload function.
     * @remarks
     * <b>FilterUnload</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltunloadfilter">FltUnloadFilter</a>. 
     * 
     * <b>FilterUnload</b> searches for a registered minifilter whose service name matches the given <i>lpFilterName</i> and calls that minifilter's <i>FilterUnloadCallback</i> (<a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nc-fltkernel-pflt_filter_unload_callback">PFLT_FILTER_UNLOAD_CALLBACK</a>) routine. 
     * 
     * If the minifilter did not register a <i>FilterUnloadCallback</i> routine, the call to <b>FilterUnload</b> fails. 
     * 
     * Callers of <b>FilterUnload</b> must have <b>SeLoadDriverPrivilege</b> (the LUID of SE_LOAD_DRIVER_PRIVILEGE) to load or unload a minifilter driver. This privilege is named by the SE_LOAD_DRIVER_NAME name constant. (Privileges are described in the Microsoft Windows Software Development Kit (SDK) for Windows 7 and .NET Framework 4.0 documentation.)
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string containing the same minifilter name that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterload">FilterLoad</a>. This parameter is required and cannot be <b>NULL</b> or an empty string.
     * @returns {HRESULT} <b>FilterUnload</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterunload
     */
    static FilterUnload(lpFilterName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

        result := DllCall("FLTLIB.dll\FilterUnload", "ptr", lpFilterName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterCreate function creates a handle for the given minifilter.
     * @remarks
     * A user-mode application calls <b>FilterCreate</b> to create a handle that can be used to communicate with a kernel-mode minifilter. The returned minifilter handle can be passed as a parameter to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtergetinformation">FilterGetInformation</a>. 
     * 
     * To close a filter handle returned by <b>FilterCreate</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterclose">FilterClose</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string containing the name of the minifilter. This parameter is required and cannot be <b>NULL</b>.
     * @returns {HFILTER} Pointer to a caller-allocated variable that receives a handle for the minifilter if the call to <b>FilterCreate</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtercreate
     */
    static FilterCreate(lpFilterName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

        hFilter := HFILTER()
        result := DllCall("FLTLIB.dll\FilterCreate", "ptr", lpFilterName, "ptr", hFilter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hFilter
    }

    /**
     * The FilterClose function closes an open minifilter handle.
     * @remarks
     * After <b>FilterClose</b> is called, the minifilter handle that the <i>hFilter</i> parameter specifies is no longer valid and cannot safely be used. 
     * 
     * Use <b>FilterClose</b> to close open minifilter handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindclose">FilterFindClose</a> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a>. 
     * 
     * To close a connection port handle that was opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterconnectcommunicationport">FilterConnectCommunicationPort</a>, use <a href="https://docs.microsoft.com/windows/win32/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @param {HFILTER} hFilter Minifilter handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a>.
     * @returns {HRESULT} <b>FilterClose</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterclose
     */
    static FilterClose(hFilter) {
        hFilter := hFilter is Win32Handle ? NumGet(hFilter, "ptr") : hFilter

        result := DllCall("FLTLIB.dll\FilterClose", "ptr", hFilter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterInstanceCreate function creates a handle that can be used to communicate with the given minifilter instance.
     * @remarks
     * A user-mode application calls <b>FilterInstanceCreate</b> to create a handle that can be used to communicate with a kernel-mode minifilter instance. The returned instance handle can be passed as a parameter to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancegetinformation">FilterInstanceGetInformation</a>. 
     * 
     * To close an instance handle returned by <b>FilterInstanceCreate</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstanceclose">FilterInstanceClose</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string containing the name of the minifilter that owns the instance.
     * @param {PWSTR} lpVolumeName Pointer to a null-terminated wide-character string containing the name of the volume that the instance is attached to. 
     * 
     * The <i>lpVolumeName</i> input string can be any of the following. The trailing backslash (\\) is optional. 
     * 
     * <ul>
     * <li>
     * A drive letter, such as "D:\"
     * 
     * </li>
     * <li>
     * A path to a volume mount point, such as "c:\mnt\edrive\"
     * 
     * </li>
     * <li>
     * A unique volume identifier (also called a <i>volume GUID name</i>), such as "\??\Volume{7603f260-142a-11d4-ac67-806d6172696f}\"
     * 
     * </li>
     * <li>
     * A nonpersistent device name (also called a <i>target name</i> or an <i>NT device name</i>), such as "\Device\HarddiskVolume1\"
     * 
     * </li>
     * </ul>
     * @param {PWSTR} lpInstanceName Pointer to a null-terminated wide-character string containing the instance name for the instance. This parameter is optional and can be <b>NULL</b>. If it is <b>NULL</b>, the first instance found for this minifilter on this volume is returned.
     * @returns {HFILTER_INSTANCE} Pointer to a caller-allocated variable that receives an opaque handle for the minifilter instance if the call to <b>FilterInstanceCreate</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancecreate
     */
    static FilterInstanceCreate(lpFilterName, lpVolumeName, lpInstanceName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
        lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
        lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

        hInstance := HFILTER_INSTANCE()
        result := DllCall("FLTLIB.dll\FilterInstanceCreate", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpInstanceName, "ptr", hInstance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hInstance
    }

    /**
     * The FilterInstanceClose function closes a minifilter instance handle opened by FilterInstanceCreate.
     * @remarks
     * After the <b>FilterInstanceClose</b> function is called, the minifilter instance handle specified by the <i>hFilterInstanceFind</i> parameter is no longer valid and cannot safely be used. 
     * 
     * Use <b>FilterInstanceClose</b> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindclose">FilterInstanceFindClose</a> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>.
     * @param {HFILTER_INSTANCE} hInstance Minifilter instance handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>.
     * @returns {HRESULT} <b>FilterInstanceClose</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstanceclose
     */
    static FilterInstanceClose(hInstance) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance

        result := DllCall("FLTLIB.dll\FilterInstanceClose", "ptr", hInstance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterAttach function attaches a new minifilter instance to the given volume.
     * @remarks
     * <b>FilterAttach</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltattachvolume">FltAttachVolume</a>. 
     * 
     * The instance name specified in <i>lpInstanceName</i> is required to be unique across the system. 
     * 
     * To attach a minifilter instance to a volume at a given altitude, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterattachataltitude">FilterAttachAtAltitude</a>. 
     * 
     * To detach a minifilter instance from a volume, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterdetach">FilterDetach</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string containing the name of the minifilter for which an instance is to be created. This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpVolumeName Pointer to a null-terminated wide-character string containing the name of the volume to which the newly created instance is to be attached. 
     * 
     * The <i>lpVolumeName</i> input string can be any of the following. The trailing backslash (\\) is optional. 
     * 
     * <ul>
     * <li>
     * A drive letter, such as "D:\"
     * 
     * </li>
     * <li>
     * A path to a volume mount point, such as "c:\mnt\edrive\"
     * 
     * </li>
     * <li>
     * A unique volume identifier (also called a <i>volume GUID name</i>), such as "\??\Volume{7603f260-142a-11d4-ac67-806d6172696f}\"
     * 
     * </li>
     * <li>
     * A nonpersistent device name (also called a <i>target name</i> or an <i>NT device name</i>), such as "\Device\HarddiskVolume1\"
     * 
     * </li>
     * </ul>
     * The <i>lpVolumeName</i> parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpInstanceName Pointer to a null-terminated wide-character string containing the instance name for the new instance. This parameter is optional and can be <b>NULL</b>. If this parameter is <b>NULL</b>, the new instance receives the minifilter's default instance name as described in the Remarks section for <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltattachvolume">FltAttachVolume</a>.
     * @param {Integer} dwCreatedInstanceNameLength Length, in bytes, of the buffer that <i>lpCreatedInstanceName </i> points to. This parameter is optional and can be zero.
     * @param {Pointer} lpCreatedInstanceName Pointer to a caller-allocated variable that receives the instance name for the new instance if the instance is successfully attached to the volume. This parameter is optional and can be <b>NULL</b>. If it is not <b>NULL</b>, the buffer must be large enough to hold INSTANCE_NAME_MAX_CHARS characters plus a NULL terminator.
     * @returns {HRESULT} <b>FilterAttach</b> returns S_OK if successful. Otherwise, it returns an error value such as one of the following. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FLT_INSTANCE_ALTITUDE_COLLISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instance already exists at this altitude on the volume specified. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FLT_INSTANCE_NAME_COLLISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instance already exists with this name on the volume specified. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>lpInstanceName</i> is non-<b>NULL</b>, <i>lpInstanceName</i> does not match a registered filter instance name in the registry.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterattach
     */
    static FilterAttach(lpFilterName, lpVolumeName, lpInstanceName, dwCreatedInstanceNameLength, lpCreatedInstanceName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
        lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
        lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

        result := DllCall("FLTLIB.dll\FilterAttach", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpInstanceName, "uint", dwCreatedInstanceNameLength, "ptr", lpCreatedInstanceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterAttachAtAltitude function is a debugging support function that attaches a new minifilter instance to a volume at a specified altitude, overriding any settings in the minifilter's setup information (INF) file.
     * @remarks
     * An application should only use <b>FilterAttachAtAltitude</b> for debugging. It should not call this function in a retail version of the application. 
     * 
     * <b>FilterAttachAtAltitude</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltattachvolumeataltitude">FltAttachVolumeAtAltitude</a>. 
     * 
     * The term "altitude" refers to the position that an instance occupies (or should occupy) in the minifilter instance stack for a volume. The higher the altitude, the farther the instance is from the base file system in the stack. Only one instance can be attached at a given altitude on a given volume. 
     * 
     * Altitude is specified by an <i>altitude string</i>, which is a wide-character array containing one or more decimal digits in the range from 0 through 9, and it can include a single decimal point. The decimal point is optional. For example, "100.123456" and "03333" are valid altitude strings. 
     * 
     * The string "03333" represents a higher altitude than "100.123456". (Leading and trailing zeros are ignored.) In other words, an instance whose altitude is "03333" is farther from the base file system than an instance whose altitude is "100.123456". However, this comparison is only meaningful if both instances are attached to the same volume. 
     * 
     * The instance name returned in <i>lpCreatedInstanceName</i> is unique across the system. 
     * 
     * To detach a minifilter instance from a volume, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterdetach">FilterDetach</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string containing the name of the minifilter for which an instance is to be created. This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpVolumeName Pointer to a null-terminated wide-character string containing the name of the volume to which the newly created instance is to be attached. 
     * 
     * The <i>lpVolumeName</i> input string can be any of the following. The trailing backslash (\\) is optional. 
     * 
     * <ul>
     * <li>
     * A drive letter, such as "D:\"
     * 
     * </li>
     * <li>
     * A path to a volume mount point, such as "c:\mnt\edrive\"
     * 
     * </li>
     * <li>
     * A unique volume identifier (also called a <i>volume GUID name</i>), such as "\??\Volume{7603f260-142a-11d4-ac67-806d6172696f}\"
     * 
     * </li>
     * <li>
     * A nonpersistent device name (also called a <i>target name</i> or an <i>NT device name</i>), such as "\Device\HarddiskVolume1\"
     * 
     * </li>
     * </ul>
     * This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpAltitude Pointer to a null-terminated wide-character string that contains a numeric value specifying the target position that the minifilter instance should occupy in the stack for the volume. The higher the number, the higher the relative position in the stack. An altitude string consists of one or more digits in the range from 0 through 9, and it can include a single decimal point. The decimal point is optional. For example, "100.123456" is a valid altitude string. This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpInstanceName Pointer to a null-terminated wide-character string containing the instance name for the new instance. This parameter is optional and can be <b>NULL</b>. If this parameter is <b>NULL</b>, the new instance receives the minifilter's default instance name as described in the Remarks section for <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltattachvolume">FltAttachVolume</a>.
     * @param {Integer} dwCreatedInstanceNameLength Length, in bytes, of the buffer that <i>lpCreatedInstanceName </i> points to. This parameter is optional and can be zero.
     * @param {Pointer} lpCreatedInstanceName Pointer to a caller-allocated variable that receives the instance name for the new instance if the instance is successfully attached to the volume. This parameter is optional and can be <b>NULL</b>. If it is not <b>NULL</b>, the buffer must be large enough to hold INSTANCE_NAME_MAX_CHARS characters plus a NULL terminator.
     * @returns {HRESULT} <b>FilterAttachAtAltitude</b> returns S_OK if successful. Otherwise, it returns an error value such as one of the following. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FLT_INSTANCE_ALTITUDE_COLLISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instance already exists at this altitude on the volume specified. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FLT_INSTANCE_NAME_COLLISION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instance already exists with this name on the volume specified. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterattachataltitude
     */
    static FilterAttachAtAltitude(lpFilterName, lpVolumeName, lpAltitude, lpInstanceName, dwCreatedInstanceNameLength, lpCreatedInstanceName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
        lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
        lpAltitude := lpAltitude is String ? StrPtr(lpAltitude) : lpAltitude
        lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

        result := DllCall("FLTLIB.dll\FilterAttachAtAltitude", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpAltitude, "ptr", lpInstanceName, "uint", dwCreatedInstanceNameLength, "ptr", lpCreatedInstanceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterDetach function detaches the given minifilter instance from the given volume.
     * @remarks
     * <b>FilterDetach</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltdetachvolume">FltDetachVolume</a>. 
     * 
     * <b>FilterDetach</b> detaches a minifilter instance from a volume and tears down the instance. 
     * 
     * To attach a minifilter instance to a volume, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterattach">FilterAttach</a> or <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterattachataltitude">FilterAttachAtAltitude</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string containing the name of the minifilter whose instance is to be detached from the stack. This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpVolumeName Pointer to a null-terminated wide-character string containing the name of the volume to which the instance is currently attached. 
     * 
     * The <i>lpVolumeName</i> input string can be any of the following. The trailing backslash (\\) is optional. 
     * 
     * <ul>
     * <li>
     * A drive letter, such as "D:\"
     * 
     * </li>
     * <li>
     * A path to a volume mount point, such as "c:\mnt\edrive\"
     * 
     * </li>
     * <li>
     * A unique volume identifier (also called a <i>volume GUID name</i>), such as "\??\Volume{7603f260-142a-11d4-ac67-806d6172696f}\"
     * 
     * </li>
     * <li>
     * A nonpersistent device name (also called a <i>target name</i> or an <i>NT device name</i>), such as "\Device\HarddiskVolume1\"
     * 
     * </li>
     * </ul>
     * This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpInstanceName Pointer to a null-terminated wide-character string containing the instance name for the instance to be removed. This parameter is optional and can be <b>NULL</b>. If it is <b>NULL</b>, the highest matching instance is removed.
     * @returns {HRESULT} <b>FilterDetach</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterdetach
     */
    static FilterDetach(lpFilterName, lpVolumeName, lpInstanceName) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
        lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
        lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

        result := DllCall("FLTLIB.dll\FilterDetach", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpInstanceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterFindFirst function returns information about a filter driver (minifilter driver instance or legacy filter driver) and is used to begin scanning the filters in the global list of registered filters.
     * @remarks
     * The <b>FilterFindFirst</b> function opens a search handle and returns information about the first filter driver that is found in the global list of registered filters. After the search handle has been established, call the <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindnext">FilterFindNext</a> function to search for other filters in the global list. When the search handle is no longer required, close it by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindclose">FilterFindClose</a>. 
     * 
     * Starting with Microsoft Windows Server 2003 with SP1 and Windows XP with Service Pack 1 (SP1) with filter manager rollup, <b>FilterFindFirst</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindnext">FilterFindNext</a> can provide legacy filter driver information and minifilter driver instance information. On earlier versions of Windows, <b>FilterFindFirst</b> and <b>FilterFindNext</b> can only provide information about minifilters (see the description for the <i>dwInformationClass</i> parameter above).
     * 
     * <b>FilterFindFirst</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindnext">FilterFindNext</a> return information about filter drivers in order of decreasing distance from the base file system. Information about the filter farthest from the base file system is returned first.  Information about the second-farthest filter is returned second.  Information about the filter closest to the base file system is returned last.
     * 
     * If the input <i>dwBufferSize</i> is too small, <i>lpFilterFind</i> receives INVALID_HANDLE_VALUE, and <i>lpBytesReturned</i> receives the number of bytes required to store the requested information.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @param {Pointer<Integer>} lpBytesReturned Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterFindFirst</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<HANDLE>} lpFilterFind Pointer to a caller-allocated variable that receives a search handle for the filter driver if the call to <b>FilterFindFirst</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE. This search handle can be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindnext">FilterFindNext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindclose">FilterFindClose</a>.
     * @returns {HRESULT} <b>FilterFindFirst</b> returns S_OK if successful. Otherwise, it returns an HRESULT error value, such as one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpBuffer</i> is not large enough to contain the requested information.  When this value is returned, <i>lpBytesReturned</i> will contain the size, in bytes, of the buffer required for the given <i>dwInformationClass</i> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid value was specified for the <i>dwInformationClass</i> parameter.  For example, if <i>FilterAggregateStandardInformation</i> is specified for an operating system prior to Windows Vista, <b>FilterFindFirst</b> returns this HRESULT value.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A filter driver was not found in the global list of registered filters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterfindfirst
     */
    static FilterFindFirst(dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpFilterFind) {
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTLIB.dll\FilterFindFirst", "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpFilterFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterFindNext function continues a filter search started by a call to FilterFindFirst.
     * @remarks
     * After the filter search handle is established by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a>, use the <b>FilterFindNext</b> function to search for additional filters in the global list of registered filters. 
     * 
     * <b>FilterFindNext</b> finds one filter driver (minifilter driver instance or legacy filter driver) per call.
     * 
     * Starting with Microsoft Windows Server 2003 with SP1 and Microsoft Windows XP with SP2 with filter manager rollup, <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a> and <b>FilterFindNext</b> can provide legacy filter driver information and minifilter driver instance information. On earlier versions of Windows, <b>FilterFindFirst</b> and <b>FilterFindNext</b> can only provide information about minifilters (see the description for the <i>dwInformationClass</i> parameter above).
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a> and <b>FilterFindNext</b> return information about filter drivers in order of decreasing distance from the base file system. Information about the filter farthest from the base file system is returned first.  Information about the second-farthest filter is returned second.  Information about the filter closest to the base file system is returned last.
     * @param {HANDLE} hFilterFind Filter search handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a>.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterfindnext
     */
    static FilterFindNext(hFilterFind, dwInformationClass, lpBuffer, dwBufferSize) {
        hFilterFind := hFilterFind is Win32Handle ? NumGet(hFilterFind, "ptr") : hFilterFind

        result := DllCall("FLTLIB.dll\FilterFindNext", "ptr", hFilterFind, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * The FilterFindClose function closes the specified minifilter search handle. The FilterFindFirst and FilterFindNext functions use this search handle to locate minifilters.
     * @remarks
     * After the <b>FilterFindClose</b> function is called, the minifilter search handle specified by the <i>hFilterFind</i> parameter cannot be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindnext">FilterFindNext</a> or <b>FilterFindClose</b>. 
     * 
     * Use <b>FilterFindClose</b> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterclose">FilterClose</a> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a>.
     * @param {HANDLE} hFilterFind Minifilter search handle to close. This handle must have been opened by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a>.
     * @returns {HRESULT} <b>FilterFindClose</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterfindclose
     */
    static FilterFindClose(hFilterFind) {
        hFilterFind := hFilterFind is Win32Handle ? NumGet(hFilterFind, "ptr") : hFilterFind

        result := DllCall("FLTLIB.dll\FilterFindClose", "ptr", hFilterFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterVolumeFindFirst function returns information about a volume.
     * @remarks
     * This <b>FilterVolumeFindFirst </b> function is used to begin scanning the volumes that are known to the filter manager.
     * 
     * <b>FilterVolumeFindFirst</b> opens a search handle and returns information about the first volume found in the list of volumes known to the filter manager. After the search handle has been established, use the <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindnext">FilterVolumeFindNext</a> function to search for other volumes in the filter manager's list. When the search handle is no longer required, close it by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindclose">FilterVolumeFindClose</a>.
     * 
     * Note that when using <b>FilterVolumeFindFirst</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindnext">FilterVolumeFindNext</a> to enumerate the list of volumes known to the filter manager, it is possible for two or more volumes in the list to have the same name.  For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ifs/understanding-volume-enumerations-with-duplicate-volume-names">Understanding Volume Enumerations with Duplicate Volume Names</a>.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @param {Pointer<Integer>} lpBytesReturned Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterVolumeFindFirst</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<HANDLE>} lpVolumeFind Pointer to a caller-allocated variable that receives a search handle for the minifilter if the call to <b>FilterVolumeFindFirst</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE. This search handle can be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindnext">FilterVolumeFindNext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindclose">FilterVolumeFindClose</a>.
     * @returns {HRESULT} <b>FilterVolumeFindFirst</b> returns S_OK if it successfully returns information about a volume. Otherwise, it returns an HRESULT error value, such as one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpBuffer</i> is not large enough to contain the requested information.  When this value is returned, <i>lpBytesReturned</i> will contain the size, in bytes, of the buffer required for the given <i>dwInformationClass</i> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid value was specified for the <i>dwInformationClass</i> parameter.  For example, if <b>FilterVolumeStandardInformation</b> is specified for an operating system prior to Windows Vista, <b>FilterVolumeFindFirst</b> returns this HRESULT value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A volume was not found in the list of volumes known to the filter manager.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumefindfirst
     */
    static FilterVolumeFindFirst(dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpVolumeFind) {
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTLIB.dll\FilterVolumeFindFirst", "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpVolumeFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterVolumeFindNext function continues a volume search started by a call to FilterVolumeFindFirst.
     * @remarks
     * After the search handle is established by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a>, use the <b>FilterVolumeFindNext</b> function to search for other volumes.  <b>FilterVolumeFindNext</b> finds one volume per call.
     * 
     * Note that when using <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a> and <b>FilterVolumeFindNext</b> to enumerate the list of volumes known to the filter manager, it is possible for two or more of the volumes in the list to have the same name.  For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ifs/understanding-volume-enumerations-with-duplicate-volume-names">Understanding Volume Enumerations with Duplicate Volume Names</a>.
     * @param {HANDLE} hVolumeFind Volume search handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a>.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterVolumeFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumefindnext
     */
    static FilterVolumeFindNext(hVolumeFind, dwInformationClass, lpBuffer, dwBufferSize) {
        hVolumeFind := hVolumeFind is Win32Handle ? NumGet(hVolumeFind, "ptr") : hVolumeFind

        result := DllCall("FLTLIB.dll\FilterVolumeFindNext", "ptr", hVolumeFind, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * The FilterVolumeFindClose function closes the specified volume search handle. FilterVolumeFindFirst and FilterVolumeFindNext use this search handle to locate volumes.
     * @remarks
     * After the <b>FilterVolumeFindClose</b> function is called, the handle specified by the <i>hVolumeFind</i> parameter cannot be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindnext">FilterVolumeFindNext</a> or <b>FilterVolumeFindClose</b>.
     * @param {HANDLE} hVolumeFind Volume search handle to close. This handle must have been previously opened by <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a>.
     * @returns {HRESULT} <b>FilterVolumeFindClose</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumefindclose
     */
    static FilterVolumeFindClose(hVolumeFind) {
        hVolumeFind := hVolumeFind is Win32Handle ? NumGet(hVolumeFind, "ptr") : hVolumeFind

        result := DllCall("FLTLIB.dll\FilterVolumeFindClose", "ptr", hVolumeFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterInstanceFindFirst function returns information about a minifilter driver instance and is used as a starting point for scanning the instances of a minifilter.
     * @remarks
     * The <b>FilterInstanceFindFirst</b> function opens a search handle and returns information about an instance for the minifilter named by <i>lpFilterName</i>. After the search handle has been established, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindnext">FilterInstanceFindNext</a> to search for other instances of the same minifilter. When the search handle is no longer needed, close it by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindclose">FilterInstanceFindClose</a>.
     * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string that contains the name of the minifilter driver that owns the instance.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @param {Pointer<Integer>} lpBytesReturned Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to, if the call to <b>FilterInstanceFindFirst</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<HANDLE>} lpFilterInstanceFind Pointer to a caller-allocated variable that receives a search handle for the minifilter if the call to <b>FilterInstanceFindFirst</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE. This search handle can be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindnext">FilterInstanceFindNext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindclose">FilterInstanceFindClose</a>.
     * @returns {HRESULT} <b>FilterInstanceFindFirst</b> returns S_OK if successful. Otherwise, it returns an HRESULT error value, such as one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpBuffer</i> is not large enough to contain the requested information.  When this value is returned, <i>lpBytesReturned</i> will contain the size, in bytes, of the buffer required for the given <i>dwInformationClass</i> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid value was specified for the <i>dwInformationClass</i> parameter.  For example, if <b>InstanceAggregateStandardInformation</b> is specified for operating systems prior to Windows Vista, the function returns this HRESULT value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The minifilter specified by the <i>lpFilterName</i> parameter does not have an instance on the file system stack.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancefindfirst
     */
    static FilterInstanceFindFirst(lpFilterName, dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpFilterInstanceFind) {
        lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTLIB.dll\FilterInstanceFindFirst", "ptr", lpFilterName, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpFilterInstanceFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterInstanceFindNext function continues a minifilter driver instance search started by a call to FilterInstanceFindFirst.
     * @remarks
     * After the search handle is established by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>, call <b>FilterInstanceFindNext</b> to search for other instances for the minifilter specified in the call to <b>FilterInstanceFindFirst</b>. 
     * 
     * <b>FilterInstanceFindNext</b> finds one instance per call.
     * @param {HANDLE} hFilterInstanceFind Minifilter instance search handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterInstanceFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancefindnext
     */
    static FilterInstanceFindNext(hFilterInstanceFind, dwInformationClass, lpBuffer, dwBufferSize) {
        hFilterInstanceFind := hFilterInstanceFind is Win32Handle ? NumGet(hFilterInstanceFind, "ptr") : hFilterInstanceFind

        result := DllCall("FLTLIB.dll\FilterInstanceFindNext", "ptr", hFilterInstanceFind, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * The FilterInstanceFindClose function closes the specified minifilter instance search handle. The FilterInstanceFindFirst and FilterInstanceFindNext functions use this search handle to locate instances of a minifilter.
     * @remarks
     * After the <b>FilterInstanceFindClose</b> function is called, the minifilter instance search handle specified by the <i>hFilterInstanceFind</i> parameter cannot be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a> or <b>FilterInstanceFindClose</b>. 
     * 
     * Use <b>FilterInstanceFindClose</b> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstanceclose">FilterInstanceClose</a> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>.
     * @param {HANDLE} hFilterInstanceFind Minifilter instance search handle to close. This handle must have been opened by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>.
     * @returns {HRESULT} <b>FilterInstanceFindClose</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancefindclose
     */
    static FilterInstanceFindClose(hFilterInstanceFind) {
        hFilterInstanceFind := hFilterInstanceFind is Win32Handle ? NumGet(hFilterInstanceFind, "ptr") : hFilterInstanceFind

        result := DllCall("FLTLIB.dll\FilterInstanceFindClose", "ptr", hFilterInstanceFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterVolumeInstanceFindFirst function returns information about a minifilter driver instance or legacy filter driver and is used to begin scanning the filter drivers that are attached to a volume.
     * @remarks
     * The <b>FilterVolumeInstanceFindFirst</b> function opens a search handle and returns information about the first filter driver found that is attached to the volume named by <i>lpVolumeName</i>. After the search handle has been established, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindnext">FilterVolumeInstanceFindNext</a> to search for other filter drivers that are attached to the same volume. When the search handle is no longer needed, close it by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindclose">FilterVolumeInstanceFindClose</a>. 
     * 
     * Starting with Windows Vista, <b>FilterVolumeInstanceFindFirst</b> can return both legacy filter driver information and minifilter driver instance information when the value of the <i>dwInformationClass</i> parameter is <b>InstanceAggregateStandardInformation</b>.  For earlier operating systems, this function cannot return legacy filter information because the INSTANCE_AGGREGATE_STANDARD_INFORMATION structure is not available.
     * @param {PWSTR} lpVolumeName Pointer to a null-terminated wide-character string that contains the name of the volume to which the minifilter instance or legacy filter is attached.
     * 
     * The <i>lpVolumeName</i> input string can be any of the following. The trailing backslash (\\) is optional. 
     * 
     * <ul>
     * <li>
     *  A drive letter, such as D:\
     * 
     * </li>
     * <li>
     *  A path to a volume mount point, such as c:\mnt\edrive\
     * 
     * </li>
     * <li>
     *  A unique volume identifier (also called a <i>volume GUID name</i>), such as \??\Volume{7603f260-142a-11d4-ac67-806d6172696f}\
     * 
     * </li>
     * <li>
     *  A nonpersistent device name (also called a <i>target name</i> or an <i>NT device name</i>), such as \Device\HarddiskVolume1\
     * 
     * </li>
     * </ul>
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @param {Pointer<Integer>} lpBytesReturned Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterVolumeInstanceFindFirst</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<HANDLE>} lpVolumeInstanceFind Pointer to a caller-allocated variable that receives a search handle for the minifilter instance or legacy filter (only when <b>InstanceAggregateStandardInformation</b> is specified) if the call to <b>FilterVolumeInstanceFindFirst</b> succeeds. Otherwise, <i>lpVolumeInstanceFind</i> receives INVALID_HANDLE_VALUE. This search handle can be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindnext">FilterVolumeInstanceFindNext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindclose">FilterVolumeInstanceFindClose</a>.
     * @returns {HRESULT} <b>FilterVolumeInstanceFindFirst</b> returns S_OK if successful. Otherwise, it returns an HRESULT error value, such as one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpBuffer</i> is not large enough to contain the requested information.  When this value is returned, <i>lpBytesReturned</i> will contain the size, in bytes, of the buffer required for the given <i>dwInformationClass</i> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid value was specified for the <i>dwInformationClass</i> parameter.  For example, if <b>InstanceAggregateStandardInformation</b> is specified for an operating system prior to Windows Vista, <b>FilterVolumeInstanceFindFirst</b> returns this HRESULT value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A filter driver was not found on the given volume.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumeinstancefindfirst
     */
    static FilterVolumeInstanceFindFirst(lpVolumeName, dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpVolumeInstanceFind) {
        lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName

        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("FLTLIB.dll\FilterVolumeInstanceFindFirst", "ptr", lpVolumeName, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpVolumeInstanceFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterVolumeInstanceFindNext function continues a minifilter driver instance or legacy filter driver search started by a call to FilterVolumeInstanceFindFirst.
     * @remarks
     * <b>FilterVolumeInstanceFindNext</b> finds one filter driver per call.
     * 
     * After the search handle is established by calling <b>FilterVolumeInstanceFindFirst</b>, use the <b>FilterVolumeInstanceFindNext</b> function to search for other filter drivers that are attached to the volume specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindfirst">FilterVolumeInstanceFindFirst</a>. When the search handle is no longer required, close it by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindclose">FilterVolumeInstanceFindClose</a>.
     * 
     * Starting with Windows Vista, this routine can return both legacy filter driver information and minifilter driver instance information when the value of the <i>dwInformationClass</i> parameter is <b>InstanceAggregateStandardInformation</b>.  For earlier operating systems, this routine cannot return legacy filter information because the INSTANCE_AGGREGATE_STANDARD_INFORMATION structure is not available.
     * @param {HANDLE} hVolumeInstanceFind Volume filter driver search handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindfirst">FilterVolumeInstanceFindFirst</a>.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterVolumeInstanceFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumeinstancefindnext
     */
    static FilterVolumeInstanceFindNext(hVolumeInstanceFind, dwInformationClass, lpBuffer, dwBufferSize) {
        hVolumeInstanceFind := hVolumeInstanceFind is Win32Handle ? NumGet(hVolumeInstanceFind, "ptr") : hVolumeInstanceFind

        result := DllCall("FLTLIB.dll\FilterVolumeInstanceFindNext", "ptr", hVolumeInstanceFind, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * The FilterVolumeInstanceFindClose function closes the specified volume instance search handle. FilterVolumeInstanceFindFirst and FilterVolumeInstanceFindNext use this search handle to locate instances on a volume.
     * @remarks
     * After the <b>FilterVolumeInstanceFindClose</b> function is called, the handle specified by the <i>hVolumeInstanceFind</i> parameter cannot be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindnext">FilterVolumeInstanceFindNext</a> or <b>FilterVolumeInstanceFindClose</b>.
     * @param {HANDLE} hVolumeInstanceFind Volume instance search handle to close. This handle must have been opened by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumeinstancefindfirst">FilterVolumeInstanceFindFirst</a>.
     * @returns {HRESULT} <b>FilterVolumeInstanceFindClose</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumeinstancefindclose
     */
    static FilterVolumeInstanceFindClose(hVolumeInstanceFind) {
        hVolumeInstanceFind := hVolumeInstanceFind is Win32Handle ? NumGet(hVolumeInstanceFind, "ptr") : hVolumeInstanceFind

        result := DllCall("FLTLIB.dll\FilterVolumeInstanceFindClose", "ptr", hVolumeInstanceFind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterGetInformation function returns various kinds of information about a minifilter.
     * @remarks
     * <b>FilterGetInformation</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltgetfilterinformation">FltGetFilterInformation</a>.
     * @param {HFILTER} hFilter Handle returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a> function.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterGetInformation</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtergetinformation
     */
    static FilterGetInformation(hFilter, dwInformationClass, lpBuffer, dwBufferSize) {
        hFilter := hFilter is Win32Handle ? NumGet(hFilter, "ptr") : hFilter

        result := DllCall("FLTLIB.dll\FilterGetInformation", "ptr", hFilter, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * The FilterInstanceGetInformation function returns various kinds of information about a minifilter instance.
     * @remarks
     * Given a handle to a minifilter instance, this routine returns information about the minifilter instance.  The type of instance information returned is determined by the <i>dwInformationClass</i> parameter.
     * 
     * <b>FilterInstanceGetInformation</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltgetinstanceinformation">FltGetInstanceInformation</a>.
     * @param {HFILTER_INSTANCE} hInstance Handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>.
     * @param {Integer} dwInformationClass 
     * @param {Pointer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
     * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterInstanceGetInformation</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancegetinformation
     */
    static FilterInstanceGetInformation(hInstance, dwInformationClass, lpBuffer, dwBufferSize) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance

        result := DllCall("FLTLIB.dll\FilterInstanceGetInformation", "ptr", hInstance, "int", dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * FilterConnectCommunicationPort opens a new connection to a communication server port that is created by a file system minifilter.
     * @remarks
     * <b>FilterConnectCommunicationPort</b> opens a connection to a minifilter's communication server port on behalf of a user-mode application. The application uses the resulting connection port handle to communicate with the minifilter. 
     * 
     * After it successfully calls <b>FilterConnectCommunicationPort</b>, the application can send messages to the minifilter through the connection port by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtersendmessage">FilterSendMessage</a>. It can also receive and reply to messages from the minifilter by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtergetmessage">FilterGetMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterreplymessage">FilterReplyMessage</a>, respectively. The connection port handle returned in the <i>hPort</i> parameter is passed as the first parameter to <b>FilterSendMessage</b>, <b>FilterGetMessage</b>, and <b>FilterReplyMessage</b>. 
     * 
     * Any handle that is obtained from <b>FilterConnectCommunicationPort</b> must eventually be released by calling <a href="https://docs.microsoft.com/windows/win32/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @param {PWSTR} lpPortName Pointer to a NULL-terminated wide-character string containing the fully qualified name of the communication server port (for example, L"\\MyFilterPort").
     * @param {Integer} dwOptions Connection options for the communication port. Prior to Windows 8.1, this value is set to 0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FLT_PORT_FLAG_SYNC_HANDLE"></a><a id="flt_port_flag_sync_handle"></a><dl>
     * <dt><b>FLT_PORT_FLAG_SYNC_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle returned in <i>hPort</i> is for synchronous I/O. This flag is available starting with Windows 8.1.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} lpContext Pointer to caller-supplied context information to be passed to the kernel-mode minifilter's connect notification routine. (See the <i>ConnectNotifyCallback</i> parameter in the reference page for <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltcreatecommunicationport">FltCreateCommunicationPort</a>.) This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} wSizeOfContext Size, in bytes, of the structure that the <i>lpContext</i> parameter points to. If the value of <i>lpContext</i> is non-<b>NULL</b>, this parameter must be nonzero. If <i>lpContext</i> is <b>NULL</b>, this parameter must be zero.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes Pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. For more information about the SECURITY_ATTRIBUTES structure, see the Microsoft Windows SDK documentation. This parameter is optional and can be <b>NULL</b>. If this parameter is <b>NULL</b>, the handle cannot be inherited.
     * @returns {HANDLE} Pointer to a caller-allocated variable that receives a handle for the newly created connection port if the call to <b>FilterConnectCommunicationPort</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterconnectcommunicationport
     */
    static FilterConnectCommunicationPort(lpPortName, dwOptions, lpContext, wSizeOfContext, lpSecurityAttributes) {
        lpPortName := lpPortName is String ? StrPtr(lpPortName) : lpPortName

        hPort := HANDLE()
        result := DllCall("FLTLIB.dll\FilterConnectCommunicationPort", "ptr", lpPortName, "uint", dwOptions, "ptr", lpContext, "ushort", wSizeOfContext, "ptr", lpSecurityAttributes, "ptr", hPort, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hPort
    }

    /**
     * The FilterSendMessage function sends a message to a kernel-mode minifilter.
     * @remarks
     * The <b>FilterSendMessage</b> function sends a message to a minifilter. The message is passed to the minifilter's message notification callback routine, which processes the message. (The minifilter registers its message callback notification routine by passing it as the <i>MessageNotifyCallback</i> parameter to <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltcreatecommunicationport">FltCreateCommunicationPort</a>.) 
     * 
     * <b>FilterSendMessage</b> is synchronous. The caller is put into a wait state until the message is delivered and the minifilter's reply (if any) is received. 
     * 
     * If the caller expects a reply, it must pass a non-<b>NULL</b> buffer for the <i>lpOutBuffer</i> parameter and a positive value for the <i>dwOutBufferSize</i> parameter. 
     * 
     * To get a message from a minifilter, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtergetmessage">FilterGetMessage</a>. 
     * 
     * To reply to a message from a minifilter, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterreplymessage">FilterReplyMessage</a>. 
     * 
     * A minifilter sends a message to a user-mode application by calling <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltsendmessage">FltSendMessage</a>.
     * @param {HANDLE} hPort Communication port handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterconnectcommunicationport">FilterConnectCommunicationPort</a>. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer} lpInBuffer Pointer to a caller-allocated buffer containing the message to be sent to the minifilter. The message format is caller-defined. This parameter is required and cannot be <b>NULL</b>.
     * @param {Integer} dwInBufferSize Size, in bytes, of the buffer pointed to by <i>lpInBuffer</i>.
     * @param {Pointer} lpOutBuffer Pointer to a caller-allocated buffer that receives the reply (if any) from the minifilter.
     * @param {Integer} dwOutBufferSize Size, in bytes, of the buffer pointed to by <i>lpOutBuffer</i>. This value is ignored if <i>lpOutBuffer</i> is <b>NULL</b>.
     * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpOutBuffer</i> points to if the call to <b>FilterSendMessage</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtersendmessage
     */
    static FilterSendMessage(hPort, lpInBuffer, dwInBufferSize, lpOutBuffer, dwOutBufferSize) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := DllCall("FLTLIB.dll\FilterSendMessage", "ptr", hPort, "ptr", lpInBuffer, "uint", dwInBufferSize, "ptr", lpOutBuffer, "uint", dwOutBufferSize, "uint*", &lpBytesReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpBytesReturned
    }

    /**
     * The FilterGetMessage function gets a message from a kernel-mode minifilter.
     * @remarks
     * The <b>FilterGetMessage</b> function is designed for both synchronous and asynchronous (overlapped) operation. 
     * 
     * When <i>lpOverlapped</i> is <b>NULL</b>, and a message is available, <b>FilterGetMessage</b>  returns immediately. Otherwise, the caller is put into a wait state until a message is received.
     * 
     * If <i>lpOverlapped</i> is not <b>NULL</b>, <b>FilterGetMessage</b> returns ERROR_IO_PENDING. In this situation, the event object in the <i>lpOverlapped</i> structure is set to the nonsignaled state before <b>FilterGetMessage</b> returns. When the message is delivered, this event is set to the signaled state.
     * 
     * After receiving the message from the minifilter, the caller can send a reply by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterreplymessage">FilterReplyMessage</a>. 
     * 
     * A minifilter or instance sends a message to a user-mode application by calling <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltsendmessage">FltSendMessage</a>.
     * @param {HANDLE} hPort Communication port handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterconnectcommunicationport">FilterConnectCommunicationPort</a>. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer} lpMessageBuffer Pointer to a caller-allocated buffer that receives the message from the minifilter. The message must contain a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltuserstructures/ns-fltuserstructures-_filter_message_header">FILTER_MESSAGE_HEADER</a> structure, but otherwise its format is caller-defined. This parameter is required and cannot be <b>NULL</b>.
     * @param {Integer} dwMessageBufferSize Size, in bytes, of the buffer that the <i>lpMessageBuffer</i> parameter points to.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an OVERLAPPED structure. This parameter is optional and can be <b>NULL</b>. If it is not <b>NULL</b>, the caller must initialize the <b>hEvent</b> member of the OVERLAPPED structure to a valid event handle or <b>NULL</b>.
     * @returns {HRESULT} <b>FilterGetMessage</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtergetmessage
     */
    static FilterGetMessage(hPort, lpMessageBuffer, dwMessageBufferSize, lpOverlapped) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := DllCall("FLTLIB.dll\FilterGetMessage", "ptr", hPort, "ptr", lpMessageBuffer, "uint", dwMessageBufferSize, "ptr", lpOverlapped, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterReplyMessage function replies to a message from a kernel-mode minifilter.
     * @remarks
     * A user-mode application calls the <b>FilterReplyMessage</b> function to reply to a message received from a kernel-mode minifilter. 
     * 
     * To get a message from a minifilter, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtergetmessage">FilterGetMessage</a>. 
     * 
     * To send a message to a minifilter, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtersendmessage">FilterSendMessage</a>. 
     * 
     * A minifilter sends a message to a user-mode application by calling <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltsendmessage">FltSendMessage</a>. 
     * 
     * <div class="alert"><b>Important</b>  <p class="note">Due to (system-specific) structure <a href="https://docs.microsoft.com/windows-hardware/drivers/">padding</a> requirements, accuracy is required when you set the size of buffers that are associated with <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltsendmessage">FltSendMessage</a> and <b>FilterReplyMessage</b>. As an example, assume data must be sent (via <b>FilterReplyMessage</b>) to a minifilter.  The user-mode component might declare the following structure to do so:
     * 
     * 
     * ```cpp
     * typedef struct _REPLY_STRUCT
     * {
     *      FILTER_REPLY_HEADER Header;
     *      MY_STRUCTURE Data;  // The structure to be sent to the minifilter.
     * } REPLY_STRUCT, *PREPLY_STRUCT;
     * ```
     * 
     * 
     * <p class="note">Given this structure, it might seem obvious that the caller of <b>FilterReplyMessage</b> would set the <i>dwReplyBufferSize</i> parameter to <c>sizeof(REPLY_STRUCT)</code> and the <i>ReplyLength</i> parameter of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltsendmessage">FltSendMessage</a> to the same value.  However, because of structure padding idiosyncrasies, <code>sizeof(REPLY_STRUCT)</code> might be larger than <code>sizeof(FILTER_REPLY_HEADER) + sizeof(MY_STRUCT)</c>.  If this is the case, <b>FltSendMessage</b> returns STATUS_BUFFER_OVERFLOW.
     * 
     * <p class="note">Therefore, we recommend that you call <b>FilterReplyMessage</b> and <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltsendmessage">FltSendMessage</a> (leveraging the above example) by setting <i>dwReplyBufferSize</i> and <i>ReplyLength</i> both to <c>sizeof(FILTER_REPLY_HEADER) + sizeof(MY_STRUCT)</code> instead of <code>sizeof(REPLY_STRUCT)</c>. This ensures that any extra padding at the end of the <b>REPLY_STRUCT</b> structure is ignored.
     * 
     * </div>
     * <div> </div>
     * @param {HANDLE} hPort Communication port handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterconnectcommunicationport">FilterConnectCommunicationPort</a>. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer} lpReplyBuffer A pointer to a caller-allocated buffer containing the reply to be sent to the minifilter. The reply must contain a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltuserstructures/ns-fltuserstructures-_filter_reply_header">FILTER_REPLY_HEADER</a> structure, but otherwise, its format is caller-defined. This parameter is required and cannot be <b>NULL</b>.
     * @param {Integer} dwReplyBufferSize Size, in bytes, of the buffer that the <i>lpReplyBuffer</i> parameter points to. See the Remarks section.
     * @returns {HRESULT} <b>FilterReplyMessage</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterreplymessage
     * @since windows5.0
     */
    static FilterReplyMessage(hPort, lpReplyBuffer, dwReplyBufferSize) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := DllCall("FLTLIB.dll\FilterReplyMessage", "ptr", hPort, "ptr", lpReplyBuffer, "uint", dwReplyBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FilterGetDosName function returns the MS-DOS device name that corresponds to the given volume name.
     * @remarks
     * <b>FilterGetDosName</b> returns the volume's drive letter if it has one. If no drive letter is assigned to the volume, <b>FilterGetDosName</b> returns a path to a volume mount point (also called a <i>mount point name</i>). If no drive letters or mount points are defined for the volume, <b>FilterGetDosName</b> returns S_OK, and <i>lpDosName</i> receives <b>NULL</b>.
     * @param {PWSTR} lpVolumeName Pointer to a NULL-terminated wide-character string containing the volume name. 
     * 
     * The <i>lpVolumeName</i> input string can be any of the following. The trailing backslash (\\) is optional. 
     * 
     * <ul>
     * <li>
     * A drive letter, such as "D:\"
     * 
     * </li>
     * <li>
     * A path to a volume mount point, such as "c:\mnt\edrive\"
     * 
     * </li>
     * <li>
     * A unique volume identifier (also called a <i>volume GUID name</i>), such as "\??\Volume{7603f260-142a-11d4-ac67-806d6172696f}\"
     * 
     * </li>
     * <li>
     * A nonpersistent device name (also called a <i>target name</i> or an <i>NT device name</i>), such as "\Device\HarddiskVolume1\"
     * 
     * </li>
     * </ul>
     * This parameter is required and cannot be <b>NULL</b>.
     * @param {PWSTR} lpDosName Pointer to a caller-allocated buffer that receives the MS-DOS device name as a NULL-terminated wide-character string.
     * @param {Integer} dwDosNameBufferSize Size, in wide characters, of the buffer that <i>lpDosName </i> points to.
     * @returns {HRESULT} <b>FilterGetDosName</b> returns S_OK if successful. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtergetdosname
     */
    static FilterGetDosName(lpVolumeName, lpDosName, dwDosNameBufferSize) {
        lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
        lpDosName := lpDosName is String ? StrPtr(lpDosName) : lpDosName

        result := DllCall("FLTLIB.dll\FilterGetDosName", "ptr", lpVolumeName, "ptr", lpDosName, "uint", dwDosNameBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
