#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Composition\IVisualElement.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowFrame
     * @type {Guid}
     */
    static IID => Guid("{9ee22601-7e5d-52af-846b-01dc6c296567}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DragRegionVisuals"]

    /**
     * @type {IVector<IVisualElement>} 
     */
    DragRegionVisuals {
        get => this.get_DragRegionVisuals()
    }

    /**
     * 
     * @returns {IVector<IVisualElement>} 
     */
    get_DragRegionVisuals() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IVisualElement, value)
    }
}
