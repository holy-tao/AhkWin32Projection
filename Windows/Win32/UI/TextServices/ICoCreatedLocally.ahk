#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to return information about a local object.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-icocreatedlocally
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ICoCreatedLocally extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoCreatedLocally
     * @type {Guid}
     */
    static IID => Guid("{0a53eb6c-1908-4742-8cff-2cee2e93f94c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LocalInit"]

    /**
     * Implemented by clients to return information about the local object.Note  Active Accessibility Text Services is deprecated.
     * @param {IUnknown} punkLocalObject Type: <b>IUnknown*</b>
     * 
     * A pointer to the server object.
     * @param {Pointer<Guid>} riidParam Type: <b>REFIID</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies an interface identifier.
     * @param {IUnknown} punkParam Type: <b>IUnknown*</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies the interface pointer.
     * @param {VARIANT} varParam Type: <b>VARIANT</b>
     * 
     * An optional interface parameter that is passed to the new helper object.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK. If not successful, returns a standard <a href="/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-icocreatedlocally-localinit
     */
    LocalInit(punkLocalObject, riidParam, punkParam, varParam) {
        result := ComCall(3, this, "ptr", punkLocalObject, "ptr", riidParam, "ptr", punkParam, "ptr", varParam, "HRESULT")
        return result
    }
}
