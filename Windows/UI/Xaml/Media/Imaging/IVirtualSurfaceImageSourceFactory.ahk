#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\VirtualSurfaceImageSource.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IVirtualSurfaceImageSourceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualSurfaceImageSourceFactory
     * @type {Guid}
     */
    static IID => Guid("{3ab2212a-bfac-11e0-8a92-69e44724019b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithDimensions", "CreateInstanceWithDimensionsAndOpacity"]

    /**
     * 
     * @param {Integer} pixelWidth 
     * @param {Integer} pixelHeight 
     * @returns {VirtualSurfaceImageSource} 
     */
    CreateInstanceWithDimensions(pixelWidth, pixelHeight) {
        result := ComCall(6, this, "int", pixelWidth, "int", pixelHeight, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VirtualSurfaceImageSource(value)
    }

    /**
     * 
     * @param {Integer} pixelWidth 
     * @param {Integer} pixelHeight 
     * @param {Boolean} isOpaque 
     * @returns {VirtualSurfaceImageSource} 
     */
    CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque) {
        result := ComCall(7, this, "int", pixelWidth, "int", pixelHeight, "int", isOpaque, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VirtualSurfaceImageSource(value)
    }
}
