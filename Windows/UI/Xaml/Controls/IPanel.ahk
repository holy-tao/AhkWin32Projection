#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\UIElementCollection.ahk
#Include ..\Media\Brush.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPanel
     * @type {Guid}
     */
    static IID => Guid("{a50a4bbd-8361-469c-90da-e9a40c7474df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Children", "get_Background", "put_Background", "get_IsItemsHost", "get_ChildrenTransitions", "put_ChildrenTransitions"]

    /**
     * @type {UIElementCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * @type {Boolean} 
     */
    IsItemsHost {
        get => this.get_IsItemsHost()
    }

    /**
     * @type {TransitionCollection} 
     */
    ChildrenTransitions {
        get => this.get_ChildrenTransitions()
        set => this.put_ChildrenTransitions(value)
    }

    /**
     * 
     * @returns {UIElementCollection} 
     */
    get_Children() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElementCollection(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsItemsHost() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ChildrenTransitions() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ChildrenTransitions(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
