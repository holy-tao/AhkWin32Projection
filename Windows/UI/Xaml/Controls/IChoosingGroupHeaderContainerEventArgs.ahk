#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ListViewBaseHeaderItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IChoosingGroupHeaderContainerEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChoosingGroupHeaderContainerEventArgs
     * @type {Guid}
     */
    static IID => Guid("{67db44d6-d201-4d72-beac-5e8e58afd8c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GroupHeaderContainer", "put_GroupHeaderContainer", "get_GroupIndex", "get_Group"]

    /**
     * @type {ListViewBaseHeaderItem} 
     */
    GroupHeaderContainer {
        get => this.get_GroupHeaderContainer()
        set => this.put_GroupHeaderContainer(value)
    }

    /**
     * @type {Integer} 
     */
    GroupIndex {
        get => this.get_GroupIndex()
    }

    /**
     * @type {IInspectable} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * 
     * @returns {ListViewBaseHeaderItem} 
     */
    get_GroupHeaderContainer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ListViewBaseHeaderItem(value)
    }

    /**
     * 
     * @param {ListViewBaseHeaderItem} value 
     * @returns {HRESULT} 
     */
    put_GroupHeaderContainer(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupIndex() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Group() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }
}
