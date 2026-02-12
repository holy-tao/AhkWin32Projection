#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class IScaleAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScaleAnimation
     * @type {Guid}
     */
    static IID => Guid("{023552c7-71ab-428c-9c9f-d31780964995}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialScaleX", "get_InitialScaleY", "get_FinalScaleX", "get_FinalScaleY", "get_NormalizedOrigin"]

    /**
     * @type {IReference<Float>} 
     */
    InitialScaleX {
        get => this.get_InitialScaleX()
    }

    /**
     * @type {IReference<Float>} 
     */
    InitialScaleY {
        get => this.get_InitialScaleY()
    }

    /**
     * @type {Float} 
     */
    FinalScaleX {
        get => this.get_FinalScaleX()
    }

    /**
     * @type {Float} 
     */
    FinalScaleY {
        get => this.get_FinalScaleY()
    }

    /**
     * @type {POINT} 
     */
    NormalizedOrigin {
        get => this.get_NormalizedOrigin()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialScaleX() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialScaleY() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FinalScaleX() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FinalScaleY() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_NormalizedOrigin() {
        value := POINT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
