#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\Memory\MEMORY_BASIC_INFORMATION.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * Holds auxiliary page entry information returned by PssWalkSnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_AUXILIARY_PAGE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_AUXILIARY_PAGES</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_auxiliary_page_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_AUXILIARY_PAGE_ENTRY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The address of the captured auxiliary page, in the context of the captured process.
     * @type {Pointer<Void>}
     */
    Address {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Basic information about the captured page. See <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> for more information.
     * @type {MEMORY_BASIC_INFORMATION}
     */
    BasicInformation{
        get {
            if(!this.HasProp("__BasicInformation"))
                this.__BasicInformation := MEMORY_BASIC_INFORMATION(8, this)
            return this.__BasicInformation
        }
    }

    /**
     * The capture time of the page. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    CaptureTime{
        get {
            if(!this.HasProp("__CaptureTime"))
                this.__CaptureTime := FILETIME(56, this)
            return this.__CaptureTime
        }
    }

    /**
     * A pointer to the contents of the captured page, in the context of the current process. This member may be <b>NULL</b> if page contents were not captured. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     * @type {Pointer<Void>}
     */
    PageContents {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The size of the page contents that <b>PageContents</b> points to, in bytes.
     * @type {Integer}
     */
    PageSize {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
