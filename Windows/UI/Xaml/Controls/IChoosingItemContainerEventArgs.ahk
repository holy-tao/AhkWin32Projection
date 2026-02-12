#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include Primitives\SelectorItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IChoosingItemContainerEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChoosingItemContainerEventArgs
     * @type {Guid}
     */
    static IID => Guid("{9bb43bce-ae67-4a80-8363-e3fe1b244f2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemIndex", "get_Item", "get_ItemContainer", "put_ItemContainer", "get_IsContainerPrepared", "put_IsContainerPrepared"]

    /**
     * @type {Integer} 
     */
    ItemIndex {
        get => this.get_ItemIndex()
    }

    /**
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * @type {SelectorItem} 
     */
    ItemContainer {
        get => this.get_ItemContainer()
        set => this.put_ItemContainer(value)
    }

    /**
     * @type {Boolean} 
     */
    IsContainerPrepared {
        get => this.get_IsContainerPrepared()
        set => this.put_IsContainerPrepared(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemIndex() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {SelectorItem} 
     */
    get_ItemContainer() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SelectorItem(value)
    }

    /**
     * 
     * @param {SelectorItem} value 
     * @returns {HRESULT} 
     */
    put_ItemContainer(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContainerPrepared() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsContainerPrepared(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
