#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include .\InertiaExpansionBehavior.ahk
#Include .\InertiaRotationBehavior.ahk
#Include .\InertiaTranslationBehavior.ahk
#Include ..\..\Input\ManipulationDelta.ahk
#Include ..\..\Input\ManipulationVelocities.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IManipulationInertiaStartingRoutedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManipulationInertiaStartingRoutedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{246a91a9-ca43-4c0b-acef-81e8b8147520}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Container", "get_ExpansionBehavior", "put_ExpansionBehavior", "get_RotationBehavior", "put_RotationBehavior", "get_TranslationBehavior", "put_TranslationBehavior", "get_Handled", "put_Handled", "get_PointerDeviceType", "get_Delta", "get_Cumulative", "get_Velocities"]

    /**
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * @type {InertiaExpansionBehavior} 
     */
    ExpansionBehavior {
        get => this.get_ExpansionBehavior()
        set => this.put_ExpansionBehavior(value)
    }

    /**
     * @type {InertiaRotationBehavior} 
     */
    RotationBehavior {
        get => this.get_RotationBehavior()
        set => this.put_RotationBehavior(value)
    }

    /**
     * @type {InertiaTranslationBehavior} 
     */
    TranslationBehavior {
        get => this.get_TranslationBehavior()
        set => this.put_TranslationBehavior(value)
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * @type {ManipulationDelta} 
     */
    Delta {
        get => this.get_Delta()
    }

    /**
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @returns {InertiaExpansionBehavior} 
     */
    get_ExpansionBehavior() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InertiaExpansionBehavior(value)
    }

    /**
     * 
     * @param {InertiaExpansionBehavior} value 
     * @returns {HRESULT} 
     */
    put_ExpansionBehavior(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InertiaRotationBehavior} 
     */
    get_RotationBehavior() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InertiaRotationBehavior(value)
    }

    /**
     * 
     * @param {InertiaRotationBehavior} value 
     * @returns {HRESULT} 
     */
    put_RotationBehavior(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InertiaTranslationBehavior} 
     */
    get_TranslationBehavior() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InertiaTranslationBehavior(value)
    }

    /**
     * 
     * @param {InertiaTranslationBehavior} value 
     * @returns {HRESULT} 
     */
    put_TranslationBehavior(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_Handled(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Delta() {
        value := ManipulationDelta()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        value := ManipulationDelta()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        value := ManipulationVelocities()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
