#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The MULTI_QI (objidlbase.h) structure represents an interface in a query for multiple interfaces.
 * @remarks
 * To optimize network performance, most remote activation functions take an array of <b>MULTI_QI</b> structures rather than just a single IID as input and a single pointer to the requested interface on the object as output, as do local activation functions. This allows a set of pointers to interfaces to be returned from the same object in a single round-trip to the server. In network scenarios, requesting multiple interfaces at the time of object construction can save considerable time over using a number of calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for unique interfaces, each of which would require a round-trip to the server.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-multi_qi
 * @namespace Windows.Win32.System.Com
 */
export default struct MULTI_QI {
    #StructPack 8

    /**
     * A pointer to an interface identifier.
     */
    pIID : Guid.Ptr

    /**
     * A pointer to the interface requested in <b>pIID</b>. This member must be <b>NULL</b> on input.
     */
    pItf : IUnknown

    /**
     * The return value of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call to locate the requested interface. Common return values include S_OK and E_NOINTERFACE. This member must be 0 on input.
     */
    hr : HRESULT

}
