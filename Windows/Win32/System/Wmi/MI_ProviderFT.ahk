#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ProviderFT_AssociatorInstances.ahk" { MI_ProviderFT_AssociatorInstances }
#Import ".\MI_ProviderFT_DeleteInstance.ahk" { MI_ProviderFT_DeleteInstance }
#Import ".\MI_ProviderFT_Invoke.ahk" { MI_ProviderFT_Invoke }
#Import ".\MI_ProviderFT_Load.ahk" { MI_ProviderFT_Load }
#Import ".\MI_ProviderFT_EnumerateInstances.ahk" { MI_ProviderFT_EnumerateInstances }
#Import ".\MI_ProviderFT_ModifyInstance.ahk" { MI_ProviderFT_ModifyInstance }
#Import ".\MI_ProviderFT_Unsubscribe.ahk" { MI_ProviderFT_Unsubscribe }
#Import ".\MI_ProviderFT_CreateInstance.ahk" { MI_ProviderFT_CreateInstance }
#Import ".\MI_ProviderFT_Subscribe.ahk" { MI_ProviderFT_Subscribe }
#Import ".\MI_ProviderFT_GetInstance.ahk" { MI_ProviderFT_GetInstance }
#Import ".\MI_ProviderFT_EnableIndications.ahk" { MI_ProviderFT_EnableIndications }
#Import ".\MI_ProviderFT_DisableIndications.ahk" { MI_ProviderFT_DisableIndications }
#Import ".\MI_ProviderFT_ReferenceInstances.ahk" { MI_ProviderFT_ReferenceInstances }
#Import ".\MI_ProviderFT_Unload.ahk" { MI_ProviderFT_Unload }

/**
 * A support structure used in the MI_ClassDecl and MI_Module structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_providerft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ProviderFT {
    #StructPack 8

    /**
     * The server invokes this function to initialize the provider, which
     *  performs initialization activities.
     */
    Load : MI_ProviderFT_Load

    /**
     * The server invokes this function to release any resources held by the 
     *  provider.
     */
    Unload : MI_ProviderFT_Unload

    /**
     * The server invokes this function to obtain a single CIM 
     *  instance from the provider.
     */
    GetInstance : MI_ProviderFT_GetInstance

    /**
     * The server calls this function to enumerate instances of a CIM class 
     *  in the target namespace.
     */
    EnumerateInstances : MI_ProviderFT_EnumerateInstances

    /**
     * The server calls this function to create a single CIM 
     *  instance in the target namespace.
     */
    CreateInstance : MI_ProviderFT_CreateInstance

    /**
     * The server calls this function to modify an existing CIM 
     *  instance in the target namespace. The instance must already exist.
     */
    ModifyInstance : MI_ProviderFT_ModifyInstance

    /**
     * The server calls this function to delete a single CIM 
     *  instance from the target namespace.
     */
    DeleteInstance : MI_ProviderFT_DeleteInstance

    /**
     * The server calls this function to find all CIM instances
     *  associated with a particular 'source' CIM instance.
     */
    AssociatorInstances : MI_ProviderFT_AssociatorInstances

    /**
     * The server calls this function to enumerate association 
     *  instances that refer to a particular CIM instance.
     */
    ReferenceInstances : MI_ProviderFT_ReferenceInstances

    /**
     * The server calls this function to enable indications delivery 
     *  from the provider.
     */
    EnableIndications : MI_ProviderFT_EnableIndications

    /**
     * The server calls this function to disable indications delivery 
     *  from the provider.
     */
    DisableIndications : MI_ProviderFT_DisableIndications

    /**
     * The server invokes this function to subscribe to indications.
     */
    Subscribe : MI_ProviderFT_Subscribe

    /**
     * The server invokes this function to unsubscribe from indications.
     */
    Unsubscribe : MI_ProviderFT_Unsubscribe

    /**
     * The server calls this function to carry out a CIM extrinsic method 
     *  invocation on behalf of a requestor.
     */
    Invoke : MI_ProviderFT_Invoke

}
