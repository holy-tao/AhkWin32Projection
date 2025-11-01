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
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Guid>} pfmtid 
     * @param {Pointer<Integer>} ppid 
     * @param {Pointer<Integer>} pchEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-parsepropertyname
     */
    ParsePropertyName(pszName, pfmtid, ppid, pchEaten) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "ptr", pfmtid, "uint*", ppid, "uint*", pchEaten, "HRESULT")
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
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {Integer} flags 
     * @param {PWSTR} pwszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getdisplayname
     */
    GetDisplayName(fmtid, pid, flags, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(5, this, "ptr", fmtid, "uint", pid, "int", flags, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {PWSTR} pwszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getpropertydescription
     */
    GetPropertyDescription(fmtid, pid, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(6, this, "ptr", fmtid, "uint", pid, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {Pointer<Integer>} pcxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getdefaultwidth
     */
    GetDefaultWidth(fmtid, pid, pcxChars) {
        result := ComCall(7, this, "ptr", fmtid, "uint", pid, "uint*", pcxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {Pointer<Integer>} pflags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-getflags
     */
    GetFlags(fmtid, pid, pflags) {
        result := ComCall(8, this, "ptr", fmtid, "uint", pid, "int*", pflags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @param {Integer} puiff 
     * @param {PWSTR} pwszText 
     * @param {Integer} cchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-formatfordisplay
     */
    FormatForDisplay(fmtid, pid, ppropvar, puiff, pwszText, cchText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(9, this, "ptr", fmtid, "uint", pid, "ptr", ppropvar, "int", puiff, "ptr", pwszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} fmtid 
     * @param {Integer} pid 
     * @param {PWSTR} pwszHelpFile 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} puHelpID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipropertyui-gethelpinfo
     */
    GetHelpInfo(fmtid, pid, pwszHelpFile, cch, puHelpID) {
        pwszHelpFile := pwszHelpFile is String ? StrPtr(pwszHelpFile) : pwszHelpFile

        result := ComCall(10, this, "ptr", fmtid, "uint", pid, "ptr", pwszHelpFile, "uint", cch, "uint*", puHelpID, "HRESULT")
        return result
    }
}
