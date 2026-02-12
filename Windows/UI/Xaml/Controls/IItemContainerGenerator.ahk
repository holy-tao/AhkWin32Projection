#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\DependencyObject.ahk
#Include .\ItemContainerGenerator.ahk
#Include Primitives\GeneratorPosition.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemContainerGenerator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemContainerGenerator
     * @type {Guid}
     */
    static IID => Guid("{40765f00-83f0-4d7f-b1b8-f19de4f1d5da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ItemsChanged", "remove_ItemsChanged", "ItemFromContainer", "ContainerFromItem", "IndexFromContainer", "ContainerFromIndex", "GetItemContainerGeneratorForPanel", "StartAt", "Stop", "GenerateNext", "PrepareItemContainer", "RemoveAll", "Remove", "GeneratorPositionFromIndex", "IndexFromGeneratorPosition", "Recycle"]

    /**
     * 
     * @param {ItemsChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {IInspectable} 
     */
    ItemFromContainer(container) {
        result := ComCall(8, this, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {IInspectable} item 
     * @returns {DependencyObject} 
     */
    ContainerFromItem(item) {
        result := ComCall(9, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {Integer} 
     */
    IndexFromContainer(container) {
        result := ComCall(10, this, "ptr", container, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {DependencyObject} 
     */
    ContainerFromIndex(index) {
        result := ComCall(11, this, "int", index, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {Panel} panel_ 
     * @returns {ItemContainerGenerator} 
     */
    GetItemContainerGeneratorForPanel(panel_) {
        result := ComCall(12, this, "ptr", panel_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemContainerGenerator(result_)
    }

    /**
     * 
     * @param {GeneratorPosition} position 
     * @param {Integer} direction_ 
     * @param {Boolean} allowStartAtRealizedItem 
     * @returns {HRESULT} 
     */
    StartAt(position, direction_, allowStartAtRealizedItem) {
        result := ComCall(13, this, "ptr", position, "int", direction_, "int", allowStartAtRealizedItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isNewlyRealized 
     * @returns {DependencyObject} 
     */
    GenerateNext(isNewlyRealized) {
        result := ComCall(15, this, "ptr", isNewlyRealized, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(returnValue)
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {HRESULT} 
     */
    PrepareItemContainer(container) {
        result := ComCall(16, this, "ptr", container, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {GeneratorPosition} position 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(position, count) {
        result := ComCall(18, this, "ptr", position, "int", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @returns {GeneratorPosition} 
     */
    GeneratorPositionFromIndex(itemIndex) {
        result_ := GeneratorPosition()
        result := ComCall(19, this, "int", itemIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {GeneratorPosition} position 
     * @returns {Integer} 
     */
    IndexFromGeneratorPosition(position) {
        result := ComCall(20, this, "ptr", position, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Recycles the calling process.
     * @param {GeneratorPosition} position 
     * @param {Integer} count 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-recyclesurrogate
     */
    Recycle(position, count) {
        result := ComCall(21, this, "ptr", position, "int", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
