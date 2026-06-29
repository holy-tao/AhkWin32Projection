#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_FilterFT.ahk" { MI_FilterFT }
#Import ".\MI_ServerFT.ahk" { MI_ServerFT }
#Import ".\MI_InstanceFT.ahk" { MI_InstanceFT }
#Import ".\MI_ContextFT.ahk" { MI_ContextFT }
#Import ".\MI_PropertySetFT.ahk" { MI_PropertySetFT }

/**
 * This structure defines default function tables for all types:\_Context, Instance, PropertySet, and Filter.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_server
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Server {
    #StructPack 8

    /**
     * Pointer to an <b>MI_Server</b> function table.
     */
    serverFT : MI_ServerFT.Ptr

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_context">MI_Context</a> function table.
     */
    contextFT : MI_ContextFT.Ptr

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a> function table.
     */
    instanceFT : MI_InstanceFT.Ptr

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_propertyset">MI_PropertySet</a> function table.
     */
    propertySetFT : MI_PropertySetFT.Ptr

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_filter">MI_Filter</a> function table.
     */
    filterFT : MI_FilterFT.Ptr

}
