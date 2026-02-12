#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapElement3DStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapElement3DStatics
     * @type {Guid}
     */
    static IID => Guid("{6128011a-450f-442a-b9d9-aa815c71907a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocationProperty", "get_HeadingProperty", "get_PitchProperty", "get_RollProperty", "get_ScaleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LocationProperty {
        get => this.get_LocationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeadingProperty {
        get => this.get_HeadingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PitchProperty {
        get => this.get_PitchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RollProperty {
        get => this.get_RollProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ScaleProperty {
        get => this.get_ScaleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LocationProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeadingProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PitchProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RollProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ScaleProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
