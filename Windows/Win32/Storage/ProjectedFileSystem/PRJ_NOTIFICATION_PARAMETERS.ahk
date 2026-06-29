#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_NOTIFY_TYPES.ahk" { PRJ_NOTIFY_TYPES }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Extra parameters for notifications.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_notification_parameters
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_NOTIFICATION_PARAMETERS {
    #StructPack 4


    struct _PostCreate {
        NotificationMask : PRJ_NOTIFY_TYPES

    }

    struct _FileRenamed {
        NotificationMask : PRJ_NOTIFY_TYPES

    }

    struct _FileDeletedOnHandleClose {
        IsFileModified : BOOLEAN

    }

    PostCreate : PRJ_NOTIFICATION_PARAMETERS._PostCreate

    static __New() {
        DefineProp(this.Prototype, 'FileRenamed', { type: PRJ_NOTIFICATION_PARAMETERS._FileRenamed, offset: 0 })
        DefineProp(this.Prototype, 'FileDeletedOnHandleClose', { type: PRJ_NOTIFICATION_PARAMETERS._FileDeletedOnHandleClose, offset: 0 })
        this.DeleteProp("__New")
    }
}
