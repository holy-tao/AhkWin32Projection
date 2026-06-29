#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedsEnum extends IUnknown {
    /**
     * The interface identifier for IXFeedsEnum
     * @type {Guid}
     */
    static IID := Guid("{dc43a9d5-5015-4301-8c96-a47434b4d658}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedsEnum interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Count : IntPtr
        Item  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeedsEnum.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the number of times that the Task Scheduler will attempt to restart the task.
     * @remarks
     * If this element is specified, the [**Interval**](taskschedulerschema-interval-restarttype-element.md) element must also be specified to tell the Task Scheduler how long to attempt to restart the task.
     * 
     * For C++ development, see [**RestartCount Property of ITaskSettings**](/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_restartcount).
     * 
     * For script development, see [**TaskSettings.RestartCount**](tasksettings-restartcount.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-count-restarttype-element
     */
    Count() {
        result := ComCall(3, this, "uint*", &puiCount := 0, "HRESULT")
        return puiCount
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} uiIndex 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(uiIndex, riid) {
        result := ComCall(4, this, "uint", uiIndex, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IXFeedsEnum.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Count := CallbackCreate(GetMethod(implObj, "Count"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Count)
        CallbackFree(this.vtbl.Item)
    }
}
