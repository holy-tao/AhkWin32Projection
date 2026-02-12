#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\SurfaceImageSource.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class ISurfaceImageSourceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurfaceImageSourceFactory
     * @type {Guid}
     */
    static IID => Guid("{3ab2212a-ef65-4a5f-bfac-73993e8c12c9}")

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
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {SurfaceImageSource} 
     */
    CreateInstanceWithDimensions(pixelWidth, pixelHeight, baseInterface, innerInterface) {
        result := ComCall(6, this, "int", pixelWidth, "int", pixelHeight, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SurfaceImageSource(value)
    }

    /**
     * 
     * @param {Integer} pixelWidth 
     * @param {Integer} pixelHeight 
     * @param {Boolean} isOpaque 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {SurfaceImageSource} 
     */
    CreateInstanceWithDimensionsAndOpacity(pixelWidth, pixelHeight, isOpaque, baseInterface, innerInterface) {
        result := ComCall(7, this, "int", pixelWidth, "int", pixelHeight, "int", isOpaque, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SurfaceImageSource(value)
    }
}
