#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VisualUnorderedCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionLight extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionLight
     * @type {Guid}
     */
    static IID => Guid("{41a6d7c2-2e5d-4bc1-b09e-8f0a03e3d8d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Targets"]

    /**
     * @type {VisualUnorderedCollection} 
     */
    Targets {
        get => this.get_Targets()
    }

    /**
     * 
     * @returns {VisualUnorderedCollection} 
     */
    get_Targets() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualUnorderedCollection(value)
    }
}
