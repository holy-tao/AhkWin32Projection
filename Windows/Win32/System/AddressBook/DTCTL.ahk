#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtctl
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTCTL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _ctl_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        lpv {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLLABEL>}
         */
        lplabel {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLEDIT>}
         */
        lpedit {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLLBX>}
         */
        lplbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLCOMBOBOX>}
         */
        lpcombobox {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLDDLBX>}
         */
        lpddlbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLCHECKBOX>}
         */
        lpcheckbox {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLGROUPBOX>}
         */
        lpgroupbox {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLBUTTON>}
         */
        lpbutton {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLRADIOBUTTON>}
         */
        lpradiobutton {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLMVLISTBOX>}
         */
        lpmvlbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLMVDDLBX>}
         */
        lpmvddlbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLPAGE>}
         */
        lppage {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    ulCtlType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulCtlFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Integer>}
     */
    lpbNotif {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbNotif {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    lpszFilter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulItemID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {_ctl_e__Union}
     */
    ctl{
        get {
            if(!this.HasProp("__ctl"))
                this.__ctl := %this.__Class%._ctl_e__Union(40, this)
            return this.__ctl
        }
    }
}
