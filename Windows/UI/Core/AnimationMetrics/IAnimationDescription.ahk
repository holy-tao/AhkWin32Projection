#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\IPropertyAnimation.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class IAnimationDescription extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnimationDescription
     * @type {Guid}
     */
    static IID => Guid("{7d11a549-be3d-41de-b081-05c149962f9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Animations", "get_StaggerDelay", "get_StaggerDelayFactor", "get_DelayLimit", "get_ZOrder"]

    /**
     * @type {IVectorView<IPropertyAnimation>} 
     */
    Animations {
        get => this.get_Animations()
    }

    /**
     * @type {TimeSpan} 
     */
    StaggerDelay {
        get => this.get_StaggerDelay()
    }

    /**
     * @type {Float} 
     */
    StaggerDelayFactor {
        get => this.get_StaggerDelayFactor()
    }

    /**
     * @type {TimeSpan} 
     */
    DelayLimit {
        get => this.get_DelayLimit()
    }

    /**
     * @type {Integer} 
     */
    ZOrder {
        get => this.get_ZOrder()
    }

    /**
     * 
     * @returns {IVectorView<IPropertyAnimation>} 
     */
    get_Animations() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IPropertyAnimation, value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StaggerDelay() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StaggerDelayFactor() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DelayLimit() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZOrder() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
