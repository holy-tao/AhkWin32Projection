#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DebugPropertyInfo.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include .\IEnumDebugPropertyInfo.ahk
#Include .\IDebugProperty.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IDebugProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugProperty
     * @type {Guid}
     */
    static IID => Guid("{51973c50-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyInfo", "GetExtendedInfo", "SetValueAsString", "EnumMembers", "GetParent"]

    /**
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @returns {DebugPropertyInfo} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(dwFieldSpec, nRadix) {
        pPropertyInfo := DebugPropertyInfo()
        result := ComCall(3, this, "uint", dwFieldSpec, "uint", nRadix, "ptr", pPropertyInfo, "HRESULT")
        return pPropertyInfo
    }

    /**
     * 
     * @param {Integer} cInfos 
     * @param {Pointer<Guid>} rgguidExtendedInfo 
     * @returns {VARIANT} 
     */
    GetExtendedInfo(cInfos, rgguidExtendedInfo) {
        rgvar := VARIANT()
        result := ComCall(4, this, "uint", cInfos, "ptr", rgguidExtendedInfo, "ptr", rgvar, "HRESULT")
        return rgvar
    }

    /**
     * 
     * @param {PWSTR} pszValue 
     * @param {Integer} nRadix 
     * @returns {HRESULT} 
     */
    SetValueAsString(pszValue, nRadix) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(5, this, "ptr", pszValue, "uint", nRadix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @param {Pointer<Guid>} refiid 
     * @returns {IEnumDebugPropertyInfo} 
     */
    EnumMembers(dwFieldSpec, nRadix, refiid) {
        result := ComCall(6, this, "uint", dwFieldSpec, "uint", nRadix, "ptr", refiid, "ptr*", &ppepi := 0, "HRESULT")
        return IEnumDebugPropertyInfo(ppepi)
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {IDebugProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(7, this, "ptr*", &ppDebugProp := 0, "HRESULT")
        return IDebugProperty(ppDebugProp)
    }
}
