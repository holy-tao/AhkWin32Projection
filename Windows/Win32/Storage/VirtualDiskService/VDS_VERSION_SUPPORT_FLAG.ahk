#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_VERSION_SUPPORT_FLAG enumeration (vdshwprv.h) indicates which versions of the VDS interfaces are supported.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the 
  *     <b>VDS_VERSION_SUPPORT_FLAG</b> enumeration in future 
  *     Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized 
  *     <b>VDS_VERSION_SUPPORT_FLAG</b> enumeration 
  *     constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_version_support_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VERSION_SUPPORT_FLAG{

    /**
     * Indicates that the VDS 1.0 interfaces are supported. VDS 1.0 is supported on 
 *       Windows Server 2003 and later.
     * @type {Integer (Int32)}
     */
    static VDS_VSF_1_0 => 1

    /**
     * Indicates that the VDS 1.1 interfaces are supported. VDS 1.1 is supported on 
 *       Windows Server 2003 R2 and later.
     * @type {Integer (Int32)}
     */
    static VDS_VSF_1_1 => 2

    /**
     * Indicates that the VDS 2.0 interfaces are supported. VDS 2.0 is supported on Windows Vista and 
 *       later.
 *       
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003 R2:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_VSF_2_0 => 4

    /**
     * Indicates that the VDS 2.1 interfaces are supported. VDS 2.1 is supported on Windows Vista with SP1,  
 *       Windows Server 2008, and later.
 *       
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003 R2:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_VSF_2_1 => 8

    /**
     * Indicates that the VDS 3.0 interfaces are supported. VDS 3.0 is supported on Windows 7, 
 *       Windows Server 2008 R2, and later.
 *       
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003 R2:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_VSF_3_0 => 16
}
