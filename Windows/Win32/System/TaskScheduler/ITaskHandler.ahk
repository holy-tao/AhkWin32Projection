#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the methods that are called by the Task Scheduler service to manage a COM handler.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskhandler
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskHandler extends IUnknown{
    /**
     * The interface identifier for ITaskHandler
     * @type {Guid}
     */
    static IID => Guid("{839d7762-5121-4009-9234-4f0d19394f04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pHandlerServices 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    Start(pHandlerServices, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(3, this, "ptr", pHandlerServices, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pRetCode 
     * @returns {HRESULT} 
     */
    Stop(pRetCode) {
        result := ComCall(4, this, "ptr", pRetCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
