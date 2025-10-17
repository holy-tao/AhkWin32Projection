#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a node in a wait chain.
 * @see https://docs.microsoft.com/windows/win32/api//wct/ns-wct-waitchain_node_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WAITCHAIN_NODE_INFO extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ObjectStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    class _LockObject extends Win32Struct {
        static sizeof => 272
        static packingSize => 8

        /**
         * @type {String}
         */
        ObjectName {
            get => StrGet(this.ptr + 0, 127, "UTF-16")
            set => StrPut(value, this.ptr + 0, 127, "UTF-16")
        }
    
        /**
         * @type {Integer}
         */
        Timeout {
            get => NumGet(this, 256, "int64")
            set => NumPut("int64", value, this, 256)
        }
    
        /**
         * @type {BOOL}
         */
        Alertable {
            get => NumGet(this, 264, "int")
            set => NumPut("int", value, this, 264)
        }
    
    }

    class _ThreadObject extends Win32Struct {
        static sizeof => 272
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ProcessId {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ThreadId {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        WaitTime {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        ContextSwitches {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    /**
     * @type {_LockObject}
     */
    LockObject{
        get {
            if(!this.HasProp("__LockObject"))
                this.__LockObject := %this.__Class%._LockObject(8, this)
            return this.__LockObject
        }
    }

    /**
     * @type {_ThreadObject}
     */
    ThreadObject{
        get {
            if(!this.HasProp("__ThreadObject"))
                this.__ThreadObject := %this.__Class%._ThreadObject(8, this)
            return this.__ThreadObject
        }
    }
}
