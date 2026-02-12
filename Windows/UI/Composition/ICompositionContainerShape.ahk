#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionShapeCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionContainerShape extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionContainerShape
     * @type {Guid}
     */
    static IID => Guid("{4f5e859b-2e5b-44a8-982c-aa0f69c16059}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Shapes"]

    /**
     * @type {CompositionShapeCollection} 
     */
    Shapes {
        get => this.get_Shapes()
    }

    /**
     * 
     * @returns {CompositionShapeCollection} 
     */
    get_Shapes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionShapeCollection(value)
    }
}
