#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCT_OBJECT_TYPE.ahk" { WCT_OBJECT_TYPE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WCT_OBJECT_STATUS.ahk" { WCT_OBJECT_STATUS }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a node in a wait chain.
 * @see https://learn.microsoft.com/windows/win32/api/wct/ns-wct-waitchain_node_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WAITCHAIN_NODE_INFO {
    #StructPack 8


    struct _LockObject {
        ObjectName : WCHAR[128]

        Timeout : Int64

        Alertable : BOOL

    }

    struct _ThreadObject {
        ProcessId : UInt32

        ThreadId : UInt32

        WaitTime : UInt32

        ContextSwitches : UInt32

    }

    ObjectType : WCT_OBJECT_TYPE

    ObjectStatus : WCT_OBJECT_STATUS

    LockObject : WAITCHAIN_NODE_INFO._LockObject

    static __New() {
        DefineProp(this.Prototype, 'ThreadObject', { type: WAITCHAIN_NODE_INFO._ThreadObject, offset: 8 })
        this.DeleteProp("__New")
    }
}
