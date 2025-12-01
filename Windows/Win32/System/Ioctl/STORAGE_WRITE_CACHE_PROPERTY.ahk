#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve information about a device's write cache property.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_write_cache_property
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_WRITE_CACHE_PROPERTY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-write_cache_type">WRITE_CACHE_TYPE</a> enumeration 
     *       that indicates the current write cache type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheTypeUnknown"></a><a id="writecachetypeunknown"></a><a id="WRITECACHETYPEUNKNOWN"></a><dl>
     * <dt><b>WriteCacheTypeUnknown</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot report the type of the write cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheTypeNone"></a><a id="writecachetypenone"></a><a id="WRITECACHETYPENONE"></a><dl>
     * <dt><b>WriteCacheTypeNone</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not have a write cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheTypeWriteBack"></a><a id="writecachetypewriteback"></a><a id="WRITECACHETYPEWRITEBACK"></a><dl>
     * <dt><b>WriteCacheTypeWriteBack</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has a write-back cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheTypeWriteThrough"></a><a id="writecachetypewritethrough"></a><a id="WRITECACHETYPEWRITETHROUGH"></a><dl>
     * <dt><b>WriteCacheTypeWriteThrough</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has a write-through cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    WriteCacheType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-write_cache_enable">WRITE_CACHE_ENABLE</a> enumeration 
     *       that indicates whether the write cache is enabled.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheEnableUnknown"></a><a id="writecacheenableunknown"></a><a id="WRITECACHEENABLEUNKNOWN"></a><dl>
     * <dt><b>WriteCacheEnableUnknown</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot report whether the device's write cache is enabled or disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheDisabled"></a><a id="writecachedisabled"></a><a id="WRITECACHEDISABLED"></a><dl>
     * <dt><b>WriteCacheDisabled</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device's write cache is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheEnabled"></a><a id="writecacheenabled"></a><a id="WRITECACHEENABLED"></a><dl>
     * <dt><b>WriteCacheEnabled</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device's write cache is enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    WriteCacheEnabled {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-write_cache_change">WRITE_CACHE_CHANGE</a> enumeration that 
     *       indicates whether if the host can change the write cache characteristics.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheChangeUnknown"></a><a id="writecachechangeunknown"></a><a id="WRITECACHECHANGEUNKNOWN"></a><dl>
     * <dt><b>WriteCacheChangeUnknown</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot report the write cache change capability of the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheNotChangeable"></a><a id="writecachenotchangeable"></a><a id="WRITECACHENOTCHANGEABLE"></a><dl>
     * <dt><b>WriteCacheNotChangeable</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Host software cannot change the characteristics of the device's write cache 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteCacheChangeable"></a><a id="writecachechangeable"></a><a id="WRITECACHECHANGEABLE"></a><dl>
     * <dt><b>WriteCacheChangeable</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Host software can change the characteristics of the device's write cache 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    WriteCacheChangeable {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-write_through">WRITE_THROUGH</a> enumeration that indicates whether the device supports write-through caching.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteThroughUnknown"></a><a id="writethroughunknown"></a><a id="WRITETHROUGHUNKNOWN"></a><dl>
     * <dt><b>WriteThroughUnknown</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that no information is available concerning the write-through capabilities of the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteThroughNotSupported"></a><a id="writethroughnotsupported"></a><a id="WRITETHROUGHNOTSUPPORTED"></a><dl>
     * <dt><b>WriteThroughNotSupported</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the device does not support write-through operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WriteThroughSupported"></a><a id="writethroughsupported"></a><a id="WRITETHROUGHSUPPORTED"></a><dl>
     * <dt><b>WriteThroughSupported</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the device supports write-through operations.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    WriteThroughSupported {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A <b>BOOLEAN</b> value that indicates whether the device allows host software to 
     *       flush the device cache. If <b>TRUE</b>, the device allows host software to flush the device 
     *       cache. If <b>FALSE</b>, host software cannot flush the device cache.
     * @type {BOOLEAN}
     */
    FlushCacheSupported {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * A <b>BOOLEAN</b> value that indicates whether a user can configure the device's power 
     *       protection characteristics in the registry. If <b>TRUE</b>, a user can configure the device's 
     *       power protection characteristics in the registry. If <b>FALSE</b>, the user cannot configure 
     *       the device's power protection characteristics in the registry.
     * @type {BOOLEAN}
     */
    UserDefinedPowerProtection {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * A <b>BOOLEAN</b> value that indicates whether the device has a battery backup for the 
     *       write cache. If <b>TRUE</b>, the device has a battery backup for the write cache. If 
     *       <b>FALSE</b>, the device does not have a battery backup for the writer cache.
     * @type {BOOLEAN}
     */
    NVCacheEnabled {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }
}
