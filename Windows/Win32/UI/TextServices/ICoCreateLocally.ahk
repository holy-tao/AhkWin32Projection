#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables a client application to create a helper object in the server context.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-icocreatelocally
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ICoCreateLocally extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoCreateLocally
     * @type {Guid}
     */
    static IID => Guid("{03de00aa-f272-41e3-99cb-03c5e8114ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CoCreateLocally"]

    /**
     * Clients call ICoCreateLocally::CoCreateLocally to create a helper object in the same context as the server object.
     * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
     * 
     * Class identifier of the object to be created locally.
     * @param {Integer} dwClsContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Context in which the helper object should run. This is usually CLSCTX_INPROC_SERVER.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired interface identifier (IID).
     * @param {Pointer<Guid>} riidParam Type: <b>REFIID</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies an interface identifier.
     * @param {IUnknown} punkParam Type: <b>IUnknown*</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies the interface pointer.
     * @param {VARIANT} varParam Type: <b>VARIANT</b>
     * 
     * An optional interface parameter that is passed to the new helper object.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the desired interface identifier (from <i>riid</i>).
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-icocreatelocally-cocreatelocally
     */
    CoCreateLocally(rclsid, dwClsContext, riid, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwClsContext, "ptr", riid, "ptr*", &punk := 0, "ptr", riidParam, "ptr", punkParam, "ptr", varParam, "HRESULT")
        return IUnknown(punk)
    }
}
