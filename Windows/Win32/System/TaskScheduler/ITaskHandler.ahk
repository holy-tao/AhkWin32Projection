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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "Pause", "Resume"]

    /**
     * Called to start the COM handler.
     * @param {IUnknown} pHandlerServices An <b>IUnkown</b> interface that is used to communicate back with the Task Scheduler.
     * @param {BSTR} data The arguments that are required by the handler.  These arguments are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-icomhandleraction-get_data">Data</a> property of the COM handler action.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskhandler-start
     */
    Start(pHandlerServices, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(3, this, "ptr", pHandlerServices, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Called to stop the COM handler.
     * @returns {HRESULT} The return code that the Task Schedule will raise as an event when the COM handler action is completed.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskhandler-stop
     */
    Stop() {
        result := ComCall(4, this, "int*", &pRetCode := 0, "HRESULT")
        return pRetCode
    }

    /**
     * Called to pause the COM handler.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskhandler-pause
     */
    Pause() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Called to resume the COM handler.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskhandler-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
