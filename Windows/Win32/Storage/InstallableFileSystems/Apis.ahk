#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HFILTER.ahk" { HFILTER }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\INSTANCE_INFORMATION_CLASS.ahk" { INSTANCE_INFORMATION_CLASS }
#Import ".\FILTER_VOLUME_INFORMATION_CLASS.ahk" { FILTER_VOLUME_INFORMATION_CLASS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HFILTER_INSTANCE.ahk" { HFILTER_INSTANCE }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import ".\FILTER_INFORMATION_CLASS.ahk" { FILTER_INFORMATION_CLASS }

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */

;@region Functions
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
export FilterLoad(lpFilterName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

    result := DllCall("FLTLIB.dll\FilterLoad", "ptr", lpFilterName, "HRESULT")
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
export FilterUnload(lpFilterName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

    result := DllCall("FLTLIB.dll\FilterUnload", "ptr", lpFilterName, "HRESULT")
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
export FilterCreate(lpFilterName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

    _hFilter := HFILTER.Owned()
    result := DllCall("FLTLIB.dll\FilterCreate", "ptr", lpFilterName, HFILTER.Ptr, _hFilter, "HRESULT")
    return _hFilter
}

/**
 * The FilterClose function closes an open minifilter handle.
 * @remarks
 * After <b>FilterClose</b> is called, the minifilter handle that the <i>hFilter</i> parameter specifies is no longer valid and cannot safely be used. 
 * 
 * Use <b>FilterClose</b> to close open minifilter handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindclose">FilterFindClose</a> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterfindfirst">FilterFindFirst</a>. 
 * 
 * To close a connection port handle that was opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterconnectcommunicationport">FilterConnectCommunicationPort</a>, use <a href="https://docs.microsoft.com/windows/win32/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
 * @param {HFILTER} _hFilter Minifilter handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a>.
 * @returns {HRESULT} <b>FilterClose</b> returns S_OK if successful. Otherwise, it returns an error value.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterclose
 */
export FilterClose(_hFilter) {
    result := DllCall("FLTLIB.dll\FilterClose", HFILTER, _hFilter, "HRESULT")
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
export FilterInstanceCreate(lpFilterName, lpVolumeName, lpInstanceName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
    lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
    lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

    _hInstance := HFILTER_INSTANCE.Owned()
    result := DllCall("FLTLIB.dll\FilterInstanceCreate", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpInstanceName, HFILTER_INSTANCE.Ptr, _hInstance, "HRESULT")
    return _hInstance
}

/**
 * The FilterInstanceClose function closes a minifilter instance handle opened by FilterInstanceCreate.
 * @remarks
 * After the <b>FilterInstanceClose</b> function is called, the minifilter instance handle specified by the <i>hFilterInstanceFind</i> parameter is no longer valid and cannot safely be used. 
 * 
 * Use <b>FilterInstanceClose</b> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindclose">FilterInstanceFindClose</a> to close handles returned by calls to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>.
 * @param {HFILTER_INSTANCE} _hInstance Minifilter instance handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>.
 * @returns {HRESULT} <b>FilterInstanceClose</b> returns S_OK if successful. Otherwise, it returns an error value.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstanceclose
 */
export FilterInstanceClose(_hInstance) {
    result := DllCall("FLTLIB.dll\FilterInstanceClose", HFILTER_INSTANCE, _hInstance, "HRESULT")
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
 * @param {Integer} lpCreatedInstanceName Pointer to a caller-allocated variable that receives the instance name for the new instance if the instance is successfully attached to the volume. This parameter is optional and can be <b>NULL</b>. If it is not <b>NULL</b>, the buffer must be large enough to hold INSTANCE_NAME_MAX_CHARS characters plus a NULL terminator.
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
export FilterAttach(lpFilterName, lpVolumeName, lpInstanceName, dwCreatedInstanceNameLength, lpCreatedInstanceName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
    lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
    lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

    result := DllCall("FLTLIB.dll\FilterAttach", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpInstanceName, "uint", dwCreatedInstanceNameLength, "ptr", lpCreatedInstanceName, "HRESULT")
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
 * @param {Integer} lpCreatedInstanceName Pointer to a caller-allocated variable that receives the instance name for the new instance if the instance is successfully attached to the volume. This parameter is optional and can be <b>NULL</b>. If it is not <b>NULL</b>, the buffer must be large enough to hold INSTANCE_NAME_MAX_CHARS characters plus a NULL terminator.
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
export FilterAttachAtAltitude(lpFilterName, lpVolumeName, lpAltitude, lpInstanceName, dwCreatedInstanceNameLength, lpCreatedInstanceName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
    lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
    lpAltitude := lpAltitude is String ? StrPtr(lpAltitude) : lpAltitude
    lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

    result := DllCall("FLTLIB.dll\FilterAttachAtAltitude", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpAltitude, "ptr", lpInstanceName, "uint", dwCreatedInstanceNameLength, "ptr", lpCreatedInstanceName, "HRESULT")
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
export FilterDetach(lpFilterName, lpVolumeName, lpInstanceName) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName
    lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
    lpInstanceName := lpInstanceName is String ? StrPtr(lpInstanceName) : lpInstanceName

    result := DllCall("FLTLIB.dll\FilterDetach", "ptr", lpFilterName, "ptr", lpVolumeName, "ptr", lpInstanceName, "HRESULT")
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
 * @param {FILTER_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
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
export FilterFindFirst(dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpFilterFind) {
    lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTLIB.dll\FilterFindFirst", FILTER_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, HANDLE.Ptr, lpFilterFind, "HRESULT")
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
 * @param {FILTER_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned is defined by the <i>dwInformationClass</i> parameter.
 * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterfindnext
 */
export FilterFindNext(hFilterFind, dwInformationClass, lpBuffer, dwBufferSize) {
    result := DllCall("FLTLIB.dll\FilterFindNext", HANDLE, hFilterFind, FILTER_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
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
export FilterFindClose(hFilterFind) {
    result := DllCall("FLTLIB.dll\FilterFindClose", HANDLE, hFilterFind, "HRESULT")
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
 * @param {FILTER_VOLUME_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
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
export FilterVolumeFindFirst(dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpVolumeFind) {
    lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTLIB.dll\FilterVolumeFindFirst", FILTER_VOLUME_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, HANDLE.Ptr, lpVolumeFind, "HRESULT")
    return result
}

/**
 * The FilterVolumeFindNext function continues a volume search started by a call to FilterVolumeFindFirst.
 * @remarks
 * After the search handle is established by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a>, use the <b>FilterVolumeFindNext</b> function to search for other volumes.  <b>FilterVolumeFindNext</b> finds one volume per call.
 * 
 * Note that when using <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a> and <b>FilterVolumeFindNext</b> to enumerate the list of volumes known to the filter manager, it is possible for two or more of the volumes in the list to have the same name.  For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ifs/understanding-volume-enumerations-with-duplicate-volume-names">Understanding Volume Enumerations with Duplicate Volume Names</a>.
 * @param {HANDLE} hVolumeFind Volume search handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtervolumefindfirst">FilterVolumeFindFirst</a>.
 * @param {FILTER_VOLUME_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
 * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterVolumeFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumefindnext
 */
export FilterVolumeFindNext(hVolumeFind, dwInformationClass, lpBuffer, dwBufferSize) {
    result := DllCall("FLTLIB.dll\FilterVolumeFindNext", HANDLE, hVolumeFind, FILTER_VOLUME_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
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
export FilterVolumeFindClose(hVolumeFind) {
    result := DllCall("FLTLIB.dll\FilterVolumeFindClose", HANDLE, hVolumeFind, "HRESULT")
    return result
}

/**
 * The FilterInstanceFindFirst function returns information about a minifilter driver instance and is used as a starting point for scanning the instances of a minifilter.
 * @remarks
 * The <b>FilterInstanceFindFirst</b> function opens a search handle and returns information about an instance for the minifilter named by <i>lpFilterName</i>. After the search handle has been established, call <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindnext">FilterInstanceFindNext</a> to search for other instances of the same minifilter. When the search handle is no longer needed, close it by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindclose">FilterInstanceFindClose</a>.
 * @param {PWSTR} lpFilterName Pointer to a null-terminated wide-character string that contains the name of the minifilter driver that owns the instance.
 * @param {INSTANCE_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
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
export FilterInstanceFindFirst(lpFilterName, dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpFilterInstanceFind) {
    lpFilterName := lpFilterName is String ? StrPtr(lpFilterName) : lpFilterName

    lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTLIB.dll\FilterInstanceFindFirst", "ptr", lpFilterName, INSTANCE_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, HANDLE.Ptr, lpFilterInstanceFind, "HRESULT")
    return result
}

/**
 * The FilterInstanceFindNext function continues a minifilter driver instance search started by a call to FilterInstanceFindFirst.
 * @remarks
 * After the search handle is established by calling <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>, call <b>FilterInstanceFindNext</b> to search for other instances for the minifilter specified in the call to <b>FilterInstanceFindFirst</b>. 
 * 
 * <b>FilterInstanceFindNext</b> finds one instance per call.
 * @param {HANDLE} hFilterInstanceFind Minifilter instance search handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancefindfirst">FilterInstanceFindFirst</a>.
 * @param {INSTANCE_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
 * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterInstanceFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancefindnext
 */
export FilterInstanceFindNext(hFilterInstanceFind, dwInformationClass, lpBuffer, dwBufferSize) {
    result := DllCall("FLTLIB.dll\FilterInstanceFindNext", HANDLE, hFilterInstanceFind, INSTANCE_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
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
export FilterInstanceFindClose(hFilterInstanceFind) {
    result := DllCall("FLTLIB.dll\FilterInstanceFindClose", HANDLE, hFilterInstanceFind, "HRESULT")
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
 * @param {INSTANCE_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
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
export FilterVolumeInstanceFindFirst(lpVolumeName, dwInformationClass, lpBuffer, dwBufferSize, lpBytesReturned, lpVolumeInstanceFind) {
    lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName

    lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("FLTLIB.dll\FilterVolumeInstanceFindFirst", "ptr", lpVolumeName, INSTANCE_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, lpBytesReturnedMarshal, lpBytesReturned, HANDLE.Ptr, lpVolumeInstanceFind, "HRESULT")
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
 * @param {INSTANCE_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
 * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterVolumeInstanceFindNext</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtervolumeinstancefindnext
 */
export FilterVolumeInstanceFindNext(hVolumeInstanceFind, dwInformationClass, lpBuffer, dwBufferSize) {
    result := DllCall("FLTLIB.dll\FilterVolumeInstanceFindNext", HANDLE, hVolumeInstanceFind, INSTANCE_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
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
export FilterVolumeInstanceFindClose(hVolumeInstanceFind) {
    result := DllCall("FLTLIB.dll\FilterVolumeInstanceFindClose", HANDLE, hVolumeInstanceFind, "HRESULT")
    return result
}

/**
 * The FilterGetInformation function returns various kinds of information about a minifilter.
 * @remarks
 * <b>FilterGetInformation</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltgetfilterinformation">FltGetFilterInformation</a>.
 * @param {HFILTER} _hFilter Handle returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filtercreate">FilterCreate</a> function.
 * @param {FILTER_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
 * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterGetInformation</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtergetinformation
 */
export FilterGetInformation(_hFilter, dwInformationClass, lpBuffer, dwBufferSize) {
    result := DllCall("FLTLIB.dll\FilterGetInformation", HFILTER, _hFilter, FILTER_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
    return lpBytesReturned
}

/**
 * The FilterInstanceGetInformation function returns various kinds of information about a minifilter instance.
 * @remarks
 * Given a handle to a minifilter instance, this routine returns information about the minifilter instance.  The type of instance information returned is determined by the <i>dwInformationClass</i> parameter.
 * 
 * <b>FilterInstanceGetInformation</b> is the Win32 equivalent of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltgetinstanceinformation">FltGetInstanceInformation</a>.
 * @param {HFILTER_INSTANCE} _hInstance Handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/fltuser/nf-fltuser-filterinstancecreate">FilterInstanceCreate</a>.
 * @param {INSTANCE_INFORMATION_CLASS} dwInformationClass 
 * @param {Integer} lpBuffer Pointer to a caller-allocated buffer that receives the requested information. The type of the information returned in the buffer is defined by the <i>dwInformationClass</i> parameter.
 * @param {Integer} dwBufferSize Size, in bytes, of the buffer that the <i>lpBuffer</i> parameter points to. The caller should set this parameter according to the given <i>dwInformationClass</i>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpBuffer</i> points to if the call to <b>FilterInstanceGetInformation</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterinstancegetinformation
 */
export FilterInstanceGetInformation(_hInstance, dwInformationClass, lpBuffer, dwBufferSize) {
    result := DllCall("FLTLIB.dll\FilterInstanceGetInformation", HFILTER_INSTANCE, _hInstance, INSTANCE_INFORMATION_CLASS, dwInformationClass, "ptr", lpBuffer, "uint", dwBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
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
 * @param {Integer} lpContext Pointer to caller-supplied context information to be passed to the kernel-mode minifilter's connect notification routine. (See the <i>ConnectNotifyCallback</i> parameter in the reference page for <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltcreatecommunicationport">FltCreateCommunicationPort</a>.) This parameter is optional and can be <b>NULL</b>.
 * @param {Integer} wSizeOfContext Size, in bytes, of the structure that the <i>lpContext</i> parameter points to. If the value of <i>lpContext</i> is non-<b>NULL</b>, this parameter must be nonzero. If <i>lpContext</i> is <b>NULL</b>, this parameter must be zero.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes Pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. For more information about the SECURITY_ATTRIBUTES structure, see the Microsoft Windows SDK documentation. This parameter is optional and can be <b>NULL</b>. If this parameter is <b>NULL</b>, the handle cannot be inherited.
 * @returns {HANDLE} Pointer to a caller-allocated variable that receives a handle for the newly created connection port if the call to <b>FilterConnectCommunicationPort</b> succeeds; otherwise, it receives INVALID_HANDLE_VALUE.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterconnectcommunicationport
 */
export FilterConnectCommunicationPort(lpPortName, dwOptions, lpContext, wSizeOfContext, lpSecurityAttributes) {
    lpPortName := lpPortName is String ? StrPtr(lpPortName) : lpPortName

    hPort := HANDLE.Owned()
    result := DllCall("FLTLIB.dll\FilterConnectCommunicationPort", "ptr", lpPortName, "uint", dwOptions, "ptr", lpContext, "ushort", wSizeOfContext, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HANDLE.Ptr, hPort, "HRESULT")
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
 * @param {Integer} lpInBuffer Pointer to a caller-allocated buffer containing the message to be sent to the minifilter. The message format is caller-defined. This parameter is required and cannot be <b>NULL</b>.
 * @param {Integer} dwInBufferSize Size, in bytes, of the buffer pointed to by <i>lpInBuffer</i>.
 * @param {Integer} lpOutBuffer Pointer to a caller-allocated buffer that receives the reply (if any) from the minifilter.
 * @param {Integer} dwOutBufferSize Size, in bytes, of the buffer pointed to by <i>lpOutBuffer</i>. This value is ignored if <i>lpOutBuffer</i> is <b>NULL</b>.
 * @returns {Integer} Pointer to a caller-allocated variable that receives the number of bytes returned in the buffer that <i>lpOutBuffer</i> points to if the call to <b>FilterSendMessage</b> succeeds. This parameter is required and cannot be <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtersendmessage
 */
export FilterSendMessage(hPort, lpInBuffer, dwInBufferSize, lpOutBuffer, dwOutBufferSize) {
    result := DllCall("FLTLIB.dll\FilterSendMessage", HANDLE, hPort, "ptr", lpInBuffer, "uint", dwInBufferSize, "ptr", lpOutBuffer, "uint", dwOutBufferSize, "uint*", &lpBytesReturned := 0, "HRESULT")
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
 * @param {Integer} lpMessageBuffer Pointer to a caller-allocated buffer that receives the message from the minifilter. The message must contain a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltuserstructures/ns-fltuserstructures-_filter_message_header">FILTER_MESSAGE_HEADER</a> structure, but otherwise its format is caller-defined. This parameter is required and cannot be <b>NULL</b>.
 * @param {Integer} dwMessageBufferSize Size, in bytes, of the buffer that the <i>lpMessageBuffer</i> parameter points to.
 * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an OVERLAPPED structure. This parameter is optional and can be <b>NULL</b>. If it is not <b>NULL</b>, the caller must initialize the <b>hEvent</b> member of the OVERLAPPED structure to a valid event handle or <b>NULL</b>.
 * @returns {HRESULT} <b>FilterGetMessage</b> returns S_OK if successful. Otherwise, it returns an error value.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filtergetmessage
 */
export FilterGetMessage(hPort, lpMessageBuffer, dwMessageBufferSize, lpOverlapped) {
    result := DllCall("FLTLIB.dll\FilterGetMessage", HANDLE, hPort, "ptr", lpMessageBuffer, "uint", dwMessageBufferSize, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
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
 * @param {Integer} lpReplyBuffer A pointer to a caller-allocated buffer containing the reply to be sent to the minifilter. The reply must contain a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltuserstructures/ns-fltuserstructures-_filter_reply_header">FILTER_REPLY_HEADER</a> structure, but otherwise, its format is caller-defined. This parameter is required and cannot be <b>NULL</b>.
 * @param {Integer} dwReplyBufferSize Size, in bytes, of the buffer that the <i>lpReplyBuffer</i> parameter points to. See the Remarks section.
 * @returns {HRESULT} <b>FilterReplyMessage</b> returns S_OK if successful. Otherwise, it returns an error value.
 * @see https://learn.microsoft.com/windows/win32/api/fltuser/nf-fltuser-filterreplymessage
 * @since windows5.0
 */
export FilterReplyMessage(hPort, lpReplyBuffer, dwReplyBufferSize) {
    result := DllCall("FLTLIB.dll\FilterReplyMessage", HANDLE, hPort, "ptr", lpReplyBuffer, "uint", dwReplyBufferSize, "HRESULT")
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
export FilterGetDosName(lpVolumeName, lpDosName, dwDosNameBufferSize) {
    lpVolumeName := lpVolumeName is String ? StrPtr(lpVolumeName) : lpVolumeName
    lpDosName := lpDosName is String ? StrPtr(lpDosName) : lpDosName

    result := DllCall("FLTLIB.dll\FilterGetDosName", "ptr", lpVolumeName, "ptr", lpDosName, "uint", dwDosNameBufferSize, "HRESULT")
    return result
}

;@endregion Functions
