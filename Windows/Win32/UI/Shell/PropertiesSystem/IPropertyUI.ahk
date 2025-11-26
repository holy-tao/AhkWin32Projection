#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Developers should use IPropertyDescription instead.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipropertyui
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyUI
     * @type {Guid}
     */
    static IID => Guid("{757a7d9f-919a-4118-99d7-dbb208c8cc66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParsePropertyName", "GetCannonicalName", "GetDisplayName", "GetPropertyDescription", "GetDefaultWidth", "GetFlags", "FormatForDisplay", "GetHelpInfo"]

    /**
     * Developers should use IPropertyDescription instead. Reads the characters of the specified property name and identifies the FMTID and PROPID of the property.
     * @param {PWSTR} pszName Type: <b>LPWSTR</b>
     * 
     * A string specifying the property name to parse.
     * @param {Pointer<Guid>} pfmtid Type: <b>FMTID*</b>
     * 
     * The FMTID of the parsed property.
     * @param {Pointer<Integer>} ppid Type: <b>PROPID*</b>
     * 
     * The PROPID of the parsed property name.
     * @param {Pointer<Integer>} pchEaten Type: <b>ULONG*</b>
     * 
     * The number of characters that were consumed in parsing <i>pszName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-parsepropertyname
     */
    ParsePropertyName(pszName, pfmtid, ppid, pchEaten) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppidMarshal := ppid is VarRef ? "uint*" : "ptr"
        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszName, "ptr", pfmtid, ppidMarshal, ppid, pchEatenMarshal, pchEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {PWSTR} pwszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     */
    GetCannonicalName(fmtid, pid, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(4, this, "ptr", fmtid, "uint", pid, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. Gets a string specifying the name of the property suitable for display to users.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @param {Integer} flags Type: <b>PROPERTYUI_NAME_FLAGS</b>
     * 
     * One of the following PROPERTYUI_NAME_FLAGS values:
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
     * 
     * A string specifying the property.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The length of the property display name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-getdisplayname
     */
    GetDisplayName(fmtid, pid, flags, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(5, this, "ptr", fmtid, "uint", pid, "int", flags, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. Gets the property description of a specified property.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
     * 
     * The description of the property.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The length of the property description.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-getpropertydescription
     */
    GetPropertyDescription(fmtid, pid, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(6, this, "ptr", fmtid, "uint", pid, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead. Gets the width of the property description.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The width of the property description.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-getdefaultwidth
     */
    GetDefaultWidth(fmtid, pid) {
        result := ComCall(7, this, "ptr", fmtid, "uint", pid, "uint*", &pcxChars := 0, "HRESULT")
        return pcxChars
    }

    /**
     * Developers should use IPropertyDescription instead. Gets property feature flags for a specified property.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_propertyui_flags">PROPERTYUI_FLAGS</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_propertyui_flags">PROPERTYUI_FLAGS</a> for the property.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-getflags
     */
    GetFlags(fmtid, pid) {
        result := ComCall(8, this, "ptr", fmtid, "uint", pid, "int*", &pflags := 0, "HRESULT")
        return pflags
    }

    /**
     * Developers should use IPropertyDescription instead. Gets a formatted, Unicode string representation of a property value.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * @param {Integer} pid Type: <b>PROPID</b>
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} puiff Type: <b>PROPERTYUI_FORMAT_FLAGS</b>
     * 
     * The format for the returned property value.
     * @param {PWSTR} pwszText Type: <b>LPWSTR</b>
     * 
     * The property value, formatted for display.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-formatfordisplay
     */
    FormatForDisplay(fmtid, pid, ppropvar, puiff, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(9, this, "ptr", fmtid, "uint", pid, "ptr", ppropvar, "int", puiff, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Developers should use IPropertyDescription instead.
     * @param {Pointer<Guid>} fmtid Type: <b>REFFMTID</b>
     * 
     * The FMTID of the property.
     * @param {Integer} pid Type: <b>PROPID</b>
     * 
     * The PROPID of the property.
     * @param {PWSTR} pwszHelpFile Type: <b>LPWSTR</b>
     * 
     * The fully qualified path of the Help file.
     * @param {Integer} cch Type: <b>DWORD</b>
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The Help context ID for the property.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipropertyui-gethelpinfo
     */
    GetHelpInfo(fmtid, pid, pwszHelpFile, cch) {
        pwszHelpFile := pwszHelpFile is String ? StrPtr(pwszHelpFile) : pwszHelpFile

        result := ComCall(10, this, "ptr", fmtid, "uint", pid, "ptr", pwszHelpFile, "uint", cch, "uint*", &puHelpID := 0, "HRESULT")
        return puHelpID
    }
}
