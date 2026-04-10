#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D2D1_THREADING_MODE.ahk
#Include .\D2D1_DEBUG_LEVEL.ahk
#Include .\D2D1_DEVICE_CONTEXT_OPTIONS.ahk

/**
 * Specifies the options with which the Direct2D device, factory, and device context are created.
 * @remarks
 * The root objects referred to here are the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> device, Direct2D factory and the Direct2D device context.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_creation_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_CREATION_PROPERTIES extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * The threading mode with which the corresponding root objects will be created.
     * @type {D2D1_THREADING_MODE}
     */
    threadingMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The debug level that the root objects should be created with.
     * @type {D2D1_DEBUG_LEVEL}
     */
    debugLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The device context options that the root objects should be created with.
     * @type {D2D1_DEVICE_CONTEXT_OPTIONS}
     */
    options {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
