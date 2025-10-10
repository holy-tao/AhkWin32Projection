#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_ClassDecl and MI_Module structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_providerft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ProviderFT extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The server invokes this function to initialize the provider, which
     *  performs initialization activities.
     * @type {Pointer<MI_ProviderFT_Load>}
     */
    Load {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The server invokes this function to release any resources held by the 
     *  provider.
     * @type {Pointer<MI_ProviderFT_Unload>}
     */
    Unload {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The server invokes this function to obtain a single CIM 
     *  instance from the provider.
     * @type {Pointer<MI_ProviderFT_GetInstance>}
     */
    GetInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The server calls this function to enumerate instances of a CIM class 
     *  in the target namespace.
     * @type {Pointer<MI_ProviderFT_EnumerateInstances>}
     */
    EnumerateInstances {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The server calls this function to create a single CIM 
     *  instance in the target namespace.
     * @type {Pointer<MI_ProviderFT_CreateInstance>}
     */
    CreateInstance {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The server calls this function to modify an existing CIM 
     *  instance in the target namespace. The instance must already exist.
     * @type {Pointer<MI_ProviderFT_ModifyInstance>}
     */
    ModifyInstance {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The server calls this function to delete a single CIM 
     *  instance from the target namespace.
     * @type {Pointer<MI_ProviderFT_DeleteInstance>}
     */
    DeleteInstance {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The server calls this function to find all CIM instances
     *  associated with a particular 'source' CIM instance.
     * @type {Pointer<MI_ProviderFT_AssociatorInstances>}
     */
    AssociatorInstances {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The server calls this function to enumerate association 
     *  instances that refer to a particular CIM instance.
     * @type {Pointer<MI_ProviderFT_ReferenceInstances>}
     */
    ReferenceInstances {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The server calls this function to enable indications delivery 
     *  from the provider.
     * @type {Pointer<MI_ProviderFT_EnableIndications>}
     */
    EnableIndications {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The server calls this function to disable indications delivery 
     *  from the provider.
     * @type {Pointer<MI_ProviderFT_DisableIndications>}
     */
    DisableIndications {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The server invokes this function to subscribe to indications.
     * @type {Pointer<MI_ProviderFT_Subscribe>}
     */
    Subscribe {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The server invokes this function to unsubscribe from indications.
     * @type {Pointer<MI_ProviderFT_Unsubscribe>}
     */
    Unsubscribe {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The server calls this function to carry out a CIM extrinsic method 
     *  invocation on behalf of a requestor.
     * @type {Pointer<MI_ProviderFT_Invoke>}
     */
    Invoke {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
