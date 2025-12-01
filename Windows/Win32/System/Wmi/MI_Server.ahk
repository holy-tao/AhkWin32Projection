#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure defines default function tables for all types:\_Context, Instance, PropertySet, and Filter.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_server
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Server extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Pointer to an <b>MI_Server</b> function table.
     * @type {Pointer<MI_ServerFT>}
     */
    serverFT {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_context">MI_Context</a> function table.
     * @type {Pointer<MI_ContextFT>}
     */
    contextFT {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> function table.
     * @type {Pointer<MI_InstanceFT>}
     */
    instanceFT {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_propertyset">MI_PropertySet</a> function table.
     * @type {Pointer<MI_PropertySetFT>}
     */
    propertySetFT {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_filter">MI_Filter</a> function table.
     * @type {Pointer<MI_FilterFT>}
     */
    filterFT {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
