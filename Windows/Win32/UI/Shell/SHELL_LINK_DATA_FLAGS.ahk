#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies option settings. Used with IShellLinkDataList::GetFlags and IShellLinkDataList::SetFlags.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-shell_link_data_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHELL_LINK_DATA_FLAGS extends Win32BitflagEnum{

    /**
     * 0x00000000. Default value used when no other flag is explicitly set.
     * @type {Integer (Int32)}
     */
    static SLDF_DEFAULT => 0

    /**
     * 0x00000001. The Shell link was saved with an ID list.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_ID_LIST => 1

    /**
     * 0x00000002. The Shell link was saved with link information to enable distributed tracking. This information is used by .lnk files to locate the target if the targets's path has changed. It includes information such as volume label and serial number, although the specific stored information can change from release to release.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_LINK_INFO => 2

    /**
     * 0x00000004. The link has a name.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_NAME => 4

    /**
     * 0x00000008. The link has a relative path.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_RELPATH => 8

    /**
     * 0x00000010. The link has a working directory.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_WORKINGDIR => 16

    /**
     * 0x00000020. The link has arguments.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_ARGS => 32

    /**
     * 0x00000040. The link has an icon location.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_ICONLOCATION => 64

    /**
     * 0x00000080. Stored strings are Unicode.
     * @type {Integer (Int32)}
     */
    static SLDF_UNICODE => 128

    /**
     * 0x00000100. Prevents the storage of link tracking information. If this flag is set, it is less likely, though not impossible, that a target can be found by the link if that target is moved.
     * @type {Integer (Int32)}
     */
    static SLDF_FORCE_NO_LINKINFO => 256

    /**
     * 0x00000200. The link contains expandable environment strings such as <c>%windir%</c>.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_EXP_SZ => 512

    /**
     * 0x00000400. Causes a 16-bit target application to run in a separate Virtual DOS Machine (VDM)/Windows on Windows (WOW).
     * @type {Integer (Int32)}
     */
    static SLDF_RUN_IN_SEPARATE => 1024

    /**
     * 0x00001000. The link is a special Windows Installer link.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_DARWINID => 4096

    /**
     * 0x00002000. Causes the target application to run as a different user.
     * @type {Integer (Int32)}
     */
    static SLDF_RUNAS_USER => 8192

    /**
     * 0x00004000. The icon path in the link contains an expandable environment string such as such as <c>%windir%</c>.
     * @type {Integer (Int32)}
     */
    static SLDF_HAS_EXP_ICON_SZ => 16384

    /**
     * 0x00008000. Prevents the use of ID list alias mapping when parsing the ID list from the path.
     * @type {Integer (Int32)}
     */
    static SLDF_NO_PIDL_ALIAS => 32768

    /**
     * 0x00010000. Forces the use of the UNC name (a full network resource name), rather than the local name.
     * @type {Integer (Int32)}
     */
    static SLDF_FORCE_UNCNAME => 65536

    /**
     * 0x00020000. Causes the target of this link to launch with a shim layer active. A shim is an intermediate DLL that facilitates compatibility between otherwise incompatible software services. Shims are typically used to provide version compatibility.
     * @type {Integer (Int32)}
     */
    static SLDF_RUN_WITH_SHIMLAYER => 131072

    /**
     * 0x00040000. <b>Introduced in Windows Vista</b>. Disable object ID distributed tracking information.
     * @type {Integer (Int32)}
     */
    static SLDF_FORCE_NO_LINKTRACK => 262144

    /**
     * 0x00080000. <b>Introduced in Windows Vista</b>. Enable the caching of target metadata into the link file.
     * @type {Integer (Int32)}
     */
    static SLDF_ENABLE_TARGET_METADATA => 524288

    /**
     * 0x00100000. <b>Introduced in Windows 7</b>. Disable shell link tracking.
     * @type {Integer (Int32)}
     */
    static SLDF_DISABLE_LINK_PATH_TRACKING => 1048576

    /**
     * 0x00200000. <b>Introduced in Windows Vista</b>. Disable known folder tracking information.
     * @type {Integer (Int32)}
     */
    static SLDF_DISABLE_KNOWNFOLDER_RELATIVE_TRACKING => 2097152

    /**
     * 0x00400000. <b>Introduced in Windows 7</b>. Disable known folder alias mapping when loading the IDList during deserialization.
     * @type {Integer (Int32)}
     */
    static SLDF_NO_KF_ALIAS => 4194304

    /**
     * 0x00800000. <b>Introduced in Windows 7</b>. Allow link to point to another shell link as long as this does not create cycles.
     * @type {Integer (Int32)}
     */
    static SLDF_ALLOW_LINK_TO_LINK => 8388608

    /**
     * 0x01000000. <b>Introduced in Windows 7</b>. Remove alias when saving the IDList.
     * @type {Integer (Int32)}
     */
    static SLDF_UNALIAS_ON_SAVE => 16777216

    /**
     * 0x02000000. <b>Introduced in Windows 7</b>. Recalculate the IDList from the path with the environmental variables at load time, rather than persisting the IDList.
     * @type {Integer (Int32)}
     */
    static SLDF_PREFER_ENVIRONMENT_PATH => 33554432

    /**
     * 0x04000000. <b>Introduced in Windows 7</b>. If the target is a UNC location on a local machine, keep the local IDList target in addition to the remote target.
     * @type {Integer (Int32)}
     */
    static SLDF_KEEP_LOCAL_IDLIST_FOR_UNC_TARGET => 67108864

    /**
     * 0x08000000. <b>Introduced in Windows 8</b>. Persist the target IDlist in its volume-ID-relative form to avoid a dependency on drive letters.
     * @type {Integer (Int32)}
     */
    static SLDF_PERSIST_VOLUME_ID_RELATIVE => 134217728

    /**
     * <b>Introduced in Windows Vista</b>. A mask for valid <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-shell_link_data_flags">SHELL_LINK_DATA_FLAGS</a> bits.
     * 
     *                         
     * 
     * <table class="clsStd">
     * <tr>
     * <th>OS</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>Windows 8</td>
     * <td>0x0FFFF7FF</td>
     * </tr>
     * <tr>
     * <td>Windows 7</td>
     * <td>0x07FFF7FF</td>
     * </tr>
     * <tr>
     * <td>Windows Vista</td>
     * <td>0x003FF7FF</td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static SLDF_VALID => 268433407

    /**
     * Reserved; do not use.
     * @type {Integer (Int32)}
     */
    static SLDF_RESERVED => -2147483648
}
