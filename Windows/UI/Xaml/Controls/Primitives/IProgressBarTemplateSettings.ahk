#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IProgressBarTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressBarTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{3fe2ea2a-e3f2-4c2b-9488-918d77d2bbe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EllipseDiameter", "get_EllipseOffset", "get_EllipseAnimationWellPosition", "get_EllipseAnimationEndPosition", "get_ContainerAnimationStartPosition", "get_ContainerAnimationEndPosition", "get_IndicatorLengthDelta"]

    /**
     * @type {Float} 
     */
    EllipseDiameter {
        get => this.get_EllipseDiameter()
    }

    /**
     * @type {Float} 
     */
    EllipseOffset {
        get => this.get_EllipseOffset()
    }

    /**
     * @type {Float} 
     */
    EllipseAnimationWellPosition {
        get => this.get_EllipseAnimationWellPosition()
    }

    /**
     * @type {Float} 
     */
    EllipseAnimationEndPosition {
        get => this.get_EllipseAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    ContainerAnimationStartPosition {
        get => this.get_ContainerAnimationStartPosition()
    }

    /**
     * @type {Float} 
     */
    ContainerAnimationEndPosition {
        get => this.get_ContainerAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    IndicatorLengthDelta {
        get => this.get_IndicatorLengthDelta()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseDiameter() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseOffset() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseAnimationWellPosition() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseAnimationEndPosition() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContainerAnimationStartPosition() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContainerAnimationEndPosition() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IndicatorLengthDelta() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
