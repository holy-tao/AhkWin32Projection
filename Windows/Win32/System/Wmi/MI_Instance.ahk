#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ClassDecl.ahk" { MI_ClassDecl }
#Import ".\MI_InstanceFT.ahk" { MI_InstanceFT }

/**
 * This structure represents a CIM instance. This object should not be accessed directly. Instead, the MI_Instance_* functions should be used.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instance
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Instance {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instanceft">MI_InstanceFT</a> function table.
     */
    ft : MI_InstanceFT.Ptr

    /**
     * The class declaration for this instance.
     */
    classDecl : MI_ClassDecl.Ptr

    /**
     * Optional server name. Can be null.
     */
    serverName : IntPtr

    /**
     * Optional namespace. Can be null.
     */
    nameSpace : IntPtr

    /**
     * Reserved for internal use.
     */
    reserved : IntPtr[4]

}
