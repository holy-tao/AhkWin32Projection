#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Function table for all actions on a session object.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_sessionft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_SessionFT {
    #StructPack 8

    /**
     * TBD
     */
    Close : IntPtr

    /**
     * TBD
     */
    GetApplication : IntPtr

    /**
     * TBD
     */
    GetInstance : IntPtr

    /**
     * TBD
     */
    ModifyInstance : IntPtr

    /**
     * TBD
     */
    CreateInstance : IntPtr

    /**
     * TBD
     */
    DeleteInstance : IntPtr

    /**
     * TBD
     */
    Invoke : IntPtr

    /**
     * TBD
     */
    EnumerateInstances : IntPtr

    /**
     * TBD
     */
    QueryInstances : IntPtr

    /**
     * TBD
     */
    AssociatorInstances : IntPtr

    /**
     * TBD
     */
    ReferenceInstances : IntPtr

    /**
     * TBD
     */
    Subscribe : IntPtr

    /**
     * TBD
     */
    GetClass : IntPtr

    /**
     * TBD
     */
    EnumerateClasses : IntPtr

    /**
     * TBD
     */
    TestConnection : IntPtr

}
