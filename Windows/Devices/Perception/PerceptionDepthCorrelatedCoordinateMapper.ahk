#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionDepthCorrelatedCoordinateMapper.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides convenience methods to map pixel coordinates in camera image space to depth image space.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcoordinatemapper
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionDepthCorrelatedCoordinateMapper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionDepthCorrelatedCoordinateMapper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionDepthCorrelatedCoordinateMapper.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Maps a pixel from camera image space to depth image space.
     * @param {POINT} sourcePixelCoordinate A pixel coordinate, in camera image space.
     * @param {PerceptionDepthFrame} depthFrame The depth frame to map the pixel to.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcoordinatemapper.mappixeltotarget
     */
    MapPixelToTarget(sourcePixelCoordinate, depthFrame) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCoordinateMapper := IPerceptionDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCoordinateMapper.MapPixelToTarget(sourcePixelCoordinate, depthFrame)
    }

    /**
     * Maps a set of pixels from camera image space to depth image space.
     * @param {Integer} sourceCoordinates_length 
     * @param {Pointer<POINT>} sourceCoordinates A set of pixel coordinates, in camera image space.
     * @param {PerceptionDepthFrame} depthFrame The depth frame to map the pixels to.
     * @param {Pointer<Integer>} results_length 
     * @param {Pointer<Pointer<POINT>>} results The mapping of the pixel coordinate to depth image space.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcoordinatemapper.mappixelstotarget
     */
    MapPixelsToTarget(sourceCoordinates_length, sourceCoordinates, depthFrame, results_length, results) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCoordinateMapper := IPerceptionDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCoordinateMapper.MapPixelsToTarget(sourceCoordinates_length, sourceCoordinates, depthFrame, results_length, results)
    }

    /**
     * Maps a region of pixels from camera image space to depth image space.
     * @param {RECT} region_ The region of pixels to map from camera image space to depth image space.
     * @param {PerceptionDepthFrame} depthFrame The depth frame to map the region of pixels to.
     * @param {Pointer<Integer>} targetCoordinates_length 
     * @param {Pointer<Pointer<POINT>>} targetCoordinates The pixel coordinates, mapped to depth image space.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcoordinatemapper.mapregionofpixelstotargetasync
     */
    MapRegionOfPixelsToTargetAsync(region_, depthFrame, targetCoordinates_length, targetCoordinates) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCoordinateMapper := IPerceptionDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCoordinateMapper.MapRegionOfPixelsToTargetAsync(region_, depthFrame, targetCoordinates_length, targetCoordinates)
    }

    /**
     * Maps all pixels in an image from camera image space to depth image space.
     * @param {PerceptionDepthFrame} depthFrame The depth frame to map the pixels to.
     * @param {Pointer<Integer>} targetCoordinates_length 
     * @param {Pointer<Pointer<POINT>>} targetCoordinates Returns the pixel coordinates, mapped to depth image space.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthcorrelatedcoordinatemapper.mapallpixelstotargetasync
     */
    MapAllPixelsToTargetAsync(depthFrame, targetCoordinates_length, targetCoordinates) {
        if (!this.HasProp("__IPerceptionDepthCorrelatedCoordinateMapper")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthCorrelatedCoordinateMapper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthCorrelatedCoordinateMapper := IPerceptionDepthCorrelatedCoordinateMapper(outPtr)
        }

        return this.__IPerceptionDepthCorrelatedCoordinateMapper.MapAllPixelsToTargetAsync(depthFrame, targetCoordinates_length, targetCoordinates)
    }

;@endregion Instance Methods
}
