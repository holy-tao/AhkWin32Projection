#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollContentPresenter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollContentPresenter2
     * @type {Guid}
     */
    static IID => Guid("{5f9f2737-2318-5999-8a62-c3ed3c0e98b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanContentRenderOutsideBounds", "put_CanContentRenderOutsideBounds", "get_SizesContentToTemplatedParent", "put_SizesContentToTemplatedParent"]

    /**
     * @type {Boolean} 
     */
    CanContentRenderOutsideBounds {
        get => this.get_CanContentRenderOutsideBounds()
        set => this.put_CanContentRenderOutsideBounds(value)
    }

    /**
     * @type {Boolean} 
     */
    SizesContentToTemplatedParent {
        get => this.get_SizesContentToTemplatedParent()
        set => this.put_SizesContentToTemplatedParent(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanContentRenderOutsideBounds() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_CanContentRenderOutsideBounds(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SizesContentToTemplatedParent() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_SizesContentToTemplatedParent(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
