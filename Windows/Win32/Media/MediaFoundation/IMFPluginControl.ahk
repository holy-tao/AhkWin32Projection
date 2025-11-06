#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how media sources and transforms are enumerated in Microsoft Media Foundation.
 * @remarks
 * 
  * Media Foundation provides a set of built-in media sources and decoders. Applications can enumerate them as follows: 
  * 
  * <ul>
  * <li>Media sources are enumerated through the <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver">Source Resolver</a>.</li>
  * <li>Transforms, such as decoders, are enumerated through the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenum">MFTEnum</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> functions.</li>
  * </ul>
  * Applications might also enumerate these objects indirectly. For example, if an application   uses the topology loader to resolve a partial topology, the topology loader calls <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> to find the required decoders.
  * 
  * Third parties can implement their own custom media sources and decoders, and register them for enumeration so that other applications can use them.
  * 
  * To control the enumeration order, Media Foundation maintains two process-wide lists of CLSIDs: a preferred list and a blocked list.  An object whose CLSID appears in the preferred list appears first in the enumeration order. An object whose CLSID appears on the blocked list is not enumerated.
  * 
  * The lists are initially populated from the registry. Applications can use the <b>IMFPluginControl</b> interface to modify the lists for the current process.
  * 
  * The preferred list contains a set of key/value pairs, where the keys are strings and the values are CLSIDs. These key/value pairs are defined as follows:
  * 
  * <ul>
  * <li>For media sources, the key name is a file name extension, protocol scheme, or MIME type. The value is the CLSID of a scheme handler or byte-stream handler for that media source.</li>
  * <li>For decoders, the key name is a media subtype GUID in canonical string form. (For more information about media subtypes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-types">Media Types</a>.) The value is the CLSID of the Media Foundation transform (MFT) that implements the decoder. </li>
  * </ul>
  * The following examples show the various types of key:
  * 
  * <ul>
  * <li>File extension: ".wmv"</li>
  * <li>Scheme: "http:"</li>
  * <li>MIME type: "video/mp4"</li>
  * <li>Media subtype: "{47504A4D-0000-0010-8000-00AA00389B71}"</li>
  * </ul>
  * To search the preferred list by key name, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsid">IMFPluginControl::GetPreferredClsid</a> method. To enumerate the entire list, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsidbyindex">IMFPluginControl::GetPreferredClsidByIndex</a> method in a loop.
  * 
  * The blocked list contains a list of CLSIDs. To enumerate the entire list, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfplugincontrol-getdisabledbyindex">IMFPluginControl::GetDisabledByIndex</a> method in a loop. To check whether a specific CLSID appears on the list, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfplugincontrol-isdisabled">IMFPluginControl::IsDisabled</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfplugincontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPluginControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPluginControl
     * @type {Guid}
     */
    static IID => Guid("{5c6c44bf-1db6-435b-9249-e8cd10fdec96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredClsid", "GetPreferredClsidByIndex", "SetPreferredClsid", "IsDisabled", "GetDisabledByIndex", "SetDisabled"]

    /**
     * 
     * @param {Integer} pluginType 
     * @param {PWSTR} selector 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsid
     */
    GetPreferredClsid(pluginType, selector) {
        selector := selector is String ? StrPtr(selector) : selector

        clsid := Guid()
        result := ComCall(3, this, "uint", pluginType, "ptr", selector, "ptr", clsid, "HRESULT")
        return clsid
    }

    /**
     * 
     * @param {Integer} pluginType 
     * @param {Integer} index 
     * @param {Pointer<PWSTR>} selector 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsidbyindex
     */
    GetPreferredClsidByIndex(pluginType, index, selector, clsid) {
        selectorMarshal := selector is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", pluginType, "uint", index, selectorMarshal, selector, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pluginType 
     * @param {PWSTR} selector 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-setpreferredclsid
     */
    SetPreferredClsid(pluginType, selector, clsid) {
        selector := selector is String ? StrPtr(selector) : selector

        result := ComCall(5, this, "uint", pluginType, "ptr", selector, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pluginType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-isdisabled
     */
    IsDisabled(pluginType, clsid) {
        result := ComCall(6, this, "uint", pluginType, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pluginType 
     * @param {Integer} index 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getdisabledbyindex
     */
    GetDisabledByIndex(pluginType, index) {
        clsid := Guid()
        result := ComCall(7, this, "uint", pluginType, "uint", index, "ptr", clsid, "HRESULT")
        return clsid
    }

    /**
     * 
     * @param {Integer} pluginType 
     * @param {Pointer<Guid>} clsid 
     * @param {BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-setdisabled
     */
    SetDisabled(pluginType, clsid, disabled) {
        result := ComCall(8, this, "uint", pluginType, "ptr", clsid, "int", disabled, "HRESULT")
        return result
    }
}
