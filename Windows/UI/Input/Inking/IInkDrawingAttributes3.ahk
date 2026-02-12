#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkDrawingAttributesPencilProperties.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkDrawingAttributes3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributes3
     * @type {Guid}
     */
    static IID => Guid("{72020002-7d5b-4690-8af4-e664cbe2b74f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_PencilProperties"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {InkDrawingAttributesPencilProperties} 
     */
    PencilProperties {
        get => this.get_PencilProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {InkDrawingAttributesPencilProperties} 
     */
    get_PencilProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkDrawingAttributesPencilProperties(value)
    }
}
