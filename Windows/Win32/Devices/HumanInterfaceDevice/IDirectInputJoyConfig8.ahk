#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IDirectInputJoyConfig8 interface contains methods that allow hardware developers who are writing property sheets to write and read information to and from the registry.
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/nn-dinputd-idirectinputjoyconfig8
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class IDirectInputJoyConfig8 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputJoyConfig8
     * @type {Guid}
     */
    static IID => Guid("{eb0d7dfa-1990-4f27-b4d6-edf2eec4a44c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Acquire", "Unacquire", "SetCooperativeLevel", "SendNotify", "EnumTypes", "GetTypeInfo", "SetTypeInfo", "DeleteType", "GetConfig", "SetConfig", "DeleteConfig", "GetUserValues", "SetUserValues", "AddNewHardware", "OpenTypeKey", "OpenAppStatusKey"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire
     */
    Acquire() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-unacquire
     */
    Unacquire() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-setcooperativelevel
     */
    SetCooperativeLevel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(5, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-sendnotify
     */
    SendNotify() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPDIJOYTYPECALLBACK>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-enumtypes
     */
    EnumTypes(param0, param1) {
        result := ComCall(7, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-gettypeinfo
     */
    GetTypeInfo(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(8, this, "ptr", param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @param {PWSTR} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-settypeinfo
     */
    SetTypeInfo(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param3 := param3 is String ? StrPtr(param3) : param3

        result := ComCall(9, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-deletetype
     */
    DeleteType(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(10, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-getconfig
     */
    GetConfig(param0, param1, param2) {
        result := ComCall(11, this, "uint", param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-setconfig
     */
    SetConfig(param0, param1, param2) {
        result := ComCall(12, this, "uint", param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-deleteconfig
     */
    DeleteConfig(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-getuservalues
     */
    GetUserValues(param0, param1) {
        result := ComCall(14, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-setuservalues
     */
    SetUserValues(param0, param1) {
        result := ComCall(15, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Pointer<Guid>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-addnewhardware
     */
    AddNewHardware(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(16, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<HKEY>} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-opentypekey
     */
    OpenTypeKey(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(17, this, "ptr", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HKEY>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-openappstatuskey
     */
    OpenAppStatusKey(param0) {
        result := ComCall(18, this, "ptr", param0, "HRESULT")
        return result
    }
}
