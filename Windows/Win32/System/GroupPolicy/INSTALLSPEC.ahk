#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The INSTALLSPEC structure specifies a group policy application by its user-friendly name and group policy GUID or by its file name extension. The Spec member of the INSTALLDATA structure provides this information to the InstallApplication function.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-installspec
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class INSTALLSPEC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _AppName extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {PWSTR}
         */
        Name {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        GPOId {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _COMClass extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        Clsid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ClsCtx {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * Structure that contains the following members.
     * @type {_AppName}
     */
    AppName{
        get {
            if(!this.HasProp("__AppName"))
                this.__AppName := %this.__Class%._AppName(0, this)
            return this.__AppName
        }
    }

    /**
     * The file name extension, such as .jpg,  of the application to be installed.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/nf-appmgmt-installapplication">InstallApplication</a> fails if the <b>Type</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-installdata">INSTALLDATA</a> equals <b>FILEEXT</b> and there is no application deployed to the user with this file name extension.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    FileExt {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This parameter is reserved and should not be used.
     * @type {PWSTR}
     */
    ProgId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This parameter is reserved and should not be used.
     * @type {_COMClass}
     */
    COMClass{
        get {
            if(!this.HasProp("__COMClass"))
                this.__COMClass := %this.__Class%._COMClass(0, this)
            return this.__COMClass
        }
    }
}
