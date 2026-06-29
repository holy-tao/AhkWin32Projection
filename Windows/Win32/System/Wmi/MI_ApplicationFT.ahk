#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Application structure. Use the functions with the name prefix &quot;MI_Application_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_applicationft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ApplicationFT {
    #StructPack 8

    /**
     * Deinitializes the management infrastructure. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_close">MI_Application_Close</a>.
     */
    Close : IntPtr

    /**
     * Creates a session that allows a group of operations that go to the same destination to be grouped so they 
     *        can share connections. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newsession">MI_Application_NewSession</a>.
     */
    NewSession : IntPtr

    /**
     * Creates a new hosted Provider. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newhostedprovider">MI_Application_NewHostedProvider</a>.
     */
    NewHostedProvider : IntPtr

    /**
     * Creates an instance. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newinstance">MI_Application_NewInstance</a>.
     */
    NewInstance : IntPtr

    /**
     * Creates an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptions">MI_DestinationOptions</a> object. 
     *        See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newdestinationoptions">MI_Application_NewDestinationOptions</a>.
     */
    NewDestinationOptions : IntPtr

    /**
     * Creates an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptions">MI_OperationOptions</a> object. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newoperationoptions">MI_Application_NewOperationOptions</a>.
     */
    NewOperationOptions : IntPtr

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newsubscriptiondeliveryoptions">MI_Application_NewSubscriptionDeliveryOptions</a>.
     */
    NewSubscriptionDeliveryOptions : IntPtr

    /**
     * Creates a serializer allowing a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> or an 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a> to be persisted in a form that can be stored to 
     *        disk or transported over a transport. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newserializer">MI_Application_NewSerializer</a>.
     */
    NewSerializer : IntPtr

    /**
     * Creates a deserializer that can be used to re-create the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_class">MI_Class</a>. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newdeserializer">MI_Application_NewDeserializer</a>.
     */
    NewDeserializer : IntPtr

    /**
     * TBD
     */
    NewInstanceFromClass : IntPtr

    /**
     * TBD
     */
    NewClass : IntPtr

}
