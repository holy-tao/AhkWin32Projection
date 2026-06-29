#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TASKPAGE.ahk" { TASKPAGE }
#Import "..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the methods to access the property sheet settings of a task.
 * @remarks
 * This is the primary interface of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/t">task object</a>. To create a task object, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> for existing tasks or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-newworkitem">ITaskScheduler::NewWorkItem</a> for new tasks.
 * @see https://learn.microsoft.com/windows/win32/api/mstask/nn-mstask-iprovidetaskpage
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IProvideTaskPage extends IUnknown {
    /**
     * The interface identifier for IProvideTaskPage
     * @type {Guid}
     */
    static IID := Guid("{4086658a-cbbb-11cf-b604-00c04fd8d565}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideTaskPage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideTaskPage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method retrieves one or more property sheet pages associated with a task object.
     * @remarks
     * To retrieve the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-iprovidetaskpage">IProvideTaskPage</a> interface, call <b>ITask::QueryInterface</b>.
     * 
     * The following code shows the variable declaration and calling syntax for using this method and for calling <b>ITask::QueryInterface</b>.
     * @param {TASKPAGE} tpType One of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ne-mstask-taskpage">TASKPAGE</a> enumeration values that specify the page to return.
     * @param {BOOL} fPersistChanges Specifies whether changes to the task object are made persistent automatically. If <b>TRUE</b>, the page updates the persistent task object automatically if there is a change made on release. If <b>FALSE</b>, the caller is responsible for making task object changes persistent by calling <b>IPersistFile::Save</b> on the task object.
     * @returns {HPROPSHEETPAGE} Handle to the returned property sheet page of the task object. This handle can then be used to display the page.
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-iprovidetaskpage-getpage
     */
    GetPage(tpType, fPersistChanges) {
        phPage := HPROPSHEETPAGE.Owned()
        result := ComCall(3, this, TASKPAGE, tpType, BOOL, fPersistChanges, HPROPSHEETPAGE.Ptr, phPage, "HRESULT")
        return phPage
    }

    Query(iid) {
        if (IProvideTaskPage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPage := CallbackCreate(GetMethod(implObj, "GetPage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPage)
    }
}
