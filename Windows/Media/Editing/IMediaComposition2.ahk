#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\MediaOverlayLayer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaComposition2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaComposition2
     * @type {Guid}
     */
    static IID => Guid("{a59e5372-2366-492c-bec8-e6dfba6d0281}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverlayLayers"]

    /**
     * @type {IVector<MediaOverlayLayer>} 
     */
    OverlayLayers {
        get => this.get_OverlayLayers()
    }

    /**
     * 
     * @returns {IVector<MediaOverlayLayer>} 
     */
    get_OverlayLayers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MediaOverlayLayer, value)
    }
}
