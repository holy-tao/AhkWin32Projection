#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaOverlayLayer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaOverlayLayerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaOverlayLayerFactory
     * @type {Guid}
     */
    static IID => Guid("{947cb473-a39e-4362-abbf-9f8b5070a062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithCompositorDefinition"]

    /**
     * 
     * @param {IVideoCompositorDefinition} compositorDefinition 
     * @returns {MediaOverlayLayer} 
     */
    CreateWithCompositorDefinition(compositorDefinition) {
        result := ComCall(6, this, "ptr", compositorDefinition, "ptr*", &mediaOverlayLayer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaOverlayLayer(mediaOverlayLayer_)
    }
}
