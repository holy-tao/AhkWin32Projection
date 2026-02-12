#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CompositionDebugHeatMaps.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ICompositionDebugSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDebugSettings
     * @type {Guid}
     */
    static IID => Guid("{2831987e-1d82-4d38-b7b7-efd11c7bc3d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeatMaps"]

    /**
     * @type {CompositionDebugHeatMaps} 
     */
    HeatMaps {
        get => this.get_HeatMaps()
    }

    /**
     * 
     * @returns {CompositionDebugHeatMaps} 
     */
    get_HeatMaps() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionDebugHeatMaps(value)
    }
}
