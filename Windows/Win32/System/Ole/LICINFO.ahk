#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains parameters that describe the licensing behavior of a class factory that supports licensing. The structure is filled by calling the IClassFactory2::GetLicInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-licinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct LICINFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     */
    cbLicInfo : Int32

    /**
     * Indicates whether this class factory allows the creation of its objects on an unlicensed machine through the use of a license key. If <b>TRUE</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-requestlickey">IClassFactory2::RequestLicKey</a> can be called to obtain the key. If <b>FALSE</b>, objects can be created only on a fully licensed machine.
     */
    fRuntimeKeyAvail : BOOL

    /**
     * Indicates whether a full machine license exists such that calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iclassfactory-createinstance">IClassFactory::CreateInstance</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-requestlickey">IClassFactory2::RequestLicKey</a> will succeed. If <b>TRUE</b>, the full machine license exists. Thus, objects can be created freely. and a license key is available if <b>fRuntimeKeyAvail</b> is also <b>TRUE</b>. If <b>FALSE</b>, this class factory cannot create any instances of objects on this machine unless the proper license key is passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-createinstancelic">IClassFactory2::CreateInstanceLic</a>.
     */
    fLicVerified : BOOL

}
