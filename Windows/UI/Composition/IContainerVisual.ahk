#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VisualCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IContainerVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContainerVisual
     * @type {Guid}
     */
    static IID => Guid("{02f6bc74-ed20-4773-afe6-d49b4a93db32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Children"]

    /**
     * @type {VisualCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * 
     * @returns {VisualCollection} 
     */
    get_Children() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualCollection(value)
    }
}
