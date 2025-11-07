#Requires AutoHotkey v2.0.0 64-bit

/**
 * Controls aspects of the behavior of the IOleObject::GetMoniker and IOleClientSite::GetMoniker methods.
 * @remarks
 * 
 * If the OLEGETMONIKER_FORCEASSIGN flag causes a container to create a moniker for the object, the container should notify the object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmoniker">IOleObject::GetMoniker</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/ne-oleidl-olegetmoniker
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEGETMONIKER{

    /**
     * If a moniker for the object or container does not exist, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a> should return E_FAIL and not assign a moniker.
     * @type {Integer (Int32)}
     */
    static OLEGETMONIKER_ONLYIFTHERE => 1

    /**
     * If a moniker for the object or container does not exist, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a> should create one.
     * @type {Integer (Int32)}
     */
    static OLEGETMONIKER_FORCEASSIGN => 2

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a> can release the object's moniker (although it is not required to do so). This constant is not valid in <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmoniker">IOleObject::GetMoniker</a>.
     * @type {Integer (Int32)}
     */
    static OLEGETMONIKER_UNASSIGN => 3

    /**
     * If a moniker for the object does not exist, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmoniker">IOleObject::GetMoniker</a> can create a temporary moniker that can be used for display purposes (<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-getdisplayname">IMoniker::GetDisplayName</a>) but not for binding. This enables the object server to return a descriptive name for the object without incurring the overhead of creating and maintaining a moniker until a link is actually created.
     * @type {Integer (Int32)}
     */
    static OLEGETMONIKER_TEMPFORUSER => 4
}
