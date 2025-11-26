#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Controls\HPROPSHEETPAGE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods to access the property sheet settings of a task.
 * @remarks
 * 
 * This is the primary interface of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/t">task object</a>. To create a task object, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> for existing tasks or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-newworkitem">ITaskScheduler::NewWorkItem</a> for new tasks.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-iprovidetaskpage
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IProvideTaskPage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideTaskPage
     * @type {Guid}
     */
    static IID => Guid("{4086658a-cbbb-11cf-b604-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPage"]

    /**
     * This method retrieves one or more property sheet pages associated with a task object.
     * @param {Integer} tpType One of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ne-mstask-taskpage">TASKPAGE</a> enumeration values that specify the page to return.
     * @param {BOOL} fPersistChanges Specifies whether changes to the task object are made persistent automatically. If <b>TRUE</b>, the page updates the persistent task object automatically if there is a change made on release. If <b>FALSE</b>, the caller is responsible for making task object changes persistent by calling <b>IPersistFile::Save</b> on the task object.
     * @returns {HPROPSHEETPAGE} Handle to the returned property sheet page of the task object. This handle can then be used to display the page.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-iprovidetaskpage-getpage
     */
    GetPage(tpType, fPersistChanges) {
        phPage := HPROPSHEETPAGE()
        result := ComCall(3, this, "int", tpType, "int", fPersistChanges, "ptr", phPage, "HRESULT")
        return phPage
    }
}
