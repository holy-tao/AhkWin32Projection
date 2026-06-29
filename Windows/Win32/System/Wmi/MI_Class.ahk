#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ClassDecl.ahk" { MI_ClassDecl }
#Import ".\MI_ClassFT.ahk" { MI_ClassFT }

/**
 * Represents the schema of an instance.
 * @remarks
 * The <b>MI_Class</b> object represents the schema of an instance.  Classes can be retrieved from the server, and instances can be queried for the <b>MI_Class</b> object.  Use the <b>MI_Class</b> APIs rather than navigating the structures themselves.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_class
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Class {
    #StructPack 8

    /**
     * Pointer to <b>MI_Class</b> function table.
     */
    ft : MI_ClassFT.Ptr

    __classDecl_ptr : IntPtr
    /**
     * Pointer to the class declaration.
     */
    classDecl {
        get => (addr := this.__classDecl_ptr) ? MI_ClassDecl.At(addr) : unset
        set => this.__classDecl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * The namespace name.
     */
    namespaceName : IntPtr

    /**
     * The server name.
     */
    serverName : IntPtr

    /**
     * Reserved for internal use.
     */
    reserved : IntPtr[4]

}
