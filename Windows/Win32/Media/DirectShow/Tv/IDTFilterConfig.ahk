#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDTFilterConfig interface configures the Decrypter/Detagger filter. Most applications will not have to use this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilterConfig)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-idtfilterconfig
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilterConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDTFilterConfig
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4d2-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecureChannelObject"]

    /**
     * The GetSecureChannelObject method retrieves the secure channel object used to decrypt the stream.
     * @returns {IUnknown} Receives a pointer to the secure channel object's <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilterconfig-getsecurechannelobject
     */
    GetSecureChannelObject() {
        result := ComCall(3, this, "ptr*", &ppUnkDRMSecureChannel := 0, "HRESULT")
        return IUnknown(ppUnkDRMSecureChannel)
    }
}
