#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Geometry.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGeometryStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeometryStatics
     * @type {Guid}
     */
    static IID => Guid("{7a70aa8c-0b06-465f-b637-9a47e5a70111}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Empty", "get_StandardFlatteningTolerance", "get_TransformProperty"]

    /**
     * @type {Geometry} 
     */
    Empty {
        get => this.get_Empty()
    }

    /**
     * @type {Float} 
     */
    StandardFlatteningTolerance {
        get => this.get_StandardFlatteningTolerance()
    }

    /**
     * @type {DependencyProperty} 
     */
    TransformProperty {
        get => this.get_TransformProperty()
    }

    /**
     * 
     * @returns {Geometry} 
     */
    get_Empty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geometry(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StandardFlatteningTolerance() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TransformProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
