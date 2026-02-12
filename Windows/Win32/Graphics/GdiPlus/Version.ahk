#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Version Property (ClientNetLibInfo Class)
 * @remarks
 * 
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/clientnetlibinfo-class/version-property-clientnetlibinfo-class
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Version extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static V3 => 3
}
