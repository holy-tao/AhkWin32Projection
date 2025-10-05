#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ACMSTREAMHEADER structure defines the header used to identify an ACM conversion source and destination buffer pair for a conversion stream.
 * @remarks
 * Before an <b>ACMSTREAMHEADER</b> structure can be used for a conversion, it must be prepared by using the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmstreamprepareheader">acmStreamPrepareHeader</a> function. When an application is finished with an <b>ACMSTREAMHEADER</b> structure, it must call the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmstreamunprepareheader">acmStreamUnprepareHeader</a> function before freeing the source and destination buffers.
 * @see https://learn.microsoft.com/windows/win32/api/msacm/ns-msacm-acmstreamheader
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ACMSTREAMHEADER extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Size, in bytes, of the <b>ACMSTREAMHEADER</b> structure. This member must be initialized before the application calls any ACM stream functions using this structure. The size specified in this member must be large enough to contain the base <b>ACMSTREAMHEADER</b> structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags giving information about the conversion buffers. This member must be initialized to zero before the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmstreamprepareheader">acmStreamPrepareHeader</a> function and should not be modified by the application while the stream header remains prepared.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACMSTREAMHEADER_STATUSF_DONE"></a><a id="acmstreamheader_statusf_done"></a><dl>
     * <dt><b>ACMSTREAMHEADER_STATUSF_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by the ACM or driver to indicate that it is finished with the conversion and is returning the buffers to the application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACMSTREAMHEADER_STATUSF_INQUEUE"></a><a id="acmstreamheader_statusf_inqueue"></a><dl>
     * <dt><b>ACMSTREAMHEADER_STATUSF_INQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by the ACM or driver to indicate that the buffers are queued for conversion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACMSTREAMHEADER_STATUSF_PREPARED"></a><a id="acmstreamheader_statusf_prepared"></a><dl>
     * <dt><b>ACMSTREAMHEADER_STATUSF_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by the ACM to indicate that the buffers have been prepared by using the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmstreamprepareheader">acmStreamPrepareHeader</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fdwStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * User data. This can be any instance data specified by the application.
     * @type {Pointer}
     */
    dwUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the source buffer. This pointer must always refer to the same location while the stream header remains prepared. If an application needs to change the source location, it must unprepare the header and reprepare it with the alternate location.
     * @type {Pointer<Byte>}
     */
    pbSrc {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Length, in bytes, of the source buffer pointed to by <b>pbSrc</b>. When the header is prepared, this member must specify the maximum size that will be used in the source buffer. Conversions can be performed on source lengths less than or equal to the original prepared size. However, this member must be reset to the original size when an application unprepares the header.
     * @type {Integer}
     */
    cbSrcLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Amount of data, in bytes, used for the conversion. This member is not valid until the conversion is complete. This value can be less than or equal to <b>cbSrcLength</b>. An application must use the <b>cbSrcLengthUsed</b> member when advancing to the next piece of source data for the conversion stream.
     * @type {Integer}
     */
    cbSrcLengthUsed {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * User data. This can be any instance data specified by the application.
     * @type {Pointer}
     */
    dwSrcUser {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the destination buffer. This pointer must always refer to the same location while the stream header remains prepared. If an application needs to change the destination location, it must unprepare the header and reprepare it with the alternate location.
     * @type {Pointer<Byte>}
     */
    pbDst {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Length, in bytes, of the destination buffer pointed to by <b>pbDst</b>. When the header is prepared, this member must specify the maximum size that will be used in the destination buffer.
     * @type {Integer}
     */
    cbDstLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Amount of data, in bytes, returned by a conversion. This member is not valid until the conversion is complete. This value can be less than or equal to <b>cbDstLength</b>. An application must use the <b>cbDstLengthUsed</b> member when advancing to the next destination location for the conversion stream.
     * @type {Integer}
     */
    cbDstLengthUsed {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * User data. This can be any instance data specified by the application.
     * @type {Pointer}
     */
    dwDstUser {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved; do not use. This member requires no initialization by the application and should never be modified while the header remains prepared.
     * @type {Array<UInt32>}
     */
    dwReservedDriver{
        get {
            if(!this.HasProp("__dwReservedDriverProxyArray"))
                this.__dwReservedDriverProxyArray := Win32FixedArray(this.ptr + 64, 15, Primitive, "uint")
            return this.__dwReservedDriverProxyArray
        }
    }
}
