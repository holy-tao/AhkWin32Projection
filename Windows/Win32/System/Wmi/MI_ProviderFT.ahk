#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
    Load : IntPtr

    /**
     * The server invokes this function to release any resources held by the 
     *  provider.
     */
    Unload : IntPtr

    /**
     * The server invokes this function to obtain a single CIM 
     *  instance from the provider.
     */
    GetInstance : IntPtr

    /**
     * The server calls this function to enumerate instances of a CIM class 
     *  in the target namespace.
     */
    EnumerateInstances : IntPtr

    /**
     * The server calls this function to create a single CIM 
     *  instance in the target namespace.
     */
    CreateInstance : IntPtr

    /**
     * The server calls this function to modify an existing CIM 
     *  instance in the target namespace. The instance must already exist.
     */
    ModifyInstance : IntPtr

    /**
     * The server calls this function to delete a single CIM 
     *  instance from the target namespace.
     */
    DeleteInstance : IntPtr

    /**
     * The server calls this function to find all CIM instances
     *  associated with a particular 'source' CIM instance.
     */
    AssociatorInstances : IntPtr

    /**
     * The server calls this function to enumerate association 
     *  instances that refer to a particular CIM instance.
     */
    ReferenceInstances : IntPtr

    /**
     * The server calls this function to enable indications delivery 
     *  from the provider.
     */
    EnableIndications : IntPtr

    /**
     * The server calls this function to disable indications delivery 
     *  from the provider.
     */
    DisableIndications : IntPtr

    /**
     * The server invokes this function to subscribe to indications.
     */
    Subscribe : IntPtr

    /**
     * The server invokes this function to unsubscribe from indications.
     */
    Unsubscribe : IntPtr

    /**
     * The server calls this function to carry out a CIM extrinsic method 
     *  invocation on behalf of a requestor.
     */
    Invoke : IntPtr

}
