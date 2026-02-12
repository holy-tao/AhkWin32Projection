#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewer4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewer4
     * @type {Guid}
     */
    static IID => Guid("{786fb0c4-50a9-5a45-8a92-7bf372e19098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReduceViewportForCoreInputViewOcclusions", "put_ReduceViewportForCoreInputViewOcclusions", "get_HorizontalAnchorRatio", "put_HorizontalAnchorRatio", "get_VerticalAnchorRatio", "put_VerticalAnchorRatio", "get_CanContentRenderOutsideBounds", "put_CanContentRenderOutsideBounds", "add_AnchorRequested", "remove_AnchorRequested"]

    /**
     * @type {Boolean} 
     */
    ReduceViewportForCoreInputViewOcclusions {
        get => this.get_ReduceViewportForCoreInputViewOcclusions()
        set => this.put_ReduceViewportForCoreInputViewOcclusions(value)
    }

    /**
     * @type {Float} 
     */
    HorizontalAnchorRatio {
        get => this.get_HorizontalAnchorRatio()
        set => this.put_HorizontalAnchorRatio(value)
    }

    /**
     * @type {Float} 
     */
    VerticalAnchorRatio {
        get => this.get_VerticalAnchorRatio()
        set => this.put_VerticalAnchorRatio(value)
    }

    /**
     * @type {Boolean} 
     */
    CanContentRenderOutsideBounds {
        get => this.get_CanContentRenderOutsideBounds()
        set => this.put_CanContentRenderOutsideBounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReduceViewportForCoreInputViewOcclusions() {
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
    put_ReduceViewportForCoreInputViewOcclusions(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalAnchorRatio() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAnchorRatio(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAnchorRatio() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalAnchorRatio(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanContentRenderOutsideBounds() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ScrollViewer, AnchorRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AnchorRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_AnchorRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
