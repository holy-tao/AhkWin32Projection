#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VisualUnorderedCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionLight2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionLight2
     * @type {Guid}
     */
    static IID => Guid("{a7bcda72-f35d-425d-9b98-23f4205f6669}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExclusionsFromTargets"]

    /**
     * @type {VisualUnorderedCollection} 
     */
    ExclusionsFromTargets {
        get => this.get_ExclusionsFromTargets()
    }

    /**
     * 
     * @returns {VisualUnorderedCollection} 
     */
    get_ExclusionsFromTargets() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualUnorderedCollection(value)
    }
}
