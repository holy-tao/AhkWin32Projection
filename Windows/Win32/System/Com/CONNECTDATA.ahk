#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Describes a connection that exists to a given connection point.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-connectdata
 * @namespace Windows.Win32.System.Com
 */
export default struct CONNECTDATA {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on a connected advisory sink. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> using this pointer when the <b>CONNECTDATA</b> structure is no longer needed. The caller is responsible for calling <b>Release</b> for each <b>CONNECTDATA</b> structure enumerated through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ienumconnections-next">IEnumConnections::Next</a>.
     */
    pUnk : IUnknown

    /**
     * Connection where this value is the same token that is returned originally from calls to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">IConnectionPoint::Advise</a>. This token can be used to disconnect the sink pointed to by a <b>pUnk</b> by passing <b>dwCookie</b> to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">IConnectionPoint::Unadvise</a>.
     */
    dwCookie : UInt32

}
