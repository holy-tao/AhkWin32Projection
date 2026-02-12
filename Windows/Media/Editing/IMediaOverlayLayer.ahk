#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaOverlayLayer.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\MediaOverlay.ahk
#Include ..\Effects\IVideoCompositorDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaOverlayLayer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaOverlayLayer
     * @type {Guid}
     */
    static IID => Guid("{a6d9ba57-eeda-46c6-bbe5-e398c84168ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "get_Overlays", "get_CustomCompositorDefinition"]

    /**
     * @type {IVector<MediaOverlay>} 
     */
    Overlays {
        get => this.get_Overlays()
    }

    /**
     * @type {IVideoCompositorDefinition} 
     */
    CustomCompositorDefinition {
        get => this.get_CustomCompositorDefinition()
    }

    /**
     * Clone Method Example (VC++)
     * @returns {MediaOverlayLayer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaOverlayLayer(result_)
    }

    /**
     * 
     * @returns {IVector<MediaOverlay>} 
     */
    get_Overlays() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MediaOverlay, value)
    }

    /**
     * 
     * @returns {IVideoCompositorDefinition} 
     */
    get_CustomCompositorDefinition() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVideoCompositorDefinition(value)
    }
}
