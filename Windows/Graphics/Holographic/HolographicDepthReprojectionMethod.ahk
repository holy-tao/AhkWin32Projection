#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reprojection method used to process the depth buffer submitted for image stabilization for a particular holographic camera when a given [HolographicFrame](holographicframe.md) is presented.
 * @remarks
 * Use this value when setting the [DepthReprojectionMethod](holographiccamerarenderingparameters_depthreprojectionmethod.md) property on the [HolographicCameraRenderingParameters](holographiccamerarenderingparameters.md) for each frame that it should be applied to. 
 * 
 * This value is only applicable when the app has also submitted a depth buffer for the same **HolographicFrame**.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicdepthreprojectionmethod
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicDepthReprojectionMethod extends Win32Enum{

    /**
     * Each pixel will be reprojected using a smoothed and filtered depth value, which is derived from depth information local to that pixel.
     * @type {Integer (Int32)}
     */
    static DepthReprojection => 0

    /**
     * A best-fit plane will be constructed using the depth data, and the best-fit plane will be used for planar reprojection. The best-fit plane is optimized using temporal smoothing and fronto-parallel bias.
     * @type {Integer (Int32)}
     */
    static AutoPlanar => 1
}
