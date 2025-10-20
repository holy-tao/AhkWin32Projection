#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch2 extends IShellDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDispatch2
     * @type {Guid}
     */
    static IID => Guid("{a4c6892c-3ba9-11d2-9dea-00c04fb16162}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsRestricted", "ShellExecute", "FindPrinter", "GetSystemInformation", "ServiceStart", "ServiceStop", "IsServiceRunning", "CanStartStopService", "ShowBrowserBar"]

    /**
     * 
     * @param {BSTR} Group 
     * @param {BSTR} Restriction 
     * @param {Pointer<Integer>} plRestrictValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-isrestricted
     */
    IsRestricted(Group, Restriction, plRestrictValue) {
        Group := Group is String ? BSTR.Alloc(Group).Value : Group
        Restriction := Restriction is String ? BSTR.Alloc(Restriction).Value : Restriction

        result := ComCall(30, this, "ptr", Group, "ptr", Restriction, "int*", plRestrictValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} File 
     * @param {VARIANT} vArgs 
     * @param {VARIANT} vDir 
     * @param {VARIANT} vOperation 
     * @param {VARIANT} vShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-shellexecute
     */
    ShellExecute(File, vArgs, vDir, vOperation, vShow) {
        File := File is String ? BSTR.Alloc(File).Value : File

        result := ComCall(31, this, "ptr", File, "ptr", vArgs, "ptr", vDir, "ptr", vOperation, "ptr", vShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} location 
     * @param {BSTR} model 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-findprinter
     */
    FindPrinter(name, location, model) {
        name := name is String ? BSTR.Alloc(name).Value : name
        location := location is String ? BSTR.Alloc(location).Value : location
        model := model is String ? BSTR.Alloc(model).Value : model

        result := ComCall(32, this, "ptr", name, "ptr", location, "ptr", model, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-getsysteminformation
     */
    GetSystemInformation(name, pv) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(33, this, "ptr", name, "ptr", pv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {VARIANT} Persistent 
     * @param {Pointer<VARIANT>} pSuccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-servicestart
     */
    ServiceStart(ServiceName, Persistent, pSuccess) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(34, this, "ptr", ServiceName, "ptr", Persistent, "ptr", pSuccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {VARIANT} Persistent 
     * @param {Pointer<VARIANT>} pSuccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-servicestop
     */
    ServiceStop(ServiceName, Persistent, pSuccess) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(35, this, "ptr", ServiceName, "ptr", Persistent, "ptr", pSuccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {Pointer<VARIANT>} pRunning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-isservicerunning
     */
    IsServiceRunning(ServiceName, pRunning) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(36, this, "ptr", ServiceName, "ptr", pRunning, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {Pointer<VARIANT>} pCanStartStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-canstartstopservice
     */
    CanStartStopService(ServiceName, pCanStartStop) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(37, this, "ptr", ServiceName, "ptr", pCanStartStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrClsid 
     * @param {VARIANT} bShow 
     * @param {Pointer<VARIANT>} pSuccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-showbrowserbar
     */
    ShowBrowserBar(bstrClsid, bShow, pSuccess) {
        bstrClsid := bstrClsid is String ? BSTR.Alloc(bstrClsid).Value : bstrClsid

        result := ComCall(38, this, "ptr", bstrClsid, "ptr", bShow, "ptr", pSuccess, "HRESULT")
        return result
    }
}
