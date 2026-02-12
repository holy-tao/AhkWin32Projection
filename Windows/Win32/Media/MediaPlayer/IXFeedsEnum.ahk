#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedsEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedsEnum
     * @type {Guid}
     */
    static IID => Guid("{dc43a9d5-5015-4301-8c96-a47434b4d658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Count", "Item"]

    /**
     * Specifies the number of times that the Task Scheduler will attempt to restart the task.
     * @remarks
     * If this element is specified, the [**Interval**](taskschedulerschema-interval-restarttype-element.md) element must also be specified to tell the Task Scheduler how long to attempt to restart the task.
     * 
     * For C++ development, see [**RestartCount Property of ITaskSettings**](/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_restartcount).
     * 
     * For script development, see [**TaskSettings.RestartCount**](tasksettings-restartcount.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-count-restarttype-element
     */
    Count() {
        result := ComCall(3, this, "uint*", &puiCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(uiIndex, riid) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
