#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TileMixedRealityModel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ISecondaryTileVisualElements4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryTileVisualElements4
     * @type {Guid}
     */
    static IID => Guid("{66566117-b544-40d2-8d12-74d4ec24d04c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MixedRealityModel"]

    /**
     * @type {TileMixedRealityModel} 
     */
    MixedRealityModel {
        get => this.get_MixedRealityModel()
    }

    /**
     * 
     * @returns {TileMixedRealityModel} 
     */
    get_MixedRealityModel() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileMixedRealityModel(value)
    }
}
