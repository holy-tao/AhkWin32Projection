#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies features of the storage object, such as sector size, in the StgCreateStorageEx and StgOpenStorageEx functions.
 * @remarks
 * 
 * <b>STGOPTIONS</b> is only supported on Unicode APIs.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//coml2api/ns-coml2api-stgoptions
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class STGOPTIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the version of the 
     * <b>STGOPTIONS</b> structure. It is set to <b>STGOPTIONS_VERSION</b>.
     * 
     * <div class="alert"><b>Note</b>  When  <b>usVersion</b> is set to 1, the <b>ulSectorSize</b> member can be set.  This is useful when creating a large-sector documentation file.  
     * However, when <b>usVersion</b> is set to 1, the <b>pwcsTemplateFile</b> member cannot be used.</div>
     * <div> </div>
     * <b>In Windows 2000 and later:  </b><b>STGOPTIONS_VERSION</b> can be set to 1 for version 1.
     * 
     * <b>In Windows XP and later:  </b><b>STGOPTIONS_VERSION</b> can be set to 2 for version 2.
     * 
     * <b>For operating systems prior to Windows 2000:  </b><b>STGOPTIONS_VERSION</b> will be set to 0 for version 0.
     * @type {Integer}
     */
    usVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved for future use; must be zero.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the sector size of the storage object. The default is 512 bytes.
     * @type {Integer}
     */
    ulSectorSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the name of a file whose Encrypted File System (EFS) metadata will be transferred to a newly created Structured Storage file. This member is valid only when <b>STGFMT_DOCFILE</b> is used with <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatestorageex">StgCreateStorageEx</a>.
     * 
     * <b>In Windows XP and later:  </b>The <b>pwcsTemplateFile</b> member is only valid if version 2 or later is specified in the <b>usVersion</b> member.
     * @type {PWSTR}
     */
    pwcsTemplateFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
