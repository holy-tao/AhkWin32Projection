#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionVisualSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositorWithVisualSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositorWithVisualSurface
     * @type {Guid}
     */
    static IID => Guid("{cfa1658b-0123-4551-8891-89bdcc40322b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVisualSurface"]

    /**
     * 
     * @returns {CompositionVisualSurface} 
     */
    CreateVisualSurface() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionVisualSurface(result_)
    }
}
