#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Application structure. Use the functions with the name prefix &quot;MI_Application_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_applicationft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ApplicationFT extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Deinitializes the management infrastructure. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_close">MI_Application_Close</a>.
     * @type {Pointer}
     */
    Close {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Creates a session that allows a group of operations that go to the same destination to be grouped so they 
     *        can share connections. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newsession">MI_Application_NewSession</a>.
     * @type {Pointer}
     */
    NewSession {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Creates a new hosted Provider. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newhostedprovider">MI_Application_NewHostedProvider</a>.
     * @type {Pointer}
     */
    NewHostedProvider {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Creates an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newinstance">MI_Application_NewInstance</a>.
     * @type {Pointer}
     */
    NewInstance {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Creates an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptions">MI_DestinationOptions</a> object. 
     *        See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newdestinationoptions">MI_Application_NewDestinationOptions</a>.
     * @type {Pointer}
     */
    NewDestinationOptions {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Creates an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptions">MI_OperationOptions</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newoperationoptions">MI_Application_NewOperationOptions</a>.
     * @type {Pointer}
     */
    NewOperationOptions {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newsubscriptiondeliveryoptions">MI_Application_NewSubscriptionDeliveryOptions</a>.
     * @type {Pointer}
     */
    NewSubscriptionDeliveryOptions {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Creates a serializer allowing a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> or an 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> to be persisted in a form that can be stored to 
     *        disk or transported over a transport. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newserializer">MI_Application_NewSerializer</a>.
     * @type {Pointer}
     */
    NewSerializer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Creates a deserializer that can be used to re-create the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a>. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newdeserializer">MI_Application_NewDeserializer</a>.
     * @type {Pointer}
     */
    NewDeserializer {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    NewInstanceFromClass {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    NewClass {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
