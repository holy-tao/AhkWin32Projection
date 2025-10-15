#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information about a vSwitch event.
 * @remarks
 * 
  * For the unnamed union, switch_is(eventType), switch_type(FWPM_VSWITCH_EVENT_TYPE).
  * 
  * <b>FWPM_VSWITCH_EVENT0</b> is a specific implementation of FWPM_VSWITCH_EVENT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a> for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_vswitch_event0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_VSWITCH_EVENT0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: [FWPM_VSWITCH_EVENT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_vswitch_event_type)</b>
     * 
     * The type of vSwitch event.
     * @type {Integer}
     */
    eventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>wchar_t*</b>
     * 
     * GUID that identifies a vSwitch.
     * @type {PWSTR}
     */
    vSwitchId{
        get {
            if(!this.HasProp("__vSwitchId"))
                this.__vSwitchId := PWSTR(this.ptr + 8)
            return this.__vSwitchId
        }
    }

    class _positionInfo extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        numvSwitchFilterExtensions {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Pointer<PWSTR>}
         */
        vSwitchFilterExtensions {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _reorderInfo extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {BOOL}
         */
        inRequiredPosition{
            get {
                if(!this.HasProp("__inRequiredPosition"))
                    this.__inRequiredPosition := BOOL(this.ptr + 0)
                return this.__inRequiredPosition
            }
        }
    
        /**
         * @type {Integer}
         */
        numvSwitchFilterExtensions {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<PWSTR>}
         */
        vSwitchFilterExtensions {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    /**
     * @type {_positionInfo}
     */
    positionInfo{
        get {
            if(!this.HasProp("__positionInfo"))
                this.__positionInfo := %this.__Class%._positionInfo(this.ptr + 16)
            return this.__positionInfo
        }
    }

    /**
     * @type {_reorderInfo}
     */
    reorderInfo{
        get {
            if(!this.HasProp("__reorderInfo"))
                this.__reorderInfo := %this.__Class%._reorderInfo(this.ptr + 16)
            return this.__reorderInfo
        }
    }
}
