#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Operation structure. Use the functions with the name prefix &quot;MI_Operation_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationFT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Closes an operation handle. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_close">MI_Operation_Close</a>.
     * @type {Pointer}
     */
    Close {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Cancels a running operation. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_cancel">MI_Operation_Cancel</a>.
     * @type {Pointer}
     */
    Cancel {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Gets the session associated with an operation. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_getsession">MI_Operation_GetSession</a>.
     * @type {Pointer}
     */
    GetSession {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Gets a synchronous result for an instance operation. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_getinstance">MI_Operation_GetInstance</a>.
     * @type {Pointer}
     */
    GetInstance {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Get the synchronous results from a subscription. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_getindication">MI_Operation_GetIndication</a>.
     * @type {Pointer}
     */
    GetIndication {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Closes an operation handle. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operation_close">MI_Operation_Close</a>.
     * @type {Pointer}
     */
    GetClass {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
