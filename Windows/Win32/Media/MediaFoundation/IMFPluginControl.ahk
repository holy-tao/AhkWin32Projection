#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls how media sources and transforms are enumerated in Microsoft Media Foundation. (IMFPluginControl)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfplugincontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPluginControl extends IUnknown {
    /**
     * The interface identifier for IMFPluginControl
     * @type {Guid}
     */
    static IID := Guid("{5c6c44bf-1db6-435b-9249-e8cd10fdec96}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPluginControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPreferredClsid        : IntPtr
        GetPreferredClsidByIndex : IntPtr
        SetPreferredClsid        : IntPtr
        IsDisabled               : IntPtr
        GetDisabledByIndex       : IntPtr
        SetDisabled              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPluginControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Searches the preferred list for a class identifier (CLSID) that matches a specified key name.
     * @param {Integer} pluginType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_type">MF_Plugin_Type</a> enumeration, specifying the type of object.
     * @param {PWSTR} selector The key name to match. For more information about the format of key names, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a>.
     * @returns {Guid} Receives a CLSID from the preferred list.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsid
     */
    GetPreferredClsid(pluginType, selector) {
        selector := selector is String ? StrPtr(selector) : selector

        clsid := Guid()
        result := ComCall(3, this, "uint", pluginType, "ptr", selector, Guid.Ptr, clsid, "HRESULT")
        return clsid
    }

    /**
     * The IMFPluginControl::GetPreferredClsidByIndex (mfobjects.h) method gets a class identifier (CLSID) from the preferred list, specified by index value.
     * @param {Integer} pluginType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_type">MF_Plugin_Type</a> enumeration, specifying the type of object to enumerate.
     * @param {Integer} index The zero-based index of the CLSID to retrieve.
     * @param {Pointer<PWSTR>} selector Receives the key name associated with the CLSID. The caller must free the memory for the returned string by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. For more information about the format of key names, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a>.
     * @param {Pointer<Guid>} clsid Receives the CLSID at the specified index.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>index</i> parameter is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getpreferredclsidbyindex
     */
    GetPreferredClsidByIndex(pluginType, index, selector, clsid) {
        selectorMarshal := selector is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", pluginType, "uint", index, selectorMarshal, selector, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Adds a class identifier (CLSID) to the preferred list or removes a CLSID from the list. (IMFPluginControl.SetPreferredClsid)
     * @remarks
     * The preferred list is global to the caller's process. Calling this method does not affect the list in other process.
     * @param {Integer} pluginType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_type">MF_Plugin_Type</a> enumeration, specifying the type of object.
     * @param {PWSTR} selector The key name for the CLSID. For more information about the format of key names, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a>.
     * @param {Pointer<Guid>} clsid The CLSID to add to the list. If this parameter is <b>NULL</b>, the key/value entry specified by the <i>selector</i> parameter is removed from the list.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-setpreferredclsid
     */
    SetPreferredClsid(pluginType, selector, clsid) {
        selector := selector is String ? StrPtr(selector) : selector

        result := ComCall(5, this, "uint", pluginType, "ptr", selector, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Queries whether a class identifier (CLSID) appears in the blocked list. (IMFPluginControl.IsDisabled)
     * @param {Integer} pluginType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_type">MF_Plugin_Type</a> enumeration, specifying the type of object for the query.
     * @param {Pointer<Guid>} clsid The CLSID to search for.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified CLSID appears in the blocked list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified CLSID is not in the blocked list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-isdisabled
     */
    IsDisabled(pluginType, clsid) {
        result := ComCall(6, this, "uint", pluginType, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * The IMFPluginControl::GetDisabledByIndex (mfobjects.h) gets a class identifier (CLSID) from the blocked list.
     * @param {Integer} pluginType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_type">MF_Plugin_Type</a> enumeration, specifying the type of object to enumerate.
     * @param {Integer} index The zero-based index of the CLSID to retrieve.
     * @returns {Guid} Receives the CLSID at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-getdisabledbyindex
     */
    GetDisabledByIndex(pluginType, index) {
        clsid := Guid()
        result := ComCall(7, this, "uint", pluginType, "uint", index, Guid.Ptr, clsid, "HRESULT")
        return clsid
    }

    /**
     * Adds a class identifier (CLSID) to the blocked list, or removes a CLSID from the list. (IMFPluginControl.SetDisabled)
     * @remarks
     * The blocked list is global to the caller's process. Calling this method does not affect the list in other processes.
     * @param {Integer} pluginType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_plugin_type">MF_Plugin_Type</a> enumeration, specifying the type of object.
     * @param {Pointer<Guid>} clsid The CLSID to add or remove.
     * @param {BOOL} disabled Specifies whether to add or remove the CSLID. If the value is <b>TRUE</b>, the method adds the CLSID to the blocked list. Otherwise, the method removes it from the list.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol-setdisabled
     */
    SetDisabled(pluginType, clsid, disabled) {
        result := ComCall(8, this, "uint", pluginType, Guid.Ptr, clsid, BOOL, disabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFPluginControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPreferredClsid := CallbackCreate(GetMethod(implObj, "GetPreferredClsid"), flags, 4)
        this.vtbl.GetPreferredClsidByIndex := CallbackCreate(GetMethod(implObj, "GetPreferredClsidByIndex"), flags, 5)
        this.vtbl.SetPreferredClsid := CallbackCreate(GetMethod(implObj, "SetPreferredClsid"), flags, 4)
        this.vtbl.IsDisabled := CallbackCreate(GetMethod(implObj, "IsDisabled"), flags, 3)
        this.vtbl.GetDisabledByIndex := CallbackCreate(GetMethod(implObj, "GetDisabledByIndex"), flags, 4)
        this.vtbl.SetDisabled := CallbackCreate(GetMethod(implObj, "SetDisabled"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPreferredClsid)
        CallbackFree(this.vtbl.GetPreferredClsidByIndex)
        CallbackFree(this.vtbl.SetPreferredClsid)
        CallbackFree(this.vtbl.IsDisabled)
        CallbackFree(this.vtbl.GetDisabledByIndex)
        CallbackFree(this.vtbl.SetDisabled)
    }
}
