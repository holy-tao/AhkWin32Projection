#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FORMATETC.ahk

/**
 * Contains information used to specify each advisory connection.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-statdata
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STATDATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure for the data of interest to the advise sink. The advise sink receives notification of changes to the data specified by this <b>FORMATETC</b> structure.
     * @type {FORMATETC}
     */
    formatetc{
        get {
            if(!this.HasProp("__formatetc"))
                this.__formatetc := FORMATETC(this.ptr + 0)
            return this.__formatetc
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration value that determines when the advisory sink is notified of changes in the data.
     * @type {Integer}
     */
    advf {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface that will receive change notifications.
     * @type {Pointer<IAdviseSink>}
     */
    pAdvSink {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The token that uniquely identifies the advisory connection. This token is returned by the method that sets up the advisory connection.
     * @type {Integer}
     */
    dwConnection {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
