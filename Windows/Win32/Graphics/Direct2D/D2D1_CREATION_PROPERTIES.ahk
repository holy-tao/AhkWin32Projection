#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_THREADING_MODE.ahk" { D2D1_THREADING_MODE }
#Import ".\D2D1_DEBUG_LEVEL.ahk" { D2D1_DEBUG_LEVEL }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }

/**
 * Specifies the options with which the Direct2D device, factory, and device context are created.
 * @remarks
 * The root objects referred to here are the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> device, Direct2D factory and the Direct2D device context.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_creation_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_CREATION_PROPERTIES {
    #StructPack 4

    /**
     * The threading mode with which the corresponding root objects will be created.
     */
    threadingMode : D2D1_THREADING_MODE

    /**
     * The debug level that the root objects should be created with.
     */
    debugLevel : D2D1_DEBUG_LEVEL

    /**
     * The device context options that the root objects should be created with.
     */
    options : D2D1_DEVICE_CONTEXT_OPTIONS

}
