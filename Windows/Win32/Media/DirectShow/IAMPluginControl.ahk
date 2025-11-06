#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the preferred and blocked filter lists.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamplugincontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPluginControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMPluginControl
     * @type {Guid}
     */
    static IID => Guid("{0e26a181-f40c-4635-8786-976284b52981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredClsid", "GetPreferredClsidByIndex", "SetPreferredClsid", "IsDisabled", "GetDisabledByIndex", "SetDisabled", "IsLegacyDisabled"]

    /**
     * 
     * @param {Pointer<Guid>} subType 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-getpreferredclsid
     */
    GetPreferredClsid(subType) {
        clsid := Guid()
        result := ComCall(3, this, "ptr", subType, "ptr", clsid, "HRESULT")
        return clsid
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} subType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-getpreferredclsidbyindex
     */
    GetPreferredClsidByIndex(index, subType, clsid) {
        result := ComCall(4, this, "uint", index, "ptr", subType, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} subType 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-setpreferredclsid
     */
    SetPreferredClsid(subType, clsid) {
        result := ComCall(5, this, "ptr", subType, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-isdisabled
     */
    IsDisabled(clsid) {
        result := ComCall(6, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-getdisabledbyindex
     */
    GetDisabledByIndex(index) {
        clsid := Guid()
        result := ComCall(7, this, "uint", index, "ptr", clsid, "HRESULT")
        return clsid
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-setdisabled
     */
    SetDisabled(clsid, disabled) {
        result := ComCall(8, this, "ptr", clsid, "int", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} dllName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-islegacydisabled
     */
    IsLegacyDisabled(dllName) {
        dllName := dllName is String ? StrPtr(dllName) : dllName

        result := ComCall(9, this, "ptr", dllName, "HRESULT")
        return result
    }
}
