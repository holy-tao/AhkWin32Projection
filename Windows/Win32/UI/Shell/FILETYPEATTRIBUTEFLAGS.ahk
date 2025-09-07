#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates FILETYPEATTRIBUTEFLAGS constants that are used in the EditFlags value of a file association PROGID registry key.
 * @remarks
 * These flags represent possible attributes stored in the EditFlags value of a ProgID registration. The EditFlags data is a single REG_DWORD.
  * 
  * The following example shows the <b><b>FTA_NoRemove</b></b> (0x00000010) and <b><b>FTA_NoNewVerb</b></b> (0x00000020) attributes assigned to the .myp file type.
  * 
  * <pre><b>HKEY_CLASSES_ROOT</b>
  *    <b>.myp</b>
  *       (Default) = MyProgram.1
  *    <b>MyProgram.1</b>
  *       (Default) = MyProgram Application
  *       <b>EditFlags</b> = 0x00000030</pre>\
  * 
  * APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getdata">IQueryAssociations::GetData</a> can retrieve that EditFlags data. Compare the numerical equivalents of these <b>FILETYPEATTRIBUTEFLAGS</b> flags against that retrieved value to determine which flags are set.
  * 
  * The following example demonstrates the use of <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getdata">IQueryAssociations::GetData</a> to determine if those values are set.
  * 
  *                 
  * 
  * 
  * ```
  * IQueryAssociations *passoc;
  * 
  * HRESULT hr = AssocCreate(CLSID_QueryAssociations, IID_PPV_ARGS(&passoc));
  * if (SUCCEEDED(hr))
  * {
  *     hr = passoc->Init(NULL, pszType, NULL, NULL);
  *     if (SUCCEEDED(hr))
  *     {
  *         DWORD dwEditFlags;
  *         ULONG cb = sizeof(dwEditFlags);
  *         
  *         hr = passoc->GetData(NULL, ASSOCDATA_EDITFLAGS, NULL, &dwEditFlags, &cb);
  *         if (SUCCEEDED(hr))
  *         {
  *             if (dwEditFlags & 0x00000010) // FTA_NoRemove
  *             {
  *                 // ...
  *             }    
  *             if (dwEditFlags & 0x00000020)  // FTA_NoNewVerb
  *             {
  *                 // ...
  *             }
  *         }
  *     }
  *     passoc->Release();
  * }
  * ```
  * 
  * 
  * To set an EditFlags attribute, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shsetvaluea">SHSetValue</a> functions. First use <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getdata">IQueryAssociations::GetData</a> to retrieve the current set of attributes as shown in the example above, add the desired <b>FILETYPEATTRIBUTEFLAGS</b> to that value, then write that value back to the registry using one of the two set functions.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-filetypeattributeflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FILETYPEATTRIBUTEFLAGS{

    /**
     * No <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-filetypeattributeflags">FILETYPEATTRIBUTEFLAGS</a> options set.
     * @type {Integer (Int32)}
     */
    static FTA_None => 0

    /**
     * Excludes the file type.
     * @type {Integer (Int32)}
     */
    static FTA_Exclude => 1

    /**
     * Shows file types, such as folders, that are not associated with a file name extension.
     * @type {Integer (Int32)}
     */
    static FTA_Show => 2

    /**
     * Indicates that the file type has a file name extension.
     * @type {Integer (Int32)}
     */
    static FTA_HasExtension => 4

    /**
     * Prohibits editing of the registry entries associated with this file type, the addition of new entries, and the deletion or modification of existing entries.
     * @type {Integer (Int32)}
     */
    static FTA_NoEdit => 8

    /**
     * Prohibits deletion of the registry entries associated with this file type.
     * @type {Integer (Int32)}
     */
    static FTA_NoRemove => 16

    /**
     * Prohibits the addition of new <a href="https://docs.microsoft.com/windows/desktop/shell/fa-verbs">verbs</a> to the file type.
     * @type {Integer (Int32)}
     */
    static FTA_NoNewVerb => 32

    /**
     * Prohibits the modification or deletion of canonical <a href="https://docs.microsoft.com/windows/desktop/shell/fa-verbs">verbs</a> such as <b>open</b> and <b>print</b>.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditVerb => 64

    /**
     * Prohibits the deletion of canonical verbs such as <b>open</b> and <b>print</b>.
     * @type {Integer (Int32)}
     */
    static FTA_NoRemoveVerb => 128

    /**
     * Prohibits the modification or deletion of the description of the file type.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditDesc => 256

    /**
     * Prohibits the modification or deletion of the <a href="https://docs.microsoft.com/windows/desktop/shell/icon">icon</a> assigned to the file type.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditIcon => 512

    /**
     * Prohibits the modification of the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-verbs">default verb</a>.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditDflt => 1024

    /**
     * Prohibits the modification of the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-verbs">commands</a> associated with verbs.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditVerbCmd => 2048

    /**
     * Prohibits the modification or deletion of verbs.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditVerbExe => 4096

    /**
     * Prohibits the modification or deletion of the entries related to DDE.
     * @type {Integer (Int32)}
     */
    static FTA_NoDDE => 8192

    /**
     * Prohibits the modification or deletion of the content type and default extension entries.
     * @type {Integer (Int32)}
     */
    static FTA_NoEditMIME => 32768

    /**
     * Indicates that the file type's <b>open</b> verb can be safely invoked for downloaded files. This flag  applies only to safe file types, as identified by <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-associsdangerous">AssocIsDangerous</a>. To improve the user experience and reduce unnecessary user prompts when downloading and activating items, file type owners should specify this flag and applications that download and activate files should respect this flag.
     * @type {Integer (Int32)}
     */
    static FTA_OpenIsSafe => 65536

    /**
     * Prevents the <b>Never ask me</b> check box from being enabled. Use of this flag means <b>FTA_OpenIsSafe</b> is not respected and <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-associsdangerous">AssocIsDangerous</a> always returns TRUE.
 * If your file type can execute code, you should always use this flag or ensure that the file type handlers mitigate risks, for example, by producing warning prompts before running the code.
 * 
 * The user can override this attribute through the <b>File Type</b> dialog box.
     * @type {Integer (Int32)}
     */
    static FTA_AlwaysUnsafe => 131072

    /**
     * Prohibits the addition of members of this file type to the <a href="https://docs.microsoft.com/windows/desktop/shell/manage">Recent Documents</a> folder. Additionally, in Windows 7 and later, prohibits the addition of members of this file type to the automatic <b>Recent</b> or <b>Frequent</b> category of an application's Jump List.
 * 
 * This flag does not restrict members of this file type from being added to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist">custom Jump List</a>. It also places no restriction on the file type being added to the automatic Jump Lists of other applications in the case that other applications use this file type.
     * @type {Integer (Int32)}
     */
    static FTA_NoRecentDocs => 1048576

    /**
     * <b>Introduced in Windows 8</b>. Marks the file or URI scheme as safe to be used from a low trust application. Files that originate from the Internet or an app container are examples where the file is considered untrusted. Untrusted files that contain code are especially dangerous, and appropriate security mitigations must be applied if the file is to be opened by a full trust application. File type owners for file formats that have the ability to execute code should specify this flag only if their program mitigates elevation-of-privilege threats that are associated with running code at a higher integrity level. Mitigations include prompting the user before code is executed or executing the code with reduced privileges.
 * 
 * By specifying this flag for an entire file type, an app running within an app container can pass files of this type to a program running at full trust. Some file types are recognized as inherently dangerous due to their ability to execute code and will be blocked if you don't specify this value.
     * @type {Integer (Int32)}
     */
    static FTA_SafeForElevation => 2097152

    /**
     * <b>Introduced in Windows 8</b>. Ensures that the verbs for the file type are invoked with a URI instead of a downloaded version of the file. Use this flag only if you've registered the file type's verb to support DirectInvoke through the SupportedProtocols or UseUrl registration.
     * @type {Integer (Int32)}
     */
    static FTA_AlwaysUseDirectInvoke => 4194304
}
