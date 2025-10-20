#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the settings that the Task Scheduler service uses to obtain a network profile.
 * @remarks
 * 
  * When reading or writing your own XML for a task, network settings are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-networksettings-settingstype-element">NetworkSettings</a> element of the Task Scheduler schema.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-inetworksettings
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class INetworkSettings extends IDispatch{
    /**
     * The interface identifier for INetworkSettings
     * @type {Guid}
     */
    static IID => Guid("{9f7dea84-c30b-4245-80b6-00e9f646f1b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     */
    get_Id(pId) {
        result := ComCall(9, this, "ptr", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} id 
     * @returns {HRESULT} 
     */
    put_Id(id) {
        id := id is String ? BSTR.Alloc(id).Value : id

        result := ComCall(10, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
