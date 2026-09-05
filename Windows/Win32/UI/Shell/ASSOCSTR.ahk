#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by IQueryAssociations::GetString to define the type of string that is to be returned.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-assocstr
 * @namespace Windows.Win32.UI.Shell
 */
class ASSOCSTR extends Win32Enum {

    /**
     * A command string associated with a Shell verb.
     * Native name: ASSOCSTR_COMMAND
     * @type {Integer (Int32)}
     */
    static COMMAND => 1

    /**
     * An executable from a Shell verb command string. For example, this string is found as the (Default) value for a subkey such as 
     *                     
     *                         <b>HKEY_CLASSES_ROOT</b>&#92;<i>ApplicationName</i>&#92;<b>shell</b>&#92;<b>Open</b>&#92;<b>command</b>. If the command uses Rundll.exe, set the <b>ASSOCF_REMAPRUNDLL</b> flag in the <i>flags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a> to retrieve the target executable.
     * 
     * <div class="alert"><b>Caution</b>  <p class="note">Not all app associations have executables. Do not assume that an executable will always be present.
     * 
     * </div>
     * <div> </div>
     * This type of string will identify the code that will be invoked in the implementation of the verb.
     * Native name: ASSOCSTR_EXECUTABLE
     * @type {Integer (Int32)}
     */
    static EXECUTABLE => 2

    /**
     * The friendly name of a document type.
     * Native name: ASSOCSTR_FRIENDLYDOCNAME
     * @type {Integer (Int32)}
     */
    static FRIENDLYDOCNAME => 3

    /**
     * The friendly name of an executable file.
     * Native name: ASSOCSTR_FRIENDLYAPPNAME
     * @type {Integer (Int32)}
     */
    static FRIENDLYAPPNAME => 4

    /**
     * Ignore the information associated with the <b>open</b> subkey.
     * Native name: ASSOCSTR_NOOPEN
     * @type {Integer (Int32)}
     */
    static NOOPEN => 5

    /**
     * Look under the <b>ShellNew</b> subkey.
     * Native name: ASSOCSTR_SHELLNEWVALUE
     * @type {Integer (Int32)}
     */
    static SHELLNEWVALUE => 6

    /**
     * A template for DDE commands.
     * Native name: ASSOCSTR_DDECOMMAND
     * @type {Integer (Int32)}
     */
    static DDECOMMAND => 7

    /**
     * The DDE command to use to create a process.
     * Native name: ASSOCSTR_DDEIFEXEC
     * @type {Integer (Int32)}
     */
    static DDEIFEXEC => 8

    /**
     * The application name in a DDE broadcast.
     * Native name: ASSOCSTR_DDEAPPLICATION
     * @type {Integer (Int32)}
     */
    static DDEAPPLICATION => 9

    /**
     * The topic name in a DDE broadcast.
     * Native name: ASSOCSTR_DDETOPIC
     * @type {Integer (Int32)}
     */
    static DDETOPIC => 10

    /**
     * Corresponds to the InfoTip registry value. Returns an info tip for an item, or list of properties in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> from which to create an info tip, such as when hovering the cursor over a file name. The list of properties can be parsed with <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>.
     * Native name: ASSOCSTR_INFOTIP
     * @type {Integer (Int32)}
     */
    static INFOTIP => 11

    /**
     * <b>Introduced in Internet Explorer 6</b>. Corresponds to the QuickTip registry value. Same as ASSOCSTR_INFOTIP, except that it always returns a list of property names in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>. The difference between this value and ASSOCSTR_INFOTIP is that this returns properties that are safe for any scenario that causes slow property retrieval, such as offline or slow networks. Some of the properties returned from ASSOCSTR_INFOTIP might not be appropriate for slow property retrieval scenarios. The list of properties can be parsed with <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>.
     * Native name: ASSOCSTR_QUICKTIP
     * @type {Integer (Int32)}
     */
    static QUICKTIP => 12

    /**
     * <b>Introduced in Internet Explorer 6</b>. Corresponds to the TileInfo registry value. Contains a list of properties to be displayed for a particular file type in a Windows Explorer window that is in tile view. This is the same as ASSOCSTR_INFOTIP, but, like ASSOCSTR_QUICKTIP, it also returns a list of property names in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>. The list of properties can be parsed with <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>.
     * Native name: ASSOCSTR_TILEINFO
     * @type {Integer (Int32)}
     */
    static TILEINFO => 13

    /**
     * <b>Introduced in Internet Explorer 6</b>. Describes a general type of MIME file association, such as image and bmp, so that applications can make general assumptions about a specific file type.
     * Native name: ASSOCSTR_CONTENTTYPE
     * @type {Integer (Int32)}
     */
    static CONTENTTYPE => 14

    /**
     * <b>Introduced in Internet Explorer 6</b>. Returns the path to the icon resources to use by default for this association. Positive numbers indicate an index into the dll's resource table, while negative numbers indicate a resource ID. An example of the syntax for the resource is "c:\myfolder\myfile.dll,-1".
     * Native name: ASSOCSTR_DEFAULTICON
     * @type {Integer (Int32)}
     */
    static DEFAULTICON => 15

    /**
     * <b>Introduced in Internet Explorer 6</b>. For an object that has a Shell extension associated with it, you can use this to retrieve the CLSID of that Shell extension object by passing a string representation of the IID of the interface you want to retrieve as the <i>pwszExtra</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>. For example, if you want to retrieve a handler that implements the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> interface, you would specify "{BB2E617C-0920-11d1-9A0B-00C04FC2D6C1}", which is the IID of <b>IExtractImage</b>.
     * Native name: ASSOCSTR_SHELLEXTENSION
     * @type {Integer (Int32)}
     */
    static SHELLEXTENSION => 16

    /**
     * <b>Introduced in Internet Explorer 8</b>. For a verb invoked through COM and the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface, you can use this flag to retrieve the <b>IDropTarget</b> object's CLSID. This CLSID is registered in the <b>DropTarget</b> subkey. The verb is specified in the <i>pwszExtra</i> parameter in the call to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>.
     * 
     * This type of string will identify the code that will be invoked in the implementation of the verb.
     * Native name: ASSOCSTR_DROPTARGET
     * @type {Integer (Int32)}
     */
    static DROPTARGET => 17

    /**
     * <b>Introduced in Internet Explorer 8</b>. For a verb invoked through COM and the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexecutecommand">IExecuteCommand</a> interface, you can use this flag to retrieve the <b>IExecuteCommand</b> object's CLSID. This CLSID is registered in the verb's <b>command</b> subkey as the DelegateExecute entry. The verb is specified in the <i>pwszExtra</i> parameter in the call to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>.
     * 
     * This type of string will identify the code that will be invoked in the implementation of the verb.
     * Native name: ASSOCSTR_DELEGATEEXECUTE
     * @type {Integer (Int32)}
     */
    static DELEGATEEXECUTE => 18

    /**
     * A string value of the URI protocol schemes. For example, `http:https:ftp:file:` or `*` indicating all.
     * Native name: ASSOCSTR_SUPPORTED_URI_PROTOCOLS
     * @type {Integer (Int32)}
     */
    static SUPPORTED_URI_PROTOCOLS => 19

    /**
     * <b>Introduced in Windows 10</b>. The ProgID provided by the app associated with the file type or URI scheme. This if configured by users in their default program settings.
     * Native name: ASSOCSTR_PROGID
     * @type {Integer (Int32)}
     */
    static PROGID => 20

    /**
     * <b>Introduced in Windows 10</b>. The AppUserModelID of the app associated with the file type or URI scheme. This is configured by users in their default program settings.
     * Native name: ASSOCSTR_APPID
     * @type {Integer (Int32)}
     */
    static APPID => 21

    /**
     * <b>Introduced in Windows 10</b>. The publisher of the app associated with the file type or URI scheme. This is configured by users in their default program settings.
     * Native name: ASSOCSTR_APPPUBLISHER
     * @type {Integer (Int32)}
     */
    static APPPUBLISHER => 22

    /**
     * <b>Introduced in Windows 10</b>. The icon reference of the app associated with the file type or URI scheme. This is configured by users in their default program settings.
     * Native name: ASSOCSTR_APPICONREFERENCE
     * @type {Integer (Int32)}
     */
    static APPICONREFERENCE => 23

    /**
     * The maximum defined ASSOCSTR value, used for validation purposes.
     * Native name: ASSOCSTR_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 24
}
