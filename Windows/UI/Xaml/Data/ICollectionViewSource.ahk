#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICollectionView.ahk
#Include ..\PropertyPath.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICollectionViewSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICollectionViewSource
     * @type {Guid}
     */
    static IID => Guid("{a66a1146-d2fb-4ead-be9f-3578a466dcfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source", "get_View", "get_IsSourceGrouped", "put_IsSourceGrouped", "get_ItemsPath", "put_ItemsPath"]

    /**
     * @type {IInspectable} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {ICollectionView} 
     */
    View {
        get => this.get_View()
    }

    /**
     * @type {Boolean} 
     */
    IsSourceGrouped {
        get => this.get_IsSourceGrouped()
        set => this.put_IsSourceGrouped(value)
    }

    /**
     * @type {PropertyPath} 
     */
    ItemsPath {
        get => this.get_ItemsPath()
        set => this.put_ItemsPath(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ICollectionView} 
     */
    get_View() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICollectionView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSourceGrouped() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_IsSourceGrouped(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PropertyPath} 
     */
    get_ItemsPath() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyPath(value)
    }

    /**
     * 
     * @param {PropertyPath} value 
     * @returns {HRESULT} 
     */
    put_ItemsPath(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
