#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_TRIGGER_TYPE.ahk" { SERVICE_TRIGGER_TYPE }
#Import ".\SERVICE_TRIGGER_SPECIFIC_DATA_ITEM.ahk" { SERVICE_TRIGGER_SPECIFIC_DATA_ITEM }
#Import ".\SERVICE_TRIGGER_ACTION.ahk" { SERVICE_TRIGGER_ACTION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a service trigger event. This structure is used by the SERVICE_TRIGGER_INFO structure.
 * @remarks
 * On a system that is joined to a domain, security policy settings may prevent the BFE service and its dependent services from being stopped or cause them to restart automatically. In this case, it is necessary to disable the services and then re-enable them after the event is registered. To do this programmatically, store each service's original start type, change the service start type to SERVICE_DISABLED, register the event, and then restore the service's original start type. For information about changing a service's start type, see <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a>. 
 * 
 * To disable the services using the SC command-line tool, use the  command <b>sc config bfe start= disabled</b>  to disable the BFE service and its dependent services, then use the command <b>net stop bfe /Y</b>  to stop them.  To re-enable the services, use the command <b>sc config bfe start= auto</b>. For more information about the SC command-line tool, see <a href="https://docs.microsoft.com/windows/desktop/Services/controlling-a-service-using-sc">Controlling a Service Using SC</a>.
 * 
 * If it is not possible to disable the services, it may be necessary to restart the system after installing the service that is registering the event. In this case, do not disable the BFE service and its dependent services before restarting the system, because the system may not work correctly if these services remain disabled.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_trigger
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_TRIGGER {
    #StructPack 8

    dwTriggerType : SERVICE_TRIGGER_TYPE

    dwAction : SERVICE_TRIGGER_ACTION

    /**
     * Points to a GUID that identifies the trigger event subtype. The value of this member depends on the value of the <b>dwTriggerType</b> member. 
     * 
     * If <b>dwTriggerType</b> is SERVICE_TRIGGER_TYPE_CUSTOM, <b>pTriggerSubtype</b> is the GUID that identifies the custom event provider. 
     * 
     * If <b>dwTriggerType</b> is SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL, <b>pTriggerSubtype</b> is the GUID that identifies the device interface class.
     */
    pTriggerSubtype : Guid.Ptr

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_trigger_specific_data_item">SERVICE_TRIGGER_SPECIFIC_DATA_ITEM</a> structures in the array pointed to by <i>pDataItems</i>. 
     * 
     * This member is valid only if the <b>dwDataType</b> member is SERVICE_TRIGGER_TYPE_CUSTOM, SERVICE_TRIGGER_TYPE_DEVICE_ARRIVAL, SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT, or SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT.
     */
    cDataItems : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_trigger_specific_data_item">SERVICE_TRIGGER_SPECIFIC_DATA_ITEM</a> structures that contain trigger-specific data.
     */
    pDataItems : SERVICE_TRIGGER_SPECIFIC_DATA_ITEM.Ptr

}
