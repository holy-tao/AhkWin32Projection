#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch2 extends IShellDispatch{
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
     * 
     * @param {BSTR} Group 
     * @param {BSTR} Restriction 
     * @param {Pointer<Int32>} plRestrictValue 
     * @returns {HRESULT} 
     */
    IsRestricted(Group, Restriction, plRestrictValue) {
        Group := Group is String ? BSTR.Alloc(Group).Value : Group
        Restriction := Restriction is String ? BSTR.Alloc(Restriction).Value : Restriction

        result := ComCall(30, this, "ptr", Group, "ptr", Restriction, "int*", plRestrictValue, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    ShellExecute(File, vArgs, vDir, vOperation, vShow) {
        File := File is String ? BSTR.Alloc(File).Value : File

        result := ComCall(31, this, "ptr", File, "ptr", vArgs, "ptr", vDir, "ptr", vOperation, "ptr", vShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} location 
     * @param {BSTR} model 
     * @returns {HRESULT} 
     */
    FindPrinter(name, location, model) {
        name := name is String ? BSTR.Alloc(name).Value : name
        location := location is String ? BSTR.Alloc(location).Value : location
        model := model is String ? BSTR.Alloc(model).Value : model

        result := ComCall(32, this, "ptr", name, "ptr", location, "ptr", model, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pv 
     * @returns {HRESULT} 
     */
    GetSystemInformation(name, pv) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(33, this, "ptr", name, "ptr", pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {VARIANT} Persistent 
     * @param {Pointer<VARIANT>} pSuccess 
     * @returns {HRESULT} 
     */
    ServiceStart(ServiceName, Persistent, pSuccess) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(34, this, "ptr", ServiceName, "ptr", Persistent, "ptr", pSuccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {VARIANT} Persistent 
     * @param {Pointer<VARIANT>} pSuccess 
     * @returns {HRESULT} 
     */
    ServiceStop(ServiceName, Persistent, pSuccess) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(35, this, "ptr", ServiceName, "ptr", Persistent, "ptr", pSuccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {Pointer<VARIANT>} pRunning 
     * @returns {HRESULT} 
     */
    IsServiceRunning(ServiceName, pRunning) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(36, this, "ptr", ServiceName, "ptr", pRunning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ServiceName 
     * @param {Pointer<VARIANT>} pCanStartStop 
     * @returns {HRESULT} 
     */
    CanStartStopService(ServiceName, pCanStartStop) {
        ServiceName := ServiceName is String ? BSTR.Alloc(ServiceName).Value : ServiceName

        result := ComCall(37, this, "ptr", ServiceName, "ptr", pCanStartStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrClsid 
     * @param {VARIANT} bShow 
     * @param {Pointer<VARIANT>} pSuccess 
     * @returns {HRESULT} 
     */
    ShowBrowserBar(bstrClsid, bShow, pSuccess) {
        bstrClsid := bstrClsid is String ? BSTR.Alloc(bstrClsid).Value : bstrClsid

        result := ComCall(38, this, "ptr", bstrClsid, "ptr", bShow, "ptr", pSuccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
