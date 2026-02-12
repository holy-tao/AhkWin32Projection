#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBindableVector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class INotifyCollectionChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotifyCollectionChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4cf68d33-e3f2-4964-b85e-945b4f7e2f21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action", "get_NewItems", "get_OldItems", "get_NewStartingIndex", "get_OldStartingIndex"]

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {IBindableVector} 
     */
    NewItems {
        get => this.get_NewItems()
    }

    /**
     * @type {IBindableVector} 
     */
    OldItems {
        get => this.get_OldItems()
    }

    /**
     * @type {Integer} 
     */
    NewStartingIndex {
        get => this.get_NewStartingIndex()
    }

    /**
     * @type {Integer} 
     */
    OldStartingIndex {
        get => this.get_OldStartingIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBindableVector} 
     */
    get_NewItems() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBindableVector(value)
    }

    /**
     * 
     * @returns {IBindableVector} 
     */
    get_OldItems() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBindableVector(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewStartingIndex() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldStartingIndex() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
