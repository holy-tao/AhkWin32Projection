#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MULTI_QI (objidlbase.h) structure represents an interface in a query for multiple interfaces.
 * @remarks
 * To optimize network performance, most remote activation functions take an array of <b>MULTI_QI</b> structures rather than just a single IID as input and a single pointer to the requested interface on the object as output, as do local activation functions. This allows a set of pointers to interfaces to be returned from the same object in a single round-trip to the server. In network scenarios, requesting multiple interfaces at the time of object construction can save considerable time over using a number of calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for unique interfaces, each of which would require a round-trip to the server.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-multi_qi
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class MULTI_QI extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to an interface identifier.
     * @type {Pointer<Guid>}
     */
    pIID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the interface requested in <b>pIID</b>. This member must be <b>NULL</b> on input.
     * @type {IUnknown}
     */
    pItf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The return value of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call to locate the requested interface. Common return values include S_OK and E_NOINTERFACE. This member must be 0 on input.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
