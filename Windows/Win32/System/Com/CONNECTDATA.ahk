#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a connection that exists to a given connection point.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ns-ocidl-connectdata
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CONNECTDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on a connected advisory sink. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> using this pointer when the <b>CONNECTDATA</b> structure is no longer needed. The caller is responsible for calling <b>Release</b> for each <b>CONNECTDATA</b> structure enumerated through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ienumconnections-next">IEnumConnections::Next</a>.
     * @type {Pointer<IUnknown>}
     */
    pUnk {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Connection where this value is the same token that is returned originally from calls to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">IConnectionPoint::Advise</a>. This token can be used to disconnect the sink pointed to by a <b>pUnk</b> by passing <b>dwCookie</b> to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">IConnectionPoint::Unadvise</a>.
     * @type {Integer}
     */
    dwCookie {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
