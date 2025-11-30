#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by IQueryAssociations::GetString to define the type of string that is to be returned.
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/ne-shlwapi-assocstr
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ASSOCSTR extends Win32Enum{

    /**
     * A command string associated with a Shell verb.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_COMMAND => 1

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
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_EXECUTABLE => 2

    /**
     * The friendly name of a document type.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_FRIENDLYDOCNAME => 3

    /**
     * The friendly name of an executable file.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_FRIENDLYAPPNAME => 4

    /**
     * Ignore the information associated with the <b>open</b> subkey.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_NOOPEN => 5

    /**
     * Look under the <b>ShellNew</b> subkey.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_SHELLNEWVALUE => 6

    /**
     * A template for DDE commands.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DDECOMMAND => 7

    /**
     * The DDE command to use to create a process.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DDEIFEXEC => 8

    /**
     * The application name in a DDE broadcast.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DDEAPPLICATION => 9

    /**
     * The topic name in a DDE broadcast.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DDETOPIC => 10

    /**
     * Corresponds to the InfoTip registry value. Returns an info tip for an item, or list of properties in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> from which to create an info tip, such as when hovering the cursor over a file name. The list of properties can be parsed with <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_INFOTIP => 11

    /**
     * <b>Introduced in Internet Explorer 6</b>. Corresponds to the QuickTip registry value. Same as ASSOCSTR_INFOTIP, except that it always returns a list of property names in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>. The difference between this value and ASSOCSTR_INFOTIP is that this returns properties that are safe for any scenario that causes slow property retrieval, such as offline or slow networks. Some of the properties returned from ASSOCSTR_INFOTIP might not be appropriate for slow property retrieval scenarios. The list of properties can be parsed with <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_QUICKTIP => 12

    /**
     * <b>Introduced in Internet Explorer 6</b>. Corresponds to the TileInfo registry value. Contains a list of properties to be displayed for a particular file type in a Windows Explorer window that is in tile view. This is the same as ASSOCSTR_INFOTIP, but, like ASSOCSTR_QUICKTIP, it also returns a list of property names in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>. The list of properties can be parsed with <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_TILEINFO => 13

    /**
     * <b>Introduced in Internet Explorer 6</b>. Describes a general type of MIME file association, such as image and bmp, so that applications can make general assumptions about a specific file type.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_CONTENTTYPE => 14

    /**
     * <b>Introduced in Internet Explorer 6</b>. Returns the path to the icon resources to use by default for this association. Positive numbers indicate an index into the dll's resource table, while negative numbers indicate a resource ID. An example of the syntax for the resource is "c:\myfolder\myfile.dll,-1".
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DEFAULTICON => 15

    /**
     * <b>Introduced in Internet Explorer 6</b>. For an object that has a Shell extension associated with it, you can use this to retrieve the CLSID of that Shell extension object by passing a string representation of the IID of the interface you want to retrieve as the <i>pwszExtra</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>. For example, if you want to retrieve a handler that implements the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> interface, you would specify "{BB2E617C-0920-11d1-9A0B-00C04FC2D6C1}", which is the IID of <b>IExtractImage</b>.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_SHELLEXTENSION => 16

    /**
     * <b>Introduced in Internet Explorer 8</b>.. For a verb invoked through COM and the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface, you can use this flag to retrieve the <b>IDropTarget</b> object's CLSID. This CLSID is registered in the <b>DropTarget</b> subkey. The verb is specified in the <i>pwszExtra</i> parameter in the call to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>.
     * 
     * This type of string will identify the code that will be invoked in the implementation of the verb.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DROPTARGET => 17

    /**
     * <b>Introduced in Internet Explorer 8</b>.. For a verb invoked through COM and the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexecutecommand">IExecuteCommand</a> interface, you can use this flag to retrieve the <b>IExecuteCommand</b> object's CLSID. This CLSID is registered in the verb's <b>command</b> subkey as the DelegateExecute entry. The verb is specified in the <i>pwszExtra</i> parameter in the call to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>.
     * 
     * This type of string will identify the code that will be invoked in the implementation of the verb.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_DELEGATEEXECUTE => 18

    /**
     * <b>Introduced in Windows 8</b>.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_SUPPORTED_URI_PROTOCOLS => 19

    /**
     * The ProgID provided by the app associated with the file type or URI scheme. This if configured by users in their default program settings.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_PROGID => 20

    /**
     * The AppUserModelID of the app associated with the file type or URI scheme. This is configured by users in their default program settings.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_APPID => 21

    /**
     * The publisher of the app associated with the file type or URI scheme. This is configured by users in their default program settings.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_APPPUBLISHER => 22

    /**
     * The icon reference of the app associated with the file type or URI scheme. This is configured by users in their default program settings.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_APPICONREFERENCE => 23

    /**
     * The maximum defined ASSOCSTR value, used for validation purposes.
     * @type {Integer (Int32)}
     */
    static ASSOCSTR_MAX => 24
}
