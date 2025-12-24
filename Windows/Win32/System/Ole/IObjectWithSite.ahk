#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a simple way to support communication between an object and its site in the container.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iobjectwithsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IObjectWithSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithSite
     * @type {Guid}
     */
    static IID => Guid("{fc4801a3-2ba9-11cf-a229-00aa003d7352}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSite", "GetSite"]

    /**
     * Enables a container to pass an object a pointer to the interface for its site.
     * @param {IUnknown} pUnkSite A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer of the site managing this object. If <b>NULL</b>, the object should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on any existing site at which point the object no longer knows its site.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iobjectwithsite-setsite
     */
    SetSite(pUnkSite) {
        result := ComCall(3, this, "ptr", pUnkSite, "HRESULT")
        return result
    }

    /**
     * Retrieves the latest site passed using SetSite.
     * @param {Pointer<Guid>} riid The IID of the interface pointer that should be returned in <i>ppvSite</i>.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvSite</i> contains the requested interface pointer to the site last seen in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">SetSite</a>. The specific interface returned depends on the <i>riid</i> argument. In essence, the two arguments act identically to those in <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. If the appropriate interface pointer is available, the object must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on that pointer before returning successfully. If no site is available, or the requested interface is not supported, this method must *<i>ppvSite</i> to <b>NULL</b> and return a failure code.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iobjectwithsite-getsite
     */
    GetSite(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppvSite := 0, "HRESULT")
        return ppvSite
    }
}
